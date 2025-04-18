package comprehensiveLab.lab2
public class LR0Item<:Equatable<LR0Item> & Hashable{
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
    public operator func==(another:LR0Item) {
        return this.nonTerminalSymbol == another.nonTerminalSymbol && 
               this.production == another.production &&
               this.dotPosition == another.dotPosition &&
               this.itemType == another.itemType
    }
    public operator func!=(another:LR0Item) {
        return this.nonTerminalSymbol != another.nonTerminalSymbol || 
               this.production != another.production ||
               this.dotPosition != another.dotPosition ||
               this.itemType != another.itemType
    }
    public func hashCode():Int64 {
        var s:String = this.nonTerminalSymbol.name + this.production.productionId.toString() + this.dotPosition.toString() + this.itemType;
        return s.hashCode();
    }
}
