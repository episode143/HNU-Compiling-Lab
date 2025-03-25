package lab2
import std.collection.*
public class NonTerminalSymbol<:GrammarSymbol & Hashable & Equatable<NonTerminalSymbol>{
    // 有关非终结符构成的产生式
    let pProductionTable:ArrayList<Production>
    // 产生式的个数
    let numOfProduction:Int64
    let pFirstSet:HashSet<TerminalSymbol>
    let pFollowSet:HashSet<TerminalSymbol>
    // 求follow的时候存放所依赖的非终结符
    let pDependentSetInFollow:HashSet<NonTerminalSymbol>
    public init(name:String,symbolType:String ,pProductionTable:ArrayList<Production> ,numOfProduction:Int64 ,pFirstSet:HashSet<TerminalSymbol>,pFollowSet:HashSet<TerminalSymbol>,pDependentSetInFollow:HashSet<NonTerminalSymbol>){
        super(name,symbolType);
        this.pProductionTable = pProductionTable;
        this.numOfProduction = numOfProduction;
        this.pFirstSet = pFirstSet;
        this.pFollowSet = pFollowSet;
        this.pDependentSetInFollow = pDependentSetInFollow;
    }
    // 非终结符的name即为其hashcode
    public func hashCode():Int64 {
        return this.name.hashCode();
    }
    // 非终结符相等即看其name是否相等
    public operator func ==(another: NonTerminalSymbol) {
        return this.name == another.name;
    }
    public operator func !=(another: NonTerminalSymbol) {
        return this.name != another.name;
    }
}