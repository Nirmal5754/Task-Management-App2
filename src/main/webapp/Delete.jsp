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
<%

int id = Integer.parseInt(request.getParameter("id")); 
out.print(id); 
int st = Dao.deletemp(id);
out.print(st);
if(st > 0)
{
	response.sendRedirect("Employeelist.jsp");
}
else{
	out.print("some thing went wrong");
}

%>


</body>
</html>