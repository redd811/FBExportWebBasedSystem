package com.fb.exportorder.module.customer.service;

import com.fb.exportorder.models.customer.Customer;

public interface CustomerAccountService {
	void editAccount(Customer customer, long customerId);
}
