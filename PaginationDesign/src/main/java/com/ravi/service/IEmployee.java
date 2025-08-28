package com.ravi.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.ravi.entity.Employee;

public interface IEmployee {
	public void addEmployee(Employee employee);
	public List<Employee> getAllEmployee();
	public Employee getEmployeeById(Long id);
	public void deleteEmployee(Long id);
	public Page<Employee> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
}
