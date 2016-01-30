public with sharing class Pagination_min{
  
    Public Integer noOfRecords{get; set;}
    Public Integer size{get;set;}
    public String billingCity{get;set;}
    public String billingState{get;set;}
    public String billingCountry{get;set;}
    public ApexPages.StandardSetController setCon {get;set;}   
   
    Public List<Account> getAccounts()
    {
        if(setCon==null)
            return null;
        return (List<Account>)setCon.getRecords();  
    }
    public String getQuery() 
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
        return queryString;
    }
    
    public void search() {
        size = 2;
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator(getQuery()));
        setCon.setPageSize(size);
        noOfRecords = setCon.getResultSize();
    }
    
    
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
        set;
    }
    
    public Integer pageNumber {
       get {
               return setCon.getPageNumber();
           }
        set;
    }
    public void first()
    {
        setCon.first();
    }
    public void last()
    {
        setCon.last();
    }
    public void previous() 
    {
        setCon.previous();
    }
    public void next() 
    {
        setCon.next();
    }
}