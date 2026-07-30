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
String error = null;
 error = request.getParameter("error");
%>
  <div class="min-h-screen flex justify-center items-center" >
  <form class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg" action="adduser.jsp" method="post">
  <h1 class="text-center">Create Account</h1>
    <div class="p-3">
    <label for="name" class="block text-gray-700 font-medium mb-2" >Full Name</label>
    <input type="text" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"  id="name"   name="fullname">
  </div>
  <div class="p-3">
    <label for="emailphone" class="block text-gray-700 font-medium mb-2" >Email/Phone</label>
    <input type="text" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="emailphone"    name="emailorphone"  >
  </div>
  <div class="p-3">
    <label for="pass" class="block text-gray-700 font-medium mb-2" name="password">Password</label>
    <input type="password" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="pass"  name="password">
  </div>
  
            <button
              type="submit"  class="p-5 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition duration-300" >
                Create Account
            </button> <p>Already have an account <a href="Login.jsp" class="text-sky-600">Sign up</a></p>
               <p class="text-red-500">   <%= error == null ? "" : error %></p>
  </form>

</div>
</body>
</html>