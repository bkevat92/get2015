@isTest
public class TestStack {
    
@isTest
    public static void test11()
    {
        Stack stk = new Stack();
        System.assert(stk.isEmty());
    }
    @isTest
    public static void test12()
    {
        Stack stk = new Stack();
        stk.push(12);
        System.assert(stk.isEmty() != true);
    }
    @isTest
    public static void test13()
    {
        Stack stk = new Stack();
        stk.push(12);
        Integer res = stk.pop();
        System.assertEquals(12,res);
    }
    @isTest
    public static void test14()
    {
        Stack stk = new Stack();
        stk.push(11);
        System.assertEquals(11,stk.peek());
        System.assert(stk.size() != 0);
    }
}