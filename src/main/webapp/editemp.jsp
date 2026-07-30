<%@page import="com.demo.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



   <jsp:useBean id="e" class="com.demo.employee" />

<jsp:setProperty property="*" name="e"/>
  
  
<%

int i = Dao.Update(e);
if(i > 0){
	response.sendRedirect("Employeelist.jsp");
	
}

else{
	out.print("something went wrong");
}

%>



</body>
</html>