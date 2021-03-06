package com.fb.exportorder.models.customer;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fb.exportorder.models.Account;
import com.fb.exportorder.models.ShippingAddress;

@Entity
public class Customer extends Account {
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="customer")
	@JsonIgnore
	private List<Order> orders;
	
	@OneToOne
	@Cascade(value=org.hibernate.annotations.CascadeType.ALL)
	private Cart cart = new Cart();
	
	@OneToMany(cascade=CascadeType.ALL)
	@Cascade({org.hibernate.annotations.CascadeType.DELETE,
        org.hibernate.annotations.CascadeType.MERGE,
        org.hibernate.annotations.CascadeType.PERSIST,
        org.hibernate.annotations.CascadeType.DELETE_ORPHAN})
	private List <ShippingAddress> shippingAddresses = new ArrayList<>();

	@OneToMany(cascade=CascadeType.ALL, mappedBy="customer")
	@Cascade({org.hibernate.annotations.CascadeType.DELETE,
	          org.hibernate.annotations.CascadeType.MERGE,
	          org.hibernate.annotations.CascadeType.PERSIST,
	          org.hibernate.annotations.CascadeType.DELETE_ORPHAN})
	@JsonManagedReference
	private List <Activity> activities = new ArrayList<>();

	@OneToMany(cascade=CascadeType.ALL)
	@Cascade({org.hibernate.annotations.CascadeType.DELETE,
        org.hibernate.annotations.CascadeType.MERGE,
        org.hibernate.annotations.CascadeType.PERSIST,
        org.hibernate.annotations.CascadeType.DELETE_ORPHAN})
	private List <Notification> notifications = new ArrayList<>();
	
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public List<ShippingAddress> getShippingAddresses() {
		return shippingAddresses;
	}

	public void setShippingAddresses(List<ShippingAddress> shippingAddresses) {
		this.shippingAddresses = shippingAddresses;
	}

	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}

	public List<Notification> getNotifications() {
		return notifications;
	}

	public void setNotifications(List<Notification> notifications) {
		this.notifications = notifications;
	}
	
}
