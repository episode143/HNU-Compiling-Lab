package lab2
import std.collection.*
public class ItemSet{
    let stateId:Int64
    let pItemTable:ArrayList<LR0Item>
    public init(stateId:Int64 ,pItemTable:ArrayList<LR0Item>) {
        this.stateId = stateId;
        this.pItemTable = pItemTable;
    }
}