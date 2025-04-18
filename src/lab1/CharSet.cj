package comprehensiveLab.lab1
public class CharSet{
    public CharSet(
        /** 字符集id*/
        public var indexId: Int32,
        /** 字符集中的段id，一个字符集可以包含多个段*/
        public var segementId: Int32,
        /** 段的起始字符*/
        public var fromChar: Rune,
        /** 段的结尾字符*/
        public var toChar: Rune
    ) {
        
    }
}