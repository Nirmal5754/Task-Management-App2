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
<jsp:include page="Navbar.jsp"></jsp:include>


<form class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg" action="addemp.jsp" method="post">
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
                Create ID-Card
            </button>
  </form>
</body>
</html>