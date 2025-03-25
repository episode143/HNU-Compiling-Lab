package lab2
import std.collection.*
main(): Int64 {
    // 关于LL(1)的语法分析表
    var pParseTableOfLL:ArrayList<ArrayList<Cell>>;
    // 构建LR文法的DFA时，将所有的项集放在一个表中
    var pItemSetTable:ArrayList<ItemSet>;
    // LR语法分析表的ACTION部分
    var pActionCellTable:ArrayList<ActionCell>;
    // LR语法分析表的GOTO部分
    var pGOTOCellTable:ArrayList<GotoCell>;
    // 产生式概述表
    var pProductionInfoTable:ArrayList<ProductionInfo>;
    return 0
}