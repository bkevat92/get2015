@isTest
public class TestNotAllowInsertStudent {
@isTest
    public static void test11()
    {   
        Class__c cls = new Class__c();
        cls.Name__c ='tempClass';
        cls.MaxSize__c =1;
        insert cls;
        
        Student__c std = new Student__c();
        std.Last_Name__c = 'xyz';
        std.Email__c = 'xyz123@hfh.com';
        
        Student__c std1 = new Student__c();
        std1.Last_Name__c = 'xyz1';
        std1.Email__c = 'xy1z123@hfh.com';
        
        std.Class__c = cls.id;
        std1.Class__c = cls.id;
 
        insert std;
       
        
        Test.startTest();
        Database.SaveResult svrslt = Database.insert(std1);
        Test.stopTest();
        System.assert(!svrslt.isSuccess());
        System.assert(svrslt.getErrors().size() > 0);
        System.assertEquals('No more seat in selected class', svrslt.getErrors()[0].getMessage());

    }
}