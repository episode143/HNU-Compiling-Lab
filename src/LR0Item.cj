package lab2
public class LR0Item{
    public var nonTerminalSymbol:NonTerminalSymbol
    public var production:Production
    public var dotPosition:Int64
    // LR(0)项目中的类型 两种：CORE 和NONCORE
    public var itemType:String
    public init(nonTerminalSymbol:NonTerminalSymbol ,production:Production ,dotPosition:Int64 ,itemType:String) {
        this.nonTerminalSymbol = nonTerminalSymbol;
        this.production = production;
        this.dotPosition = dotPosition;
        this.itemType = itemType;
    }
}