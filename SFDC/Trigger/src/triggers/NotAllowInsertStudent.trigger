trigger NotAllowInsertStudent on Student__c (before insert) {
   for(Student__c std : Trigger.new)
    {
        Class__c stdClass = [SELECT MaxSize__c,Number_Of_Students__c FROM Class__c WHERE Id=:std.Class__c LIMIT 1];
        if(stdClass.MaxSize__c <= stdClass.Number_Of_Students__c)
        {
            std.addError('No more seat in selected class');
        }
    }
}