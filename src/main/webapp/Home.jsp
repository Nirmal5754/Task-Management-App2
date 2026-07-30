<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Task Management System</title>

<script src="https://cdn.tailwindcss.com"></script>

</head>

<body class="bg-gray-100">



	<jsp:include page="Navbar.jsp"></jsp:include>
	<!-- Welcome Section -->

	<%
	String fullname = (String) session.getAttribute("fullname");
	
	
	
	%>

	<div class="max-w-7xl mx-auto mt-16">

		<div class="bg-white rounded-xl shadow-lg p-10 text-center">

			<h1 class="text-4xl font-bold text-blue-600">
           <input type="hidden" name="fullname" value="<%=fullname%>">
				Welcome <span class="text-gray-800"> <%=fullname == null ? "User" : fullname%>
				</span>

			</h1>

			<p class="text-gray-500 mt-4 text-lg">Task Management Dashboard</p>

		</div>

	</div>

	


		


</body>
</html>