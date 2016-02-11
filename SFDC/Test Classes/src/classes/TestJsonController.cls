@isTest
public class TestJsonController {
  @isTest 
    public static void test11()
    {
         List<Account> accList = Database.query('select Id,Name from Account');
         String expected = JSON.serialize(accList);
        System.assertEquals(expected, new JsonController().preparedData());
    }
   
}