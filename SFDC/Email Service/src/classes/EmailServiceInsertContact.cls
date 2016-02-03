global class EmailServiceInsertContact implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope envelope)
    {   
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        String xmlString = email.textAttachments[0].body;
        List<Contact> cntList = new List<Contact>();
        
        Dom.Document dcmnt = new Dom.Document();
        dcmnt.load(xmlString);
        for(DOM.XMLNode xmlContact : dcmnt.getRootElement().getChildElements())
        {
            Contact contact = new Contact();
            
            String firstName = xmlContact.getChildElement('fname', null).getText();
            String lastName = xmlContact.getChildElement('lname', null).getText();
            contact.firstName = firstName;
            contact.lastName = lastName;
            cntList.add(contact);            
        }
        insert cntList;
        system.debug(cntList);
        return result;
    } 
}