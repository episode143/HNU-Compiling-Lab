package comprehensiveLab.lab2
import std.collection.*
public class ItemSet<:Equatable<ItemSet> & Hashable{
    public var stateId:Int64
    public var pItemTable:ArrayList<LR0Item>
    public init(stateId:Int64 ,pItemTable:ArrayList<LR0Item>) {
        this.stateId = stateId;
        this.pItemTable = pItemTable;
    }
    // 判断是否相等只需要判断所有的CORE
    public operator func==(another:ItemSet) {
        var core_num:Int64 = 0;
        var another_core_num:Int64 =0;
        for(item in this.pItemTable) {
            if(item.itemType == "CORE") {
                core_num ++;
            }
        }
        for(item in another.pItemTable) {
            if(item.itemType == "CORE") {
                another_core_num++;
            }
        }
        if(core_num != another_core_num) {
            return false;
        }
        for(item in this.pItemTable) {
            if(item.itemType == "CORE") {
                var hasShow:Bool = false;
                for(anotherItem in another.pItemTable) {
                    if(anotherItem == item) {
                        hasShow = true;
                        break;
                    }
                }
                if(!hasShow) {
                    return false;
                }
            }
        }
        return true;
    }
    public operator func!=(another:ItemSet) {
        var core_num:Int64 = 0;
        var another_core_num:Int64 =0;
        for(item in this.pItemTable) {
            if(item.itemType == "CORE") {
                core_num ++;
            }
        }
        for(item in another.pItemTable) {
            if(item.itemType == "CORE") {
                another_core_num++;
            }
        }
        if(core_num != another_core_num) {
            return true;
        }
        for(item in this.pItemTable) {
            if(item.itemType == "CORE") {
                var hasShow:Bool = false;
                for(anotherItem in another.pItemTable) {
                    if(anotherItem == item) {
                        hasShow = true;
                        break;
                    }
                }
                if(!hasShow) {
                    return true;
                }
            }
        }
        return false;
    }
    public func hashCode():Int64 {
        return this.stateId;
    }
}