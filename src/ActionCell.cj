package lab2
public class ActionCell {
    // 状态序号
    let stateId:Int64
    // 纵坐标：终止符
    let terminalSymbolName:String
    // 为枚举类型 取值有三种：r规约 s移入 a接收
    let actionType:String
    // 当action类别为规约时，id取值为产生式id 当action类别为移入时，id的取值为下一状态id
    let actionId:Int64
    public init(stateId:Int64 ,terminalSymbolName:String ,actionType:String ,actionId:Int64) {
        this.stateId = stateId;
        this.terminalSymbolName = terminalSymbolName;
        this.actionType = actionType;
        this.actionId = actionId;
    }
}