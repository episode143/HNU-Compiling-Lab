package lab2
import std.collection.*
public class DFA{
    let startupItemSet:ItemSet
    let pEdgeTable:ArrayList<TransitionEdge>
    public init(startupItemSet:ItemSet ,pEdgeTable:ArrayList<TransitionEdge>) {
        this.startupItemSet = startupItemSet;
        this.pEdgeTable = pEdgeTable;
    }
}