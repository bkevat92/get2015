@isTest
public class TestDateUtility {
  @isTest
    public static void test1()
    {
        Date d1 = date.newInstance(2016, 3, 1);
        Date d2 = date.newInstance(2016, 3, 14);
        System.assertEquals(8, DateUtility.workingdaysBetween(d1,d2));
        
    }
     @isTest
    public static void test2()
    {
        Date d1 = date.newInstance(2016, 3, 1);
        Date d2 = date.newInstance(2013, 3, 14);
        System.assertNotEquals(5, DateUtility.workingdaysBetween(d1,d2));
        
    }
}