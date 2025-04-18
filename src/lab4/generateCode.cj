package comprehensiveLab.lab4
import std.collection.*
import comprehensiveLab.lab2.*
// 带有翻译的LR语法分析的通用代码
public func translate_to_TMCODE(ts_sequence:ArrayList<object>,path:String) {
    var step:Int64 = 1;
    // 状态栈存储编号
    var pStateStack:ArrayList<Int64> = ArrayList<Int64>();
    pStateStack.append(0);
    var currentLexeme_pos:Int64 = 0;
    while(!pStateStack.isEmpty()) {
        println();
        println("STEP: ${step}")
        step++;
        var currSize:Int64 = pStateStack.size;
        // 求出当前状态
        var currentState = pStateStack[currSize-1];
        println("当前状态：${currentState}  当前驱动非终结符：${ts_sequence[currentLexeme_pos].grammarSymbol.name}");
        if(pActionCellTable[pItemSetTable[currentState]].contains(getTS[ts_sequence[currentLexeme_pos].grammarSymbol.name])) {
            var indicator:ActionCell = pActionCellTable[pItemSetTable[currentState]][getTS[ts_sequence[currentLexeme_pos].grammarSymbol.name]];
            println("action： ${indicator.actionType} ${indicator.actionId}");
            if(indicator.actionType == "s") {
                pStateStack.append(indicator.actionId);
                if(ts_sequence[currentLexeme_pos].grammarSymbol.name == "then") {
                    nextVariableAddress--;
                    if(debug) {
                        testInfo.append("address--     casue:  then")
                    }
                }
                // 添加进对象栈
                pObjectStack.append(ts_sequence[currentLexeme_pos]);
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
                // 根据规约编号来执行翻译动作
                translateAction(indicator.actionId,path);
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
                println("得到最终中间代码是");
                outputTranslationResult(path);
                return;
            }
        }
        else {
            println("输入字符串有语法错误");
            return;
        }
    }
}