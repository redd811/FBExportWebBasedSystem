<%@ include file = "../../lib/tags/tag-libraries.jsp" %>

<main>

    <div class = "container mt-4">

        <h4 class = "pt-3">
            Your Addresses
            <i class="fa fa-address-card ml-2" aria-hidden="true"></i>
        </h4>

        <hr />
    </div>

    <div class="container mt-4">
        <div class="row">

            <div class="col-lg-3">

                <div class = "mb-4">

                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            <i class="fa fa-user mr-2" aria-hidden="true"></i>
                            View Profile
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-bell mr-2" aria-hidden="true"></i>
                            Notifications
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-reorder mr-2" aria-hidden="true"></i>
                            Order Lists
                        </a>
                        <a href="#" class="list-group-item">
                            <i class="fa fa-ship mr-2" aria-hidden="true"></i>
                            Shipping
                        </a>
                        <a href="<c:url value = '/your-address' />" class="list-group-item active">
                            <i class="fa fa-address-card mr-2" aria-hidden="true"></i>
                            Your Addresses
                        </a>
                        <a href="<c:url value = '/account-settings' />" class="list-group-item">
                            <i class="fa fa-gear mr-2" aria-hidden="true"></i>
                            Account Settings
                        </a>

                        <a href="<c:url value = '/sign-out' />" class="list-group-item">
                            <i class="fa fa-sign-out mr-2" aria-hidden="true"></i>
                            Sign out
                        </a>
                    </div>

                </div>

            </div>

            <div class="col-lg-9">

                <div class="row">
                    <div class="col-md-12">

                        <div class = "row">
                            <div class = "col-md-4">
                            <div id = "add-address" class="card bg-light z-depth-0" style="width: 17rem; height: 12rem; color: #A3A3A3; cursor: pointer; border: 2px dashed #A3A3A3;">
                                <div class="card-body">
                                    <div class = "text-center pt-4">
                                        <i class="fa fa-plus-square-o fa-3x" aria-hidden="true"></i>
                                        <h4> Add Address </h4>
                                    </div>
                                </div>
                            </div>
                            </div>
                            
                            <c:forEach var = "shippingAddress" items = "${shippingAddressList}">
                            	<div class = "col-md-4">
		                            <div class="card border-light mb-3" style="max-width: 17rem; height: 12rem;">
		                                <div class="card-header pt-2 pb-2" style = "font-size: 14px;">
		                                    <strong> ${shippingAddress.addressType} </strong>
		                                </div>
		                                
		                                <div class="card-body pt-3">
									
		                                    <div class = "card-text">
		                                        <ul class="list-unstyled mb-2" style = "font-size: 12px; height: 6rem; max-height: 6rem; overflow-y: auto;">
		                                            <li> ${shippingAddress.receiverFullName} </li>
		                                            <li> ${shippingAddress.address.zipCode} ${shippingAddress.address.address} ${shippingAddress.address.city } </li>
		                                            <li> ${shippingAddress.address.country} </li>
		                                            <li> Phone number: ${shippingAddress.phoneNumber} </li>
		                                        </ul>
		                                        
		                                        <c:choose>
		                                        
			                                        <c:when test="${shippingAddress.addressType eq 'User Account Address'}">
			                                        
				                                        <ul class="list-inline" style = "font-size: 12px;">
				                                            <li class="list-inline-item"> <a class = "blue-text" href = "#"> Edit </a> </li>
				                                            <li class="list-inline-item"> | </li>
				                                            <li class="list-inline-item"> 
				                                            
					                                            <c:choose>
					                                            
					                                            	<c:when test="${shippingAddress.defaultShippingAddress}">
					                                            		<a class = "disabled grey-text"> Set default shipping address </a> 
					                                        		</c:when>
					                                        		<c:otherwise>
					                                        			<a class = "blue-text" href = "#"> Set default shipping address</a>
					                                        		</c:otherwise>
					                                        		
					                                        	</c:choose>
				                                        	
				                                        	</li>
				                                        	
				                                        	
				                                        </ul>
			                                        
			                                        </c:when>
			                                        <c:otherwise>
			                                        	<ul class="list-inline" style="font-size: 12px;">
                                                            <li class="list-inline-item mr-1"> <a class="blue-text" href="#"> Edit </a> </li>
                                                            <li class="list-inline-item mr-1"> | </li>
                                                            <li class="list-inline-item mr-1"> <a class="blue-text" href="#"> Delete </a> </li>
                                                            <li class="list-inline-item mr-1"> | </li>
                                                            
															<c:choose>
					                                            
					                                            <c:when test="${shippingAddress.defaultShippingAddress}">
					                                            	<a class = "disabled grey-text"> Set default shipping address </a> 
					                                        	</c:when>
					                                        	<c:otherwise>
					                                        		<a class = "blue-text" href = "#"> Set default shipping address</a>
					                                        	</c:otherwise>
					                                        		
					                                        </c:choose>
                                                        
                                                        </ul>
			                                        </c:otherwise>
		                                        
		                                        </c:choose>
		
		                                    </div>
		
		                                </div>
		                            </div>
	                            </div>
                            </c:forEach>
                            
                           
                           
                            
                        </div>
                        

                </div>


            </div>

        </div>

        <hr />
    </div>



</main>