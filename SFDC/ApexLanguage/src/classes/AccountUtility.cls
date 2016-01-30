public class AccountUtility {
   public static void addContactId(String contactID)
   {   
            Contact cntTemp = [SELECT Id,AccountId FROM Contact WHERE id =: contactID LIMIT 1];
            Account contactIdAccount = [SELECT Id,Name FROM Account WHERE Id =: cntTemp.AccountId  LIMIT 1];
            List<Account> accountList = [SELECT Id,ContactIDs__c FROM Account];     
                for(Account acc : accountList)
                   {
                        if(String.isBlank(acc.ContactIDs__c))
                          {
                               List<Contact> listContact = [SELECT Id FROM Contact WHERE Account.id =: acc.id]; 
                               String ids = '';
                               for(Contact cnt:listContact)
                               {
                                   ids = ids+','+cnt.id;
                               }
                               acc.ContactIDs__c = ids;
                               update(acc);
                           } 
                         
                           if(acc.id == contactIdAccount.id && !acc.ContactIDs__c.contains(contactID))
                           {
                                 acc.ContactIDs__c =  acc.ContactIDs__c +','+ contactID;
                                 update(acc);
                            
                           }
                     }
            
       
   }

}