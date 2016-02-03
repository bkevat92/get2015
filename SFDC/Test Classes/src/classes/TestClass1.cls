@isTest
public class TestClass1 {
   @isTest
    public static void test11()
    { 
        List<Student__c> studentList = [SELECT Name From Student__c where Class__r.Id = 'a0A28000005Kd4y'] ;
        System.assert( studentList == Class1.getStudentList('a0A28000005Kd4y'));
    }
     @isTest
    public static void test12()
    {
         List<Student__c> studentList = [SELECT Name From Student__c where Class__r.Id = 'a0A28000005LE50'] ;
        System.assertEquals(studentList, Class1.getStudentList('a0A28000005LE50'));
        
    }
     @isTest
    public static void test13()
    {
          Map<Class__c,List<Student__c>> m1 = new Map<Class__c,List<Student__c>>();
          for(Class__c cls : [SELECT Name FROM Class__c])
          {
              m1.put(cls, [SELECT Name From Student__c where Class__r.Id =: cls.Id]);
          }
        System.assertEquals(m1, Class1.getAllClassesWithStudentList());
    }
}