package comprehensiveLab.lab1
import std.collection.*
// 测试move函数
public func testMove(){
    var a:Rune = 'a';
    var b:Rune = 'b';
    var c:Rune = 'c';
    var charSetNum1:Int32 = range(a,a);
    var charSetNum2:Int32 = range(b,b);
    var charSetNum3:Int32 = range(a,b);

    var nodeList = ArrayList<State>();
    nodeList.append(State(0,"UNMATCH",""));
    nodeList.append(State(1,"UNMATCH",""));
    nodeList.append(State(2,"UNMATCH",""));
    nodeList.append(State(3,"UNMATCH",""));
    nodeList.append(State(4,"UNMATCH",""));
    nodeList.append(State(5,"UNMATCH",""));
    nodeList.append(State(6,"UNMATCH",""));
    nodeList.append(State(7,"UNMATCH",""));
    nodeList.append(State(8,"UNMATCH",""));
    nodeList.append(State(9,"UNMATCH",""));
    nodeList.append(State(10,"MATCH",""));

    var edgeList = ArrayList<Edge>();
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(1,2,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));
    edgeList.append(Edge(0,1,-1,"NULL"));

}
public func showStateList(list: ArrayList<Int32>) {
    print("当前状态集合");
    for(state in list) {
        print("${state}  ")
    }
}