<%@page import="com.demo.Dao"%>
<%@page import="com.demo.employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<%

int id = Integer.parseInt(request.getParameter("id"));

   employee e = Dao.getEmployee(id);

%>



 <jsp:include page="Navbar.jsp"></jsp:include>

<h1>Update Employee ID-Card</h1>
<form class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg" action="editemp.jsp" method="post">
<input type="hidden" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"  id="empid" value=<%=id %>  name="emp_id">
    <div class="p-3">
    <label for="empname" class="block text-gray-700 font-medium mb-2" >Employee Name</label>
    <input type="text" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"  id="empname"   name="emp_name">
  </div>
 
  <div class="p-3">
    <label for="depname" class="block text-gray-700 font-medium mb-2" >Department Name</label>
    <input type="text" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="depname"  name="emp_depart">
  </div>
  
            <button
              type="submit"  class="p-5 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition duration-300" >
                Update ID-Card
            </button>
  </form>




</body>
</html>