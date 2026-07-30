<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.demo.Dao"%>
    <%@page import="com.demo.employee"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.ResultSet"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>


<jsp:useBean id="u" class="com.demo.user" />

<jsp:setProperty property="*" name="u"/>

<%
int error = 0;

if(request.getMethod().equalsIgnoreCase("POST")){
	
	try{
		Connection con = null;


		con = Dao.getconnection();
	PreparedStatement p2 = con.prepareStatement("select * from users where emailorphone = ? and password = ? ");
	p2.setString( 1 , u.getEmailorphone() );
	p2.setString( 2, u.getPassword() );
	ResultSet rs = p2.executeQuery();
	  if(rs.next()){
		    session.setAttribute("fullname", rs.getString(2));
		  response.sendRedirect("Home.jsp");
	  }
	  else{
		error = 1;
	  }


	}

	catch (Exception e1) {
		// TODO: handle exception
		e1.printStackTrace();
	}
	
	
	
}




%>
  <div class="min-h-screen flex justify-center items-center" >
  <form class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg" action="Login.jsp" method="post" >
  <h1 class="text-center">Sign up</h1>
  <div class="p-3">
    <label for="emailphone" class="block text-gray-700 font-medium mb-2" >Email/Phone</label>
    <input type="text" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="emailphone"    name="emailorphone"  >
  </div>
  <div class="p-3">
    <label for="pass" class="block text-gray-700 font-medium mb-2" name="password">Password</label>
    <input type="password" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="pass"  name="password">
  </div>
  
            <button
              type="submit"  class="px-3 py-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition duration-300" >
               Login
            </button>
            <p class="text-red-500"><%= error ==  0 ?  "" : "Invalid Email/Phone or Password"  %></p>
            
  </form>

</div>


</body>
</html>