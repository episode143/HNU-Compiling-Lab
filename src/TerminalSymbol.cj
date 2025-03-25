package lab2
public class TerminalSymbol<: GrammarSymbol & Hashable &Equatable<TerminalSymbol>{
    // 也是枚举类型
    public let lemexeCategory:String
    public init(name:String ,symbolType:String ,lemexeCategory:String) {
        super(name,symbolType);
        this.lemexeCategory = lemexeCategory;
    }
    // 终结符的type即为其hashcode
    public func hashCode():Int64 {
        return this.symbolType.hashCode();
    }
    // 终结符只用判断type是否相等即可
    public operator func ==(another:TerminalSymbol):Bool {
        return this.symbolType == another.symbolType;
    }
    public operator func !=(another:TerminalSymbol):Bool {
        return this.symbolType != another.symbolType;
    }
}