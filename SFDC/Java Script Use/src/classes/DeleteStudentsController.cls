public class DeleteStudentsController {
    public List<Student__c> studentList {set ; get;}
    Set<ID> idSet{set;get;}
    public Integer size{set ; get;}
    public DeleteStudentsController(ApexPages.StandardSetController controller) {
        if(idSet == null) {
            idSet = new Set<Id>();
        }
        List<Student__c> stdList = controller.getSelected();
        for(Student__c std : stdList) {
            idSet.add(std.ID);
        }
        size=0;
        size = stdList.size();
        studentList = [select ID,Name,Class__C from Student__c where ID IN : idSet];
    }
    public void deleteAll() {
        Database.delete(studentList);
    }
    
    public void showMessage() {
     System.debug('sfksjhf');  
     ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, 'No record selected'));
   
    }
}