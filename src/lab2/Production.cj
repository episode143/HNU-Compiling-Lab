package comprehensiveLab.lab2
import std.collection.*
public class Production<:Equatable<Production>{
    // 产生式编号
    public var productionId:Int64
    // 产生式体中包含文法符的个数
    public var bodySize:Int64
    // 产生式体中包含的文法符 存入的时候可以不看类型是终结符还是非终结符 但是取出的时候需要转换类型
    public var pBodySymbolTable:ArrayList<GrammarSymbol>
    // 产生式的FIRST函数值
    public var pFirstSet:HashSet<TerminalSymbol>
    public init(productionId:Int64 ,bodySize:Int64 ,pBodySymbolTable:ArrayList<GrammarSymbol> ,pFirstSet:HashSet<TerminalSymbol>){
        this.productionId = productionId;
        this.bodySize = bodySize;
        this.pBodySymbolTable = pBodySymbolTable;
        this.pFirstSet = pFirstSet;
    }
    public init(productionId:Int64 ,bodySize:Int64 ){
        this.productionId = productionId;
        this.bodySize = bodySize;
        this.pBodySymbolTable = ArrayList<GrammarSymbol>();
        this.pFirstSet = HashSet<TerminalSymbol>();
    }
    public operator func==(another:Production) {
        return this.productionId == another.productionId;
    }
    public operator func!=(another:Production) {
        return this.productionId == another.productionId;
    }
}