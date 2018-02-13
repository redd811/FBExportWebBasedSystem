package com.fb.exportorder.module.customer.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.ShippingAddressRepository;

@Service
public class YourAddressServiceImpl implements YourAddressService {

	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	ShippingAddressRepository shippingAddressRepository;
	
	private List<String> validate (ShippingAddress shippingAddress) {
		
		List<String> errorMessages = new ArrayList<>();
		
		Address address = shippingAddress.getAddress();
		Contact contact = shippingAddress.getContact();
		
		if (StringUtils.isBlank(shippingAddress.getAddressType()))
			errorMessages.add("Address to cannot be empty");
		
		if (!StringUtils.isAlphaSpace(shippingAddress.getReceiverFullName()) || StringUtils.isBlank(shippingAddress.getReceiverFullName()))
			errorMessages.add("Receiver's full name cannot be empty");
		
		if (StringUtils.isBlank(contact.getCountryCode()))
			errorMessages.add("country code cannot be empty");
		
		if (!StringUtils.isNumeric(contact.getPhoneNumber()) || StringUtils.isBlank(contact.getPhoneNumber()) || Long.parseLong(contact.getPhoneNumber()) <= 0) {
			errorMessages.add("invalid phone number");
		}
		
		if (!StringUtils.isAlphaSpace(address.getCountry()) || StringUtils.isBlank(address.getCountry()))
			errorMessages.add("country cannot be empty, contain digits or symbols");
		
		if (!StringUtils.isAlphaSpace(address.getCity()) || StringUtils.isBlank(address.getCity()))
			errorMessages.add("city cannot be empty, contain digits or symbols");
		
		if (StringUtils.isBlank(address.getZipCode()))
			errorMessages.add("zipcode cannot be empty");
		
		if (StringUtils.isBlank(address.getAddress()))
			errorMessages.add("address cannot be empty");
		
		return errorMessages;
		
	}
	
	@Override
	public List<ShippingAddress> getAllAddressesById(long id) {
		return customerRepository.findOne(id).getShippingAddresses();
	}

	@Override
	public List<String> addAddress(ShippingAddress shippingAddress, long id) {
		
		List<String> errorMessages = validate(shippingAddress);
		
		if (errorMessages.isEmpty()) {
		
			Customer customer = customerRepository.findOne(id);
			
			customer.getShippingAddresses()
					.add(shippingAddress);
			
			customerRepository.save(customer);
			
		}
		
		return errorMessages;
	}

	@Override
	public void deleteAddress(long customerId, long addressId) {
		
		Customer customer = customerRepository.findOne(customerId);
		ShippingAddress deleteShippingAddress = shippingAddressRepository.findOne(addressId);
		
		customer.getShippingAddresses()
				.remove(deleteShippingAddress);
		
		customerRepository.save(customer);
		
	}

	@Override
	public void setDefaultShippingAddress(long prevShippingAddressId, long newShippingAddressId) {
		
		ShippingAddress prevShippingAddress = shippingAddressRepository.findOne(prevShippingAddressId);
		ShippingAddress newShippingAddress = shippingAddressRepository.findOne(newShippingAddressId);
		
		prevShippingAddress.setDefaultShippingAddress(false);
		newShippingAddress.setDefaultShippingAddress(true);
		
		shippingAddressRepository.save(prevShippingAddress);
		shippingAddressRepository.save(newShippingAddress);
		
	}

	@Override
	public List<String> editShippingAddress(ShippingAddress shippingAddress, long shippingAddressId) {
		
		List<String> errorMessages = validate(shippingAddress);
		
		if (errorMessages.isEmpty()) {
			
		}
		
		return errorMessages;
	}
	

}
