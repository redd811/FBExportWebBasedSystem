package com.fb.exportorder.module.admin.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fb.exportorder.models.Employee;
import com.fb.exportorder.models.customer.Customer;

public interface ManageCustomerService {
	
	public List<Customer> getAllCustomers();
	
	public void editEnabledCustomer(String username);
	
	public List<String> editCustomer(Customer customer, String newEmailClientEdit, String newUsernameClientEdit);

	public Customer getCustomerByUsername(String usernameClientEdit);

}