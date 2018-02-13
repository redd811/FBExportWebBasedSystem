package com.fb.exportorder.module.customer.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fb.exportorder.models.Address;
import com.fb.exportorder.models.Contact;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.module.customer.service.YourAddressService;

@Controller
public class YourAddressController {

	@Autowired
	YourAddressService yourAddressService;

	@RequestMapping("/your-address")
	public String yourAddress(Model model, HttpSession session) {
		model.addAttribute(yourAddressService.getAllAddressesById((long) session.getAttribute("customerId")));
		return "your-address";
	}

	@RequestMapping(value = "/add-address", method = RequestMethod.POST)
	public @ResponseBody String addAddress(@RequestParam String shippingAddressJSON, HttpSession session) {

		long customerId = (long)session.getAttribute("customerId");
		
		try {

			JSONObject shippingAddressRawJSON = (JSONObject) new JSONParser().parse(shippingAddressJSON);

			ShippingAddress newShippingAddress = new ShippingAddress();

			Contact contactShippingAddress = new Contact();

			Address address = new Address();

			address.setAddress((String) shippingAddressRawJSON.get("address"));
			address.setCity((String) shippingAddressRawJSON.get("city"));
			address.setCountry((String) shippingAddressRawJSON.get("country"));
			address.setZipCode((String) shippingAddressRawJSON.get("zipcode"));

			contactShippingAddress.setPhoneNumber((String) shippingAddressRawJSON.get("phoneNumber"));
			contactShippingAddress.setCountryCode((String) shippingAddressRawJSON.get("countryCode"));

			newShippingAddress.setAddressType((String) shippingAddressRawJSON.get("addressType"));
			newShippingAddress.setReceiverFullName((String) shippingAddressRawJSON.get("receiverFullName"));
			newShippingAddress.setContact(contactShippingAddress);
			newShippingAddress.setDefaultShippingAddress(false);
			newShippingAddress.setShippingInstructions((String) shippingAddressRawJSON.get("shippingInstructions"));
			newShippingAddress.setAddress(address);

			yourAddressService.addAddress(newShippingAddress, customerId);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
		List <ShippingAddress> shippingAddress = yourAddressService.getAllAddressesById(customerId);

		return Long.toString(shippingAddress.get(shippingAddress.size() - 1).getShippingAddressId());
	}
	
	@RequestMapping(value = "/delete-address", method = RequestMethod.POST)
	public @ResponseBody String deleteAddress (String deleteId, HttpSession session) {
		
		long customerId = (long)session.getAttribute("customerId");
		
		yourAddressService.deleteAddress(customerId, Long.parseLong(deleteId));
		
		return "";
	}
	
	@RequestMapping(value = "/set-default-shipping-address", method = RequestMethod.POST)
	public @ResponseBody String setDefaultShippingAddress (@RequestParam String prevDefaultShippingAddressId,
														   @RequestParam String newDefaultShippingAddressId) {
		
		yourAddressService.setDefaultShippingAddress(Long.parseLong(prevDefaultShippingAddressId), 
													 Long.parseLong(newDefaultShippingAddressId));
		
		return "";
	}
	

}
