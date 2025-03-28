package lab2
import std.collection.*
// 关于非终结符
public var getNTS:HashMap<String, NonTerminalSymbol> = HashMap<String, NonTerminalSymbol>();
// 关于终结符
public var getTS:HashMap<String, TerminalSymbol> = HashMap<String, TerminalSymbol>();
// 关于LL(1)的语法分析表
public var pParseTableOfLL:ArrayList<ArrayList<Cell>> = ArrayList<ArrayList<Cell>>();
// 构建LR文法的DFA时，将所有的项集放在一个表中
public var pItemSetTable:ArrayList<ItemSet> = ArrayList<ItemSet>();
// 构建LR文法的DFA的时候，将所有的边放在一个表中
public var pTransitionEdgeTable:ArrayList<TransitionEdge> = ArrayList<TransitionEdge>();
// LR语法分析表的ACTION部分
public var pActionCellTable:HashMap<ItemSet, HashMap<TerminalSymbol, ActionCell>> = HashMap<ItemSet, HashMap<TerminalSymbol, ActionCell>>();
// LR语法分析表的GOTO部分
public var pGOTOCellTable:HashMap<ItemSet, HashMap<NonTerminalSymbol, GotoCell>> = HashMap<ItemSet, HashMap<NonTerminalSymbol, GotoCell>>();
// 产生式概述表
public var pProductionInfoTable:ArrayList<ProductionInfo> = ArrayList<ProductionInfo>();

main(): Int64 {
    test_Arithmetic_Operation();
    return 0
}
// 测试第一题
public func testTask1(){
    test1();
    //show_all_nts_production();
    get_All_NFS_FIRST();
    show_All_NFS_FIRST();
    get_All_Production_FIRST();
    show_All_Production_FIRST();
    get_All_NTS_FOLLOW();
    show_All_NTS_FOLLOW();
}
// 测试第二题
public func testTask2(){
    test2();
    test2_1();
    test2_4();
    test2_5();
}