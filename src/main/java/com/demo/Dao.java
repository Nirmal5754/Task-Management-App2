package com.demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dao  {

	
	public static Connection getconnection() throws SQLException {
		
		Connection con =  null;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("All environment variables:");
			System.getenv().forEach((k, v) -> System.out.println(k + " = " + v));
			 con = DriverManager.getConnection(
					    System.getenv("DB_URL"),
					    System.getenv("DB_USER"),
					    System.getenv("DB_PASSWORD")
					);
			System.out.println("connection establish result "+ con);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			
			
			
		}
		
		
		return con;
	}
	
	
	
	public static int SaveDao (employee e1) {
		
		
		
		Connection con = null;
		int status = 0;
		
		try {
			
		con = Dao.getconnection();
		
		PreparedStatement p1 = con.prepareStatement("insert into employees ( emp_name , emp_depart ) values(?,?)");
			p1.setString(1,e1.getEmp_name());
			p1.setString(2,e1.getEmp_depart());
		
		
			 status = p1.executeUpdate();
			 
			 
		} catch (Exception e2) {
			// TODO: handle exception
		e2.printStackTrace();
			
			
		}
			
		return status;
			
	}
	
	
	
	public static List<employee> reademp(){
		
		Connection con = null;
		List<employee>list = new ArrayList<employee>();
		
		
	try {
		
con = Dao.getconnection();
PreparedStatement p2 = con.prepareStatement("select * from employees");
		ResultSet rs = p2.executeQuery();
	while(rs.next()) {
		
		employee e =new employee();
		e.setEmp_id(rs.getInt(1));
	
		e.setEmp_name(rs.getString(2));;
		e.setEmp_depart(rs.getString(3));		
		e.setTask_name(rs.getString(4));
		e.setStatus_of_task(rs.getString(5));
	
		list.add(e);
		
		
	}
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		
		
		
		return list;
		
	}
	
	
	
public static employee getEmployee(int id){
		
		Connection con = null;

			employee e =new employee();
	try {
		
con = Dao.getconnection();
PreparedStatement p2 = con.prepareStatement("select * from emp where id = ?");
p2.setInt(1,id);
		ResultSet rs = p2.executeQuery();
	while(rs.next()) {
		
	
		
		e.setEmp_id(rs.getInt(1)); 
		e.setEmp_name(rs.getString(2));
		e.setEmp_depart(rs.getString(3));		
		e.setTask_name(rs.getString(4));
		e.setStatus_of_task(rs.getString(5)); 
	
		
		
		
	}
		
		
		
	} catch (Exception e1) {
		// TODO: handle exception
		e1.printStackTrace();
	}
		
		
		
		return e;
		
	}



public static int Update(employee e){
	
	Connection con = null;
int statusem = 0; 
int statust = 0; 
int status = 0;
//		employee e =new employee();
try {
	
con = Dao.getconnection();
PreparedStatement p2 = con.prepareStatement("update employees set emp_name = ? , emp_depart = ?  where emp_id= ? ");
   p2.setString(1, e.getEmp_name());
   p2.setString(2, e.getEmp_depart());
   p2.setInt(3, e.getEmp_id());
   
   PreparedStatement p3 = con.prepareStatement("update tasks set employee_name = ?  where emp_id= ? ");
   p3.setString(1, e.getEmp_name());
   
   p3.setInt(2, e.getEmp_id());
   
   
   
	statusem  = p2.executeUpdate();

	statust  = p3.executeUpdate();
	
	if(statusem > 0 && statust > 0) {
		status = 1;
	}
	else {
		status = 0;
	}
	
	
} catch (Exception e1) {
	// TODO: handle exception
	e1.printStackTrace();
}
	
	
	
	return status;
	
}
	
	
	

public static int deletemp(int id){
	
	Connection con = null;
int status = 0;
//		employee e =new employee();
try {
	
con = Dao.getconnection();

PreparedStatement p1 = con.prepareStatement(
	    "UPDATE tasks SET  status_of_task = 'Not Started' , employee_name = 'Not Assigned', emp_id = NULL WHERE emp_id = ?"
	);
	p1.setInt(1, id);
	p1.executeUpdate();



PreparedStatement p2 = con.prepareStatement("delete from employees where emp_id = ? ");

p2.setInt(1,id);
	status  = p2.executeUpdate();

	
	
	
} catch (Exception e1) {
	// TODO: handle exception
	e1.printStackTrace();
}
	
	
	
	return status;
	
}

public static int Saveusers (user u1) {
	
	
	
	Connection con = null;
	int status = 0;
	
	try {
		
	con = Dao.getconnection();
	
	PreparedStatement p1 = con.prepareStatement("insert into users ( fullname , emailorphone , password) values(?,?,?)");
		p1.setString(1, u1.getFullname());
		p1.setString(2,u1.getEmailorphone());
		p1.setString(3,u1.getPassword());
		
		System.out.println("before executeupdate");
		 status = p1.executeUpdate();
		 
		 
	} catch (Exception e2) {
		// TODO: handle exception
	e2.printStackTrace();
		
		
	}
		
	return status;
		
}

	
}
