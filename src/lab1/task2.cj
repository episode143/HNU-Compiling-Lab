package comprehensiveLab.lab1
import std.collection.*
var currGraphNum:Int32 = 0;

// 针对一个字符或者一个字符集来创建其NFA  
public func generateBasicNFA(driverType: String,driverId: Int32,category:String):Graph {
    currGraphNum +=1;
    var temp:Int32 = 0;
    var edgeList = ArrayList<Edge>();
    var nodeList = ArrayList<State>();
    var target:Graph = Graph(currGraphNum+1,2,edgeList,nodeList);
    if(driverType == "CHAR") {
        var startState:State = State(0,"UNMATCH","");
        var endState:State = State(1,"MATCH","");
        target.pStateTable.append(startState);
        target.pStateTable.append(endState);
        var currEdge:Edge = Edge(0,1,driverId,"CHAR");
        target.pEdgeTable.append(currEdge);
    } else if(driverType == "CHARSET") {
        var startState:State = State(0,"UNMATCH","");
        var endState:State = State(1,"MATCH","");
        target.pStateTable.append(startState);
        target.pStateTable.append(endState);
        var currEdge:Edge = Edge(0,1,driverId,"CHARSET");
        target.pEdgeTable.append(currEdge);
    }
    target.pStateTable[1].LexemeCategory = category;
    return target;
}
// 并运算
public func union(pNFA1: Graph, pNFA2: Graph):Graph {
    currGraphNum+=1;
    var nodeList = ArrayList<State>();
    var edgeList = ArrayList<Edge>();
    var target = Graph(currGraphNum,0,edgeList,nodeList);  //结果图
    var nodeNum1:Int32 = pNFA1.numOfStates;  //1的状态数
    var nodeNum2:Int32 = pNFA2.numOfStates;  //2的状态数
    var startNode1:State = pNFA1.pStateTable[0];
    var endNode1:State = pNFA1.pStateTable[Int64(nodeNum1)-1];
    var startNode2:State = pNFA2.pStateTable[0];
    var endNode2:State = pNFA2.pStateTable[Int64(nodeNum2)-1];
    var startInput1:Bool = false;
    var endOutput1:Bool = false;
    var startInput2:Bool = false;
    var endOutput2:Bool = false;
    var upNumChange:Int32 = 0;  //上NFA序号变化情况
    var lowNumChange:Int32 = 0;  //下NFA序号变化情况

    //检测f1的头尾情况
    for(edge in pNFA1.pEdgeTable) {
        if(edge.fromState == nodeNum1-1) {
            endOutput1 = true;
        }
        if(edge.nextState == 0) {
            startInput1 = true;
        }
    }
    //结束状态有出边
    if(endOutput1) {
        var endNode:State = pNFA1.pStateTable[Int64(nodeNum1)-1];
        endNode.StateType = "UNMATCH";
        pNFA1.pStateTable.append(State(nodeNum1,"MATCH",""));
        var newEdge:Edge = Edge(nodeNum1-1,nodeNum1,-1,"NULL");
        pNFA1.pEdgeTable.append(newEdge);
    } 
    //开始状态有入边
    if(startInput1){
        var insertNode:State = State(-1,"UNMATCH","");  //新的开始节点
        var insertEdge:Edge = Edge(-1,0,-1,"NULL");   //新的边
        pNFA1.pStateTable.insert(0,insertNode);
        pNFA1.pEdgeTable.append(insertEdge);
        upNumChange = 1;
    }
    var p1End:State = pNFA1.pStateTable[pNFA1.pStateTable.size-1];
    //检查f1结尾状态的category
    if(p1End.LexemeCategory!="") {
        p1End.StateType = "UNMATCH";
        var shutNode:State = State(p1End.stateId+1,"MATCH","");
        var shutEdge:Edge = Edge(p1End.stateId,shutNode.stateId,-1,"NULL");
        pNFA1.pEdgeTable.append(shutEdge);
        pNFA1.pStateTable.append(shutNode);
    }
    // println("p1情况")
    // show(pNFA1);
    //检测f2头尾情况
    for(edge in pNFA2.pEdgeTable) {
        if(edge.fromState == nodeNum2-1) {
            endOutput2 = true;
        }
        if(edge.nextState == 0) {
            startInput2 = true;
        }
    }
    //结束状态有出边
    if(endOutput2) {
        var endNode:State = pNFA2.pStateTable[Int64(nodeNum2)-1];
        endNode.StateType = "UNMATCH";
        pNFA2.pStateTable.append(State(nodeNum2,"MATCH",""));
        var newEdge:Edge = Edge(nodeNum2-1,nodeNum2,-1,"NULL");
        pNFA2.pEdgeTable.append(newEdge);
    } 
    //开始状态有入边
    if(startInput2){
        var insertNode:State = State(-1,"UNMATCH","");  //新的开始节点
        var insertEdge:Edge = Edge(-1,0,-1,"NULL");   //新的边
        pNFA2.pStateTable.insert(0,insertNode);
        pNFA2.pEdgeTable.append(insertEdge);
        lowNumChange = 1;
    }
    var p2End:State = pNFA2.pStateTable[pNFA2.pStateTable.size-1];
    //检查f2状态的category
    if(p2End.LexemeCategory!="") {
        p2End.StateType = "UNMATCH";
        var shutNode:State = State(p2End.stateId+1,"MATCH","");
        var shutEdge:Edge = Edge(p2End.stateId,shutNode.stateId,-1,"NULL");
        pNFA2.pEdgeTable.append(shutEdge);
        pNFA2.pStateTable.append(shutNode);
    }
    // println("p2情况");
    // show(pNFA2);
    var index1:Int64 = 1;
    var index2:Int64 = 1;
    var size1 = pNFA1.pStateTable.size;  //f1的状态数
    var size2 = pNFA2.pStateTable.size;  //f2的状态数
    var eNode1:State = pNFA1.pStateTable[size1-1]; //变化后的f1的结束状态
    var eNode2:State = pNFA2.pStateTable[size2-1]; //变化后的f2的结束状态
    target.pStateTable.append(State(0,"UNMATCH",""));
    //添加 f1中的状态（除了结束状态）
    while(index1 < size1-1) {
        var tempNode:State = pNFA1.pStateTable[index1];
        target.pStateTable.append(State(tempNode.stateId+upNumChange,"UNMATCH",tempNode.LexemeCategory));
        index1 +=1;
    }
    // 添加f1中的所有的边
    for(edge in pNFA1.pEdgeTable) {
        if(edge.fromState != eNode1.stateId && edge.nextState!=eNode1.stateId) {
            target.pEdgeTable.append(Edge(edge.fromState+upNumChange,edge.nextState+upNumChange,edge.driverId,edge.DriverType));
        } else if(edge.fromState == eNode1.stateId) {
            target.pEdgeTable.append(Edge(Int32(size1+size2)-3,edge.nextState+upNumChange,edge.driverId,edge.DriverType));
        } else if(edge.nextState == eNode1.stateId) {
            target.pEdgeTable.append(Edge(edge.fromState+upNumChange,Int32(size1+size2)-3,edge.driverId,edge.DriverType));
        }
    }
    var detIndex:Int64 = target.pStateTable.size;  //当前有多少节点了
    //  添加 f2中的状态（除了结束状态）
    while(index2 < size2-1){
        var tempNode:State = pNFA2.pStateTable[index2];
        target.pStateTable.append(State(tempNode.stateId+lowNumChange+Int32(detIndex)-1,"UNMATCH",tempNode.LexemeCategory));
        index2 +=1;
    }
    // 添加 f2中的所有边
    for(edge in pNFA2.pEdgeTable) {
        var tempFromState:Int32 = -1;
        var tempNextState:Int32 = -1;
        if(edge.fromState != pNFA2.pStateTable[0].stateId && edge.fromState != eNode2.stateId ) {
            tempFromState = edge.fromState+lowNumChange+Int32(detIndex)-1;  
        } else if(edge.fromState == eNode1.stateId) {
            tempFromState = Int32(size1+size2)-3;
        } else if(edge.fromState == pNFA2.pStateTable[0].stateId) {
            tempFromState = 0;
        }
        if(edge.nextState != pNFA2.pStateTable[0].stateId && edge.nextState != eNode2.stateId) {
            tempNextState = edge.nextState+lowNumChange+Int32(detIndex)-1;
        } else if(edge.nextState == eNode2.stateId) {
            tempNextState = Int32(size1+size2)-3;
        } else if(edge.nextState == pNFA2.pStateTable[0].stateId) {
            tempNextState = 0;
        }
        target.pEdgeTable.append(Edge(tempFromState,tempNextState,edge.driverId,edge.DriverType));
    }
    target.pStateTable.append(State(Int32(size1+size2)-3,"MATCH",eNode1.LexemeCategory));
    target.graphId = currGraphNum;
    target.numOfStates = Int32(target.pStateTable.size);
    return target;
}
public func testUnion(){
    var nodeList1 = ArrayList<State>();
    var edgeList1 = ArrayList<Edge>();
    var nodeList2 = ArrayList<State>();
    var edgeList2 = ArrayList<Edge>();
    nodeList1.append(State(0,"UNMATCH",""));
    nodeList1.append(State(1,"MATCH","INTEGER_CONST"));
    edgeList1.append(Edge(0,1,11,"CHAR"));

    nodeList2.append(State(0,"UNMATCH",""));
    nodeList2.append(State(1,"MATCH",""));
    edgeList2.append(Edge(0,1,11,"CHAR"));
    edgeList2.append(Edge(1,0,11,"CHAR"));

    var p1:Graph = Graph(0,2,edgeList1,nodeList1);
    var p2:Graph = Graph(1,2,edgeList2,nodeList2);
    show(p1);
    show(p2);
    var testGraph:Graph = union(p1,p2);
    show(testGraph);
}
// 连接运算
public func product(pNFA1: Graph, pNFA2: Graph):Graph {
    currGraphNum+=1;
    var nodeList = ArrayList<State>();
    var edgeList = ArrayList<Edge>();
    var target = Graph(currGraphNum,0,edgeList,nodeList);  //结果图
    var s:Int64 = pNFA1.pStateTable.size;
    pNFA1.pStateTable[s-1].StateType = pNFA2.pStateTable[0].StateType;
    var endOutput:Bool = false;
    var startInput:Bool = false;
    for(edge in pNFA1.pEdgeTable) {
        if(edge.fromState == pNFA1.pStateTable[s-1].stateId) {
            endOutput = true;
            break;
        }
    }
    for(edge in pNFA2.pEdgeTable) {
        if(edge.nextState == pNFA2.pStateTable[0].stateId) {
            startInput = true;
            break;
        }
    }
    if(endOutput && startInput) {
        for(node in pNFA1.pStateTable) {
            target.pStateTable.append(node);
        }
        for(edge in pNFA1.pEdgeTable) {
            target.pEdgeTable.append(edge);
        }
        target.pEdgeTable.append(Edge(Int32(s-1),Int32(s),-1,"NULL")); //插入
        for(node in pNFA2.pStateTable) {
            target.pStateTable.append(State(node.stateId+Int32(s),node.StateType,node.LexemeCategory));
        }
        for(edge in pNFA2.pEdgeTable) {
            target.pEdgeTable.append(Edge(edge.fromState+Int32(s),edge.nextState+Int32(s),edge.driverId,edge.DriverType));
        }
    } else {
        for(node in pNFA1.pStateTable) {
            target.pStateTable.append(node);
        }
        for(edge in pNFA1.pEdgeTable) {
            target.pEdgeTable.append(edge);
        }
        for(node in pNFA2.pStateTable) {
            if(node.stateId != 0) {
                target.pStateTable.append(State(node.stateId+Int32(s-1),node.StateType,node.LexemeCategory));
            }
        }
        for(edge in pNFA2.pEdgeTable) {
            target.pEdgeTable.append(Edge(edge.fromState+Int32(s-1),edge.nextState+Int32(s-1),edge.driverId,edge.DriverType));
        }
        var nodeTail:Int64 = nodeList.size -1;
        var p2Tail:Int64 = pNFA2.pStateTable.size -1;
        nodeList[nodeTail].LexemeCategory = pNFA2.pStateTable[p2Tail].LexemeCategory;
        nodeList[nodeTail].StateType = pNFA2.pStateTable[p2Tail].StateType;
    }
    target.numOfStates = Int32(target.pStateTable.size);
    target.graphId = currGraphNum;
    return target;
}
// 测试连接运算
public func testProduct(){
    var c:Rune = 'c';
    var nodeList1 = ArrayList<State>();
    var edgeList1 = ArrayList<Edge>();
    var nodeList2 = ArrayList<State>();
    var edgeList2 = ArrayList<Edge>();
    var target1 = Graph(currGraphNum,0,edgeList1,nodeList1);
    var target2 = Graph(currGraphNum,0,edgeList2,nodeList2);
    target1.pStateTable.append(State(0,"UNMATCH",""));
    target1.pStateTable.append(State(1,"MATCH",""));
    target1.numOfStates = 2;
    target1.pEdgeTable.append(Edge(0,1,Int32(UInt32(c)),"CHAR"));
    target1.pEdgeTable.append(Edge(1,0,Int32(UInt32(c)),"CHAR"));
    target2.pStateTable.append(State(0,"UNMATCH",""));
    target2.pStateTable.append(State(1,"MATCH",""));
    target2.pEdgeTable.append(Edge(0,1,Int32(UInt32(c)),"CHAR"));
    target2.pEdgeTable.append(Edge(1,0,Int32(UInt32(c)),"CHAR"));
    var target3:Graph = product(target1,target2);
    show(target1);
    show(target2);
    show(target3);
}
// 正闭包运算
public func plusClosure(pNFA: Graph): Graph {
    var nodeNum:Int64 = pNFA.pStateTable.size;
    var edge:Edge = Edge(pNFA.pStateTable[nodeNum-1].stateId,0,-1,"NULL");
    pNFA.pEdgeTable.append(edge);
    return pNFA;
}
// 闭包运算
public func closure(pNFA: Graph) :Graph {
    currGraphNum +=1;
    var nodeNum:Int64 = pNFA.pStateTable.size;
    var startInput:Bool = false;
    var endOutput:Bool = false;
    var startStateId:Int32 = pNFA.pStateTable[0].stateId;
    var endStateId:Int32 = pNFA.pStateTable[nodeNum - 1].stateId;
    var numChange:Int32 = 0;
    for(edge in pNFA.pEdgeTable) {
        if(edge.fromState == endStateId) {
            endOutput = true;
        }
        if(edge.nextState == startStateId) {
            startInput = true;
        }
    }
    // 特殊情况
    if(!startInput && !endOutput && pNFA.pStateTable.size == 2) {
        var tempNodeList = ArrayList<State>();
        var tempEdgeList = ArrayList<Edge>();
        tempNodeList.append(State(0,"MATCH",pNFA.pStateTable[1].LexemeCategory));
        for(edge in pNFA.pEdgeTable) {
            tempEdgeList.append(Edge(0,0,edge.driverId,edge.DriverType));
        }
        var currNFA:Graph = Graph(currGraphNum,1,tempEdgeList,tempNodeList);
        return currNFA;
    }
    if(startInput) {
        pNFA.pStateTable.insert(0,State(-1,"UNMATCH",""));
        numChange = 1;
        pNFA.pEdgeTable.append(Edge(-1,0,-1,"NULL"));
    }
    // 原先的结束状态连接到开始状态
    pNFA.pEdgeTable.append(Edge(Int32(nodeNum)-1,0,-1,"NULL"));
    if(endOutput) {
        nodeNum = pNFA.pStateTable.size;
        var endIndex:Int32 = pNFA.pStateTable[nodeNum-1].stateId;
        pNFA.pStateTable[nodeNum-1].StateType = "UNMATCH";
        pNFA.pStateTable.append(State(Int32(endIndex+1),"MATCH",""));
        pNFA.pEdgeTable.append(Edge(endIndex,endIndex+1,-1,"NULL"));
    }
    if(numChange == Int32(1)){
        for(node in pNFA.pStateTable) {
            node.stateId +=1;
        }
        for(edge in pNFA.pEdgeTable) {
            edge.fromState +=1;
            edge.nextState +=1;
        }
    }
    return pNFA;
}
// 测试闭包运算
public func testClosure() {
    var nodeList = ArrayList<State>();
    var edgeList = ArrayList<Edge>();
    nodeList.append(State(0,"UNMATCH",""));
    nodeList.append(State(1,"UNMATCH",""));
    edgeList.append(Edge(0,1,33,"CHAR"));
    edgeList.append(Edge(1,2,33,"CHAR"));
    edgeList.append(Edge(2,0,33,"CHAR"));
    var rawNFA:Graph = Graph(0,3,edgeList,nodeList);
    show(rawNFA);
    var closureNFA:Graph = closure(rawNFA);
    show(closureNFA);
}
// ？运算
public func zeroOrOne(pNFA:Graph):Graph {
    var startInput:Bool = false;
    var endOutput:Bool = false;
    var endIndex:Int64 = pNFA.pStateTable.size-1;
    for(edge in pNFA.pEdgeTable) {
        if(edge.fromState == Int32(endIndex)) {
            endOutput = true;
        }
        if(edge.nextState == 0){
            startInput = true;
        }
    }
    var numChange:Int64 = 0;
    if(startInput) {
        pNFA.pEdgeTable.append(Edge(-1,0,-1,"NULL"));
        pNFA.pStateTable.insert(0,State(-1,"UNMATCH",""));
        numChange = 1;
    }
    if(endOutput) {
        var size:Int64 = pNFA.pStateTable.size;
        pNFA.pStateTable[size-1].StateType = "UNMATCH";
        pNFA.pEdgeTable.append(Edge(Int32(endIndex),Int32(endIndex+1),-1,"NULL"));
        pNFA.pStateTable.append(State(Int32(endIndex+1),"MATCH",""));
    }
    if(startInput) {
        for(edge in pNFA.pEdgeTable) {
            edge.fromState +=1;
            edge.nextState +=1;
        }
        for(state in pNFA.pStateTable) {
            state.stateId +=1;
        }
    }
    endIndex = Int64(pNFA.pStateTable[pNFA.pStateTable.size-1].stateId);
    pNFA.pEdgeTable.append(Edge(0,Int32(endIndex),-1,"NULL"));
    return pNFA;
}
public func testZeroOrOne(){
    var egdeList = ArrayList<Edge>();
    var nodeList = ArrayList<State>();
    nodeList.append(State(0,"UNMATCH",""));
    nodeList.append(State(1,"UNMATCH",""));
    nodeList.append(State(2,"MATCH",""));
    egdeList.append(Edge(0,1,11,"CHAR"));
    egdeList.append(Edge(1,2,11,"CHAR"));
    egdeList.append(Edge(1,0,11,"CHAR"));
    var rawGraph:Graph = Graph(1,2,egdeList,nodeList);
    show(rawGraph);
    var testGraph = zeroOrOne(rawGraph);
    show(testGraph);
}
public func show(pNFA: Graph) {
    println("node in nfa");
    for(node in pNFA.pStateTable) {
        println("node: ${node.stateId} StateType: ${node.StateType} LexemeCategory: ${node.LexemeCategory}");
    }
    println("edge in nfa");
    for(edge in pNFA.pEdgeTable) {
        println("fromState: ${edge.fromState} nextState: ${edge.nextState} driverId: ${edge.driverId} driverType: ${edge.DriverType}");
    }
}
