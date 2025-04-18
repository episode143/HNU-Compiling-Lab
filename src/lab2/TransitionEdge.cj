package comprehensiveLab.lab2
public class TransitionEdge{
    public var driverSymbol:GrammarSymbol
    public var fromItemSet:ItemSet
    public var toItemSet:ItemSet
    public init(driverSymbol:GrammarSymbol ,fromItemSet:ItemSet ,toItemSet:ItemSet) {
        // 在给driverSymbol赋值的时候要强制类型转换
        this.driverSymbol = driverSymbol;
        this.fromItemSet = fromItemSet;
        this.toItemSet = toItemSet;
    }
}
