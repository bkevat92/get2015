trigger LoanStatusMail on Loan__c (after update) {
    
    for(Loan__c lnNew :Trigger.new)
    {
        Loan__c lnOld = Trigger.oldMap.get(lnNew.id);
        if(lnNew.Status__c != lnOld.Status__c)
        {     
              String msg = 'Your Loan Status is '+lnNew.Status__c;
              Messaging.Singleemailmessage mail = new Messaging.Singleemailmessage();
              mail.setPlainTextBody(msg);
              mail.setToAddresses(new String[]{lnNew.Applicant_Email__c});
              mail.setSubject('Loan Status');
              Messaging.sendEmail(new Messaging.Singleemailmessage[] { mail});
        }
    }
}