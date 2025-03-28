package lab2
import std.collection.*;
public func test_Arithmetic_Operation() {
    create_Arithmetic_Grammar();
    create_Arithmetic_Grammar_LR0_DFA();
    var isSLR1:Bool = judge_SLR1();
    if(isSLR1) {
        println("当前文法是SLR1文法");
    }
    // 创建LR1语法分析表
    create_LR1_Analysis_Table();
}
// 创建算数运算的文法
public func create_Arithmetic_Grammar() {
    // 创建非终结符E'
    var nts_E1:NonTerminalSymbol = NonTerminalSymbol("E'","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_E1);

    // 创建非终结符E
    var nts_E:NonTerminalSymbol = NonTerminalSymbol("E","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_E);

    // 创建非终结符T
    var nts_T:NonTerminalSymbol = NonTerminalSymbol("T","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_T);

    // 创建非终结符F
    var nts_F:NonTerminalSymbol = NonTerminalSymbol("F","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_F);

    // 创建终结符 +
    var ts_plus:TerminalSymbol = TerminalSymbol("+","TERMINAL","OPERATOR");

    // 创建终结符 -
    var ts_subtract:TerminalSymbol = TerminalSymbol("-","TERMINAL","OPERATOR");

    // 创建终结符 *
    var ts_multiply:TerminalSymbol = TerminalSymbol("*","TERMINAL","OPERATOR");

    // 创建终结符 /
    var ts_devide:TerminalSymbol = TerminalSymbol("/","TERMINAL","OPERATOR");

    // 创建终结符 num
    var ts_num:TerminalSymbol = TerminalSymbol("num","TERMINAL","NUM");

    // 创建终结符 (
    var ts_left_bracket:TerminalSymbol = TerminalSymbol("(","TERMINAL","OPERATOR");

    // 创建终结符 )
    var ts_right_bracket:TerminalSymbol = TerminalSymbol(")","TERMINAL","OPERATOR");

    // 创建终结符 $
    var ts_shut:TerminalSymbol = TerminalSymbol("$","TERMINAL","SHUT");
    nts_E.pFollowSet.put(ts_shut);

    // 创建产生式E'->E $
    var production_0:Production = Production(0,2);
    production_0.pBodySymbolTable.append(nts_E);
    production_0.pBodySymbolTable.append(ts_shut);
    nts_E1.pProductionTable.append(production_0);
    nts_E1.numOfProduction = 1;
    all_Production_Set.append(production_0);

    // 创建产生式E->E + T
    var production_1:Production = Production(1,3);
    production_1.pBodySymbolTable.append(nts_E);
    production_1.pBodySymbolTable.append(ts_plus);
    production_1.pBodySymbolTable.append(nts_T);
    nts_E.pProductionTable.append(production_1);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_1);

    // 创建产生式E->E - T
    var production_2:Production = Production(2,3);
    production_2.pBodySymbolTable.append(nts_E);
    production_2.pBodySymbolTable.append(ts_subtract);
    production_2.pBodySymbolTable.append(nts_T);
    nts_E.pProductionTable.append(production_2);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_2);

    // 创建产生式E->T
    var production_3:Production = Production(3,1);
    production_3.pBodySymbolTable.append(nts_T);
    nts_E.pProductionTable.append(production_3);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_3);

    // 创建产生式E->num
    var production_4:Production = Production(4,1);
    production_4.pBodySymbolTable.append(ts_num);
    nts_E.pProductionTable.append(production_4);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_4);

    // 创建产生式T->T * F
    var production_5:Production = Production(5,3);
    production_5.pBodySymbolTable.append(nts_T);
    production_5.pBodySymbolTable.append(ts_multiply);
    production_5.pBodySymbolTable.append(nts_F);
    nts_T.pProductionTable.append(production_5);
    nts_T.numOfProduction = 3;
    all_Production_Set.append(production_5);

    // 创建产生式T->T / F
    var production_6:Production = Production(6,3);
    production_6.pBodySymbolTable.append(nts_T);
    production_6.pBodySymbolTable.append(ts_devide);
    production_6.pBodySymbolTable.append(nts_F);
    nts_T.pProductionTable.append(production_6);
    nts_T.numOfProduction = 3;
    all_Production_Set.append(production_6);

    // 创建产生式T->F
    var production_7:Production = Production(7,1);
    production_7.pBodySymbolTable.append(nts_F);
    nts_T.pProductionTable.append(production_7);
    nts_T.numOfProduction = 3;
    all_Production_Set.append(production_7);

    // 创建产生式F->( E )
    var production_8:Production = Production(8,3);
    production_8.pBodySymbolTable.append(ts_left_bracket);
    production_8.pBodySymbolTable.append(nts_E);
    production_8.pBodySymbolTable.append(ts_right_bracket);
    nts_F.pProductionTable.append(production_8);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_8);

    // 创建产生式F->num
    var production_9:Production = Production(9,1);
    production_9.pBodySymbolTable.append(ts_num);
    nts_F.pProductionTable.append(production_9);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_9);
    
    // 展示所有非终结符的FIRST
    println("展示所有非终结符的FIRST");
    get_All_NFS_FIRST();
    show_All_NFS_FIRST();
    println();
    // 展示所有产生式的FIRST
    println("展示所有产生式的FIRST");
    get_All_Production_FIRST();
    show_All_Production_FIRST();
    println();
    // 展示所有非终结符的FOLLOW
    println("展示所有非终结符的FOLLOW");
    get_All_NTS_FOLLOW();
    show_All_NTS_FOLLOW();
    println();
}

// 创建LR(0)的DFA
public func create_Arithmetic_Grammar_LR0_DFA() {
    // 创建I0核心项 E'->E
    var I0_0_item:LR0Item = LR0Item(all_NonTerminalSymbol_Set[0],all_Production_Set[0],0,"CORE");

    // 创建I0（只含核心项）
    var I0:ItemSet = ItemSet(0,ArrayList<LR0Item>());
    I0.pItemTable.append(I0_0_item);
    pItemSetTable.append(I0);
    getClosure(I0);
    show_ItemSet(I0);
    exhaustTransition(I0);
    show_All_itemSet();
}
