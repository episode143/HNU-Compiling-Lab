package comprehensiveLab.lab1
import std.collection.*
main(): Int64 {
    createTINY();
    //testCase();
    return 0
}
// 测试用例 b* a* (a | b) a*
public func testProblem(){
    var a:Graph = generateBasicNFA("CHAR",1,"");
    println("a 的 nfa");
    show(a);
    println();

    var b:Graph = generateBasicNFA("CHAR",2,"");
    println("b 的 nfa");
    show(b);
    println();

    var b_closure = closure(b.copyGraph());
    println("b 的 closure");
    show(b_closure);
    println();

    var a1_closure = closure(a.copyGraph());
    println("a 的 closure");
    show(a1_closure);
    println();

    var a2_closure = closure(a.copyGraph());
    var a_union_b = union(a.copyGraph(),b.copyGraph());
    println("a union b 的 nfa")
    show(a_union_b);
    println();

    var p1 = product(b_closure,a1_closure);
    println("b closure * a1 closure");
    show(p1);
    println();

    var p2 = product(p1,a_union_b);
    println("p1 * (a|b)");
    show(p2);
    println();

    var p3 = product(p2,a2_closure);
    println("p2 * a2 closure");
    show(p3);
    println();

    var DFA = p3.NFA_to_DFA();
    println("p3 的 DFA");
    show(DFA);
}
// 测试用例 b* (a | ab)
public func testProblem1(){
    var a:Graph = generateBasicNFA("CHAR",1,"");
    var b:Graph = generateBasicNFA("CHAR",2,"");
    var b_closure = closure(b.copyGraph());
    var ab = product(a.copyGraph(),b.copyGraph());
    var a_union_ab = union(a.copyGraph(),ab.copyGraph());
    var closure_a_union_ab = closure(a_union_ab.copyGraph());
    var p1 = product(b_closure.copyGraph(),closure_a_union_ab.copyGraph());
    var DFA = p1.NFA_to_DFA();
    show(DFA);
}

