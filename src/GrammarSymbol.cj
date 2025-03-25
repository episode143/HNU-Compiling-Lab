package lab2
public open class GrammarSymbol {
    public let name:String
    // 为枚举类 取值有三类TERMINAL NONTERMINAL  NULL
    public let symbolType:String
    public init(name:String ,symbolType:String) {
        this.name = name;
        this.symbolType = symbolType;
    };
}