import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sforce.soap.enterprise.LoginResult;
import com.sforce.soap.enterprise.SessionHeader;
import com.sforce.soap.enterprise.SforceServiceLocator;
import com.sforce.soap.enterprise.SoapBindingStub;
import com.sforce.soap.schemas._class.MyFirstWebservice.MyFirstWebserviceBindingStub;
import com.sforce.soap.schemas._class.MyFirstWebservice.MyFirstWebserviceServiceLocator;


public class ContactAndStudentUtility{
public static void main(String[] args){
System.out.println("start of program");
try 
    {  //Get a stub for calling enterprise WSDL's login method in order to get SessionID
     SoapBindingStub bind= (SoapBindingStub)new SforceServiceLocator().getSoap();
     LoginResult lr=bind.login("bkevat92@metacube.com", "Lalita_2005mNY7OZZFF31BKpITbveOHC90");

     //Create a sessionHeader object and set its sessioId property to sessionId 
     //received in loginResult object                        
     SessionHeader sh=new SessionHeader();
     sh.setSessionId(lr.getSessionId());

     //Create a service locator object for your custom web service
     MyFirstWebserviceServiceLocator locator=new MyFirstWebserviceServiceLocator();
     
     //Get URL for your custom web service
     URL url=new URL(locator.getMyFirstWebserviceAddress());

     //Create a stub for your custom web service with URL for your service and locator as parameters
     MyFirstWebserviceBindingStub stub=new MyFirstWebserviceBindingStub(url, locator);
    
     //Set the header property of stub with name "SessionHeader" and value as sh-sessionHeader 
     //object created above 
     stub.setHeader(locator.getMyFirstWebserviceAddress(), "SessionHeader", sh);

     //now make call to custom service-in our case its "Hello(String name)"
     System.out.println(stub.queryForContact("Select Name From Contact"));
     String inputStr = "11-11-2012";
     DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
     Date inputDate = dateFormat.parse(inputStr);
     System.out.println(inputDate);
     System.out.println(stub.createNewStudent("WebServiceStudent1", "a0A28000005LE50", "Female",inputDate));
    }

 catch (Exception e) 
 {e.printStackTrace(); }  
}}