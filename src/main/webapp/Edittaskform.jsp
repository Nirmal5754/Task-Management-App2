<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@page import="com.demo.Dao"%>
       <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.ResultSet"%>
    <script src="https://cdn.tailwindcss.com"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




 <jsp:include page="Navbar.jsp"></jsp:include>

<%
int tid = 0;
int signal = 0;
String sig = request.getParameter("st");
if(sig != null){
	signal = Integer.parseInt(sig);
}


String taskname = request.getParameter("task_name"); 
String statusoft = request.getParameter("status_of_task"); 
String tids = request.getParameter("ide"); 
Connection con = null;
String tname2 = "";
String statusof2 = "";
try{ 
	con = Dao.getconnection();
	
	
	
if(tids != null){
	tid = Integer.parseInt(tids);	
}
PreparedStatement ptda  =  con.prepareStatement( "select task_name , status_of_task from tasks where task_id = ? " );
ptda.setInt(1, tid); 

ResultSet tdata = ptda.executeQuery();

if (tdata.next()) {
     tname2 = tdata.getString("task_name");   
     statusof2 = tdata.getString("status_of_task"); 
}

if(signal > 0){
	
	PreparedStatement ptu  =  con.prepareStatement( "update  tasks set task_name = ? , status_of_task = ?  where task_id = ? " );
	
	
	PreparedStatement peu  =  con.prepareStatement( "update  employees set task_name = ? , status_of_task = ?  where emp_id = ? " );
	PreparedStatement peid  =  con.prepareStatement( "select emp_id from tasks where task_id = ? " );
	

	
	
	peid.setInt(1, tid);
	ResultSet rsn = peid.executeQuery();

	int empid3 = 0;
	if (rsn.next()) {
	     empid3 = rsn.getInt("emp_id");   
	}
	peu.setString(1, taskname);
	peu.setString(2, statusoft);
	peu.setInt(3, empid3);
	
		ptu.setString(1, taskname);
	ptu.setString(2, statusoft);
	ptu.setInt(3, tid);
	
	int stptu = ptu.executeUpdate();
	
int stpeu = peu.executeUpdate();

out.print("task update "+stptu+" ");   
out.print("emp update "+stpeu);   



if(stptu > 0 && stpeu > 0){
	
	response.sendRedirect("Tasklist.jsp");
	return;
	
}
else{
	
	out.print("something went wrong");
	
}
	
	
	
	
	
}

}
catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();

	
}






%>





<h1>Update task </h1>
<form class="w-full max-w-md bg-white p-8 rounded-lg shadow-lg" action="Edittaskform.jsp?st=5&ide=<%=tid%>" method="post">
 
    <div class="p-3">
    <label for="tname" class="block text-gray-700 font-medium mb-2" >Task Name</label>
    <input type="text" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"  id="tname" value=<%=tname2%>   name="task_name">
  </div>
 
  <div class="p-3">
    <label for="statusoft" class="block text-gray-700 font-medium mb-2" >Status of task</label>
    <input type="text" class="w-full border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" id="statusoft" value=<%=statusof2%> name="status_of_task">
  </div>
  
            <button
              type="submit"   class="p-5 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-lg transition duration-300" >
               Update Task
            </button>
  </form>


</body>
</html>