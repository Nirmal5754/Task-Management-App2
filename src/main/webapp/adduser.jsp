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

<jsp:useBean id="u" class="com.demo.user" />

<jsp:setProperty property="*" name="u"/>

<%
out.print(u);
int s = Dao.Saveusers(u);
if(s > 0){
	response.sendRedirect("Login.jsp");

}
else{
	response.sendRedirect("Register.jsp?error="+"Something went wrong please try again later !");
}



%>



</body>
</html>