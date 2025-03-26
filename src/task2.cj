package lab2
import std.collection.*
// 创建测试样例 文法3.6
public func test2(){
    // 创建非终结符E'
    var name_E1:String = "E'";
    var pProductionTable_E1 = ArrayList<Production>();
    var numOfProduction_E1 = 1;
    var pFirstSet_E1 = HashSet<TerminalSymbol>();
    var pFollowSet_E1 = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_E1 = HashSet<NonTerminalSymbol>();
    var nts_E1:NonTerminalSymbol = NonTerminalSymbol(name_E1,non_s,pProductionTable_E1,numOfProduction_E1,pFirstSet_E1,pFollowSet_E1,pDependentSetInFollow_E1);
    all_NonTerminalSymbol_Set.append(nts_E1);

    // 创建非终结符E
    var name_E:String = "E";
    var pProductionTable_E = ArrayList<Production>();
    var numOfProduction_E = 2;
    var pFirstSet_E = HashSet<TerminalSymbol>();
    var pFollowSet_E = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_E = HashSet<NonTerminalSymbol>();
    var nts_E:NonTerminalSymbol = NonTerminalSymbol(name_E,non_s,pProductionTable_E,numOfProduction_E,pFirstSet_E,pFollowSet_E,pDependentSetInFollow_E);
    all_NonTerminalSymbol_Set.append(nts_E);


    // 创建非终结符T
    var name_T:String = "T";
    var pProductionTable_T = ArrayList<Production>();
    var numOfProduction_T = 2;
    var pFirstSet_T = HashSet<TerminalSymbol>();
    var pFollowSet_T = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_T = HashSet<NonTerminalSymbol>();
    var nts_T:NonTerminalSymbol = NonTerminalSymbol(name_T,non_s,pProductionTable_T,numOfProduction_T,pFirstSet_T,pFollowSet_T,pDependentSetInFollow_T);
    all_NonTerminalSymbol_Set.append(nts_T);


    // 创建非终结符F
    var name_F:String = "F";
    var pProductionTable_F = ArrayList<Production>();
    var numOfProduction_F = 2;
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

    // 创建终结符$
    var name_shut:String = "$";
    var lexeme_shut:String = "$";
    var ts_shut = TerminalSymbol(name_shut,ter_s,lexeme_shut);
    // 把结束符$是开始符的FOLLOW天然已知条件添加进去
    nts_E.pFollowSet.put(ts_shut);

    // 创建产生式 E'->E
    var production_0_id:Int64 = 0;
    var production_0_size:Int64 = 1;
    var production_0_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_0_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_0:Production = Production(production_0_id,production_0_size,production_0_sTable,production_0_fSet);
    production_0.pBodySymbolTable.append(nts_E);
    // 将其添加进E的产生式中
    nts_E1.pProductionTable.append(production_0);
    nts_E1.numOfProduction = 1;
    all_Production_Set.append(production_0);

    // 创建产生式 E->E + T
    var production_1_id:Int64 = 1;
    var production_1_size:Int64 = 3;
    var production_1_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_1_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_1:Production = Production(production_1_id,production_1_size,production_1_sTable,production_1_fSet);
    production_1.pBodySymbolTable.append(nts_E);
    production_1.pBodySymbolTable.append(ts_plus);
    production_1.pBodySymbolTable.append(nts_T);
    // 将其添加进E的产生式中
    nts_E.pProductionTable.append(production_1);
    nts_E.numOfProduction = 2;
    all_Production_Set.append(production_1);
    
    // 创建产生式 E->T
    var production_2_id:Int64 = 2;
    var production_2_size:Int64 = 1;
    var production_2_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_2_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_2:Production = Production(production_2_id,production_2_size,production_2_sTable,production_2_fSet);
    production_2.pBodySymbolTable.append(nts_T);
    // 将其添加进E的产生式中
    nts_E.pProductionTable.append(production_2);
    nts_E.numOfProduction = 2;
    all_Production_Set.append(production_2);

    // 创建产生式 T->T * F
    var production_3_id:Int64 = 3;
    var production_3_size:Int64 = 3;
    var production_3_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_3_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_3:Production = Production(production_3_id,production_3_size,production_3_sTable,production_3_fSet);
    production_3.pBodySymbolTable.append(nts_T);
    production_3.pBodySymbolTable.append(ts_multiple);
    production_3.pBodySymbolTable.append(nts_F);
    // 将其添加进T的产生式中
    nts_T.pProductionTable.append(production_3);
    nts_T.numOfProduction = 2;
    all_Production_Set.append(production_3);

    // 创建产生式 T->F
    var production_4_id:Int64 = 4;
    var production_4_size:Int64 = 1;
    var production_4_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_4_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_4:Production = Production(production_4_id,production_4_size,production_4_sTable,production_4_fSet);
    production_4.pBodySymbolTable.append(nts_F);
    // 将其添加进T的产生式中
    nts_T.pProductionTable.append(production_4);
    nts_T.numOfProduction = 2;
    all_Production_Set.append(production_4);

    // 创建产生式 F->( E )
    var production_5_id:Int64 = 5;
    var production_5_size:Int64 = 3;
    var production_5_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_5_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_5:Production = Production(production_5_id,production_5_size,production_5_sTable,production_5_fSet);
    production_5.pBodySymbolTable.append(ts_left_bracket);
    production_5.pBodySymbolTable.append(nts_E);
    production_5.pBodySymbolTable.append(ts_right_bracket);
    // 将其添加进F的产生式中
    nts_F.pProductionTable.append(production_5);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_5);

    // 创建产生式 F->id
    var production_6_id:Int64 = 6;
    var production_6_size:Int64 = 1;
    var production_6_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_6_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_6:Production = Production(production_6_id,production_6_size,production_6_sTable,production_6_fSet);
    production_6.pBodySymbolTable.append(ts_id);
    // 将其添加进F的产生式中
    nts_F.pProductionTable.append(production_6);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_6);
    // // 先求解出所有非终结符的FIRST
    // get_NFS_FIRST();
    // // 再求解出所有产生式的FIRST
    // get_All_Production_FIRST();
    // 求出所有非终结符的FOLLOW
    get_NFS_FOLLOW();
    // 展示所有非终结符的FOLLOW
    show_NFS_FOLLOW();
}
// 针对第二题的第一小题测试样例
public func test2_1(){
    // 其中非终结符的顺序是 E' E T F

    // 创建I0核心项 E'->E
    var I0_0_item:LR0Item = LR0Item(all_NonTerminalSymbol_Set[0],all_Production_Set[0],0,"CORE");

    // 创建I0（只含核心项）
    var I0:ItemSet = ItemSet(0,ArrayList<LR0Item>());
    I0.pItemTable.append(I0_0_item);
    pItemSetTable.append(I0);
    getClosure(I0);
    show_ItemSet(I0);
    exhaustTransition(I0);
    //show_All_itemSet();
}
public func show_All_itemSet(){
    for(iS in pItemSetTable) {
        println("L${iS.stateId} :")
        show_ItemSet(iS);
        println();
    }
}
// 一个项集中LR(0)核心项的闭包求解
public func getClosure(itemSet: ItemSet){
    // 已经出现过的NTS集合
    var hasShowSet:HashSet<NonTerminalSymbol> = HashSet<NonTerminalSymbol>();
    // 队首是正在进行筛选的NTS集合(想要加入队伍 必须没有出现过)
    var prepare_queue:ArrayList<NonTerminalSymbol> = ArrayList<NonTerminalSymbol>();
    // 初始化队列
    for(item in itemSet.pItemTable) {
        // 不可以越界
        if(item.dotPosition < item.production.pBodySymbolTable.size) {
            var curr_symbol:GrammarSymbol = item.production.pBodySymbolTable[item.dotPosition];
            // 如果当前符号是非终结符才会操作
            if(curr_symbol is NonTerminalSymbol) {
                var curr_NTS:NonTerminalSymbol = curr_symbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
                if(curr_NTS != none_NonTerminalSymbol) {
                    if(!hasShowSet.contains(curr_NTS)) {
                        prepare_queue.append(curr_NTS);
                        hasShowSet.put(curr_NTS);
                    }
                }
            } 
        }
    }
    while(!prepare_queue.isEmpty()) {
        // 取出队首NTS
        var curr_NTS:NonTerminalSymbol = prepare_queue[0];
        prepare_queue.remove(0);
        for(production in curr_NTS.pProductionTable) {
            // 插入非核心项
            var item:LR0Item = LR0Item(curr_NTS,production,0,"NONCORE");
            itemSet.pItemTable.append(item);
            // 针对此项继续展开
            var curr_symbol:GrammarSymbol = production.pBodySymbolTable[0];
            if(curr_symbol is NonTerminalSymbol) {
                var temp_NTS:NonTerminalSymbol = curr_symbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
                if(temp_NTS != none_NonTerminalSymbol) {
                    // 添加进队列
                    if(!hasShowSet.contains(temp_NTS)) {
                        prepare_queue.append(temp_NTS);
                        hasShowSet.put(temp_NTS);
                    }
                }
            }
        }
    }
}
// 展示一个项集
public func show_ItemSet(itemSet: ItemSet) {
    // 先展示核心项
    for(item in itemSet.pItemTable) {
        if(item.itemType == "CORE") {
            print("${item.nonTerminalSymbol.name} ->");
            var i:Int64 = 0;
            while(i<item.production.pBodySymbolTable.size) {
                if(i == item.dotPosition) {
                    print(" ·");
                }
                print(" ${item.production.pBodySymbolTable[i].name}");
                i++;
            }
            if(i == item.dotPosition) {
                print(" ·");
            }
            println("     CORE");
        }
    }
    // 再展示非核心项
    for(item in itemSet.pItemTable) {
        if(item.itemType == "NONCORE") {
            print("${item.nonTerminalSymbol.name} ->");
            var i:Int64 = 0;
            while(i<item.production.pBodySymbolTable.size) {
                if(i == item.dotPosition) {
                    print(" ·");
                }
                print(" ${item.production.pBodySymbolTable[i].name}");
                i++;
            }
            if(i == item.dotPosition) {
                print(" ·");
            }
            println("     NONCORE");
        }
    }
}
// LR(0)项集的变迁：穷举出边 ok  后继项集核心项确定以及创建  ok  后继项集是否为新项集 为项集实现equatiable  从L0开始生成整个DFA
public func exhaustTransition(itemSet0:ItemSet) {
    var transition_queue:ArrayList<ItemSet> = ArrayList<ItemSet>();
    transition_queue.append(itemSet0);
    while(!transition_queue.isEmpty()){
        var itemSet = transition_queue[0];
        transition_queue.remove(0);
        var drive_NTS:HashSet<NonTerminalSymbol> = HashSet<NonTerminalSymbol>();
        var drive_TS:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
        // 收集驱动文法符
        for(item in itemSet.pItemTable) {
            // 必须是没有到最后
            if(item.dotPosition < item.production.pBodySymbolTable.size) {
                var curr_symbol:GrammarSymbol = item.production.pBodySymbolTable[item.dotPosition];
                if(curr_symbol is NonTerminalSymbol) {
                    var curr_nts:NonTerminalSymbol = curr_symbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
                    if(curr_nts != none_NonTerminalSymbol) {
                        drive_NTS.put(curr_nts);
                    }
                } else {
                    var curr_ts:TerminalSymbol = curr_symbol as TerminalSymbol ?? none_TerminalSymbol;
                    if(curr_ts != none_TerminalSymbol) {
                        drive_TS.put(curr_ts);
                    }
                }
            }
        }
        // 针对非终结符来穷举下一项集
        for(nts in drive_NTS) {
            // 创建新的项集
            var Inew:ItemSet = ItemSet(pItemSetTable.size,ArrayList<LR0Item>());
            for(item in itemSet.pItemTable) {
                if(item.dotPosition < item.production.pBodySymbolTable.size) {
                    var curr_Symbol:GrammarSymbol = item.production.pBodySymbolTable[item.dotPosition];
                    if(curr_Symbol is NonTerminalSymbol) {
                        var curr_Nts:NonTerminalSymbol = curr_Symbol as NonTerminalSymbol ?? none_NonTerminalSymbol;
                        if(curr_Nts != none_NonTerminalSymbol && curr_Nts == nts) {
                            var new_item:LR0Item = LR0Item(item.nonTerminalSymbol,item.production,item.dotPosition+1,"CORE");
                            Inew.pItemTable.append(new_item);
                        }
                    }
                }
            }
            if(!contains(Inew)) {
                pTransitionEdgeTable.append(TransitionEdge(nts,itemSet,Inew));
                getClosure(Inew);
                pItemSetTable.append(Inew);
                transition_queue.append(Inew);
            }
        }
        // 针对终结符来穷举下一项集
        for(ts in drive_TS) {
            // 创建新的项集
            var Inew:ItemSet = ItemSet(pItemSetTable.size,ArrayList<LR0Item>());
            for(item in itemSet.pItemTable) {
                if(item.dotPosition < item.production.pBodySymbolTable.size) {
                    var curr_Symbol:GrammarSymbol = item.production.pBodySymbolTable[item.dotPosition];
                    if(curr_Symbol is TerminalSymbol) {
                        var curr_Ts:TerminalSymbol = curr_Symbol as TerminalSymbol ?? none_TerminalSymbol;
                        if(curr_Ts != none_TerminalSymbol && curr_Ts == ts) {
                            var new_item:LR0Item = LR0Item(item.nonTerminalSymbol,item.production,item.dotPosition+1,"CORE");
                            Inew.pItemTable.append(new_item);
                        }
                    }
                }
            }
            if(!contains(Inew)) {
                pTransitionEdgeTable.append(TransitionEdge(ts,itemSet,Inew));
                getClosure(Inew);
                pItemSetTable.append(Inew);
                transition_queue.append(Inew);
            }
        }        
    }
}
// 检查项集是否已经出现
public func contains(itemSet:ItemSet):Bool {
    for(iS in pItemSetTable) {
        if(iS == itemSet) {
            return true;
        }
    }
    return false;
}
public func test2_4(){

}
// 判断文法是否为SLR(1)文法
public func judge_SLR1():Bool {


    return false;
}