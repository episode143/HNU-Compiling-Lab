package lab2
import std.collection.*
main(): Int64 {
    testTask3();
    return 0
}
// 测试第一题
public func testTask1(){
    test1();
    //show_all_nts_production();
    get_All_NTS_FIRST();
    show_All_NTS_FIRST();
    get_All_Production_FIRST();
    show_All_Production_FIRST();
    get_All_NTS_FOLLOW();
    show_All_NTS_FOLLOW();
}
// 测试第二题
public func testTask2(){
    test2();
    test2_1();
    test2_4();
    test2_5();
    test2_6();
}
// 测试第三题
public func testTask3(){
    create_TINY();
    create_TINY_LR0_DFA();
    //test_TINY1();
    //test_TINY2();
    test_TINY3();
}