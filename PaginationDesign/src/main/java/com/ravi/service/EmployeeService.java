package com.ravi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.ravi.entity.Employee;
import com.ravi.repository.EmployeeRepo;

@Service
public class EmployeeService implements IEmployee {
	
	@Autowired
	private EmployeeRepo employeeRepo;
	
	@Override
	public List<Employee> getAllEmployee() {
		
		return employeeRepo.findAll();
	}

	@Override
	public void addEmployee(Employee employee) {
		employeeRepo.save(employee);
		
	}

	@Override
	public void deleteEmployee(Long id) {
		employeeRepo.deleteById(id);
		
	}

	@Override
	public Employee getEmployeeById(Long id) {
		Employee employee = employeeRepo.findById(id).get();
		return employee;
	}

	@Override
	public Page<Employee> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = Sort.by(sortField);
		sort = "asc".equalsIgnoreCase(sortDirection) ? sort.ascending() : sort.descending();
		Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
		return employeeRepo.findAll(pageable);
	}	
}
