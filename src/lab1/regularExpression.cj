package comprehensiveLab.lab1
import std.collection.*
var pRegularTable = ArrayList<regularExpression>();
class regularExpression{
    public regularExpression(
        public var regularId: Int32,
        public var name: String,
        public var operatorSymbol: Rune,
        public var operandId1: Int32,
        public var operandId2: Int32,
        public var type1: String,  //取值有三种 CHAR CHARSET REGULAR
        public var type2: String,
        public var resultType: String,
        public var LexemeCategory: String,
        public var pNFA: Graph
    ) {

    }
}
