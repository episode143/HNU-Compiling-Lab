package comprehensiveLab.lab4
public class code {
    public var rowId:Int64;
    public var sentence:String;
    public init(){
        this.rowId = nextInstrId;
        nextInstrId++;
        this.sentence = "";
    }
    public init(sentence:String){
        this.rowId = nextInstrId;
        nextInstrId++;
        this.sentence = sentence;
    }
}