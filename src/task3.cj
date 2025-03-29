package lab2
import std.collection.*;
// 创建算数运算的文法
public func create_Arithmetic_Grammar() {
    // 创建非终结符E'
    var nts_E1:NonTerminalSymbol = NonTerminalSymbol("E'","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_E1);
    getNTS.put(nts_E1.name,nts_E1);

    // 创建非终结符E
    var nts_E:NonTerminalSymbol = NonTerminalSymbol("E","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_E);
    getNTS.put(nts_E.name,nts_E);

    // 创建非终结符T
    var nts_T:NonTerminalSymbol = NonTerminalSymbol("T","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_T);
    getNTS.put(nts_T.name,nts_T);

    // 创建非终结符F
    var nts_F:NonTerminalSymbol = NonTerminalSymbol("F","NONTERMINAL");
    all_NonTerminalSymbol_Set.append(nts_F);
    getNTS.put(nts_F.name,nts_F);

    // 创建终结符 +
    var ts_plus:TerminalSymbol = TerminalSymbol("+","TERMINAL","OPERATOR");
    getTS.put(ts_plus.name,ts_plus);

    // 创建终结符 -
    var ts_subtract:TerminalSymbol = TerminalSymbol("-","TERMINAL","OPERATOR");
    getTS.put(ts_subtract.name,ts_subtract);

    // 创建终结符 *
    var ts_multiply:TerminalSymbol = TerminalSymbol("*","TERMINAL","OPERATOR");
    getTS.put(ts_multiply.name,ts_multiply);

    // 创建终结符 /
    var ts_devide:TerminalSymbol = TerminalSymbol("/","TERMINAL","OPERATOR");
    getTS.put(ts_devide.name,ts_devide);

    // 创建终结符 num
    var ts_num:TerminalSymbol = TerminalSymbol("num","TERMINAL","NUM");
    getTS.put(ts_num.name,ts_num);

    // 创建终结符 (
    var ts_left_bracket:TerminalSymbol = TerminalSymbol("(","TERMINAL","OPERATOR");
    getTS.put(ts_left_bracket.name,ts_left_bracket);

    // 创建终结符 )
    var ts_right_bracket:TerminalSymbol = TerminalSymbol(")","TERMINAL","OPERATOR");
    getTS.put(ts_right_bracket.name,ts_right_bracket);

    // 创建终结符 $
    var ts_shut:TerminalSymbol = TerminalSymbol("$","TERMINAL","SHUT");
    getTS.put(ts_shut.name,ts_shut);
    nts_E.pFollowSet.put(ts_shut);

    // 创建产生式E'->E $
    var production_0:Production = Production(0,2);
    production_0.pBodySymbolTable.append(nts_E);
    production_0.pBodySymbolTable.append(ts_shut);
    nts_E1.pProductionTable.append(production_0);
    nts_E1.numOfProduction = 1;
    all_Production_Set.append(production_0);
    relativeId.append(0);

    // 创建产生式E->E + T
    var production_1:Production = Production(1,3);
    production_1.pBodySymbolTable.append(nts_E);
    production_1.pBodySymbolTable.append(ts_plus);
    production_1.pBodySymbolTable.append(nts_T);
    nts_E.pProductionTable.append(production_1);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_1);
    relativeId.append(1);

    // 创建产生式E->E - T
    var production_2:Production = Production(2,3);
    production_2.pBodySymbolTable.append(nts_E);
    production_2.pBodySymbolTable.append(ts_subtract);
    production_2.pBodySymbolTable.append(nts_T);
    nts_E.pProductionTable.append(production_2);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_2);
    relativeId.append(1);

    // 创建产生式E->T
    var production_3:Production = Production(3,1);
    production_3.pBodySymbolTable.append(nts_T);
    nts_E.pProductionTable.append(production_3);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_3);
    relativeId.append(1);

    // 创建产生式E->num
    var production_4:Production = Production(4,1);
    production_4.pBodySymbolTable.append(ts_num);
    nts_E.pProductionTable.append(production_4);
    nts_E.numOfProduction = 4;
    all_Production_Set.append(production_4);
    relativeId.append(1);

    // 创建产生式T->T * F
    var production_5:Production = Production(5,3);
    production_5.pBodySymbolTable.append(nts_T);
    production_5.pBodySymbolTable.append(ts_multiply);
    production_5.pBodySymbolTable.append(nts_F);
    nts_T.pProductionTable.append(production_5);
    nts_T.numOfProduction = 3;
    all_Production_Set.append(production_5);
    relativeId.append(2);

    // 创建产生式T->T / F
    var production_6:Production = Production(6,3);
    production_6.pBodySymbolTable.append(nts_T);
    production_6.pBodySymbolTable.append(ts_devide);
    production_6.pBodySymbolTable.append(nts_F);
    nts_T.pProductionTable.append(production_6);
    nts_T.numOfProduction = 3;
    all_Production_Set.append(production_6);
    relativeId.append(2);

    // 创建产生式T->F
    var production_7:Production = Production(7,1);
    production_7.pBodySymbolTable.append(nts_F);
    nts_T.pProductionTable.append(production_7);
    nts_T.numOfProduction = 3;
    all_Production_Set.append(production_7);
    relativeId.append(2);

    // 创建产生式F->( E )
    var production_8:Production = Production(8,3);
    production_8.pBodySymbolTable.append(ts_left_bracket);
    production_8.pBodySymbolTable.append(nts_E);
    production_8.pBodySymbolTable.append(ts_right_bracket);
    nts_F.pProductionTable.append(production_8);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_8);
    relativeId.append(3);

    // 创建产生式F->num
    var production_9:Production = Production(9,1);
    production_9.pBodySymbolTable.append(ts_num);
    nts_F.pProductionTable.append(production_9);
    nts_F.numOfProduction = 2;
    all_Production_Set.append(production_9);
    relativeId.append(3);
    
    // 展示所有非终结符的FIRST
    println("展示所有非终结符的FIRST");
    get_All_NTS_FIRST();
    show_All_NTS_FIRST();
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
// 创建算数运算LR(0)的DFA
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
// 以算数运算表达式文法验证程序代码正确性
public func test_Arithmetic_Operation() {
    create_Arithmetic_Grammar();
    create_Arithmetic_Grammar_LR0_DFA();
    var isSLR1:Bool = judge_SLR1();
    if(isSLR1) {
        println("当前文法是SLR1文法");
    }
    // 创建LR1语法分析表
    create_LR1_Analysis_Table();
    var testGrammarSequence:ArrayList<String> = ArrayList<String>();
    testGrammarSequence.append("num");
    testGrammarSequence.append("*");
    testGrammarSequence.append("(");
    testGrammarSequence.append("num");
    testGrammarSequence.append("+");
    testGrammarSequence.append("num");
    testGrammarSequence.append(")");
    testGrammarSequence.append("+");
    testGrammarSequence.append("num");
    testGrammarSequence.append("$");
    judge_Sentence_LR_Grammar(testGrammarSequence);
    
}
// LR语法分析的通用代码
public func judge_Sentence_LR_Grammar(ts_sequence:ArrayList<String>) {
    // 状态栈存储编号
    var pStateStack:ArrayList<Int64> = ArrayList<Int64>();
    pStateStack.append(0);
    var currentLexeme_pos:Int64 = 0;
    while(!pStateStack.isEmpty()) {
        var currSize:Int64 = pStateStack.size;
        // 求出当前状态
        var currentState = pStateStack[currSize-1];
        println("当前状态：${currentState}  当前驱动非终结符：${ts_sequence[currentLexeme_pos]}");
        if(pActionCellTable[pItemSetTable[currentState]].contains(getTS[ts_sequence[currentLexeme_pos]])) {
            var indicator:ActionCell = pActionCellTable[pItemSetTable[currentState]][getTS[ts_sequence[currentLexeme_pos]]];
            println("action： ${indicator.actionType} ${indicator.actionId}");
            if(indicator.actionType == "s") {
                pStateStack.append(indicator.actionId);
                currentLexeme_pos++;
                println("当前状态栈情况");
                for(st in pStateStack) {
                    print("${st} ");
                }
                println();
            }
            else if(indicator.actionType == "r") {
                var production:Production = all_Production_Set[indicator.actionId];
                println("当前规约编号：${indicator.actionId}");
                println();
                var times:Int64 = production.pBodySymbolTable.size;
                while(times!=0) {
                    times--;
                    var currTail = pStateStack.size;
                    if(currTail == 0) {
                        println("输入字符串有语法错误");
                        return;
                    }
                    pStateStack.remove(currTail-1);
                }
                var currTail:Int64 = pStateStack.size;
                currentState = pStateStack[currTail-1];
                var nextState:Int64 = pGOTOCellTable[pItemSetTable[currentState]][all_NonTerminalSymbol_Set[relativeId[indicator.actionId]]].nextStateId;
                pStateStack.append(nextState);
                println("当前状态栈情况");
                for(st in pStateStack) {
                    print("${st} ");
                }
                println();
            }
            else if(indicator.actionType == "acc") {
                println("语法分析完成,语法正确！");
                return;
            }
        }
        else {
            println("输入字符串有语法错误");
            return;
        }
    }
}
// 创建TINY语言的LR文法
public func create_TINY() {
    // MARK: - 终结符定义（全部显式列出）
    // 关键字
    var ts_if = TerminalSymbol("if", "TERMINAL", "KEYWORD")
    var ts_then = TerminalSymbol("then", "TERMINAL", "KEYWORD")
    var ts_end = TerminalSymbol("end", "TERMINAL", "KEYWORD")
    var ts_else = TerminalSymbol("else", "TERMINAL", "KEYWORD")
    var ts_repeat = TerminalSymbol("repeat", "TERMINAL", "KEYWORD")
    var ts_until = TerminalSymbol("until", "TERMINAL", "KEYWORD")
    var ts_read = TerminalSymbol("read", "TERMINAL", "KEYWORD")
    var ts_write = TerminalSymbol("write", "TERMINAL", "KEYWORD")

    // 运算符
    var ts_semicolon = TerminalSymbol(";", "TERMINAL", "OPERATOR")
    var ts_assign = TerminalSymbol(":=", "TERMINAL", "OPERATOR")
    var ts_less = TerminalSymbol("<", "TERMINAL", "OPERATOR")
    var ts_equal = TerminalSymbol("=", "TERMINAL", "OPERATOR")
    var ts_plus = TerminalSymbol("+", "TERMINAL", "OPERATOR")
    var ts_subtract = TerminalSymbol("-", "TERMINAL", "OPERATOR")
    var ts_multiply = TerminalSymbol("*", "TERMINAL", "OPERATOR")
    var ts_devide = TerminalSymbol("/", "TERMINAL", "OPERATOR")
    var ts_left_bracket = TerminalSymbol("(", "TERMINAL", "OPERATOR")
    var ts_right_bracket = TerminalSymbol(")", "TERMINAL", "OPERATOR")

    // 标识符和数字
    var ts_identifier = TerminalSymbol("identifier", "TERMINAL", "IDENTIFIER")
    var ts_number = TerminalSymbol("Number", "TERMINAL", "NUM")

    // 结束符
    var ts_shut = TerminalSymbol("$", "TERMINAL", "SHUT")

    // 将所有终结符添加到全局表
    getTS.put(ts_if.name, ts_if)
    getTS.put(ts_then.name, ts_then)
    getTS.put(ts_end.name, ts_end)
    getTS.put(ts_else.name, ts_else)
    getTS.put(ts_repeat.name, ts_repeat)
    getTS.put(ts_until.name, ts_until)
    getTS.put(ts_read.name, ts_read)
    getTS.put(ts_write.name, ts_write)
    getTS.put(ts_semicolon.name, ts_semicolon)
    getTS.put(ts_assign.name, ts_assign)
    getTS.put(ts_less.name, ts_less)
    getTS.put(ts_equal.name, ts_equal)
    getTS.put(ts_plus.name, ts_plus)
    getTS.put(ts_subtract.name, ts_subtract)
    getTS.put(ts_multiply.name, ts_multiply)
    getTS.put(ts_devide.name, ts_devide)
    getTS.put(ts_left_bracket.name, ts_left_bracket)
    getTS.put(ts_right_bracket.name, ts_right_bracket)
    getTS.put(ts_identifier.name, ts_identifier)
    getTS.put(ts_number.name, ts_number)
    getTS.put(ts_shut.name, ts_shut)    
    // MARK: - 非终结符定义（全部显式列出）
    // --------------------- 起始符号 Program' ---------------------
    var nts_Program1 = NonTerminalSymbol("Program'", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_Program1)
    getNTS.put(nts_Program1.name, nts_Program1)

    // --------------------- 其他非终结符 ---------------------
    var nts_Program = NonTerminalSymbol("Program", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_Program)
    getNTS.put(nts_Program.name, nts_Program)
    nts_Program.pFollowSet.put(ts_shut);

    var nts_stmt_sequence = NonTerminalSymbol("stmt-sequence", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_stmt_sequence)
    getNTS.put(nts_stmt_sequence.name, nts_stmt_sequence)

    var nts_statement = NonTerminalSymbol("statement", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_statement)
    getNTS.put(nts_statement.name, nts_statement)

    var nts_if_stmt = NonTerminalSymbol("if-stmt", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_if_stmt)
    getNTS.put(nts_if_stmt.name, nts_if_stmt)

    var nts_repeat_stmt = NonTerminalSymbol("repeat-stmt", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_repeat_stmt)
    getNTS.put(nts_repeat_stmt.name, nts_repeat_stmt)

    var nts_assign_stmt = NonTerminalSymbol("assign-stmt", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_assign_stmt)
    getNTS.put(nts_assign_stmt.name, nts_assign_stmt)

    var nts_read_stmt = NonTerminalSymbol("read-stmt", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_read_stmt)
    getNTS.put(nts_read_stmt.name, nts_read_stmt)

    var nts_write_stmt = NonTerminalSymbol("write-stmt", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_write_stmt)
    getNTS.put(nts_write_stmt.name, nts_write_stmt)

    var nts_exp = NonTerminalSymbol("exp", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_exp)
    getNTS.put(nts_exp.name, nts_exp)

    var nts_comparison_op = NonTerminalSymbol("comparison-op", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_comparison_op)
    getNTS.put(nts_comparison_op.name, nts_comparison_op)

    var nts_simple_exp = NonTerminalSymbol("simple-exp", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_simple_exp)
    getNTS.put(nts_simple_exp.name, nts_simple_exp)

    var nts_addop = NonTerminalSymbol("addop", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_addop)
    getNTS.put(nts_addop.name, nts_addop)

    var nts_term = NonTerminalSymbol("term", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_term)
    getNTS.put(nts_term.name, nts_term)

    var nts_mulop = NonTerminalSymbol("mulop", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_mulop)
    getNTS.put(nts_mulop.name, nts_mulop)

    var nts_factor = NonTerminalSymbol("factor", "NONTERMINAL")
    all_NonTerminalSymbol_Set.append(nts_factor)
    getNTS.put(nts_factor.name, nts_factor)

    // MARK: - 产生式定义（全部显式列出）
    // --------------------- 起始符号 Program' → Program $---------------------
    var production_0 = Production(0, 1)
    production_0.pBodySymbolTable.append(nts_Program)
    production_0.pBodySymbolTable.append(ts_shut)
    nts_Program1.pProductionTable.append(production_0)
    all_Production_Set.append(production_0)
    relativeId.append(0);

    // --------------------- Program → stmt-sequence ---------------------
    var production_1 = Production(1, 1)
    production_1.pBodySymbolTable.append(nts_stmt_sequence)
    nts_Program.pProductionTable.append(production_1)
    all_Production_Set.append(production_1)
    relativeId.append(1);

    // --------------------- stmt-sequence 递归定义 ---------------------
    // stmt-sequence → stmt-sequence ; statement
    var production_2 = Production(2, 3)
    production_2.pBodySymbolTable.append(nts_stmt_sequence)
    production_2.pBodySymbolTable.append(ts_semicolon)
    production_2.pBodySymbolTable.append(nts_statement)
    nts_stmt_sequence.pProductionTable.append(production_2)
    all_Production_Set.append(production_2)
    relativeId.append(2);

    // stmt-sequence → statement
    var production_3 = Production(3, 1)
    production_3.pBodySymbolTable.append(nts_statement)
    nts_stmt_sequence.pProductionTable.append(production_3)
    all_Production_Set.append(production_3)
    relativeId.append(2);

    // --------------------- statement 分支定义 ---------------------
    // statement → if-stmt
    var production_4 = Production(4, 1)
    production_4.pBodySymbolTable.append(nts_if_stmt)
    nts_statement.pProductionTable.append(production_4)
    all_Production_Set.append(production_4)
    relativeId.append(3);

    // statement → repeat-stmt
    var production_5 = Production(5, 1)
    production_5.pBodySymbolTable.append(nts_repeat_stmt)
    nts_statement.pProductionTable.append(production_5)
    all_Production_Set.append(production_5)
    relativeId.append(3);

    // statement → assign-stmt
    var production_6 = Production(6, 1)
    production_6.pBodySymbolTable.append(nts_assign_stmt)
    nts_statement.pProductionTable.append(production_6)
    all_Production_Set.append(production_6)
    relativeId.append(3);

    // statement → read-stmt
    var production_7 = Production(7, 1)
    production_7.pBodySymbolTable.append(nts_read_stmt)
    nts_statement.pProductionTable.append(production_7)
    all_Production_Set.append(production_7)
    relativeId.append(3);

    // statement → write-stmt
    var production_8 = Production(8, 1)
    production_8.pBodySymbolTable.append(nts_write_stmt)
    nts_statement.pProductionTable.append(production_8)
    all_Production_Set.append(production_8)
    relativeId.append(3);

    // --------------------- if-stmt 分支定义 ---------------------
    // if-stmt → if exp then stmt-sequence end
    var production_9 = Production(9, 5)
    production_9.pBodySymbolTable.append(ts_if)
    production_9.pBodySymbolTable.append(nts_exp)
    production_9.pBodySymbolTable.append(ts_then)
    production_9.pBodySymbolTable.append(nts_stmt_sequence)
    production_9.pBodySymbolTable.append(ts_end)
    nts_if_stmt.pProductionTable.append(production_9)
    all_Production_Set.append(production_9)
    relativeId.append(4);

    // if-stmt → if exp then stmt-sequence else stmt-sequence end
    var production_10 = Production(10, 7)
    production_10.pBodySymbolTable.append(ts_if)
    production_10.pBodySymbolTable.append(nts_exp)
    production_10.pBodySymbolTable.append(ts_then)
    production_10.pBodySymbolTable.append(nts_stmt_sequence)
    production_10.pBodySymbolTable.append(ts_else)
    production_10.pBodySymbolTable.append(nts_stmt_sequence)
    production_10.pBodySymbolTable.append(ts_end)
    nts_if_stmt.pProductionTable.append(production_10)
    all_Production_Set.append(production_10)
    relativeId.append(4);

    // --------------------- repeat-stmt 定义 ---------------------
    // repeat-stmt → repeat stmt-sequence until exp
    var production_11 = Production(11, 4)
    production_11.pBodySymbolTable.append(ts_repeat)
    production_11.pBodySymbolTable.append(nts_stmt_sequence)
    production_11.pBodySymbolTable.append(ts_until)
    production_11.pBodySymbolTable.append(nts_exp)
    nts_repeat_stmt.pProductionTable.append(production_11)
    all_Production_Set.append(production_11)
    relativeId.append(5);

    // --------------------- assign-stmt 定义 ---------------------
    // assign-stmt → identifier := exp
    var production_12 = Production(12, 3)
    production_12.pBodySymbolTable.append(ts_identifier)
    production_12.pBodySymbolTable.append(ts_assign)
    production_12.pBodySymbolTable.append(nts_exp)
    nts_assign_stmt.pProductionTable.append(production_12)
    all_Production_Set.append(production_12)
    relativeId.append(6);

    // --------------------- read-stmt 定义 ---------------------
    // read-stmt → read identifier
    var production_13 = Production(13, 2)
    production_13.pBodySymbolTable.append(ts_read)
    production_13.pBodySymbolTable.append(ts_identifier)
    nts_read_stmt.pProductionTable.append(production_13)
    all_Production_Set.append(production_13)
    relativeId.append(7);

    // --------------------- write-stmt 定义 ---------------------
    // write-stmt → write exp
    var production_14 = Production(14, 2)
    production_14.pBodySymbolTable.append(ts_write)
    production_14.pBodySymbolTable.append(nts_exp)
    nts_write_stmt.pProductionTable.append(production_14)
    all_Production_Set.append(production_14)
    relativeId.append(8);

    // --------------------- exp 分支定义 ---------------------
    // exp → simple-exp comparison-op simple-exp
    var production_15 = Production(15, 3)
    production_15.pBodySymbolTable.append(nts_simple_exp)
    production_15.pBodySymbolTable.append(nts_comparison_op)
    production_15.pBodySymbolTable.append(nts_simple_exp)
    nts_exp.pProductionTable.append(production_15)
    all_Production_Set.append(production_15)
    relativeId.append(9);

    // exp → simple-exp
    var production_16 = Production(16, 1)
    production_16.pBodySymbolTable.append(nts_simple_exp)
    nts_exp.pProductionTable.append(production_16)
    all_Production_Set.append(production_16)
    relativeId.append(9);

    // --------------------- comparison-op 分支定义 ---------------------
    // comparison-op → <
    var production_17 = Production(17, 1)
    production_17.pBodySymbolTable.append(ts_less)
    nts_comparison_op.pProductionTable.append(production_17)
    all_Production_Set.append(production_17)
    relativeId.append(10);

    // comparison-op → =
    var production_18 = Production(18, 1)
    production_18.pBodySymbolTable.append(ts_equal)
    nts_comparison_op.pProductionTable.append(production_18)
    all_Production_Set.append(production_18)
    relativeId.append(10);

    // --------------------- simple-exp 递归定义 ---------------------
    // simple-exp → simple-exp addop term
    var production_19 = Production(19, 3)
    production_19.pBodySymbolTable.append(nts_simple_exp)
    production_19.pBodySymbolTable.append(nts_addop)
    production_19.pBodySymbolTable.append(nts_term)
    nts_simple_exp.pProductionTable.append(production_19)
    all_Production_Set.append(production_19)
    relativeId.append(11);

    // simple-exp → term
    var production_20 = Production(20, 1)
    production_20.pBodySymbolTable.append(nts_term)
    nts_simple_exp.pProductionTable.append(production_20)
    all_Production_Set.append(production_20)
    relativeId.append(11);

    // --------------------- addop 分支定义 ---------------------
    // addop → +
    var production_21 = Production(21, 1)
    production_21.pBodySymbolTable.append(ts_plus)
    nts_addop.pProductionTable.append(production_21)
    all_Production_Set.append(production_21)
    relativeId.append(12);

    // addop → -
    var production_22 = Production(22, 1)
    production_22.pBodySymbolTable.append(ts_subtract)
    nts_addop.pProductionTable.append(production_22)
    all_Production_Set.append(production_22)
    relativeId.append(12);

    // --------------------- term 递归定义 ---------------------
    // term → term mulop factor
    var production_23 = Production(23, 3)
    production_23.pBodySymbolTable.append(nts_term)
    production_23.pBodySymbolTable.append(nts_mulop)
    production_23.pBodySymbolTable.append(nts_factor)
    nts_term.pProductionTable.append(production_23)
    all_Production_Set.append(production_23)
    relativeId.append(13);

    // term → factor
    var production_24 = Production(24, 1)
    production_24.pBodySymbolTable.append(nts_factor)
    nts_term.pProductionTable.append(production_24)
    all_Production_Set.append(production_24)
    relativeId.append(13);

    // --------------------- mulop 分支定义 ---------------------
    // mulop → *
    var production_25 = Production(25, 1)
    production_25.pBodySymbolTable.append(ts_multiply)
    nts_mulop.pProductionTable.append(production_25)
    all_Production_Set.append(production_25)
    relativeId.append(14);

    // mulop → /
    var production_26 = Production(26, 1)
    production_26.pBodySymbolTable.append(ts_devide)
    nts_mulop.pProductionTable.append(production_26)
    all_Production_Set.append(production_26)
    relativeId.append(14);

    // --------------------- factor 分支定义 ---------------------
    // factor → ( exp )
    var production_27 = Production(27, 3)
    production_27.pBodySymbolTable.append(ts_left_bracket)
    production_27.pBodySymbolTable.append(nts_exp)
    production_27.pBodySymbolTable.append(ts_right_bracket)
    nts_factor.pProductionTable.append(production_27)
    all_Production_Set.append(production_27)
    relativeId.append(15);

    // factor → Number
    var production_28 = Production(28, 1)
    production_28.pBodySymbolTable.append(ts_number)
    nts_factor.pProductionTable.append(production_28)
    all_Production_Set.append(production_28)
    relativeId.append(15);

    // factor → Identifier
    var production_29 = Production(29, 1)
    production_29.pBodySymbolTable.append(ts_identifier)
    nts_factor.pProductionTable.append(production_29)
    all_Production_Set.append(production_29)
    relativeId.append(15);

    get_All_NTS_FIRST();
    println("展示所有NTSFIRST")
    println();
    show_All_NTS_FIRST();
    get_All_Production_FIRST();
    println("展示所有产生式的FIRST");
    println();
    show_All_Production_FIRST();
    get_All_NTS_FOLLOW();
    println("展示所有NTS的FOLLOW");
    println();
    show_All_NTS_FOLLOW();
    // var i:Int64 = 0;
    // for(nts in all_NonTerminalSymbol_Set) {
    //     println("${i}  ${nts.name} ")
    //     i++;
    // }
}
// 创建TINY语言的LR(0)的DFA
public func create_TINY_LR0_DFA() {
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
    create_LR1_Analysis_Table();
    println("当前有产生式${all_Production_Set.size}个");
    println()
}
// TINY测试样例1
public func test_TINY1() {
    var testGrammarSequence:ArrayList<String> = ArrayList<String>();
    testGrammarSequence.append("repeat");
    testGrammarSequence.append("identifier");
    testGrammarSequence.append(":=");
    testGrammarSequence.append("identifier");
    testGrammarSequence.append("*");
    testGrammarSequence.append("Number");
    testGrammarSequence.append("until");
    testGrammarSequence.append("identifier");
    testGrammarSequence.append("=");
    testGrammarSequence.append("Number");
    testGrammarSequence.append("$");
    judge_Sentence_LR_Grammar(testGrammarSequence);
}
// TINY测试样例2
public func test_TINY2() {
    var testGrammarSequence:ArrayList<String> = ArrayList<String>();
    testGrammarSequence.append("read");
    testGrammarSequence.append("identifier");
    testGrammarSequence.append(";");
    testGrammarSequence.append("identifier");
    testGrammarSequence.append(":=");
    testGrammarSequence.append("identifier");
    testGrammarSequence.append("-");
    testGrammarSequence.append("Number");
    testGrammarSequence.append(";");
    testGrammarSequence.append("write");
    testGrammarSequence.append("identifier");
    testGrammarSequence.append("$");
    judge_Sentence_LR_Grammar(testGrammarSequence);
}
// TINY测试样例3
public func test_TINY3() {
    var testGrammarSequence:ArrayList<String> = ArrayList<String>();
    testGrammarSequence.append("read"); // read
    testGrammarSequence.append("identifier"); // x
    testGrammarSequence.append(";"); // ;
    testGrammarSequence.append("if"); // if
    testGrammarSequence.append("Number"); // 0
    testGrammarSequence.append("<"); // <
    testGrammarSequence.append("identifier"); // x
    testGrammarSequence.append("then"); // then
    testGrammarSequence.append("identifier"); // fact
    testGrammarSequence.append(":="); // :=
    testGrammarSequence.append("Number"); // 1
    testGrammarSequence.append(";"); // ;
    testGrammarSequence.append("repeat"); // repeat
    testGrammarSequence.append("identifier"); // fact
    testGrammarSequence.append(":="); // :=
    testGrammarSequence.append("identifier"); // fact
    testGrammarSequence.append("*"); // *
    testGrammarSequence.append("identifier"); // x
    testGrammarSequence.append(";"); // ;
    testGrammarSequence.append("identifier"); // x
    testGrammarSequence.append(":="); // :=
    testGrammarSequence.append("identifier"); // x
    testGrammarSequence.append("-"); // -
    testGrammarSequence.append("Number"); // 1
    testGrammarSequence.append("until"); //until
    testGrammarSequence.append("identifier"); // x
    testGrammarSequence.append("="); // =
    testGrammarSequence.append("Number"); // 0
    testGrammarSequence.append(";"); // ;
    testGrammarSequence.append("write"); // write
    testGrammarSequence.append("identifier"); //  fact
    testGrammarSequence.append("end"); // end
    testGrammarSequence.append("$");
    judge_Sentence_LR_Grammar(testGrammarSequence);
}