package comprehensiveLab.lab4
import std.collection.*
import std.fs.*
// 下一临时地址
var nextVariableAddress:Int64 = 0;
var testInfo:ArrayList<String> = ArrayList<String>();
// 对象栈
public var pObjectStack:ArrayList<object> = ArrayList<object>();
// 针对TINY的变量表
public var variablePos:HashMap<String, Int64> = HashMap<String, Int64>();
// 调试符号
var debug:Bool = false;
// 指令编号(从2开始，因为前两句是初始化语句)
public var nextInstrId = 2;
public func translateAction(produciotnId:Int64,path:String) {
    match(produciotnId) {
        case 0 => outputTranslationResult(path);
        case 1 => translate1();
        case 2 => translate2();
        case 3 => translate3();
        case 4 => translate4();
        case 5 => translate5();
        case 6 => translate6();
        case 7 => translate7();
        case 8 => translate8();
        case 9 => translate9();
        case 10 => translate10();
        case 11 => translate11();
        case 12 => translate12();
        case 13 => translate13();
        case 14 => translate14();
        case 15 => translate15();
        case 16 => translate16();
        case 17 => translate17();
        case 18 => translate18();
        case 19 => translate19();
        case 20 => translate20();
        case 21 => translate21();
        case 22 => translate22();
        case 23 => translate23();
        case 24 => translate24();
        case 25 => translate25();
        case 26 => translate26();
        case 27 => translate27();
        case 28 => translate28();
        case 29 => translate29();
        case _ => outputTranslationResult(path);
    }
}
// 弹出对象栈栈顶的对象并返回
public func removeEnd():object{
    var endIndex:Int64 = pObjectStack.size-1;
    var endObject:object = pObjectStack[endIndex];
    pObjectStack.remove(endIndex);
    return endObject;
}

// 试图给一个变量分配地址，若有不分配，最后返回变量地址
public func getAddress(variable:String):Int64 {
    var address:Int64 = variablePos.size;
    if(!variablePos.contains(variable)) {
        variablePos.put(variable,address);
    }
    address = variablePos[variable];
    return address;
}

// 针对 Program' → Program $
// SDT:添加上前两行的初始化函数，并且加上halt，把Program的nextList都加上最后的halt
public func outputTranslationResult(path:String){
    var resProgram:object = object("Program'","NONTERMINAL");
    var Program:object = removeEnd();
    var haltCode:code = code("HALT   0,0,0\n");
    var code0:code = code("LD   6,0(0)\n");
    code0.rowId = 0;
    var code1:code = code("ST   0,0(0)\n");
    code1.rowId = 1;
    // 处理Program的nextList
    for(nextRow in Program.nextList) {
        Program.codeList[nextRow-2].sentence+=(haltCode.rowId - nextRow -1).toString()+"(7)\n";
    }
    resProgram.codeList.append(code0);
    resProgram.codeList.append(code1);
    resProgram.codeList.appendAll(Program.codeList);
    resProgram.codeList.append(haltCode);
    pObjectStack.append(resProgram);
    
    // 显示最后的结果
    for(code in resProgram.codeList) {
        print("${code.rowId}  "+code.sentence);
    }
    var exist:Bool = File.exists(path);
    if(!exist) {
        let outputFile:File = File.create(path);
        var rowIndex:Int64 = 0;
        for(code in resProgram.codeList) {
            outputFile.write("${rowIndex}:    ${code.sentence}".toArray());
            rowIndex++;
        }
    }
    if(debug) {
        println("临时地址变化");
        for(testSentence in testInfo) {
            println(testSentence);
        }
    }
}

// 针对 Program → stmt-sequence
// SDT:规约为更高层
public func translate1(){
    var Program:object = object("Program","NONTERMINAL");
    var stmt_sequence:object = removeEnd();
    Program.codeList.appendAll(stmt_sequence.codeList);
    Program.nextList.putAll(stmt_sequence.nextList);
    pObjectStack.append(Program);
}

// 针对 stmt-sequence → stmt-sequence ; statement
// SDT:针对stmt-sequence1的nextList 赋值为statement的第一行代码
public func translate2(){
    var stmt_sequence = object("stmt-sequence","NONTERMINAL");
    var statement:object = removeEnd();
    var ts:object = removeEnd();
    var stmt_sequence1 = removeEnd();
    var nextId:Int64 = statement.codeList[0].rowId;
    // 处理stmt-sequence1的nextList
    for(toConfirmId in stmt_sequence1.nextList) {
        stmt_sequence1.codeList[toConfirmId-stmt_sequence1.codeList[0].rowId].sentence += (nextId-toConfirmId-1).toString()+"(7)\n";
    }
    // 合并以及处理nextList
    stmt_sequence.codeList.appendAll(stmt_sequence1.codeList);
    stmt_sequence.codeList.appendAll(statement.codeList);
    stmt_sequence.nextList.putAll(statement.nextList);
    pObjectStack.append(stmt_sequence);
}

// 针对 stmt-sequence → statement
public func translate3(){
    var stmt_sequence = object("stmt-sequence","NONTERMINAL");
    var statement:object = removeEnd();
    stmt_sequence.codeList.appendAll(statement.codeList);
    stmt_sequence.nextList.putAll(statement.nextList);
    pObjectStack.append(stmt_sequence);
}

// 针对 statement 分支定义
public func translate4(){
    var statement = object("statement",'NONTERMINAL');
    var _stmt:object = removeEnd();
    statement.codeList.appendAll(_stmt.codeList);
    statement.nextList.putAll(_stmt.nextList);
    pObjectStack.append(statement);
}

public func translate5(){
    var statement = object("statement",'NONTERMINAL');
    var _stmt:object = removeEnd();
    statement.codeList.appendAll(_stmt.codeList);
    statement.nextList.putAll(_stmt.nextList);
    pObjectStack.append(statement);
}

public func translate6(){
    var statement = object("statement",'NONTERMINAL');
    var _stmt:object = removeEnd();
    statement.codeList.appendAll(_stmt.codeList);
    statement.nextList.putAll(_stmt.nextList);
    pObjectStack.append(statement);
}

public func translate7(){
    var statement = object("statement",'NONTERMINAL');
    var _stmt:object = removeEnd();
    statement.codeList.appendAll(_stmt.codeList);
    statement.nextList.putAll(_stmt.nextList);
    pObjectStack.append(statement);
}

public func translate8(){
    var statement = object("statement",'NONTERMINAL');
    var _stmt:object = removeEnd();
    statement.codeList.appendAll(_stmt.codeList);
    statement.nextList.putAll(_stmt.nextList);
    pObjectStack.append(statement);
}

// 针对 if-stmt → if exp then stmt-sequence end
public func translate9(){
    var if_stmt:object = object("if-stmt","NONTERMINAL");
    var end:object = removeEnd();
    var stmt_sequence:object = removeEnd();
    var then:object = removeEnd();
    var exp:object = removeEnd();
    var ifTS:object = removeEnd();
    // 首先要处理falseList 由于没有else 所以改为if-stmt的nextList
    if_stmt.nextList.putAll(exp.falseList);
    // 首先有个哑元在if的代码段最后跳到end之后下一行指令 哑元也要加入nextList
    var Ncode:code = code("LDA   7,");
    if_stmt.nextList.put(Ncode.rowId);
    // 看看stmt-sequence的nextList 如果有则跳转到哑元
    for(nextRow in stmt_sequence.nextList) {
        stmt_sequence.codeList[nextRow - stmt_sequence.codeList[0].rowId].sentence +=(Ncode.rowId - (nextRow+1)).toString()+"(7)";
    }
    if_stmt.codeList.appendAll(exp.codeList);
    if_stmt.codeList.appendAll(stmt_sequence.codeList);
    if_stmt.codeList.append(Ncode);
    pObjectStack.append(if_stmt);
}

// 针对 if-stmt → if exp then stmt-sequence else stmt-sequence end
public func translate10(){
    var if_stmt:object = object("if-stmt","NONTERMINAL");
    var end:object = removeEnd();
    var stmt_sequence2:object = removeEnd();
    var elseTS:object = removeEnd();
    var stmt_sequence1:object = removeEnd();
    var then:object = removeEnd();
    var exp:object = removeEnd();
    var ifTS:object = removeEnd();
    if_stmt.codeList.appendAll(exp.codeList);
    nextVariableAddress--;
}

// 针对 repeat-stmt → repeat stmt-sequence until exp
public func translate11(){
    var repeat_stmt:object = object("repeat-stmt","NONTERMINAL");
    var exp:object = removeEnd();
    var until:object = removeEnd();
    var stmt_sequence:object = removeEnd();
    var repeat:object = removeEnd();
    repeat_stmt.codeList.appendAll(stmt_sequence.codeList);
    for(falseRow in exp.falseList) {
        exp.codeList[falseRow-exp.codeList[0].rowId].sentence+=(stmt_sequence.codeList[0].rowId - falseRow -1).toString()+"(7)\n";
    }
    repeat_stmt.codeList.appendAll(exp.codeList);
    pObjectStack.append(repeat_stmt);
    nextVariableAddress--;
}

// 针对 assign-stmt → identifier := exp
// SDT:尝试获取变量的地址，先填入exp代码后，直接将寄存器0赋给变量地址
public func translate12(){
    var assign_stmt:object = object("assign-stmt","NONTERMINAL");
    var exp:object = removeEnd();
    var ts:object = removeEnd();
    var identifier:object = removeEnd();
    // 得到identifier的变量地址
    var address:Int64 = getAddress(identifier.identify);
    assign_stmt.codeList.appendAll(exp.codeList);
    assign_stmt.codeList.append(code("ST   0,"+address.toString()+"(5)\n"));
    pObjectStack.append(assign_stmt);
    nextVariableAddress--;
    if(debug) {
        testInfo.append("address--   cause:assign-stmt → identifier := exp")
    }
}

// 针对 read-stmt → read identifier
// SDT:首先要读入到寄存器0，之后写入到id的变量地址
public func translate13(){
    var read_stmt:object = object("read-stmt","NONTERMINAL");
    var identifier:object = removeEnd();
    var read:object = removeEnd();
    read_stmt.codeList.append(code("IN   0,0,0\n"));
    var address:Int64 = getAddress(identifier.identify);
    read_stmt.codeList.append(code("ST   "+"0,"+address.toString()+"(5)\n"));
    pObjectStack.append(read_stmt);
}

// 针对 write-stmt → write exp
// SDT:由于exp已经将结果载入到寄存器0中，只需要最后一行代码补上OUT即可
public func translate14(){
    var write_stmt:object = object("write-stmt","NONTERMINAL");
    var exp:object = removeEnd();
    var write:object = removeEnd();
    write_stmt.codeList.appendAll(exp.codeList);
    write_stmt.codeList.append(code("OUT   0,0,0\n"));
    pObjectStack.append(write_stmt);
}

// 针对 exp → simple-exp comparison-op simple-exp
// SDT:得到得出exp结果的，由于这个是比较，所以还是要记录下exp的比较符号，最后一行指令依旧是将运算结果载入寄存器0 由于是条件判断，所以一定会用于条件语句，提前写出goto
public func translate15(){
    var exp:object = object("exp","NONTERMINAL");
    var simple_exp2:object = removeEnd();
    var comparsion_op:object = removeEnd();
    var simple_exp1:object = removeEnd();
    exp.codeList.appendAll(simple_exp1.codeList);
    // 左值暂存到临时地址0
    exp.codeList.append(code("ST   0,"+simple_exp1.vAddress.toString()+"(6)\n"));
    // 右值赋予寄存器0
    exp.codeList.appendAll(simple_exp2.codeList);
    // 左值赋予寄存器1
    exp.codeList.append(code("LD   1,"+simple_exp1.vAddress.toString()+"(6)\n"));
    exp.codeList.append(code("SUB   0,1,0\n"));
    // 条件判断的时候会使用到
    exp.identify = comparsion_op.identify;
    if(exp.identify == "=") {
        exp.codeList.append(code("JEQ   0,2(7)\n"));
    } else if (exp.identify == "<") {
        exp.codeList.append(code("JLT   0,2(7)\n"));
    }
    exp.codeList.append(code("LDC   0,0(0)\n"));
    exp.codeList.append(code("LDA   7,1(7)\n"));
    // 条件为真的情况
    exp.codeList.append(code("LDC   0,1(0)\n"));
    var newCode:code = code("JEQ   0,");
    // 不确定的jump添加到falseList
    exp.falseList.put(newCode.rowId);
    exp.codeList.append(newCode);
    pObjectStack.append(exp);
    exp.vAddress = simple_exp1.vAddress;
    nextVariableAddress--;
    if(debug) {
        testInfo.append("exp → simple-exp comparison-op simple-exp       address:${exp.vAddress}")
    }
}

// 针对 exp → simple-exp
// SDT:规约到更高层
public func translate16(){
    var exp:object = object("exp","NONTERMINAL");
    var simple_exp:object = removeEnd();
    exp.codeList.appendAll(simple_exp.codeList);
    pObjectStack.append(exp);
    exp.vAddress = simple_exp.vAddress;
    if(debug) {
        testInfo.append("exp → simple-exp       address:${exp.vAddress}");
    }
}

// 针对 comparison-op → <
// SDT:规约到更高层
public func translate17(){
    var comparsion:object = object("comparison","NONTERMINAL");
    comparsion.identify = "<";
    var op:object = removeEnd();
    pObjectStack.append(comparsion);
}

// 针对 comparison-op → =
// SDT:规约到更高层
public func translate18(){
    var comparsion:object = object("comparison","NONTERMINAL");
    comparsion.identify = "=";
    var op:object = removeEnd();
    pObjectStack.append(comparsion);
}

// 针对 simple-exp → simple-exp addop term
// SDT：根据不同的addop,将指令最终结果存入寄存器0
public func translate19(){
    var simple_exp:object = object("simple-stmt","NONTERMINAL");
    var term:object = removeEnd();
    var addop:object = removeEnd();
    var simple_exp1:object = removeEnd();
    simple_exp.codeList.appendAll(simple_exp1.codeList);
    // 暂存到临时地址
    simple_exp.codeList.append(code("ST   0,"+simple_exp.vAddress.toString()+"(6)\n"));
    // 右值存到寄存器0
    simple_exp.codeList.appendAll(term.codeList);
    // 取出左值到寄存器1
    simple_exp.codeList.append(code("LD   1,"+simple_exp.vAddress.toString()+"(6)\n"));
    if(addop.identify == "+") {
        simple_exp.codeList.append(code("ADD   0,1,0\n"));
    } else if(addop.identify == "-") {
        simple_exp.codeList.append(code("SUB   0,1,0\n"));
    }
    pObjectStack.append(simple_exp);
    simple_exp.vAddress = simple_exp1.vAddress;
    nextVariableAddress--;
    if(debug) {
        testInfo.append("simple-exp → simple-exp addop term       address:${simple_exp.vAddress}")
    }
}

// 针对 simple-exp → term
// SDT:规约到更高层
public func translate20(){
    var simple_exp:object = object("simple-exp","NONTERMINAL");
    var term:object = removeEnd();
    simple_exp.codeList.appendAll(term.codeList);
    pObjectStack.append(simple_exp);
    simple_exp.vAddress = term.vAddress;
    if(debug) {
        testInfo.append("simple-exp → term       address:${simple_exp.vAddress}")
    }
}

// 针对 addop → +
// SDT:归约到更高层
public func translate21(){
    var addop:object = object("addop","NONTERMINAL");
    addop.identify = "+";
    var add:object = removeEnd();
    pObjectStack.append(addop);
}

// 针对 addop → -
// SDT:规约到更高层
public func translate22(){
    var addop:object = object("addop","NONTERMINAL");
    addop.identify = "-";
    var sub:object = removeEnd();
    pObjectStack.append(addop);
}

// 针对 term → term mulop factor
// SDT:更具mulop的情况以及factor的情况，将最终的结果载入到寄存器0中
public func translate23(){
    var term:object = object("term","NONTERMINAL");
    var factor:object = removeEnd();
    var mulop:object = removeEnd();
    var term1:object = removeEnd();
    term.codeList.appendAll(term1.codeList);
    // 暂存到临时地址
    term.codeList.append(code("ST   0,"+term1.vAddress.toString()+"(6)\n"));
    // 右值在寄存器0中
    term.codeList.appendAll(factor.codeList);
    // 取出左值到寄存器1
    term.codeList.append(code("LD   1,"+term1.vAddress.toString()+"(6)\n"));
    if(mulop.identify == "*") {
        term.codeList.append(code("MUL   0,1,0\n"));
    } else if(mulop.identify == "/") {
        term.codeList.append(code("DIV   0,1,0\n"));
    }
    pObjectStack.append(term);
    term.vAddress = term1.vAddress;
    nextVariableAddress--;
    if(debug) {
        testInfo.append("term → term mulop factor       address:${term.vAddress}")
    }
}

// 针对 term → factor
// SDT:规约到更高层,此时最后一行指令将结果载入寄存器0
public func translate24(){
    var term:object = object("term","NONTERMINAL");
    var factor:object = removeEnd();
    term.codeList.appendAll(factor.codeList);
    pObjectStack.append(term);
    term.vAddress = factor.vAddress;
    if(debug) {
        testInfo.append("term->factor       address:${term.vAddress}")
    }
}

// 针对 mulop → *
// SDT:规约到更高层
public func translate25(){
    var mulop:object = object("mulop","NONTERMINAL");
    mulop.identify = "*";
    var mul:object = removeEnd();
    pObjectStack.append(mulop);
}

// 针对 mulop → /
// SDT:规约到更高层
public func translate26(){
    var mulop:object = object("mulop","NONTERMINAL");
    mulop.identify = "/";
    var div:object = removeEnd();
    pObjectStack.append(mulop);
}

// 针对 factor → ( exp )
// SDT:提取exp的code到factor，此时最后一行代码是将exp计算运行结果载入到寄存器0
public func translate27(){
    var factor:object = object("factor","NONTERMINAL");
    factor.identify = "(exp)";
    var right:object = removeEnd();
    var exp:object = removeEnd();
    var left:object = removeEnd();
    factor.codeList.appendAll(exp.codeList);
    pObjectStack.append(factor);
    factor.vAddress = exp.vAddress;
    if(debug) {
        testInfo.append("factor->(exp)       address:${factor.vAddress}");
    }
}

// 针对 factor → Number
// SDT:将number的值载入寄存器0中，此时最后一行代码是将常量值赋予寄存器0中
public func translate28(){
    var factor:object = object("factor","NONTERMINAL");
    factor.identify = "Number";
    var number:object = removeEnd();
    factor.codeList.append(code("LDC   0,"+number.value.toString()+"(0)\n"));
    pObjectStack.append(factor);
    factor.vAddress = 0 - nextVariableAddress;
    nextVariableAddress++;
    if(debug) {
        testInfo.append("${number.value}       address:${factor.vAddress}");
    }
}

// 针对 factor → Identifier
// SDT:检查变量表中是否存在，否则给其分配一个地址,最后一行代码是将变量值赋予寄存器0中
public func translate29(){
    var factor:object = object("factor","NONTERMINAL");
    var identifier:object = removeEnd();
    var address:Int64 = getAddress(identifier.identify);
    factor.codeList.append(code("LD   0,"+address.toString()+"(5)\n"));
    pObjectStack.append(factor);
    factor.vAddress = 0 - nextVariableAddress;
    nextVariableAddress++;
    if(debug) {
        testInfo.append("${identifier.identify}       address:${factor.vAddress}");
    }
}



/*
 * 关于identifier 规约成factor没有代码 在其它产生式中它还出现了，所以在其出现的产生式中都要执行尝试赋予地址
 * 关于Number 规约成factor，最后一行指令是将其常量值赋予寄存器0
 * 关于exp simple-exp term 要求都是最后一行指令将其最终结果赋予寄存器0
*/