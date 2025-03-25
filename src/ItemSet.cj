package lab2
import std.collection.*
public class ItemSet{
    public var stateId:Int64
    public var pItemTable:ArrayList<LR0Item>
    public init(stateId:Int64 ,pItemTable:ArrayList<LR0Item>) {
        this.stateId = stateId;
        this.pItemTable = pItemTable;
    }
}