public class ClassManageController {
    
    public String idOfActionRecord {get;set;}
    public boolean isEditor {get; set;} 
    public Class__c actionRecord { get; private set; }
    
    
    public String thisClass {get; set;}
   
    public ClassManageController(ApexPages.StandardController controller) { }
    
    public List<Class__C> getRecords() 
    { 
        String queryString = 'SELECT Id, Name, fee__c, board__c FROM Class__c ';
        return Database.query(queryString);
    }
    
    public void saveChanges() {  
        isEditor = false;
        update actionRecord;  
    }  
    
    public void deleteRecord() { 
        actionRecord = [SELECT id,Name,fee__C FROM Class__c WHERE id = :idOfActionRecord];
        delete actionRecord;
    }  
   
    public void getFieldToEdit() { 
        actionRecord = [SELECT id, Name, fee__c,board__C FROM Class__c WHERE id = :idOfActionRecord];
        isEditor = true;    
    }    
}