<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Form</title>
</head>
<body>
  <form action="registration" method="get"> 
  <table> 
     <tr> <td>Name :</td><td><input type="text" name="name"/> </td> </tr>  
     <tr> <td>User Name :</td><td><input type="text" name="username"/></td> </tr>  
     <tr> <td>E-Mail Id :</td><td><input type="text" name="email"/></td> </tr>  
     <tr> <td>Password :</td><td><input type="password" name="password"/></td> </tr>  
    </table>   
    <input type="submit" value="register"/>  
</form>  
</body>
</html>