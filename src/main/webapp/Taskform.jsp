<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.demo.Dao"%>
    <%@page import="com.demo.task"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Connection"%>
 
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
  <script src="https://cdn.tailwindcss.com"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>

<jsp:useBean id="t" class="com.demo.task" />

<jsp:setProperty property="*" name="t"/>

<%
int error = 0;
int status = 0;


if(request.getMethod().equalsIgnoreCase("POST")){
	
	try{
		Connection con = null;


		con = Dao.getconnection();
	PreparedStatement p2 = con.prepareStatement("insert into tasks (task_name) values( ? ) ");
	p2.setString(1, t.getTask_name());

	status  = p2.executeUpdate();
	  if(status > 0){
		  
		  response.sendRedirect("Tasklist.jsp");
		  
	  }
	  
	  else{	
		  error = 1;
		  RequestDispatcher rd = request.getRequestDispatcher("Taskform.jsp");
		  rd.include(request, response);
	
	  }


	}

	catch (Exception e1) {
		// TODO: handle exception
		e1.printStackTrace();
	}
	
	
	
}




%>


 <div class ="min-h-screen w-full h-full flex items-center justify-center bg-gradient-to-br from-indigo-200 via-indigo-400 to-indigo-700 ">
         <form class="w-full justify-center rounded-lg max-w-md bg-white/20 backdrop-blur-lg mt-4 rounded-2x1 shadow-xl p-8" action="Taskform.jsp" method="post">
<h1 class="font-bold text-white-400 mb-4">Add tasks</h1>
<label class="font-semibold mb-4 mt-4"> Task Name :</label>
        <input type="text" class ="flex-col mb-4 mt-4" name="task_name"  /> <br />
      
  <button class="btn bg-blue-200 py-2 px-4 mt-4 rounded font-semibold" type="submit">Add</button>
   <p class="text-red-500"><%= error ==  0 ?  "" : "Something went wrong please try again later!"  %></p>
      </form>
    </div>
</body>
</html>