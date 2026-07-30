package com.demo;


public class employee {

	int emp_id;
	 String emp_name;
	 String emp_depart;
	 String task_name;
	 String status_of_task;
	 public int getEmp_id() {
		 return emp_id;
	 }
	 public void setEmp_id(int emp_id) {
		 this.emp_id = emp_id;
	 }
	 public String getEmp_name() {
		 return emp_name;
	 }
	 public void setEmp_name(String emp_name) {
		 this.emp_name = emp_name;
	 }
	 public String getEmp_depart() {
		 return emp_depart;
	 }
	 public void setEmp_depart(String emp_depart) {
		 this.emp_depart = emp_depart;
	 }
	 public String getTask_name() {
		 return task_name;
	 }
	 public void setTask_name(String task_name) {
		 this.task_name = task_name;
	 }
	 public String getStatus_of_task() {
		 return status_of_task;
	 }
	 public void setStatus_of_task(String status_of_task) {
		 this.status_of_task = status_of_task;
	 }
	 @Override
	 public String toString() {
		return "employee [emp_id=" + emp_id + ", emp_name=" + emp_name + ", emp_depart=" + emp_depart + ", task_name="
				+ task_name + ", status_of_task=" + status_of_task + "]";
	 }
	
	
	 
	
	
}
