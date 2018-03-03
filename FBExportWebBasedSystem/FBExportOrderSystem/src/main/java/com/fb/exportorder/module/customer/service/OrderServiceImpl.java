package com.fb.exportorder.module.customer.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fb.exportorder.models.Shipping;
import com.fb.exportorder.models.ShippingAddress;
import com.fb.exportorder.models.customer.Cart;
import com.fb.exportorder.models.customer.Customer;
import com.fb.exportorder.models.customer.Item;
import com.fb.exportorder.models.customer.Order;
import com.fb.exportorder.models.enums.OrderStatus;
import com.fb.exportorder.models.enums.PaymentMethod;
import com.fb.exportorder.models.enums.ShipmentStatus;
import com.fb.exportorder.module.customer.repository.CustomerRepository;
import com.fb.exportorder.module.customer.repository.OrderRepository;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderRepository orderRepository;
	
	@Autowired
	CustomerRepository customerRepository;
	
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	public List<String> validate (String shipmentStatus,
								  String departureDate,
								  String arrivalDate,
								  String vesselName,
								  String mmsiNumber,
								  String imoNumber,
								  String destination) {
		
		List <String> errorMessages = new ArrayList<String>();
		
		if (StringUtils.isBlank(shipmentStatus))
			errorMessages.add("choose a shipment status");
			
		try {
			
			if (StringUtils.isEmpty(departureDate))
				throw new ParseException("", 0);
			
			dateFormat.parse(departureDate);
		} catch (ParseException e) {
			errorMessages.add("invalid departure date");
		}
		
		try {
			
			if (StringUtils.isEmpty(arrivalDate))
				throw new ParseException("", 0);
			
			dateFormat.parse(arrivalDate);
		} catch (ParseException e) {
			errorMessages.add("invalid arrival date");
		}
		
		if (StringUtils.equals(shipmentStatus, "On Cargo Ship")) {
			
			if (StringUtils.isBlank(vesselName))
				errorMessages.add("vessel name is empty");
			
			if (!StringUtils.isNumeric(mmsiNumber))
				errorMessages.add("MMSI Number is invalid");
			
			if (!StringUtils.isNumeric(imoNumber))
				errorMessages.add("IMO Number is invalid");
			
			if (StringUtils.isBlank(destination))
				errorMessages.add("destination is empty");
			
			
		}
		
		return errorMessages;
	}
	
	
	@Override
	public Order order(Customer customer, ShippingAddress shippingAddress, PaymentMethod paymentMethod, double totalPrice,
			double totalWeight) {
		
		Order newOrder = new Order();
		
		Cart customerCart = customer.getCart();
		Cart orderedCart = new Cart();
		
		for (Item itemOrdered : customerCart.getItems()) {
			Item newItemOrdered = new Item();
			
			newItemOrdered.setPrice(itemOrdered.getPrice());
			newItemOrdered.setProduct(itemOrdered.getProduct());
			newItemOrdered.setWeight(itemOrdered.getWeight());
			
			orderedCart.getItems().add(newItemOrdered);
		}
		
		customerCart.clearItems();
		
		customerRepository.save(customer);
		
		newOrder.setCustomer(customer);
		newOrder.setCart(orderedCart);
		newOrder.setOrderStatus(OrderStatus.PENDING);
		newOrder.setPaymentMethod(paymentMethod);
		newOrder.setShippingAddress(shippingAddress);
		newOrder.setTotalItems(orderedCart.getItemCount());
		newOrder.setTotalWeight(totalWeight);
		newOrder.setTotalPrice(totalPrice);
		newOrder.setDateOrdered(new Date());
		
		return orderRepository.save(newOrder);
	}


	@Override
	public List<Order> getAllOrders() {
		return (List<Order>) orderRepository.findAll();
	}


	@Override
	public Order getOrderById(long id) {
		return orderRepository.findOne(id);
	}


	@Override
	public List<String> addToShipInformation(String shipmentStatus, String departureDate, String arrivalDate, String vesselName,
			String mmsiNumber, String imoNumber, String destination) {
		
		List<String> errorMessages = validate(shipmentStatus, 
											  departureDate, 
											  arrivalDate, 
											  vesselName,
											  mmsiNumber, 
											  imoNumber, 
											  destination);
		if (errorMessages.isEmpty()) {
			
			System.out.println("validation success");
			
		}
		
		return errorMessages;
		
	}


	@Override
	public void markApproved(Order order, String message) {
		order.setMessage(message);
		order.setOrderStatus(OrderStatus.APPROVED);
		orderRepository.save(order);
	}


	@Override
	public void markRejected(Order order, String reason) {
		order.setMessage(reason);
		order.setOrderStatus(OrderStatus.REJECTED);
		orderRepository.save(order);
	}


	@Override
	public void markPending(Order order) {
		order.setOrderStatus(OrderStatus.REJECTED);
		orderRepository.save(order);
	}


	@Override
	public void markReceived(Order order) {
		order.setOrderStatus(OrderStatus.RECEIVED);
		orderRepository.save(order);
	}

}
