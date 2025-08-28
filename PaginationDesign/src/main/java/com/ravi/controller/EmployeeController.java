package com.ravi.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ravi.DTO.EmployeeDTO;
import com.ravi.entity.Employee;
import com.ravi.service.IEmployee;

@Controller
public class EmployeeController {
	
	@Autowired
	private IEmployee iEmployee;
	
	@Autowired
	private Environment env;
	
	@GetMapping("/")
	public String home() {
		
		return "home";
	}
	
	@GetMapping("/addEmployee")
	public String addEmployee(Model model) {
		model.addAttribute("employeeDTO", new EmployeeDTO());
		return "addEmployee";
	}
	
	@PostMapping("/addEmployee")
	public String addingEmployee(@ModelAttribute EmployeeDTO employeeDTO, Map<String, Object> map) throws Exception{
		
		  // get Upload folder location from properties file 
		  String storeLocation=env.getRequiredProperty("upload.image");
		  
		  // if path folder is not available then auto create path folder
		  File file=new File(storeLocation); 
		  if(!file.exists()) 
			  file.mkdir();
		  
		  // get InputStreams represent in the upload image content 
		  MultipartFile photoFile=employeeDTO.getImage_name(); 
		  InputStream isPhoto=photoFile.getInputStream();
		  
		  //get the names of the uploaded image 
		  String photoFileName=photoFile.getOriginalFilename();
		  
		  //create out streams representing empty destination files 
		  OutputStream osPhoto=new FileOutputStream(file.getAbsolutePath()+"\\"+photoFileName);
		  
		  // perform file copy operation 
		  IOUtils.copy(isPhoto,osPhoto);
		  
		  //close stream 
		  isPhoto.close(); 
		  osPhoto.close();
		 
		Employee employee=new Employee();
		employee.setName(employeeDTO.getName());
		employee.setAddress(employeeDTO.getAddress());
		employee.setEmail(employeeDTO.getEmail());
		employee.setContact(employeeDTO.getContact());
		employee.setDateOfBirth(employeeDTO.getDateOfBirth());
		employee.setGender(employeeDTO.getGender());
		employee.setDesignation(employeeDTO.getDesignation());
		employee.setImageName(photoFileName);
		iEmployee.addEmployee(employee);
		List<Employee> listEmployeeData=iEmployee.getAllEmployee();
		map.put("employeeData",listEmployeeData);
		return "redirect:./";
	}
	
	@GetMapping("/showEmployee")
	public String showEmployee(@ModelAttribute Employee employee, Map<String, Object> map, 
			@RequestParam(defaultValue = "1") int pageNo,
            @RequestParam(defaultValue = "7") int pageSize,
            @RequestParam(defaultValue = "id") String sortField,
            @RequestParam(defaultValue = "asc") String sortDir) {
		
		Page<Employee> page = iEmployee.findPaginated(pageNo, pageSize, sortField, sortDir);
		//map.put("employeeData", page);
		map.put("currentPage", pageNo);
		map.put("totalPages", page.getTotalPages());
		map.put("totalItems", page.getTotalElements());
		map.put("listEmployee", page.getContent());
		map.put("sortField", sortField);
		map.put("sortDir", sortDir);
		map.put("reverseSortDir", "asc".equals(sortDir) ? "desc" : "asc");
		return "employeeShowData";
	}
	
	@GetMapping("/edit")
	public String ShowEditEmployeeForm(@RequestParam Long id, Model model) {
		Employee emp= iEmployee.getEmployeeById(id);
		model.addAttribute("empData",emp);
		return "updateEmployee";
	}
	
	@PostMapping("/edit")
	public String ShowEditEmployeeFormPost(@ModelAttribute Employee employee, Map<String, Object> map) {
		iEmployee.addEmployee(employee);
		List<Employee> list=iEmployee.getAllEmployee();
		map.put("empData", list);
		return "redirect:./showEmployee";
	}
	
	@GetMapping("/delete")
	public String DeleteCategoryPost(@RequestParam Long id, Map<String, Object> map) {
		iEmployee.deleteEmployee(id);
		List<Employee> list=iEmployee.getAllEmployee();
		map.put("employeeData", list);
		return "redirect:./showEmployee";
	}
}
