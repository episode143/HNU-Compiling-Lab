package comprehensiveLab.lab1
import std.collection.*
// 测试（a|b）*abb
public func testCase(){
    println();
    println();
    var a:Rune = 'a';
    var charSetA = range(a,a);
    var nodeListA = ArrayList<State>();
    var edgeListA = ArrayList<Edge>();
    nodeListA.append(State(0,"UNMATCH",""));
    nodeListA.append(State(1,"MATCH",""));
    edgeListA.append(Edge(0,1,charSetA,"CHAR"));
    var nfa_a:Graph = Graph(1,2,edgeListA,nodeListA);
    var b:Rune = 'b';
    var charSetB = range(b,b);
    var nodeListB = ArrayList<State>();
    var edgeListB = ArrayList<Edge>();
    nodeListB.append(State(0,"UNMATCH",""));
    nodeListB.append(State(1,"MATCH",""));
    edgeListB.append(Edge(0,1,charSetB,"CHAR"));
    var nfa_b:Graph = Graph(1,2,edgeListB,nodeListB);
    println("a的nfa");
    show(nfa_a);
    println();
    println();
    println("b的nfa");
    show(nfa_b);
    var nfa_aUnionb:Graph = union(nfa_a.copyGraph(),nfa_b.copyGraph());
    println();
    println();
    println("a | b 的 nfa");
    show(nfa_aUnionb);
    var nfa_closureOfAUnionB:Graph = closure(nfa_aUnionb.copyGraph());
    println();
    println();
    println("(a | b)* 的 nfa");
    show(nfa_closureOfAUnionB);
    var g1 = product(nfa_closureOfAUnionB.copyGraph(),nfa_a.copyGraph());
    println();
    println("(a | b)* a 的 nfa");
    show(g1);

    println();
    var g2 = product(g1.copyGraph(),nfa_a.copyGraph());
    println("(a | b)* a b 的 nfa");
    show(g2);
    println();
    var nfa_product_abb:Graph = product(product(product(nfa_closureOfAUnionB,nfa_a.copyGraph()),nfa_b.copyGraph()),nfa_b.copyGraph());
    println();
    println();
    println("(a | b)* a b b 的 nfa");
    show(nfa_product_abb);
    println();
    println();
    println("当前字符集表");
    showAll();
    var resultDNF:Graph = nfa_product_abb.NFA_to_DFA();
    println();
    println();
    println("(a | b)* a b b 的 DFA")
    show(resultDNF);
}
private func createLowerLetter():Int32{
    var a:Rune = 'a';
    var z:Rune = 'z';
    var charSetLetterLower:Int32 = range(a,z);
    return charSetLetterLower;
}
private func createUpperLetter():Int32{
    var A:Rune = 'A';
    var Z:Rune = 'Z';
    var charSetLetterUpper:Int32 = range(A,Z);
    return charSetLetterUpper;
}
private func createDigit():Int32{
    var num0:Rune = '0';
    var num9:Rune = '9';
    var charSetDigit:Int32 = range(num0,num9);
    return charSetDigit;
}
private func createSingleChar():ArrayList<Int32> {
    var charSetLetterArray = ArrayList<Int32>();
    var char__a: Rune = 'a';
    var charSetLetterLower_a = range(char__a,char__a);
    charSetLetterArray.append(charSetLetterLower_a);
    var char__b: Rune = 'b';
    var charSetLetterLower_b = range(char__b,char__b);
    charSetLetterArray.append(charSetLetterLower_b);
    var char__c: Rune = 'c';
    var charSetLetterLower_c = range(char__c,char__c);
    charSetLetterArray.append(charSetLetterLower_c);
    var char__d: Rune = 'd';
    var charSetLetterLower_d = range(char__d,char__d);
    charSetLetterArray.append(charSetLetterLower_d);
    var char__e: Rune = 'e';
    var charSetLetterLower_e = range(char__e,char__e);
    charSetLetterArray.append(charSetLetterLower_e);
    var char__f: Rune = 'f';
    var charSetLetterLower_f = range(char__f,char__f);
    charSetLetterArray.append(charSetLetterLower_f);
    var char__g: Rune = 'g';
    var charSetLetterLower_g = range(char__g,char__g);
    charSetLetterArray.append(charSetLetterLower_g);
    var char__h: Rune = 'h';
    var charSetLetterLower_h = range(char__h,char__h);
    charSetLetterArray.append(charSetLetterLower_h);
    var char__i: Rune = 'i';
    var charSetLetterLower_i = range(char__i,char__i);
    charSetLetterArray.append(charSetLetterLower_i);
    var char__j: Rune = 'j';
    var charSetLetterLower_j = range(char__j,char__j);
    charSetLetterArray.append(charSetLetterLower_j);
    var char__k: Rune = 'k';
    var charSetLetterLower_k = range(char__k,char__k);
    charSetLetterArray.append(charSetLetterLower_k);
    var char__l: Rune = 'l';
    var charSetLetterLower_l = range(char__l,char__l);
    charSetLetterArray.append(charSetLetterLower_l);
    var char__m: Rune = 'm';
    var charSetLetterLower_m = range(char__m,char__m);
    charSetLetterArray.append(charSetLetterLower_m);
    var char__n: Rune = 'n';
    var charSetLetterLower_n = range(char__n,char__n);
    charSetLetterArray.append(charSetLetterLower_n);
    var char__o: Rune = 'o';
    var charSetLetterLower_o = range(char__o,char__o);
    charSetLetterArray.append(charSetLetterLower_o);
    var char__p: Rune = 'p';
    var charSetLetterLower_p = range(char__p,char__p);
    charSetLetterArray.append(charSetLetterLower_p);
    var char__q: Rune = 'q';
    var charSetLetterLower_q = range(char__q,char__q);
    charSetLetterArray.append(charSetLetterLower_q);
    var char__r: Rune = 'r';
    var charSetLetterLower_r = range(char__r,char__r);
    charSetLetterArray.append(charSetLetterLower_r);
    var char__s: Rune = 's';
    var charSetLetterLower_s = range(char__s,char__s);
    charSetLetterArray.append(charSetLetterLower_s);
    var char__t: Rune = 't';
    var charSetLetterLower_t = range(char__t,char__t);
    charSetLetterArray.append(charSetLetterLower_t);
    var char__u: Rune = 'u';
    var charSetLetterLower_u = range(char__u,char__u);
    charSetLetterArray.append(charSetLetterLower_u);
    var char__v: Rune = 'v';
    var charSetLetterLower_v = range(char__v,char__v);
    charSetLetterArray.append(charSetLetterLower_v);
    var char__w: Rune = 'w';
    var charSetLetterLower_w = range(char__w,char__w);
    charSetLetterArray.append(charSetLetterLower_w);
    var char__x: Rune = 'x';
    var charSetLetterLower_x = range(char__x,char__x);
    charSetLetterArray.append(charSetLetterLower_w);
    var char__y: Rune = 'y';
    var charSetLetterLower_y = range(char__y,char__y);
    charSetLetterArray.append(charSetLetterLower_w);
    var char__z: Rune = 'z';
    var charSetLetterLower_z = range(char__z,char__z);
    charSetLetterArray.append(charSetLetterLower_z);
    return charSetLetterArray;
}
public func createTINY():Graph{
    //创建小写字符集 a-z
    var charSetLetterLower:Int32 = createLowerLetter();
    //创建大写字符集 A-ZP
    var charSetLetterUpper:Int32 = createUpperLetter();
    //创建数字字符集 0-9
    var charSetDigit:Int32 = createDigit();
    //创建合并字符集
    var charSetLetter:Int32 = union(charSetLetterLower,charSetLetterUpper);
    //创建字母数字字符集
    var charSetLetterDigit:Int32 = union(charSetLetter,charSetDigit);

    //创建单个字母字符集数组
    var charSetSingleLetter:ArrayList<Int32> = createSingleChar();

    // 定义单个字符变量并使用它们构建字符集
    var char001: Rune = '+';
    var charSetAdd:Int32 = range(char001, char001);

    var char002: Rune = '-';
    var charSetSub:Int32 = range(char002, char002);

    var char003: Rune = '*';
    var charSetMul:Int32 = range(char003, char003);

    var char004: Rune = '/';
    var charSetDiv:Int32 = range(char004, char004);

    var char005: Rune = '=';
    var charSetEqual:Int32 = range(char005, char005);

    var char006: Rune = '<';
    var charSetSmall:Int32 = range(char006, char006);

    var char007: Rune = '(';
    var charSetLeftBracket:Int32 = range(char007, char007);

    var char008: Rune = ')';
    var charSetRightBracket:Int32 = range(char008, char008);

    var char009: Rune = ';';
    var charSetSemicolon:Int32 = range(char009, char009);

    var char010: Rune = ':';
    var charSetColon:Int32 = range(char010, char010);

    var char011: Rune = ' ';
    var charSetSpace:Int32 = range(char011, char011);

    var char012: Rune = '{';
    var charSetLeftNote:Int32 = range(char012, char012);

    var char013: Rune = '}';
    var charSetRightNote:Int32 = range(char013, char013);

    var temp:Int32 = union(charSetLetter,char001);
    temp = union(temp,char002);
    temp = union(temp,char003);
    temp = union(temp,char004);
    temp = union(temp,char005);
    temp = union(temp,char006);
    temp = union(temp,char007);
    temp = union(temp,char008);
    temp = union(temp,char009);
    temp = union(temp,char010);
    temp = union(temp,char011);
    var noteCharSet:Int32 = union(temp,charSetLetterDigit);
    //当前字符集表
    //showAll();

    //关键字 if
    var graph_I:Graph = generateBasicNFA("CHAR",charSetSingleLetter[8],"");
    var graph_F:Graph = generateBasicNFA("CHAR",charSetSingleLetter[5],"KEYWORD");
    var graph_IF:Graph = product(graph_I,graph_F);
    //println("关键字 if");
    //show(graph_IF);

    //关键字 then
    var graph_T:Graph = generateBasicNFA("CHAR",charSetSingleLetter[19],"");
    var graph_H:Graph = generateBasicNFA("CHAR",charSetSingleLetter[7],"");
    var graph_E:Graph = generateBasicNFA("CHAR",charSetSingleLetter[4],"");
    var graph_N:Graph = generateBasicNFA("CHAR",charSetSingleLetter[13],"KEYWORD");
    var graph_TH:Graph = product(graph_T,graph_H);
    var graph_THE:Graph = product(graph_TH,graph_E);
    var graph_THEN:Graph = product(graph_THE,graph_N);
    //println("关键字 then");
    //show(graph_THEN);

    //关键字 else
    graph_E = generateBasicNFA("CHAR", charSetSingleLetter[4], "");
    var graph_L: Graph = generateBasicNFA("CHAR", charSetSingleLetter[11], "");
    var graph_S: Graph = generateBasicNFA("CHAR", charSetSingleLetter[18], "");
    var graph_E2: Graph = generateBasicNFA("CHAR", charSetSingleLetter[4], "KEYWORD");
    var graph_EL: Graph = product(graph_E, graph_L);
    var graph_ELS: Graph = product(graph_EL, graph_S);
    var graph_ELSE: Graph = product(graph_ELS, graph_E2);
    //println("关键字 else");
    //show(graph_ELSE);

    //关键字 end
    graph_E = generateBasicNFA("CHAR", charSetSingleLetter[4], "");
    graph_N = generateBasicNFA("CHAR", charSetSingleLetter[13], "");
    var graph_D: Graph = generateBasicNFA("CHAR", charSetSingleLetter[3], "KEYWORD");
    var graph_EN: Graph = product(graph_E, graph_N);
    var graph_END: Graph = product(graph_EN, graph_D);
    //println("关键字 end");
    //show(graph_END);

    //关键字 repeat
    var graph_R: Graph = generateBasicNFA("CHAR", charSetSingleLetter[17], ""); 
    graph_E = generateBasicNFA("CHAR", charSetSingleLetter[4], "");  // 'e'
    var graph_P: Graph = generateBasicNFA("CHAR", charSetSingleLetter[15], ""); 
    graph_E2 = generateBasicNFA("CHAR", charSetSingleLetter[4], ""); 
    var graph_A: Graph = generateBasicNFA("CHAR", charSetSingleLetter[0], ""); 
    graph_T = generateBasicNFA("CHAR", charSetSingleLetter[19], "KEYWORD"); 
    var graph_RE: Graph = product(graph_R, graph_E); 
    var graph_REP: Graph = product(graph_RE, graph_P); 
    var graph_REPE: Graph = product(graph_REP, graph_E2);
    var graph_REPEA: Graph = product(graph_REPE, graph_A); 
    var graph_REPEAT: Graph = product(graph_REPEA, graph_T);
    //println("关键字 repeat");
    //show(graph_REPEAT);

    //关键字 until
    var graph_U: Graph = generateBasicNFA("CHAR", charSetSingleLetter[20], ""); 
    graph_N = generateBasicNFA("CHAR", charSetSingleLetter[13], ""); 
    graph_T = generateBasicNFA("CHAR", charSetSingleLetter[19], "");
    graph_I = generateBasicNFA("CHAR", charSetSingleLetter[8], ""); 
    graph_L = generateBasicNFA("CHAR", charSetSingleLetter[11], "KEYWORD"); 
    var graph_UN: Graph = product(graph_U, graph_N); 
    var graph_UNT: Graph = product(graph_UN, graph_T); 
    var graph_UNTI: Graph = product(graph_UNT, graph_I); 
    var graph_UNTIL: Graph = product(graph_UNTI, graph_L); 
    //println("关键字 until");
    //show(graph_UNTIL);

    // 关键字 read
    graph_R = generateBasicNFA("CHAR", charSetSingleLetter[17], "");
    graph_E = generateBasicNFA("CHAR", charSetSingleLetter[4], "");
    graph_A = generateBasicNFA("CHAR", charSetSingleLetter[0], "");
    graph_D = generateBasicNFA("CHAR", charSetSingleLetter[3], "KEYWORD");
    graph_RE = product(graph_R, graph_E);
    var graph_REA: Graph = product(graph_RE, graph_A);
    var graph_READ: Graph = product(graph_REA, graph_D);
    //println("关键字 read");
    //show(graph_READ);

    // 关键字 write
    var graph_W: Graph = generateBasicNFA("CHAR", charSetSingleLetter[22], "");
    var graph_R2: Graph = generateBasicNFA("CHAR", charSetSingleLetter[17], "");
    graph_I = generateBasicNFA("CHAR", charSetSingleLetter[8], "");
    graph_T = generateBasicNFA("CHAR", charSetSingleLetter[19], "");
    graph_E2 = generateBasicNFA("CHAR", charSetSingleLetter[4], "KEYWORD");
    var graph_WR: Graph = product(graph_W, graph_R2);
    var graph_WRI: Graph = product(graph_WR, graph_I);
    var graph_WRIT: Graph = product(graph_WRI, graph_T);
    var graph_WRITE: Graph = product(graph_WRIT, graph_E2);
    //println("关键字 write");
    //show(graph_WRITE);
    // 加减乘除
    // +
    var graph_add: Graph = generateBasicNFA("CHAR", charSetAdd ,"+");
    // -
    var graph_sub: Graph = generateBasicNFA("CHAR", charSetSub ,"-");
    // *
    var graph_mul: Graph = generateBasicNFA("CHAR", charSetMul ,"*");
    // /
    var graph_div: Graph = generateBasicNFA("CHAR", charSetDiv ,"/");
    // =
    var graph_equal: Graph = generateBasicNFA("CHAR", charSetEqual, "=");
    // <
    var graph_small: Graph = generateBasicNFA("CHAR", charSetSmall, "<");
    // (
    var graph_leftBracket: Graph = generateBasicNFA("CHAR", charSetLeftBracket, "(");
    // )
    var graph_rightBracket: Graph = generateBasicNFA("CHAR", charSetRightBracket, ")");
    // ;
    var graph_semicolon: Graph = generateBasicNFA("CHAR", charSetSemicolon, ";");
    // :=
    var graph_colon1: Graph = generateBasicNFA("CHAR", charSetColon, "");
    var graph_colon2: Graph = generateBasicNFA("CHAR", charSetEqual, ":=");
    var graph_colon: Graph = product(graph_colon1, graph_colon2);
    // 空格
    var graph_space: Graph = generateBasicNFA("CHAR", charSetSpace, "BLANK");
    // ID
    var graph_letter: Graph = generateBasicNFA("CHARSET", charSetLetter, "");
    var graph_letter_digit:Graph = generateBasicNFA("CHARSET", charSetLetterDigit, "identifier");
    var graph_colsure_letter_digit:Graph = closure(graph_letter_digit);
    var graph_ID:Graph = product(graph_letter.copyGraph(), graph_colsure_letter_digit.copyGraph());
    // 注释
    var graph_leftNote: Graph = generateBasicNFA("CHAR", charSetLeftNote, "");
    graph_letter = generateBasicNFA("CHARSET", noteCharSet, "");
    var graph_content:Graph = closure(graph_letter);
    var graph_rightNote: Graph = generateBasicNFA("CHAR", charSetRightNote, "NOTE");
    var graph_note: Graph = product(graph_leftNote,product(graph_content, graph_rightNote));
    // NUM
    var graph_digit: Graph = generateBasicNFA("CHAR", charSetDigit, "Number");
    var graph_num: Graph = plusClosure(graph_digit);
    
    var graph1:Graph = union(graph_IF,graph_THEN);
    var graph2:Graph = union(graph1, graph_END);
    var graph3:Graph = union(graph2, graph_ELSE);
    var graph4:Graph = union(graph3, graph_REPEAT);
    var graph5:Graph = union(graph4, graph_UNTIL);
    var graph6:Graph = union(graph5, graph_READ);
    var graph7:Graph = union(graph6, graph_WRITE);
    var graph_keyword:Graph = graph7.copyGraph();
    var graph8:Graph = graph_add.copyGraph();
    var graph9:Graph = union(graph8, graph_sub);
    var graph10:Graph = union(graph9, graph_mul);
    var graph11:Graph = union(graph10, graph_div);
    var graph12:Graph = union(graph11, graph_equal);
    var graph13:Graph = union(graph12, graph_small);
    var graph14:Graph = union(graph13, graph_colon);
    var graph15:Graph = union(graph14, graph_semicolon);
    var graph16:Graph = union(graph15, graph_rightBracket);
    var graph17:Graph = union(graph16, graph_leftBracket);
    var graph_operator:Graph = graph17.copyGraph();
    var graph18:Graph = graph_ID.copyGraph();
    var graph19:Graph = union(graph18, graph_note);
    var graph20:Graph = union(graph19, graph_num);
    var graphEnd:Graph = union(union(graph_keyword,graph_operator),union(graph20, graph_space));
    //println("TINY 词法的 nfa");
    //show(graphEnd);
    //println();
    var result_DFA = graphEnd.NFA_to_DFA();
    //println("TINY 词法的 dfa");
    //show(result_DFA);
    return result_DFA;
}
public func testSingle(result_DFA:Graph) {
    // 测试结果
    // 测试关键字
    result_DFA.getLexemeCategory('if');
    result_DFA.getLexemeCategory('then');
    result_DFA.getLexemeCategory('else');
    result_DFA.getLexemeCategory('end');
    result_DFA.getLexemeCategory('repeat');
    result_DFA.getLexemeCategory('until');
    result_DFA.getLexemeCategory('read');
    result_DFA.getLexemeCategory('write');

    // 测试自定义符
    result_DFA.getLexemeCategory('until123');
    result_DFA.getLexemeCategory('untillll');
    result_DFA.getLexemeCategory('123123123');

    // 测试运算符
    result_DFA.getLexemeCategory(':=');
    result_DFA.getLexemeCategory('=');
    result_DFA.getLexemeCategory('<');
    result_DFA.getLexemeCategory('+');
    result_DFA.getLexemeCategory('-');
    result_DFA.getLexemeCategory('*');
    result_DFA.getLexemeCategory('/');
    result_DFA.getLexemeCategory('(');
    result_DFA.getLexemeCategory(')');
    result_DFA.getLexemeCategory(';');
}