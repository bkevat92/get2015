trigger OpportunityStatusMail on Opportunity (after update) {
     for(Opportunity opNew :Trigger.new)
       {
            Opportunity opOld = Trigger.oldMap.get(opNew.id);
            if(opNew.Custom_Status__c != opOld.Custom_Status__c)
                {     
                      Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
                      mail.setTargetObjectId(opNew.OwnerId);
                      mail.setTemplateId('00X28000000JjgQ');
                      mail.setUseSignature(false);
                      mail.setBccSender(false);
                      mail.setSaveAsActivity(false);
                      Messaging.sendEmail(new Messaging.Singleemailmessage[] { mail});
                }
    }
}