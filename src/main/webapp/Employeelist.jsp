<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.Dao"%>
<%@page import="com.demo.employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.tailwindcss.com"></script>
<title>Insert title here</title>
</head>
<body class="text-center items-center bg-white-300">
 <%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Navbar.jsp"></jsp:include>
<h2 class="text-xl font-bold text-gray-800">Employee Details</h2>
<div class="flex gap-2 py-10 px-4">
 
 
 




<%

       List<employee>list = Dao.reademp();
      request.setAttribute("list", list);

%>


  
  <c:forEach items="${list}" var="e">
  
 <div class="max-w-md mx-2 rounded-lg shadow-lg border border-gray-200 hover:shadow-xl transition duration-300">

    <div class="flex justify-between rounded-tl-lg rounded-tr-lg items-center mb-3 border border-blue-500">
         
        <button class="text-blue-500 rounded-tl-lg px-4 py-2 border-r-2 border-blue-500   font-medium transition">
      <a href="editempform.jsp?id=${e.getEmp_id()}">Edit</a>      
        </button>

        <button class="text-blue-500  px-4 py-2 rounded-tr-lg border-l-1 border-blue-500 font-medium transition">
            <a href="Delete.jsp?id=${e.getEmp_id()}">remove</a>      
        </button>
    
       
    </div>
 <span class="bg-blue-100 text-blue-700 px-3 py-1 rounded-full text-sm font-semibold">
            ID: ${e.getEmp_id()}
        </span>
    <div class="space-y-3">

        <div>
         
            <p class="font-semibold text-gray-800 "> ${e.getEmp_name()}</p>
        </div>

        <div>
         
            <p class="font-semibold text-gray-800"> ${e.getEmp_depart()}</p>
        </div>

        <div>
            <p class="text-blue-500 text-sm"> Task: ${e.getTask_name()}</p>
            
        </div>

        <div>
         
                    <c:if test="${e.getStatus_of_task() == 'Not Started'}">
      <span class="inline-block bg-sky-200 text-sky-700 px-3 py-1 rounded-full text-sm font-medium">
               Not Started
            </span>
         </c:if>
         
           <c:if test="${e.getStatus_of_task() == 'Ongoing'}">
      <span class="inline-block bg-orange-300 text-orange-700 px-3 py-1 rounded-full text-sm font-medium">
               Ongoing
            </span>
</c:if>

<c:if test="${e.getStatus_of_task() == 'Completed'}">
    <span class="inline-block bg-green-100 text-green-700 px-3 py-1 rounded-full text-sm font-medium">
                Completed
            </span>
</c:if>
         
         
         
         
         
         
         
            
        </div>
 
 
     <c:if test="${e.getStatus_of_task() == 'Ongoing'}">
    <span class="w-full bg-white-600 rounded-bl-lg rounded-br-lg text-orange-600">Assigned !</span>
</c:if>

<c:if test="${e.getStatus_of_task() == 'Completed' || e.getStatus_of_task() == 'Not Started'  }">
    <Button class="w-full bg-sky-600 rounded-bl-lg rounded-br-lg text-yellow-200"><a href="Assigntask.jsp?eid=${e.getEmp_id()}" >Assign Task</a> </Button>
</c:if>
 
 
 
 
 
 
 
 
      
 
    </div>

   

</div>
 
  </c:forEach> 
   
    
</div>

<div class="min-h-screen flex flex-col justify-center items-center">

<div class="w-full max-w-md rounded-lg bg-gray-200 text-center px-30 py-8">
<h2>Add employee</h2>
<button class="px-3 py-2 font-20 bg-gray-100 mt-3 rounded-lg" ><a href="Employeeform.jsp" >+</a></button>

</div>


</div>

</body>
</html>