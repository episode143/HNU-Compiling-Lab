package comprehensiveLab.lab2
import std.collection.*;
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
// 所有产生式对应的非终结符的编号
public var relativeId:ArrayList<Int64> = ArrayList<Int64>();