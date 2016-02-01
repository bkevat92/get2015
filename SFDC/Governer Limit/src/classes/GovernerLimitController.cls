public class GovernerLimitController {
    public List<Account> accList{get;set;}
    public List<Account> accList1{get;set;}
    public GovernerLimitController(ApexPages.StandardController controller)
    {
        accList = [SELECT id, Name FROM Account LIMIT 10];
    }
    public void updateFunction()
    {   accList = [SELECT id, Name FROM Account LIMIT 10];
        for(Account acc1:accList)
        { accList1 = [SELECT id, Name FROM Account LIMIT 10];
            acc1.Name = acc1.Name;
        }
        update accList;
      Integer a = Limits.getQueries();
      Integer b =limits.getLimitQueries();
      Integer c = a*100/b;
           System.debug( c +'% DML Consume' );
    }
}