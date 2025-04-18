package comprehensiveLab.lab3
import comprehensiveLab.lab1.*
import comprehensiveLab.lab2.*
import comprehensiveLab.lab4.object
import std.collection.*
import std.fs.*
public var validCharSet:HashSet<Rune> = HashSet<Rune>();
// 读取文件并返回字符串
public func readFromFile(path:String):String {
    initValidCharSet();
    let filePath:Path = Path(path);
    if(File.exists(filePath)) {
        let bytes = File.readFrom(path)
        println(bytes);
        var tempString:String = "";
        for(byte in bytes) {
            if(Int64(byte)!=10 && Int64(byte)!=13 && judgeValidChar(Rune(Int32(byte)))) {
                tempString += Rune(Int32(byte)).toString();
            } else {
                tempString += " ".toString();
            }
        }
        println(tempString);
        return tempString;
    } else {
        print("目标文件不存在");
        return "";
    }
}
// 词法分析并返回获取的对象序列
public func lexicalAnalysis(fileContent:String):ArrayList<object> {
    var TINY_Lexical_DFA:Graph = createTINY();    
    var ts_sequence:ArrayList<object> = TINY_Lexical_DFA.longTextSearch(fileContent);
    ts_sequence.append(object("$","TERMINAL"));
    for(s in ts_sequence) {
        println("${s.grammarSymbol.name} ");
        if(s.grammarSymbol.name == "Number") {
            println("the value:     ${s.value}")
        } else if(s.grammarSymbol.name == "identifier") {
            println("the id:        ^${s.identify}")
        }
    }
    return ts_sequence;
}
public func grammaticalAnalysis(ts_sequence:ArrayList<String>){
    create_TINY_Grammar();
    create_TINY_LR0_DFA();
    judge_Sentence_LR_Grammar(ts_sequence);
}
public func initValidCharSet(){
    var validString:String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789:=;()+-*<{}/ ";
    for(c in validString) {
        validCharSet.put(Rune(c));
    }
}
public func judgeValidChar(c:Rune):Bool {
    return validCharSet.contains(c);
}