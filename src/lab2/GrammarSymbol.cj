package comprehensiveLab.lab2
public open class GrammarSymbol {
    public var name:String
    // 为枚举类 取值有三类TERMINAL NONTERMINAL  NULL
    public var symbolType:String
    public init(name:String ,symbolType:String) {
        this.name = name;
        this.symbolType = symbolType;
    };
}