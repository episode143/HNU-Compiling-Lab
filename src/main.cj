package lab2
import std.collection.*
main(): Int64 {
    test_Arithmetic_Operation();
    return 0
}
// 测试第一题
public func testTask1(){
    test1();
    //show_all_nts_production();
    get_All_NFS_FIRST();
    show_All_NFS_FIRST();
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