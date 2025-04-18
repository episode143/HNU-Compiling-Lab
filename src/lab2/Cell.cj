package comprehensiveLab.lab2
import std.collection.*
public class Cell {
    public var nonTerminalSymbol:NonTerminalSymbol
    public var terminalSymbol:TerminalSymbol
    public var production:Production
    public init(nonTerminalSymbol:NonTerminalSymbol , terminalSymbol:TerminalSymbol ,production:Production) {
        this.nonTerminalSymbol = nonTerminalSymbol;
        this.terminalSymbol = terminalSymbol;
        this.production = production;
    }

}