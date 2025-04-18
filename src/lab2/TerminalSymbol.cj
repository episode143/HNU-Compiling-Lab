package comprehensiveLab.lab2
public class TerminalSymbol<: GrammarSymbol & Hashable &Equatable<TerminalSymbol>{
    // 也是枚举类型
    public var lemexeCategory:String
    public init(name:String ,symbolType:String ,lemexeCategory:String) {
        super(name,symbolType);
        this.lemexeCategory = lemexeCategory;
    }
    // 终结符的type加上name即为其hashcode
    public func hashCode():Int64 {
        return (this.symbolType + this.name).hashCode();
    }
    // 终结符只用判断type与name是否相等
    public operator func ==(another:TerminalSymbol):Bool {
        return this.symbolType == another.symbolType && this.name == another.name;
    }
    public operator func !=(another:TerminalSymbol):Bool {
        return this.symbolType != another.symbolType || this.name != another.name;
    }
}

