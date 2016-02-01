public class OpportunityUtility {
   public static void updateManagerField(List<Opportunity> opptyList)
   {
       for(Opportunity oppty : opptyList)
           
        {     
          
           if(String.isBlank(oppty.Manager__c) && !String.isBlank(oppty.BillToContact__c) )
           {
               Contact cnt = [select Account.Id from Contact where id =: oppty.BillToContact__c];
               System.debug('cnt' + cnt.Account.Id);
               Account acc = [select Id from Account where Id =:cnt.AccountId];
               //Account acc = [select Id from Account where Id =:cnt.Account.Id];
               oppty.Manager__c = acc.Id;
                
               // System.debug(oppty.BillToContact__r.AccountId);
               // oppty.Manager__c = [SELECT Id FROM Account WHERE id =: oppty.BillToContact__r.AccountId].Id;
               //  System.debug('Manager id: '+oppty.Manager__r.id);
         
           }
       }
   }
}