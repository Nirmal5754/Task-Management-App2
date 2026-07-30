<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="com.demo.Dao"%>
      <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
    <%@page import="com.demo.task"%>
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
<jsp:include page="Navbar.jsp"></jsp:include>
 <%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%

String eidParam = request.getParameter("eid");

String tidParam = request.getParameter("tid");

int asid = 0;
int error = 0;
int taskid = 0;

if (eidParam != null) {
    asid = Integer.parseInt(eidParam);
}



if (tidParam != null) {
    taskid = Integer.parseInt(tidParam);
}



	Connection con = null;
	List<task>tlist = new ArrayList<task>();
	

try {
	
con = Dao.getconnection();





PreparedStatement p2 = con.prepareStatement("select task_id , task_name from tasks where status_of_task = ? or status_of_task = ? ");

p2.setString(1,"Not Started");
p2.setString(2,"Completed");
	ResultSet rs = p2.executeQuery();
while(rs.next()) {
	
task t = new task();
  t.setTask_id( rs.getInt(1));
  t.setTask_name(rs.getString(2));
tlist.add(t); 
	
}
request.setAttribute("tlist", tlist);

if ("POST".equalsIgnoreCase(request.getMethod())) {

PreparedStatement em1 = con.prepareStatement("select emp_name  from employees where emp_id = ? ");
em1.setInt(1,asid); 

ResultSet empname = em1.executeQuery();

PreparedStatement tn1 = con.prepareStatement("select task_name  from tasks where task_id = ? ");
tn1.setInt(1,taskid); 
ResultSet taskname = tn1.executeQuery();



PreparedStatement upe = con.prepareStatement("update employees set task_name = ? , status_of_task = ? where emp_id = ? ");
String taskName = "";

if (taskname.next()) {
    taskName = taskname.getString("task_name");
}

upe.setString(1, taskName);
upe.setString(2,"Ongoing");
upe.setInt(3,asid); 
int estatus = upe.executeUpdate();

PreparedStatement upt = con.prepareStatement("update tasks set employee_name = ? , status_of_task = ? , emp_id = ?  where task_id = ? ");
String empName = "";

if (empname.next()) {
    empName = empname.getString("emp_name");
}

upt.setString(1, empName);
upt.setString(2,"Ongoing");
upt.setInt(3,asid); 
upt.setInt(4,taskid); 
int tstatus = upt.executeUpdate();


if(tstatus > 0 && estatus > 0){
	response.sendRedirect("Employeelist.jsp"); return;
}
else{
	error = 1;
	response.sendRedirect("Assigntask.jsp?eid=" + asid);
	return;
	
}
}
	
	
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();
}
	
	



%>




<div class="min-h-screen w-full h-full flex items-center justify-center bg-gradient-to-br from-indigo-200 via-indigo-400 to-indigo-700 ">
        <form  class="w-full rounded-lg items-center max-w-md bg-white/20 backdrop-blur-lg mt-4 rounded-2x1 shadow-xl p-8" action="Assigntask.jsp" method="post"  > 
            
             <label for="" class="mt-8 font-semibold">Select a Task from above list </label> <br />
             <input type="hidden" name="eid" value="<%= asid %>">
        <select class="mt-4 font-semibold text-green-900 bg-red-200 rounded-lg px-5" name="tid"  >
                   <option class="text-pink-700">Select Task </option>
        <c:forEach items="${tlist}" var="t">
        
           <option class="text-pink-700"  value="${t.getTask_id()}">${t.getTask_name()}</option>
        
        </c:forEach>
         

            </select> <br />
            <button class="btn bg-pink-200 px-3 mt-8 rounded-lg text-white-100 font-bold shadow-md" type="submit"  >Assign Task</button> 
             <p class="text-red-500"><%= error ==  0 ?  "" : "Something went wrong please try again later!"  %></p>
            </form>
       
    </div>
</body>
</html>