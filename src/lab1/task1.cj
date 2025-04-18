package comprehensiveLab.lab1
import std.collection.*
import std.math.*
import std.sort.*
public var pCharSetTable = ArrayList<CharSet>() //字符集表
public var currCharSetIndex: Int32 = 1;
// 新增区间字符集
public func range(fromChar: Rune, toChar: Rune):Int32 {
    var tempCharSet = CharSet(currCharSetIndex,1,fromChar,toChar);
    pCharSetTable.append( tempCharSet );
    currCharSetIndex += 1;
    return currCharSetIndex - 1;
}
// 新增双字符合并字符集
public func union(c1: Rune , c2: Rune) :Int32 {
    var c1Num:UInt32 = UInt32(c1);
    var c2Num:UInt32 = UInt32(c2);
    // 两个字符不相等
    if(c1Num > c2Num) {
        if( c1Num == c2Num +1 ) {
            // 如果是相邻的字符
            var tempCharSet = CharSet(currCharSetIndex,1,c2,c1);
            pCharSetTable.append( tempCharSet );
            currCharSetIndex +=1;
            return currCharSetIndex - 1;
        } else {
            // 如果是不相邻的字符
            var tempCharSet1 = CharSet(currCharSetIndex,1,c2,c2);
            pCharSetTable.append( tempCharSet1 );
            var tempCharSet2 = CharSet(currCharSetIndex,2,c1,c1);
            pCharSetTable.append( tempCharSet2 );
            currCharSetIndex +=1;
            return currCharSetIndex - 1;
        }
    } 
    // 如果两个字符相等
    else if(c1Num == c2Num) {
        var tempCharSet = CharSet(currCharSetIndex,1,c1,c1);
        pCharSetTable.append( tempCharSet );
        currCharSetIndex +=1;
        return currCharSetIndex - 1;
    } 
    // 如果
    else {
        if( c2Num == c1Num +1 ) {
            // 如果是相邻的字符
            var tempCharSet = CharSet(currCharSetIndex,1,c1,c2);
            pCharSetTable.append( tempCharSet );
            currCharSetIndex +=1;
            return currCharSetIndex - 1;
        } else {
            // 如果是不相邻的字符
            var tempCharSet1 = CharSet(currCharSetIndex,1,c1,c1);
            pCharSetTable.append( tempCharSet1 );
            var tempCharSet2 = CharSet(currCharSetIndex,2,c2,c2);
            pCharSetTable.append( tempCharSet2 );
            currCharSetIndex +=1;
            return currCharSetIndex - 1;
        }
    }
    return 0
}
// 字符集和字符之间的并运算
public func union(charSetId: Int32, c: Rune):Int32 {
    //默认不包字符集不包含当前字符
    var isContain:Bool  = false;
    var currSegementId:Int32 = 1;
    var leftNextTo:Bool = false;
    var rightNextTo:Bool  = false;
    var tempCharSetList = ArrayList<CharSet>();
    for(charSet in pCharSetTable) {
        if(charSet.indexId == charSetId) {
            var currCharSet:CharSet = CharSet(currCharSetIndex,currSegementId,charSet.fromChar,charSet.toChar);
            tempCharSetList.append(currCharSet);
            currSegementId++;
            if(charSet.fromChar <=c && charSet.toChar>=c) {
                isContain = true;
            }
            if(UInt32(charSet.fromChar)== UInt32(c)+1) {
                leftNextTo = true;
            }
            if(UInt32(charSet.toChar) == UInt32(c)-1) {
                rightNextTo = true;
            }
        }
    }
    if(isContain) {
       for(charSet in tempCharSetList) {
           pCharSetTable.append(charSet);
       }
    } else {
        if (leftNextTo && !rightNextTo) {
            for(charSet in tempCharSetList) {
                if(UInt32(charSet.fromChar)== UInt32(c)+1) {
                    charSet.fromChar = c;
                } 
                pCharSetTable.append(charSet);
            }
        } else if(rightNextTo && leftNextTo) {
            for(charSet in tempCharSetList) {
                if(UInt32(charSet.toChar)== UInt32(c)-1) {
                    charSet.toChar = c;
                } 
                pCharSetTable.append(charSet);
            }
        } else if( leftNextTo && rightNextTo) {
            var index:Int64 = 0;
            var segementId:Int32 = 1;
            while(index < tempCharSetList.capacity()) {
                if(UInt32(tempCharSetList[index].toChar) + 1 == UInt32(c)) {
                    var tempCharSet:CharSet = CharSet(tempCharSetList[index].indexId,segementId,
                    tempCharSetList[index].fromChar,tempCharSetList[index+1].toChar);
                    pCharSetTable.append(tempCharSet);
                    index += 2;
                    segementId++;
                } else {
                    var tempCharSet:CharSet = CharSet(tempCharSetList[index].indexId,segementId,
                    tempCharSetList[index].fromChar,tempCharSetList[index].toChar);
                    pCharSetTable.append(tempCharSet);
                    segementId +=1;
                    index +=1;
                }
            }
        } else {
            for(charSet in tempCharSetList) {
                pCharSetTable.append(charSet);
            }
            var tempCharSet:CharSet = CharSet(currCharSetIndex,currSegementId,c,c);
            pCharSetTable.append(tempCharSet);
        }
    }
    currCharSetIndex +=1;
    return currCharSetIndex -1;
}
// 字符集和字符集之间的并运算
public func union(charSetId1: Int32,charSetId2: Int32):Int32 {
    var tempCharSetList = ArrayList<CharSet>();
    for(charSet in pCharSetTable) {
        if(charSet.indexId == charSetId1 || charSet.indexId == charSetId2) {
            tempCharSetList.append(charSet);
        }
    }
    tempCharSetList.sortBy(stable: true) { charSet1:CharSet, charSet2: CharSet=>
        if(charSet1.fromChar<charSet2.fromChar) {
            return Ordering.LT;
        } else if(charSet1.fromChar == charSet2.fromChar) {
            if(charSet1.toChar<charSet2.toChar) {
               return Ordering.LT;
            } else if(charSet1.toChar == charSet2.toChar) {
               return Ordering.EQ;
            } else{
               return Ordering.GT;
            }
        } else{
            return Ordering.GT;
        }
    }
    var currSegementId:Int32 = 1;
    var currPos:Int64 = pCharSetTable.size;
    pCharSetTable.append(CharSet(currCharSetIndex,1,tempCharSetList[0].fromChar,tempCharSetList[0].toChar));
    for(charSet in tempCharSetList) {
        if(charSet.fromChar <= pCharSetTable[currPos].toChar && charSet.toChar > pCharSetTable[currPos].toChar) {
            pCharSetTable[currPos].toChar = charSet.toChar;
        } else if( charSet.fromChar > pCharSetTable[currPos].toChar) {
            currSegementId +=1;
            currPos +=1;
            pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,charSet.fromChar,charSet.toChar));
        }
    }
    currCharSetIndex +=1;
    return currCharSetIndex -1;
}
// 字符集和字符集之间的差运算
public func difference(charSetId1: Int32, charSetid2: Int32):Int32 {
    var before = pCharSetTable.size;
    var list1 = ArrayList<CharSet>();
    var list2 = ArrayList<CharSet>();
    for(charSet in pCharSetTable) {
        if(charSet.indexId == charSetId1) {
            list1.append(charSet);
        }
        if(charSet.indexId == charSetid2) {
            list2.append(charSet);
        }
    }
    var size1 = list1.size;
    var size2 = list2.size;
    var i = 0;
    var j = 0;
    var currSegementId:Int32 = 1;
    while( i < size1) {
        var start1:UInt32 = UInt32(list1[i].fromChar);
        var end1:UInt32 = UInt32(list1[i].toChar);
        while(j <size2 && UInt32(list2[j].toChar) < start1) {
            j += 1;
        }
        var isCovered:Bool = false;
        while( j< size2 && UInt32(list2[j].fromChar) <=end1 ) {
            var start2:UInt32 =UInt32( list2[j].fromChar);
            var end2:UInt32 = UInt32(list2[j].toChar);
            var overlapStart:UInt32 = max(start1,start2);
            var overlapEnd:UInt32 = min(end1,end2);
            if(overlapStart > start1) {
                pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,Rune(start1),Rune(overlapStart -1)));
                currSegementId +=1;
            }
            start1 = overlapEnd + 1;

            if(start1 > end1) {
                isCovered = true;
                break;
            }

            j++;
        }
        if(!isCovered && start1 <= end1) {
            pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,Rune(start1),Rune(end1)));
            currSegementId +=1;
        }
        i +=1;
    }
    currCharSetIndex +=1;
    return currCharSetIndex -1;
}
// 字符集和字符之间的差运算
public func difference(charSetId:Int32 , c:Rune):Int32 {
    var currSegementId:Int32 = 1;
    for(charSet in pCharSetTable) {
        if(charSet.indexId == charSetId) {
            if(charSet.fromChar > c) {
                pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,charSet.fromChar,charSet.toChar));
                currSegementId+=1;
            } else if(charSet.toChar <c) {
                pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,charSet.fromChar,charSet.toChar));
                currSegementId+=1;
            } else {
                if(charSet.fromChar == charSet.toChar) {
                    continue;
                } else if(charSet.fromChar != charSet.toChar && charSet.toChar == c) {
                    pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,charSet.fromChar,Rune(UInt32(charSet.toChar)-1)));
                    currSegementId+=1;
                } else if(charSet.fromChar != charSet.toChar && charSet.fromChar == c) {
                    pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,Rune(UInt32(charSet.fromChar)+1),charSet.toChar));
                    currSegementId+=1;
                } else if(charSet.fromChar != charSet.toChar && charSet.fromChar<c && charSet.toChar>c) {
                    pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,charSet.fromChar,Rune(UInt32(c)-1)));
                    currSegementId+=1;
                    pCharSetTable.append(CharSet(currCharSetIndex,currSegementId,Rune(UInt32(c)+1),charSet.toChar));
                    currSegementId+=1;
                }
            }
        }
    }
    currCharSetIndex +=1;
    return currCharSetIndex -1;
}

public func show(charSet: CharSet) {
    println("indexId: ${charSet.indexId} segementId: ${charSet.segementId} fromChar: ${charSet.fromChar} toChar: ${charSet.toChar}");
}
public func show(){
    println();
    println("字符集表的内容");
    for(charSet in pCharSetTable) {
        println("indexId: ${charSet.indexId} segementId: ${charSet.segementId} fromChar: ${charSet.fromChar} toChar: ${charSet.toChar}");
    }
}

// 测试样例1
func testCaseNestedCoverage() {
    pCharSetTable.clear();
    currCharSetIndex =1;
    // 创建字符集
    var c_a: Rune = 'a'
    var c_z: Rune = 'z'
    var c_c: Rune = 'c'
    var c_x: Rune = 'x'
    
    range(c_a, c_z)        // 字符集1: a-z
    range(c_c, c_x)        // 字符集2: c-x
    
    // 计算差集
    var id1 = difference(1, 2) // 预期结果: [a-b], [y-z]
    
    println("Test Case Nested Coverage:")
    show()
}
// 测试样例2
func testCaseSinglePoint() {
    pCharSetTable.clear();
    currCharSetIndex =1;
    // 创建字符集
    var c_a: Rune = 'a'
    var c_d: Rune = 'd'
    var c_b: Rune = 'b'
    
    range(c_a, c_d)        // 字符集1: a-d
    union(1, c_b)          // 将 b 加入字符集1

    range(c_b, c_b)        // 字符集2: 只包含 b
    
    // 计算差集
    var id2 = difference(1, 2) // 预期结果: [a-a], [c-d]
    
    println("Test Case Single Point:")
    show()
}
// 测试样例3
func testCaseBoundaryOverlap() {
    pCharSetTable.clear();
    currCharSetIndex = 1;
    // 创建字符集
    var c_a: Rune = 'a'
    var c_e: Rune = 'e'
    var c_e2: Rune = 'e'
    var c_g: Rune = 'g'
    
    range(c_a, c_e)        // 字符集1: a-e
    range(c_e2, c_g)       // 字符集2: e-g
    
    // 计算差集
    var id3 = difference(1, 2) // 预期结果: [a-d]
    
    println("Test Case Boundary Overlap:")
    show()
}
// 测试样例4
func testCaseLargeDataSet() {
    pCharSetTable.clear();
    currCharSetIndex = 1;
    // 创建字符集
    var c_a: Rune = 'a'
    var c_z: Rune = 'z'
    var c_b: Rune = 'b'
    var c_c: Rune = 'c'
    var c_e: Rune = 'e'
    var c_f: Rune = 'f'
    var c_h: Rune = 'h'
    var c_i: Rune = 'i'
    var c_k: Rune = 'k'
    var c_l: Rune = 'l'
    var c_n: Rune = 'n'
    var c_o: Rune = 'o'
    var c_q: Rune = 'q'
    var c_r: Rune = 'r'
    var c_t: Rune = 't'
    var c_u: Rune = 'u'
    var c_w: Rune = 'w'
    var c_x: Rune = 'x'
    
    range(c_a, c_z)        // 字符集1: a-z
    range(c_b, c_c)        // 字符集2: b-c
    range(c_e, c_f)        // 字符集3: e-f
    range(c_h, c_i)        // 字符集4: h-i
    range(c_k, c_l)        // 字符集5: k-l
    range(c_n, c_o)        // 字符集6: n-o
    range(c_q, c_r)        // 字符集7: q-r
    range(c_t, c_u)        // 字符集8: t-u
    range(c_w, c_x)        // 字符集9: w-x
    
    // 计算差集
    var id4 = difference(1, 2) // 预期结果: [a-a], [d-z] - [b-c]
    id4 = difference(id4, 3)   // 预期结果: [a-a], [d-z] - [b-c], [e-f]
    id4 = difference(id4, 4)   // 预期结果: [a-a], [d-z] - [b-c], [e-f], [h-i]
    id4 = difference(id4, 5)   // 预期结果: [a-a], [d-z] - [b-c], [e-f], [h-i], [k-l]
    id4 = difference(id4, 6)   // 预期结果: [a-a], [d-z] - [b-c], [e-f], [h-i], [k-l], [n-o]
    id4 = difference(id4, 7)   // 预期结果: [a-a], [d-z] - [b-c], [e-f], [h-i], [k-l], [n-o], [q-r]
    id4 = difference(id4, 8)   // 预期结果: [a-a], [d-z] - [b-c], [e-f], [h-i], [k-l], [n-o], [q-r], [t-u]
    id4 = difference(id4, 9)   // 预期结果: [a-a], [d-z] - [b-c], [e-f], [h-i], [k-l], [n-o], [q-r], [t-u], [w-x]

    println("Test Case Large Data Set:")
    show()
}

public func showAll() {
    var index = 0;
    for(charSet in pCharSetTable) {
        println("No ${index}");
        println("id: ${charSet.indexId} segementId: ${charSet.segementId} fromChar: ${charSet.fromChar} toChar: ${charSet.toChar}");
        index+=1;
    }
}