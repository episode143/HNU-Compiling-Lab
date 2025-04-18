package comprehensiveLab.lab1
import std.collection.*
import comprehensiveLab.lab4.object
public class Graph{
    public Graph(
        /** nfa或dfa对应的id*/
        public var graphId: Int32,
        /** 图中的节点数*/
        public var numOfStates: Int32,  
        /** 图中的边*/
        public var pEdgeTable: ArrayList<Edge>,
        /** 图中的状态*/
        public var pStateTable: ArrayList<State>
    ) {

    }
    public func copyGraph():Graph {
        var nodeList = ArrayList<State>();
        var edgeList = ArrayList<Edge>();
        for(edge in this.pEdgeTable) {
            edgeList.append(Edge(edge.fromState,edge.nextState,edge.driverId,edge.DriverType));
        }
        for(node in this.pStateTable) {
            nodeList.append(State(node.stateId,node.StateType,node.LexemeCategory));
        }
        var result:Graph =Graph(0,this.numOfStates,edgeList,nodeList);
        return result;
    }
    // move函数 （针对被diff后的集合与原集合） 
    public func move(currStateList: HashSet<Int32>,driverId:Int32):HashSet<Int32>{
        var resultStateList = HashSet<Int32>();
        for(edge in this.pEdgeTable) {
            if(currStateList.contains(edge.fromState) && edge.driverId == driverId) {
                resultStateList.put(edge.nextState);
            }
        }
        return resultStateList;
    }
    // 针对单个字符 与 其可以通过的所有集合
    public func move(currStateList: HashSet<Int32>,c:Rune):HashSet<Int32>{
        var resultStateList = HashSet<Int32>();
        for(edge in this.pEdgeTable) {
            // 当当前字符可以通过的时候确定
            if(currStateList.contains(edge.fromState) && edge.driverId!= -1 &&isSubSet(c,edge.driverId) ) {
                resultStateList.put(edge.nextState);
            }
        }
        return resultStateList;
    }
    // epsilon_colsure函数
    public func epsilon_closure(currStateList: HashSet<Int32>) :HashSet<Int32>{
        var resultStateList = HashSet<Int32>();
        for(edge in this.pEdgeTable) {
            if(currStateList.contains(edge.fromState) && edge.driverId == -1 && edge.DriverType == "NULL") {
                resultStateList.put(edge.nextState);
            }
        }
        for(state in currStateList) {
            resultStateList.put(state);
        }
        return resultStateList;
    }

    //DTran 函数
    public func DTran(currStateList: HashSet<Int32>,driverId:Int32):HashSet<Int32>{
        var moveState:HashSet<Int32> = move(currStateList,driverId);
        return epsilon_closure(moveState);
    }
    public func DTran(currStateList: HashSet<Int32>,c:Rune):HashSet<Int32>{
        var moveState:HashSet<Int32> = move(currStateList,c);
        return epsilon_closure(moveState);
    }

    // NFA转为DFA函数
    public func NFA_to_DFA():Graph {
        currGraphNum+=1;
        var nodeList = ArrayList<State>();
        var edgeList = ArrayList<Edge>();
        var target:Graph = Graph(currGraphNum,0,edgeList,nodeList);
        // 已经出现的状态集合
        var DFA_State_Set = ArrayList<HashSet<Int32>>();
        var start_state_closure = HashSet<Int32>();
        start_state_closure.put(0);
        //得到第一个初始状态集合
        start_state_closure = epsilon_closure(start_state_closure);
        DFA_State_Set.append(start_state_closure);
        //用于广搜的队列(内部元素肯定都已经出现过)
        var queue = ArrayList<HashSet<Int32>>();
        queue.append(start_state_closure);
        while(queue.size!=0) {
            // 队头的状态编号()
            var currStateId:Int64 = 0;
            var currStateSet = queue[0];
            queue.remove(0);
            while( currStateId < DFA_State_Set.size) {
                if(isSameSet(currStateSet,DFA_State_Set[currStateId])) {
                    break;
                }
                currStateId +=1;
            }
            // 找出当前状态的驱动字符集
            var driverCharSet = HashSet<Int32>();
            // 单字符的驱动集
            var justCharSet = HashSet<Int32>();
            // diff掉单字符的集合驱动集
            var diffCharSet = HashSet<Int32>();
            for(edge in this.pEdgeTable) {
                if(currStateSet.contains(edge.fromState) && edge.driverId != -1) {
                    driverCharSet.put(edge.driverId);
                    if(edge.DriverType == "CHARSET") {
                        diffCharSet.put(edge.driverId);
                    } else if(edge.DriverType == "CHAR"){
                        justCharSet.put(edge.driverId);
                    }
                }
            }
            for(driverId in justCharSet) {
                var c:Rune ='?';
                for(charSet in pCharSetTable) {
                    if(charSet.indexId == driverId) {
                        c = charSet.fromChar;
                        break;
                    }
                }
                var nextStateSet = DTran(currStateSet,c);
                var nextStateId:Int64 = 0;
                var isExist = false;
                // 判断下一状态集是否出现
                while(nextStateId < DFA_State_Set.size) {
                    if(isSameSet(nextStateSet,DFA_State_Set[nextStateId])) {
                        isExist = true;
                        break;
                    }
                    nextStateId +=1;
                }
                // 如果出现过
                if(isExist) {
                    //println("下一状态集已出现");
                    edgeList.append(Edge(Int32(currStateId),Int32(nextStateId),driverId,"CHAR"));
                    //println("新增边： fromState: ${currStateId}  nextState:${nextStateId}  driverId:${driverId}")
                }
                // 如果没有出现
                if(!isExist) {
                    //println("下一状态集未出现");
                    //println("当前状态集合");
                    //showSet(currStateSet);
                    //println("通过CHAR${driverId}进入下一状态${nextStateId}");
                    //showSet(nextStateSet);
                    // 添加到已出现的集合中
                    DFA_State_Set.append(nextStateSet);
                    // 更新状态节点的id
                    edgeList.append(Edge(Int32(currStateId),Int32(nextStateId),driverId,"CHAR"));
                    //println("新增边： fromState: ${currStateId}  nextState:${nextStateId}  driverId:${driverId}")
                    queue.append(nextStateSet);
                }
            }
            for(driverId in diffCharSet) {
                // 找到下一状态
                var nextStateSet = DTran(currStateSet,driverId);
                // println("<<<<<<<<由多字符状态集驱动得到的集合");
                // showSet(nextStateSet);
                // println();
                var nextStateId:Int64 = 0;
                var isExist = false;
                // 判断下一状态集是否出现
                while(nextStateId < DFA_State_Set.size) {
                    if(isSameSet(nextStateSet,DFA_State_Set[nextStateId])) {
                        isExist = true;
                        break;
                    }
                    nextStateId +=1;
                }
                // 如果出现过
                if(isExist) {
                    //println("下一状态集已出现");
                    edgeList.append(Edge(Int32(currStateId),Int32(nextStateId),driverId,"CHARSET"));
                    //println("新增边： fromState: ${currStateId}  nextState:${nextStateId}  driverId:${driverId}")
                }
                // 如果没有出现
                if(!isExist) {
                    //println("下一状态集未出现");
                    // 添加到已出现的集合中
                    //println("当前状态集合");
                    //showSet(currStateSet);
                    //println("通过CHARSET${driverId}进入下一状态${nextStateId}");
                    //showSet(nextStateSet);
                    DFA_State_Set.append(nextStateSet);
                    // 更新状态节点的id
                    edgeList.append(Edge(Int32(currStateId),Int32(nextStateId),driverId,"CHARSET"));
                    //println("新增边： fromState: ${currStateId}  nextState:${nextStateId}  driverId:${driverId}")
                    queue.append(nextStateSet);
                }
            }
        }
        var matchId = this.pStateTable.size-1;
        var index:Int64 = 0;
        while(index < DFA_State_Set.size) {
            var currStateSet = DFA_State_Set[index];
            var matchType = "UNMATCH";
            var category:String = "";
            // 状态子集对matchType的值判断
            if(currStateSet.contains(Int32(matchId))) {
                matchType = "MATCH";    
            } else {
                matchType = "UNMATCH";
            }
            // 状态子集对categories进行判断
            for(state in currStateSet) {
                if(this.pStateTable[Int64(state)].LexemeCategory != "") {
                    if(this.pStateTable[Int64(state)].LexemeCategory != "ID") {
                        category = this.pStateTable[Int64(state)].LexemeCategory;
                        break;
                    } else if(this.pStateTable[Int64(state)].LexemeCategory == "ID") {
                        category = "ID";
                    }
                }
            }
            nodeList.append(State(Int32(index),matchType,category));
            index +=1;
        }
        target.numOfStates = Int32(target.pStateTable.size);
        return target;
    }
    public func testBug(){
        var set = HashSet<Int32>();
        set.put(48);
        set.put(0);
        println("测试bug");
        var c:Rune = '(';
        var result = DTran(set,c);
        showSet(result);
        showAll()
    }
    public func longTextSearch(s:String):ArrayList<object> {
        // 最终序列结果
        var res_TS_Sequence:ArrayList<object> = ArrayList<object>();
        // 前一状态
        var currState:Int32 = 0;
        var num:Int64 = 0;
        // 当前状态
        var nextState:Int32 = 0;
        var index:Int64 = 0;
        var array = s.toArray();
        var charArray = ArrayList<Rune>();
        while(index < array.size) {
            var c:Rune  = Rune(array[index]);
            //println("前一状态 ${currState}   当前状态 ${nextState}");
            //println("当前索引： ${index}  当前字符 ${c}");
            index +=1;
            var hasNextTrans:Bool = false;
            for(edge in this.pEdgeTable) {
                if(edge.fromState == nextState && edge.DriverType == "CHAR" && Int64(edge.driverId) == getIndex(c)) {
                    //println("通过CHAR进入下一状态");
                    currState = nextState;
                    nextState = edge.nextState;
                    hasNextTrans = true;
                    break;
                }
            }
            if(!hasNextTrans) {
                for(edge in this.pEdgeTable) {
                    if(edge.fromState == nextState && edge.DriverType == "CHARSET" && hasContainChar(edge.driverId,c)) {
                        //println("通过CHARSET进入下一状态");
                        currState = nextState;
                        nextState = edge.nextState;
                        hasNextTrans = true;
                        break;
                    }
                }
            }
            // 扫描到现在结束 当前状态没有匹配到
            if(!hasNextTrans) {
                num+=1;
                println("识别到 token ${num} : ${pStateTable[Int64(nextState)].LexemeCategory} ");
                if(pStateTable[Int64(nextState)].LexemeCategory != "BLANK" && pStateTable[Int64(nextState)].LexemeCategory!="NOTE") {
                    if(pStateTable[Int64(nextState)].LexemeCategory != "KEYWORD") {
                        var tempObject:object = object(pStateTable[Int64(nextState)].LexemeCategory,"TERMINAL");
                        res_TS_Sequence.append(tempObject);
                        if(pStateTable[Int64(nextState)].LexemeCategory == "identifier") {
                            var id:String = "";
                            for(char in charArray) {
                                id += char.toString();
                            }
                            tempObject.identify = id;
                        } else if(pStateTable[Int64(nextState)].LexemeCategory == "Number") {
                            var value:Int64 = 0;
                            for(char in charArray) {
                                value *= 10;
                                var tempValue:UInt32 = UInt32(char);
                                var temoChar:Rune = '0';
                                tempValue -= UInt32(temoChar);
                                value+=Int64(tempValue);
                            }
                            tempObject.value = value;
                        }
                    } else {
                        var keyword:String = "";
                        for(char in charArray) {
                            keyword += char.toString();
                        }
                        res_TS_Sequence.append(object(keyword,"TERMINAL"));
                    }
                }
                print("value:   ");
                for(char in charArray) {
                    print(char);
                }
                charArray.clear();
                charArray.append(c);
                println();
                println();
                currState = 0;
                nextState = 0;
                var hasJump:Bool =false;
                for(edge in this.pEdgeTable) {
                    if(edge.fromState == nextState && edge.DriverType == "CHAR" && Int64(edge.driverId) == getIndex(c)) {
                        nextState = edge.nextState;
                        hasJump = true;
                        break;
                    }
                }
                if(!hasJump) {
                    for(edge in this.pEdgeTable) {
                        if(edge.fromState == nextState && edge.DriverType == "CHARSET" && hasContainChar(edge.driverId,c)) {
                            nextState = edge.nextState;
                            hasJump = true;
                            break;
                        }
                    }
                }
            } else {
                charArray.append(c);
            }
        }
        num +=1;
        if(this.pStateTable[Int64(nextState)].LexemeCategory != "") {
            println("识别到 token ${num} : ${pStateTable[Int64(nextState)].LexemeCategory}");
            if(pStateTable[Int64(nextState)].LexemeCategory != "BLANK" && pStateTable[Int64(nextState)].LexemeCategory!="NOTE") {
                if(pStateTable[Int64(nextState)].LexemeCategory != "KEYWORD") {
                    var tempObject:object = object(pStateTable[Int64(nextState)].LexemeCategory,"TERMINAL");
                    res_TS_Sequence.append(tempObject);
                    if(pStateTable[Int64(nextState)].LexemeCategory == "identifier") {
                        var id:String = "";
                        for(char in charArray) {
                            id += char.toString();
                        }
                        tempObject.identify = id;
                    } else if(pStateTable[Int64(nextState)].LexemeCategory == "Number") {
                        var value:Int64 = 0;
                        for(char in charArray) {
                            value *= 10;
                            var tempValue:UInt32 = UInt32(char);
                            var temoChar:Rune = '0';
                            tempValue -= UInt32(temoChar);
                            value+=Int64(tempValue);
                        }
                        tempObject.value = value;
                    }
                } else {
                    var keyword:String = "";
                    for(char in charArray) {
                        keyword += char.toString();
                    }
                    res_TS_Sequence.append(object(keyword,"TERMINAL"));
                }
            }
            print("value:  ");
            for(char in charArray) {
                print(char);
            }
            println();
            println();
        }
        return res_TS_Sequence;
    }
    public func getLexemeCategory(s:String) {
        println("当前输入的字符串:  ${s}");
        // println("---------------------------");
        var currStateSet:Int32 = 0;
        for(c in s) {
            // println("当前状态");
            // println("currState: ${currStateSet}");
            var cc:Rune = Rune(c);
            // println("currChar: ${cc}");
            // println("---------------------------");
            var hasJump:Bool =false;
            for(edge in this.pEdgeTable) {
                if(edge.fromState == currStateSet && edge.DriverType == "CHAR" && Int64(edge.driverId) == getIndex(cc)) {
                    //println("通过CHAR进入下一状态");
                    currStateSet = edge.nextState;
                    hasJump = true;
                    break;
                }
            }
            if(hasJump) {
                continue;
            }
            //println("没有通过CHAR进入下一状态");
            for(edge in this.pEdgeTable ) {
                // if(edge.fromState == currStateSet) {
                //     println("fromState:${edge.fromState}  toState:${edge.nextState}  driverType:${edge.DriverType}  driverId:${edge.driverId}");
                // }
                if(edge.fromState == currStateSet && edge.DriverType == "CHARSET" && hasContainChar(edge.driverId,cc)) {
                    //println("通过CHARSET进入下一状态");
                    currStateSet = edge.nextState;
                    hasJump = true;
                    break;
                }
            }
            if(!hasJump) {
                currStateSet = 0;
                break;
            }
        }
        //println("结束状态: ${currStateSet}");
        println("category:  ${this.pStateTable[Int64(currStateSet)].LexemeCategory}");
        println("---------------------------");
    }
}
public func isSameSet(set1:HashSet<Int32>,set2:HashSet<Int32>):Bool {
        if(set1.size != set2.size) {
            return false;
        }
        for(state in set1) {
            if(!set2.contains(state)) {
                return false;
            }
        }
        return true;
    }
public func showSet(set:HashSet<Int32>){
    for(num in set) {
        print("${num}  ");
    }
    println();
}
public func getIndex(c:Rune):Int64 {
    var a:Rune = 'a';
    var z:Rune = 'z';
    if(c>=a && c<=z){
        var a:Rune = 'a';
        var diff:UInt32 = UInt32(c)-UInt32(a);
        return 6 + Int64(diff);
    } 
    var zero:Rune = '0';
    var nine:Rune = '9';
    if(c>=zero && c<=nine) {
        return 3;
    }
    match(c) {
        case '+' => return 32;
        case '-' => return 33;
        case '*' => return 34;
        case '/' => return 35;
        case '=' => return 36;
        case '<' => return 37;
        case '(' => return 38;
        case ')' => return 39;
        case ';' => return 40;
        case ':' => return 41;
        case ' ' => return 42;
        case '{' => return 43;
        case '}' => return 44;
        case  _  => return -1;
    }
}
public func isSubSet(c:Rune , superSetId:Int32):Bool {
    for(charSet in pCharSetTable) {
        if(charSet.indexId == superSetId && UInt32(charSet.fromChar) <= UInt32(c) && UInt32(charSet.toChar) >= UInt32(c)){
            return true;
        }
    }
    return false;
}
public func hasContainChar(index:Int32 , c:Rune):Bool {
    for(charSet in pCharSetTable) {
        if(charSet.indexId == index && charSet.fromChar <= c && charSet.toChar >= c) {
            return true;
        }
    }
    return false;
}