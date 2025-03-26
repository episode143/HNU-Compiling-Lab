package lab2
import std.collection.*
// 三种枚举类
public var non_s:String = "NONTERMINAL";
public var ter_s:String = "TERMINAL";
public var null_s:String = "NULL";
// 创建终结符null
public var name_null:String = "null";
public var lexeme_null:String = "null";
public var ts_null = TerminalSymbol(name_null,null_s,lexeme_null);
// 当option为NONE的时候返回的值
public var none_s:String = "NONE";
public var none_NonTerminalSymbol:NonTerminalSymbol = NonTerminalSymbol(none_s,none_s);
public var none_TerminalSymbol:TerminalSymbol = TerminalSymbol(none_s,none_s,none_s);
// 所有的非终结符集合
public var all_NonTerminalSymbol_Set:ArrayList<NonTerminalSymbol> = ArrayList<NonTerminalSymbol>();
// 所有的产生式集合
public var all_Production_Set:ArrayList<Production> = ArrayList<Production>();
// 展示所有非终结符以及其产生式集合
public func show_all_nts_production(){
    for(nts in all_NonTerminalSymbol_Set) {
        println("name: ${nts.name} ");
        for(p in nts.pProductionTable) {
            print("   ");
            for(s in p.pBodySymbolTable) {
                print("${s.name} ")
            }
            println();
        }
    }
}
// 产生式的FIRST函数求解
public func get_NFS_FIRST(production:Production) {
    var nullStand:Bool = true;
    var i:Int64 = 0;
    while(nullStand && i<production.pBodySymbolTable.size) {
        var currGrammarSymbol:GrammarSymbol = production.pBodySymbolTable[i];
        // 如果是终结符
        if(currGrammarSymbol is TerminalSymbol) {
            nullStand = false;
            var insert_Symbol:TerminalSymbol = currGrammarSymbol as TerminalSymbol ?? none_TerminalSymbol;
            if(insert_Symbol.name != "NONE") {
                production.pFirstSet.put(insert_Symbol);
            }
        } else {
            var insert_Symbol:NonTerminalSymbol = currGrammarSymbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
            if(insert_Symbol.name != "NONE") {
                production.pFirstSet.putAll(insert_Symbol.pFirstSet);
                production.pFirstSet.remove(ts_null);
                if(!insert_Symbol.pFirstSet.contains(ts_null)) {
                    nullStand = false;
                }
            }
        }
    }
    if(nullStand && i == production.pBodySymbolTable.size) {
        production.pFirstSet.put(ts_null);
    }
}
// 展示所有产生式的FIRST
public func show_Production_FIRST(){
    for(production in all_Production_Set) {
        get_NFS_FIRST(production);
        print("PRODUCTION: ");
        for(grammar in production.pBodySymbolTable) {
            print("${grammar.name} ");
        }
        println();
        print("FIRST: ");
        for(ts in production.pFirstSet) {
            print("${ts.name} ");
        }
        println();
    }
}
// 求出所有的非终结符的FIRST
public func get_NFS_FIRST(){
    var task_table:HashMap<NonTerminalSymbol, HashSet<NonTerminalSymbol>> = HashMap<NonTerminalSymbol, HashSet<NonTerminalSymbol>>();
    for(nfs in all_NonTerminalSymbol_Set) {
        task_table.put(nfs,HashSet<NonTerminalSymbol>());
    }
    // 已经得到其FIRST函数的nts
    var accomplish_set:HashSet<NonTerminalSymbol> = HashSet<NonTerminalSymbol>();
    while(accomplish_set.size != all_NonTerminalSymbol_Set.size) {
        for(nts in all_NonTerminalSymbol_Set) {
            // 是否独立(无未计算出的FIRST依赖)
            var independent = true;
            for(production in nts.pProductionTable) {
                // 找到产生式第一个grammar
                var grammarSymbol:GrammarSymbol = production.pBodySymbolTable[0];
                if(grammarSymbol is NonTerminalSymbol) {
                    //println("nfs!!!!");
                    var insert_nts:NonTerminalSymbol = grammarSymbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
                    if(insert_nts.name != "NONE") {
                        //println("${insert_nts.name}")
                        // 如果这个非终结符已经有FIRST函数
                        if(accomplish_set.contains(insert_nts)) {
                            nts.pFirstSet.putAll(insert_nts.pFirstSet);
                            task_table[nts].remove(insert_nts);
                        } else {
                            task_table[nts].put(insert_nts);
                            independent = false;
                        }
                    }
                } else {
                    //println("FS!!")
                    var insert_ts:TerminalSymbol = grammarSymbol as TerminalSymbol ?? none_TerminalSymbol;
                    if(insert_ts.name != "NONE") {
                        nts.pFirstSet.put(insert_ts);
                    }
                }
            }
            if(independent) {
                accomplish_set.put(nts);
                //println("accomplish: ${nts.name}");
            }
        }
    }
}

public func FIRST(grammerSymbol:GrammarSymbol):HashSet<TerminalSymbol> {
    if(grammerSymbol is NonTerminalSymbol) {
        var temp_nts:NonTerminalSymbol = grammerSymbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
        return temp_nts.pFirstSet;
    } else {
        var temp_ts:TerminalSymbol = grammerSymbol as TerminalSymbol ?? none_TerminalSymbol;
        var res_set:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
        res_set.put(temp_ts);
        return res_set;
    }
}
// 展示所有非终结符的FIRST函数
public func show_NFS_FIRST(){
    for(nfs in all_NonTerminalSymbol_Set) {
        print("name: ${nfs.name} FIRST: {");
        for(ts in nfs.pFirstSet) {
            print(" ${ts.name} ");
        }
        println("}");
    }
}
public func get_NFS_FOLLOW(){
    // 仅仅使用FIRST得到部分以及依赖的FOLLOW
    for(nts in all_NonTerminalSymbol_Set) {
        for(production in nts.pProductionTable) {
            var i:Int64 = production.pBodySymbolTable.size - 1;
            var grammerSymbol:GrammarSymbol = production.pBodySymbolTable[i];
            if(grammerSymbol is NonTerminalSymbol) {
                var temp_nts = grammerSymbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
                if(temp_nts.name != "NONE") {
                    temp_nts.pDependentSetInFollow.put(nts);
                }
            }
            var nullStand:Bool = true;
            var j:Int64 = production.pBodySymbolTable.size-1;
            i = i-1;
            while(i>=0) {
                var curr_gs:GrammarSymbol = production.pBodySymbolTable[i];
                if(curr_gs is NonTerminalSymbol) {
                    var temp_nts = curr_gs as NonTerminalSymbol ?? none_NonTerminalSymbol;
                    if(temp_nts.name != "NONE") {
                        var k:Int64 = i+1;
                        while(k<=j) {
                            var insert_k_gs:GrammarSymbol = production.pBodySymbolTable[k];
                            temp_nts.pFollowSet.putAll(FIRST(insert_k_gs));
                            temp_nts.pFollowSet.remove(ts_null);
                            k++;
                        }
                        if(!temp_nts.pFirstSet.contains(ts_null)) {
                            j = i;
                        }
                        if(nullStand && !FIRST(production.pBodySymbolTable[i+1]).contains(ts_null)) {
                            nullStand = false;
                        }
                        if(nullStand) {
                            temp_nts.pDependentSetInFollow.put(nts);
                        }
                    }
                } else {
                    j = i;
                    if(nullStand) {
                        nullStand = false;
                    }
                }
                i--;
            }
        }
    }
    // 先找出所有不需要依赖的非终结符
    var accomplish_follow_nts:HashSet<NonTerminalSymbol> = HashSet<NonTerminalSymbol>();
    for(nts in all_NonTerminalSymbol_Set) {
        if(nts.pDependentSetInFollow.isEmpty()) {
            accomplish_follow_nts.put(nts);
        }
    }
    // 通过不需要依赖的终结符持续处理直到所有FOLLOW都完成
    while(accomplish_follow_nts.size != all_NonTerminalSymbol_Set.size) {
        for(nts in all_NonTerminalSymbol_Set) {
            for(dependence in nts.pDependentSetInFollow) {
                if(accomplish_follow_nts.contains(dependence)) {
                    nts.pFollowSet.putAll(dependence.pFollowSet);
                    nts.pDependentSetInFollow.remove(nts);
                    if(nts.pDependentSetInFollow.isEmpty()) {
                        accomplish_follow_nts.put(nts);
                    }
                }
            }
        }
    }
}
// 创建测试样例
public func test(){

    // 创建非终结符E
    var name_E:String = "E";
    var pProductionTable_E = ArrayList<Production>();
    var numOfProduction_E = 1;
    var pFirstSet_E = HashSet<TerminalSymbol>();
    var pFollowSet_E = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_E = HashSet<NonTerminalSymbol>();
    var nts_E:NonTerminalSymbol = NonTerminalSymbol(name_E,non_s,pProductionTable_E,numOfProduction_E,pFirstSet_E,pFollowSet_E,pDependentSetInFollow_E);
    all_NonTerminalSymbol_Set.append(nts_E);

    // 创建非终结符E'
    var name_E1:String = "E'";
    var pProductionTable_E1 = ArrayList<Production>();
    var numOfProduction_E1 = 1;
    var pFirstSet_E1 = HashSet<TerminalSymbol>();
    var pFollowSet_E1 = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_E1 = HashSet<NonTerminalSymbol>();
    var nts_E1:NonTerminalSymbol = NonTerminalSymbol(name_E1,non_s,pProductionTable_E1,numOfProduction_E1,pFirstSet_E1,pFollowSet_E1,pDependentSetInFollow_E1);
    all_NonTerminalSymbol_Set.append(nts_E1);

    // 创建非终结符T
    var name_T:String = "T";
    var pProductionTable_T = ArrayList<Production>();
    var numOfProduction_T = 1;
    var pFirstSet_T = HashSet<TerminalSymbol>();
    var pFollowSet_T = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_T = HashSet<NonTerminalSymbol>();
    var nts_T:NonTerminalSymbol = NonTerminalSymbol(name_T,non_s,pProductionTable_T,numOfProduction_T,pFirstSet_T,pFollowSet_T,pDependentSetInFollow_T);
    all_NonTerminalSymbol_Set.append(nts_T);

    // 创建非终结符T'
    var name_T1:String = "T'";
    var pProductionTable_T1 = ArrayList<Production>();
    var numOfProduction_T1 = 1;
    var pFirstSet_T1 = HashSet<TerminalSymbol>();
    var pFollowSet_T1 = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_T1 = HashSet<NonTerminalSymbol>();
    var nts_T1:NonTerminalSymbol = NonTerminalSymbol(name_T1,non_s,pProductionTable_T1,numOfProduction_T1,pFirstSet_T1,pFollowSet_T1,pDependentSetInFollow_T1);
    all_NonTerminalSymbol_Set.append(nts_T1);

    // 创建非终结符F
    var name_F:String = "F";
    var pProductionTable_F = ArrayList<Production>();
    var numOfProduction_F = 1;
    var pFirstSet_F = HashSet<TerminalSymbol>();
    var pFollowSet_F = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_F = HashSet<NonTerminalSymbol>();
    var nts_F:NonTerminalSymbol = NonTerminalSymbol(name_F,non_s,pProductionTable_F,numOfProduction_F,pFirstSet_F,pFollowSet_F,pDependentSetInFollow_F);
    all_NonTerminalSymbol_Set.append(nts_F);

    // 创建终结符+
    var name_plus:String = "+";
    var lexeme_plus:String = "OPERATOR+";
    var ts_plus = TerminalSymbol(name_plus,ter_s,lexeme_plus);

    // 创建终结符(
    var name_left_bracket:String ="(";
    var lexeme_left_bracket:String = "LEFT BRACKET";
    var ts_left_bracket = TerminalSymbol(name_left_bracket,ter_s,lexeme_left_bracket);

    // 创建终结符)
    var name_right_bracket:String =")";
    var lexeme_right_bracket:String = "RIGHT BRACKET";
    var ts_right_bracket = TerminalSymbol(name_right_bracket,ter_s,lexeme_right_bracket);

    // 创建终结符*
    var name_multiple:String ="*";
    var lexeme_multiple:String = "OPERATOR*";
    var ts_multiple = TerminalSymbol(name_multiple,ter_s,lexeme_multiple);

    // 创建终结符id
    var name_id:String = "id";
    var lexeme_id:String = "ID";
    var ts_id = TerminalSymbol(name_id,ter_s,lexeme_id);


    // 创建产生式 E->T E'
    var production_1_id:Int64 = 1;
    var production_1_size:Int64 = 2;
    var production_1_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_1_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_1:Production = Production(production_1_id,production_1_size,production_1_sTable,production_1_fSet);
    production_1.pBodySymbolTable.append(nts_T);
    production_1.pBodySymbolTable.append(nts_E1);
    // 将其添加进E的产生式中
    nts_E.pProductionTable.append(production_1);
    nts_E.numOfProduction = 1;
    all_Production_Set.append(production_1);

    // 创建产生式 E'->+ T E'
    var production_2_id:Int64 = 2;
    var production_2_size:Int64 = 3;
    var production_2_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_2_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_2:Production = Production(production_2_id,production_2_size,production_2_sTable,production_2_fSet);
    production_2.pBodySymbolTable.append(ts_plus);
    production_2.pBodySymbolTable.append(nts_T);
    production_2.pBodySymbolTable.append(nts_E1);
    // 将其添加进E'的产生式中
    nts_E1.pProductionTable.append(production_2);
    nts_E1.numOfProduction = 2;
    all_Production_Set.append(production_2);
    
    // 创建产生式 E'-> null
    var production_3_id:Int64 = 3;
    var production_3_size:Int64 = 1;
    var production_3_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_3_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_3:Production = Production(production_3_id,production_3_size,production_3_sTable,production_3_fSet);
    production_3.pBodySymbolTable.append(ts_null);
    // 将其添加进E'的产生式中
    nts_E1.pProductionTable.append(production_3);
    nts_E1.numOfProduction = 2;
    all_Production_Set.append(production_3);
    
    // 创建产生式 T->F T'
    var production_4_id:Int64 = 4;
    var production_4_size:Int64 = 2;
    var production_4_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_4_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_4:Production = Production(production_4_id,production_4_size,production_4_sTable,production_4_fSet);
    production_4.pBodySymbolTable.append(nts_F);
    production_4.pBodySymbolTable.append(nts_T1);
    // 将其添加进T的产生式中
    nts_T.pProductionTable.append(production_4);
    nts_T.numOfProduction = 1;
    all_Production_Set.append(production_4);
    
    // 创建产生式 T'->* F T'
    var production_5_id:Int64 = 5;
    var production_5_size:Int64 = 3;
    var production_5_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_5_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_5:Production = Production(production_5_id,production_5_size,production_5_sTable,production_5_fSet);
    production_5.pBodySymbolTable.append(ts_multiple);
    production_5.pBodySymbolTable.append(nts_F);
    production_5.pBodySymbolTable.append(nts_T1);
    // 将其添加进T'的产生式中
    nts_T1.pProductionTable.append(production_5);
    nts_T1.numOfProduction = 2;
    all_Production_Set.append(production_5);
    
    // 创建产生式 T'->null
    var production_6_id:Int64 = 6;
    var production_6_size:Int64 = 1;
    var production_6_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_6_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_6:Production = Production(production_6_id,production_6_size,production_6_sTable,production_6_fSet);
    production_6.pBodySymbolTable.append(ts_null);
    // 将其添加进T'的产生式中
    nts_T1.pProductionTable.append(production_6);
    nts_T1.numOfProduction = 2;
    all_Production_Set.append(production_6);
    
    // 创建产生式 F->( E )
    var production_7_id:Int64 = 7;
    var production_7_size:Int64 = 3;
    var production_7_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_7_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_7:Production = Production(production_7_id,production_7_size,production_7_sTable,production_7_fSet);
    production_7.pBodySymbolTable.append(ts_left_bracket);
    production_7.pBodySymbolTable.append(nts_E);
    production_7.pBodySymbolTable.append(ts_right_bracket);
    // 将其添加进T'的产生式中
    nts_F.pProductionTable.append(production_7);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_7);
    
    // 创建产生式 F->id
    var production_8_id:Int64 = 8;
    var production_8_size:Int64 = 1;
    var production_8_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_8_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_8:Production = Production(production_8_id,production_8_size,production_8_sTable,production_8_fSet);
    production_8.pBodySymbolTable.append(ts_id);
    // 将其添加进T'的产生式中
    nts_F.pProductionTable.append(production_8);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_8);
    
}