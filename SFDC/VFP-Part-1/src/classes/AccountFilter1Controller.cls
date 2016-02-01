public class AccountFilter1Controller {
   public String billingCity{get;set;}
   public String billingState{get;set;}
   public String billingCountry{get;set;}
   public List<Account> accountList {get;set;}
    
    public PageReference getFilteredAccounts()
    {  
        String queryString = 'SELECT Name,BillingCity From Account';
        boolean whereFlag = true;
        boolean andFlag = false;
         if(String.isNotBlank(billingCity))
                 {  
                     if(whereFlag) 
                     {
                         queryString +=  ' WHERE';
                         whereFlag = false;
                     }
                     if(andFlag)
                  {
                       queryString +=  ' AND';
                  }
                     queryString += ' BillingCity=:billingCity';
                  
                  andFlag =true;
         }
         if(String.isNotBlank(billingState))
             {  
                 if(whereFlag) 
                     {
                         queryString +=  ' WHERE';
                         whereFlag = false;
                     }
                 if(andFlag)
                  {
                       queryString +=  ' AND';
                  }
                   
                    queryString += ' BillingState=:billingState';
                   
                  andFlag =true;
                    
         }
         if(String.isNotBlank(billingCountry))
         {  
                     if(whereFlag) 
                     {
                         queryString +=  ' WHERE ';
                         whereFlag = false;
                     }
                    if(andFlag)
                  {
                       queryString +=  ' AND';
                  }
                     queryString += ' BillingCountry=:billingCountry';
                   
                  andFlag =true;
         }
        System.debug(queryString);
        accountList = Database.query(queryString);
        return null;
    }
    
    
}