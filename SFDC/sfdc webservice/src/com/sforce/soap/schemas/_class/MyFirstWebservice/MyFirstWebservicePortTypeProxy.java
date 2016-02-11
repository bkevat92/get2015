package com.sforce.soap.schemas._class.MyFirstWebservice;

public class MyFirstWebservicePortTypeProxy implements com.sforce.soap.schemas._class.MyFirstWebservice.MyFirstWebservicePortType {
  private String _endpoint = null;
  private com.sforce.soap.schemas._class.MyFirstWebservice.MyFirstWebservicePortType myFirstWebservicePortType = null;
  
  public MyFirstWebservicePortTypeProxy() {
    _initMyFirstWebservicePortTypeProxy();
  }
  
  public MyFirstWebservicePortTypeProxy(String endpoint) {
    _endpoint = endpoint;
    _initMyFirstWebservicePortTypeProxy();
  }
  
  private void _initMyFirstWebservicePortTypeProxy() {
    try {
      myFirstWebservicePortType = (new com.sforce.soap.schemas._class.MyFirstWebservice.MyFirstWebserviceServiceLocator()).getMyFirstWebservice();
      if (myFirstWebservicePortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)myFirstWebservicePortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)myFirstWebservicePortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (myFirstWebservicePortType != null)
      ((javax.xml.rpc.Stub)myFirstWebservicePortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public com.sforce.soap.schemas._class.MyFirstWebservice.MyFirstWebservicePortType getMyFirstWebservicePortType() {
    if (myFirstWebservicePortType == null)
      _initMyFirstWebservicePortTypeProxy();
    return myFirstWebservicePortType;
  }
  
  public java.lang.String createNewStudent(java.lang.String name, java.lang.String classId, java.lang.String sex, java.util.Date dob) throws java.rmi.RemoteException{
    if (myFirstWebservicePortType == null)
      _initMyFirstWebservicePortTypeProxy();
    return myFirstWebservicePortType.createNewStudent(name, classId, sex, dob);
  }
  
  public java.lang.String queryForContact(java.lang.String query) throws java.rmi.RemoteException{
    if (myFirstWebservicePortType == null)
      _initMyFirstWebservicePortTypeProxy();
    return myFirstWebservicePortType.queryForContact(query);
  }
  
  
}