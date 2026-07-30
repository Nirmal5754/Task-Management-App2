package com.demo;

public class task {
int	task_id;
String	task_name;
String	status_of_task;
String	employee_name ;
public int getTask_id() {
	return task_id;
}
public void setTask_id(int task_id) {
	this.task_id = task_id;
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
public String getEmployee_name() {
	return employee_name;
}
public void setEmployee_name(String employee_name) {
	this.employee_name = employee_name;
}
@Override
public String toString() {
	return "task [task_id=" + task_id + ", task_name=" + task_name + ", status_of_task=" + status_of_task
			+ ", employee_name=" + employee_name + "]";
}




}
