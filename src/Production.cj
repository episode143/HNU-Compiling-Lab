package lab2 
import std.collection.*
public class Production{
    let productionId:Int64
    let bodySize:Int64
    // 存入的时候可以不看类型是终结符还是非终结符 但是取出的时候需要转换类型
    let pBodySymbolTable:ArrayList<GrammarSymbol>
    let pFirstSet:HashSet<TerminalSymbol>
    public init(productionId:Int64 ,bodySize:Int64 ,pBodySymbolTable:ArrayList<GrammarSymbol> ,pFirstSet:HashSet<TerminalSymbol>){
        this.productionId = productionId;
        this.bodySize = bodySize;
        this.pBodySymbolTable = pBodySymbolTable;
        this.pFirstSet = pFirstSet;
    }
}