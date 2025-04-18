package comprehensiveLab.lab1
public class Edge {
    public Edge(
        public var fromState: Int32, //
        public var nextState: Int32,
        public var driverId: Int32, // 应该是枚举类型的编号 
        public var DriverType: String //枚举类型 有eps char charset 几种类型
    ) {

    }
}
// eps的编号暂定为-1
