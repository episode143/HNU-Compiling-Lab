package lab2
import std.collection.*
public class Cell {
    let nonTerminalSymbol:NonTerminalSymbol
    let terminalSymbol:TerminalSymbol
    let production:Production
    public init(nonTerminalSymbol:NonTerminalSymbol , terminalSymbol:TerminalSymbol ,production:Production) {
        this.nonTerminalSymbol = nonTerminalSymbol;
        this.terminalSymbol = terminalSymbol;
        this.production = production;
    }

}