package comprehensiveLab.lab2
import std.collection.*
public class DFA{
    public var startupItemSet:ItemSet
    public var pEdgeTable:ArrayList<TransitionEdge>
    public init(startupItemSet:ItemSet ,pEdgeTable:ArrayList<TransitionEdge>) {
        this.startupItemSet = startupItemSet;
        this.pEdgeTable = pEdgeTable;
    }
}