package comprehensiveLab
import comprehensiveLab.lab3.*
import comprehensiveLab.lab4.*
import std.collection.*
import std.io.SeekPosition
import std.fs.*
main(): Int64 {
    getCode();
    return 0
}
public func getCode(){
    // 读取文件内容
    var fileContent:String = readFromFile("./Sample.tny");
    // 测试词法分析器
    var ts_sequence:ArrayList<object> =lexicalAnalysis(fileContent);
    ts_sequence.append(object("$","TERMINAL"));
    var stringList:ArrayList<String> = ArrayList<String>();
    for(ts in ts_sequence) {
        stringList.append(ts.grammarSymbol.name);
    }
    stringList.append("$");
    for(s in ts_sequence) {
        println("${s.grammarSymbol.name} ");
        if(s.grammarSymbol.name == "Number") {
            println("the value:     ${s.value}")
        } else if(s.grammarSymbol.name == "identifier") {
            println("the id:        ^${s.identify}")
        }
    }
    grammaticalAnalysis(stringList);
    // 测试生成中间代码
    println("测试生成中间代码");
    translate_to_TMCODE(ts_sequence,"Sample.tm");
}