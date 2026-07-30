<%@page import="com.oracle.wls.shaded.org.apache.xalan.transformer.ResultNameSpace"%>
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




	Connection con = null;
	List<task>tlist = new ArrayList<task >();

			
		
		int error = 0;		
			
	
	
try {
	con = Dao.getconnection();

	
	
	int	delid = 0;
	String  iddel = request.getParameter("idd");
	
	if(iddel != null){
	delid =	Integer.parseInt(iddel);
		
	}
	
	

	
	if(delid > 0){
		
		PreparedStatement pdel  =  con.prepareStatement("delete from tasks where task_id = ? ");
		PreparedStatement pemp  =  con.prepareStatement("select emp_id from tasks where task_id = ?");
		pdel.setInt(1, delid);
		pemp.setInt(1, delid);
		ResultSet rsn = pemp.executeQuery();

		int empid2 = 0;
		if (rsn.next()) {
		     empid2 = rsn.getInt("emp_id");   
		}
		
		PreparedStatement edel  =  con.prepareStatement("update employees set task_name = ? , status_of_task = ? where emp_id = ? ");
		edel.setString(1, "Not Assigned");
		edel.setString(2, "Not Started");
		edel.setInt(3, empid2);
		
		int stdele = edel.executeUpdate();
		
	int stdelt = 	pdel.executeUpdate();
	
	
	if(stdelt > 0 && stdele > 0){
		
		response.sendRedirect("Tasklist.jsp");
		return;
		
	}
	else{
		response.sendRedirect("Tasklist.jsp");
		out.print("something went wrong");
		
	}
		
	}
	
	
	
	

	int	markc2 = 0;
	String  markc = request.getParameter("mark");
	
	if(markc != null){
	markc2 =	Integer.parseInt(markc);
		
	}
	
	
	int	markp2 = 0;
	String  markp = request.getParameter("merk");
	
	if(markp != null){
	markp2 =	Integer.parseInt(markp);
		
	}
	
	
	
	


PreparedStatement ps = con.prepareStatement(
	    "SELECT emp_id FROM tasks WHERE task_id=?");

	ps.setInt(1, markc2);

	ResultSet rs1 = ps.executeQuery();

	int empId = 0;

	if(rs1.next()){
	    empId = rs1.getInt("emp_id");
	}

	PreparedStatement ps2 = con.prepareStatement(
		    "SELECT emp_id FROM tasks WHERE task_id=?");

		ps2.setInt(1, markp2);

		ResultSet rs2 = ps2.executeQuery();

		int empId2 = 0;

		if (rs2.next()) {
		    empId2 = rs2.getInt("emp_id");
		}





PreparedStatement p2 = con.prepareStatement("select * from tasks");
	ResultSet rs = p2.executeQuery();
while(rs.next()) {
	
	task t =new task();
	t.setTask_id(rs.getInt(1));
	t.setTask_name(rs.getString(2));
	t.setStatus_of_task(rs.getString(3));		
	t.setEmployee_name(rs.getString(4));
	tlist.add(t);
	
	
}
	

	if (markc2 > 0){
	PreparedStatement stut = con.prepareStatement("update tasks set status_of_task = ? where task_id = ? ");
	stut.setString(1,"Completed");
	stut.setInt(2,markc2);
	int statust = stut.executeUpdate();
	
	PreparedStatement stue = con.prepareStatement("update employees  set status_of_task = ? where emp_id = ? ");
	stue.setString(1,"Completed");
	stue.setInt(2, empId);
	int statuse = stue.executeUpdate();
	
	if(statust > 0 && statuse > 0){
		response.sendRedirect("Tasklist.jsp?mark="+0);
		return;
		
	}else{
		error = 1;
		response.sendRedirect("Tasklist.jsp");
		return;
	}

	}
	
	
	
	
	else	if (markp2 > 0){
	PreparedStatement stutp = con.prepareStatement("update tasks set status_of_task = ? where task_id = ? ");
	stutp.setString(1,"Ongoing");
	stutp.setInt(2,markp2);
	int statustp = stutp.executeUpdate();
	
	PreparedStatement stup = con.prepareStatement("update employees set status_of_task = ? where emp_id = ? ");
	stup.setString(1,"Ongoing");
	stup.setInt(2, empId2);
	int statusp = stup.executeUpdate();
	
	if(statustp > 0 && statusp > 0){
		response.sendRedirect("Tasklist.jsp?merk="+0);
	}  
	else{
		error = 1;
		response.sendRedirect("Tasklist.jsp");
	}

	} 
	
	
	

	
	
	
} catch (Exception e) {
	// TODO: handle exception
	e.printStackTrace();

	
}
request.setAttribute("tlist", tlist);



%>

    <div class="mx-4 px-4">
    
   <h1 class="text-5 my-10 min-w-screen text-center fw-10">Tasks</h1>
   
    <div class="flex gap-5">
       <c:forEach items="${tlist}" var="t">
  
          <div class="px-4 mt-4 bg-gradient-to-br from-indigo-200 via-indigo-400 to-indigo-700 px-6 pt-6 pb-2 rounded-lg shadow-lg">
           <div class="flex justify-between items-center mb-3">
         
        <button class="bg-yellow-500 hover:bg-yellow-600 mr-2 text-white px-2 py-2 rounded-lg font-medium transition">
      <a href="Edittaskform.jsp?ide=${t.getTask_id()}">Edit</a>      
        </button>

        <button class="bg-red-500 hover:bg-red-600 ml-2 text-white ml-2 px-2 py-2 rounded-lg font-medium transition">
            <a href="Tasklist.jsp?idd=${t.getTask_id()}">Delete</a>      
        </button>
    
       
    </div>
            <h3 class="font-semibold mt-4"><span class="text-emerald-200">${t.task_name}</span></h3>
            
         <c:if test="${t.status_of_task == 'Ongoing'}">
    <button class="btn bg-green-500 mt-4 font-semibold px-2 py-3 text-white rounded-lg"  >
   <a href="Tasklist.jsp?mark=${t.task_id}"> Mark as Completed</a>    
    </button>
</c:if>

<c:if test="${t.status_of_task == 'Completed'}">
    <button class="btn bg-red-500 mt-4 font-semibold px-2 py-3 text-white rounded-lg">
       <a href="Tasklist.jsp?merk=${t.task_id}"> Mark as Pending</a>    
    </button>
</c:if>
  <h3 class="mt-4 text-sm text-white rounded-lg w-30 p-1 font-semibold"  >Held by ${t.employee_name}</h3>


            <h3 class="mt-4 text-sm text-white rounded-lg w-30 p-1 font-semibold"  >${t.status_of_task}</h3>
          </div>
     
    
    </c:forEach>
         <p class="text-red-500"><%=error ==  0 ?  "" : "Something went wrong please try again later!"  %></p>
    
    </div>  <button class="justify-center bg-blue-700 text-white p-4 rounded-lg mt-4 font-bold"><a  href="Taskform.jsp" >Add more tasks</a></button>
    </div>
    
    
</body>
</html>