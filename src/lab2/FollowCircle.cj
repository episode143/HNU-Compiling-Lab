package comprehensiveLab.lab2
import std.collection.*
public func create_follow_circle_case(){
    // 创建非终结符S
    var name_S:String = "S";
    var pProductionTable_S = ArrayList<Production>();
    var numOfProduction_S = 1;
    var pFirstSet_S = HashSet<TerminalSymbol>();
    var pFollowSet_S = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_S = HashSet<NonTerminalSymbol>();
    var nts_S:NonTerminalSymbol = NonTerminalSymbol(name_S,non_s,pProductionTable_S,numOfProduction_S,pFirstSet_S,pFollowSet_S,pDependentSetInFollow_S);
    all_NonTerminalSymbol_Set.append(nts_S);
    getNTS.put(name_S,nts_S);

    // 创建非终结符B
    var name_B:String = "B";
    var pProductionTable_B = ArrayList<Production>();
    var numOfProduction_B = 2;
    var pFirstSet_B = HashSet<TerminalSymbol>();
    var pFollowSet_B = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_B = HashSet<NonTerminalSymbol>();
    var nts_B:NonTerminalSymbol = NonTerminalSymbol(name_B,non_s,pProductionTable_B,numOfProduction_B,pFirstSet_B,pFollowSet_B,pDependentSetInFollow_B);
    all_NonTerminalSymbol_Set.append(nts_B);
    getNTS.put(name_B,nts_B);

    // 创建非终结符T
    var name_T:String = "T";
    var pProductionTable_T = ArrayList<Production>();
    var numOfProduction_T = 2;
    var pFirstSet_T = HashSet<TerminalSymbol>();
    var pFollowSet_T = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_T = HashSet<NonTerminalSymbol>();
    var nts_T:NonTerminalSymbol = NonTerminalSymbol(name_T,non_s,pProductionTable_T,numOfProduction_T,pFirstSet_T,pFollowSet_T,pDependentSetInFollow_T);
    all_NonTerminalSymbol_Set.append(nts_T);
    getNTS.put(name_T,nts_T);

    // 创建非终结符S'
    var name_S1:String = "S'";
    var pProductionTable_S1 = ArrayList<Production>();
    var numOfProduction_S1 = 2;
    var pFirstSet_S1 = HashSet<TerminalSymbol>();
    var pFollowSet_S1 = HashSet<TerminalSymbol>();
    var pDependentSetInFollow_S1 = HashSet<NonTerminalSymbol>();
    var nts_S1:NonTerminalSymbol = NonTerminalSymbol(name_S1,non_s,pProductionTable_S1,numOfProduction_S1,pFirstSet_S1,pFollowSet_S1,pDependentSetInFollow_S1);
    all_NonTerminalSymbol_Set.append(nts_S1);
    getNTS.put(name_S1,nts_S1);

    // 创建终结符+
    var name_plus:String = "+";
    var lexeme_plus:String = "OPERATOR+";
    var ts_plus = TerminalSymbol(name_plus,ter_s,lexeme_plus);
    getTS.put(name_plus,ts_plus);

    // 创建终结符(
    var name_left_bracket:String ="(";
    var lexeme_left_bracket:String = "LEFT BRACKET";
    var ts_left_bracket = TerminalSymbol(name_left_bracket,ter_s,lexeme_left_bracket);
    getTS.put(name_left_bracket,ts_left_bracket);

    // 创建终结符)
    var name_right_bracket:String =")";
    var lexeme_right_bracket:String = "RIGHT BRACKET";
    var ts_right_bracket = TerminalSymbol(name_right_bracket,ter_s,lexeme_right_bracket);
    getTS.put(name_right_bracket,ts_right_bracket);

    // 创建终结符*
    var name_multiple:String ="*";
    var lexeme_multiple:String = "OPERATOR*";
    var ts_multiple = TerminalSymbol(name_multiple,ter_s,lexeme_multiple);
    getTS.put(name_multiple,ts_multiple);

    // 创建终结符a
    var name_a:String = "a";
    var lexeme_a:String = "ID";
    var ts_a = TerminalSymbol(name_a,ter_s,lexeme_a);
    getTS.put(name_a,ts_a);

    // 创建终结符$
    var name_shut:String = "$";
    var lexeme_shut:String = "$";
    var ts_shut = TerminalSymbol(name_shut,ter_s,lexeme_shut);
    getTS.put(name_shut,ts_shut);

    // 结束符$是开始符的FOLLOW
    nts_S.pFollowSet.put(ts_shut);

    // 创建产生式 S->T B
    var production_1_id:Int64 = 1;
    var production_1_size:Int64 = 2;
    var production_1_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_1_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_1:Production = Production(production_1_id,production_1_size,production_1_sTable,production_1_fSet);
    production_1.pBodySymbolTable.append(nts_T);
    production_1.pBodySymbolTable.append(nts_B);
    // 将其添加进S的产生式中
    nts_S.pProductionTable.append(production_1);
    nts_S.numOfProduction = 1;
    all_Production_Set.append(production_1);
    
    // 创建产生式 B->S' B
    var production_2_id:Int64 = 2;
    var production_2_size:Int64 = 2;
    var production_2_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_2_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_2:Production = Production(production_2_id,production_2_size,production_2_sTable,production_2_fSet);
    production_2.pBodySymbolTable.append(nts_S1);
    production_2.pBodySymbolTable.append(nts_B);
    // 将其添加进B的产生式中
    nts_B.pProductionTable.append(production_2);
    nts_B.numOfProduction = 2;
    all_Production_Set.append(production_2);

    // 创建产生式 B->null
    var production_3_id:Int64 = 3;
    var production_3_size:Int64 = 1;
    var production_3_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_3_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_3:Production = Production(production_3_id,production_3_size,production_3_sTable,production_3_fSet);
    production_3.pBodySymbolTable.append(ts_null);
    // 将其添加进B的产生式中
    nts_B.pProductionTable.append(production_3);
    nts_B.numOfProduction = 2;
    all_Production_Set.append(production_3);

    // 创建产生式 S'->+ S
    var production_4_id:Int64 = 4;
    var production_4_size:Int64 = 2;
    var production_4_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_4_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_4:Production = Production(production_4_id,production_4_size,production_4_sTable,production_4_fSet);
    production_4.pBodySymbolTable.append(ts_plus);
    production_4.pBodySymbolTable.append(nts_S);
    // 将其添加进S'的产生式中
    nts_S1.pProductionTable.append(production_4);
    nts_S1.numOfProduction = 2;
    all_Production_Set.append(production_4);

    // 创建产生式 S'->T B
    var production_5_id:Int64 = 5;
    var production_5_size:Int64 = 2;
    var production_5_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_5_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_5:Production = Production(production_5_id,production_5_size,production_5_sTable,production_5_fSet);
    production_5.pBodySymbolTable.append(nts_T);
    production_5.pBodySymbolTable.append(nts_B);
    // 将其添加进S'的产生式中
    nts_S1.pProductionTable.append(production_5);
    nts_S1.numOfProduction = 2;
    all_Production_Set.append(production_5);

    // 创建产生式 T->( S )
    var production_6_id:Int64 = 6;
    var production_6_size:Int64 = 3;
    var production_6_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_6_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_6:Production = Production(production_6_id,production_6_size,production_6_sTable,production_6_fSet);
    production_6.pBodySymbolTable.append(ts_left_bracket);
    production_6.pBodySymbolTable.append(nts_S);
    production_6.pBodySymbolTable.append(ts_right_bracket);
    // 将其添加进T的产生式中
    nts_T.pProductionTable.append(production_6);
    nts_T.numOfProduction = 2;
    all_Production_Set.append(production_6);

    // 创建产生式 T->a
    var production_7_id:Int64 = 7;
    var production_7_size:Int64 = 1;
    var production_7_sTable:ArrayList<GrammarSymbol> = ArrayList<GrammarSymbol>();
    var production_7_fSet:HashSet<TerminalSymbol> = HashSet<TerminalSymbol>();
    var production_7:Production = Production(production_7_id,production_7_size,production_7_sTable,production_7_fSet);
    production_7.pBodySymbolTable.append(ts_a);
    // 将其添加进T的产生式中
    nts_T.pProductionTable.append(production_7);
    nts_T.numOfProduction = 2;
    all_Production_Set.append(production_7);

    
    // 先求解出所有非终结符的FIRST
    get_All_NTS_FIRST();
    // 展示所有终结符的FIRST
    show_All_NTS_FIRST();
    // 再求解出所有产生式的FIRST
    get_All_Production_FIRST();
    // 展示所有产生式的FIRST
    show_All_Production_FIRST();
    // 求出所有非终结符的FOLLOW
    get_All_NTS_FOLLOW();
    // 展示所有非终结符的FOLLOW
    show_All_NTS_FOLLOW();
}