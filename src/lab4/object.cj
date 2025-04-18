package comprehensiveLab.lab4
import comprehensiveLab.lab2.GrammarSymbol
import std.collection.*
public class object {
    // 如果是数字则是其数值
    public var value:Int64;
    // 如果是变量的话，则是其名称  如果是符号的话则是其字符
    public var identify:String;
    // 所代表的文法类型
    public var grammarSymbol:GrammarSymbol;
    // 所产生的中间代码
    public var codeList:ArrayList<code>;
    // 要是作为右值存到临时变量区的地址
    public var vAddress:Int64;
    // 分支语句的falseList
    public var falseList:HashSet<Int64>;
    // 存在未确定goto语句时的nextList
    public var nextList:HashSet<Int64>;
    public init(name:String,symbolType:String){
        this.value = 0;
        this.identify = "";
        this.grammarSymbol = GrammarSymbol(name,symbolType);
        this.codeList = ArrayList<code>();
        this.vAddress = 0;
        this.falseList = HashSet<Int64>();
        this.nextList = HashSet<Int64>();
    }
}


/*
 * name是对象对应文法的词性（终结符的名称或者非终结符的名称）
 * identify 在为id的时候是变量名 在为统计符号的时候是其原型字符
 */