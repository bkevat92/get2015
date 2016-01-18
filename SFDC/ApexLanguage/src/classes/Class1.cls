public class Class1 {
public static List<Student__c> getStudentList(String classId)
 {
     return [SELECT Name From Student__c where Class__r.Id =: classId];
 }
    
  public static Map<Class__c,List<Student__c>> getAllClassesWithStudentList()
  {
      Map<Class__c,List<Student__c>> m1 = new Map<Class__c,List<Student__c>>();
      for(Class__c cls : [SELECT Name FROM Class__c])
      {
          m1.put(cls, [SELECT Name From Student__c where Class__r.Id =: cls.Id]);
      }
      return m1;
  }
}