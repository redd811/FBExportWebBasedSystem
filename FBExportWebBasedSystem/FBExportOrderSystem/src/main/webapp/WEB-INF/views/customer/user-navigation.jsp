 <%@ include file = "../../lib/tags/tag-libraries.jsp" %>
 
 <!--user Navigation sign out nav-->
 
 <security:authorize access = "!hasAuthority('CUSTOMER')">
 
	<header id="move-top">
	
	    <nav class="navbar navbar-expand-lg navbar-dark black">
	
	        <div class = "container">
	
	            <ul class="navbar-nav mr-auto">
	                <li class="nav-item">
	                    <a class="nav-link white-text sub-nav-date" href="#"></a>
	                </li>
	                
	            </ul>
	            <ul class="navbar-nav nav-flex-icons">
	                <li class="nav-item">
	                    <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/login' />">
	                        <i class="fa fa-user" aria-hidden="true"></i>
	                        <span> LOGIN </span>
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/sign-up' />">
	                        <i class="fa fa-user-plus" aria-hidden="true"></i>
	                        <span> SIGN UP </span>
	                    </a>
	                </li>
	            </ul>
	
	        </div>
	
	    </nav>
	
	</header>

</security:authorize>

<!--user Navigation-->


<security:authorize access = "hasAuthority('CUSTOMER')">

	<input type="hidden" value="${sessionScope.logoutTime}" id="logoutTime"/>

	<sql:query var="notificationsQuery" 
	           dataSource = "${dataSource}">
	                            		   			SELECT notification_id, date, description, header, is_seen FROM 
	                            		   			(notification n INNER JOIN customer_notifications cn ON n.notification_id = cn.notifications_notification_id)
																	INNER JOIN customer c ON cn.customer_id = c.id WHERE c.id = ${sessionScope.customerId} AND n.is_seen = false
																	ORDER BY n.date DESC
									  	</sql:query>
	<header id="move-top">
	
		<input type = "hidden" value = '${sessionScope.customerId}' id = "customer-id"/>
	
	    <nav class="navbar navbar-expand-lg navbar-dark black">
	
	        <div class = "container">
	
	                <ul class="navbar-nav mr-auto">
	                <li class="nav-item">
	                        <a class="nav-link white-text sub-nav-date" href="#"></a>
	                    </li>
	                </ul>
	                <ul class="navbar-nav nav-flex-icons">
	                    <li class="nav-item">
	
	                        <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/view-profile' />">
	                            <input type="hidden" id="customerUsername" value="${sessionScope.customerUsername}"/>
	                            <span class = "font-weight-bold"> Welcome ${sessionScope.customerName}!</span>
	                            <img class = "ml-1" src = "<c:url value = '${sessionScope.customerProfileImageLink}' />" height = "20" width = "20" alt = "profile image" id="profileImage"/>
	                        </a>
	
	                    </li>
	                    <li class="nav-item d-none" id = "notificationListItem">
					
	                        
	                        <div class="dropdown" id = "btnShowNotification">
	                            <a class = "nav-link waves-effect waves-light pl-0 white-text" id="dropDownNotification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                            <span class = "font-weight-bold">${fn:length(notificationsQuery.rows) > 0 ? fn:length(notificationsQuery.rows) : ''}</span>
	                                <i class="fa fa-bell" aria-hidden="true"></i>
	                            </a>
	                            <div class="dropdown-menu" aria-labelledby="dropDownNotification" style = "left: -275px; width: 500px;">
	                            <h6 class="dropdown-header">
	                                <span> Notifications </span>
	                            </h6>
	
	                            <div style = "max-height: 380px; overflow-y: auto;">
	                                <div class="list-group" id = "notificationListGroup">
	                                
	                                
									
	                                </div>
	
	                            </div>
	
	                            <span class="dropdown-header text-center pb-0">
	                                <a class = "p-0" href = "<c:url value = '/notifications' />"> see more </a>
	                            </span>
	
	                            </div>
	                        </div>
	
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/view-profile' />">
	                            <i class="fa fa-user" aria-hidden="true"></i>
	                            <span> PROFILE </span>
	                        </a>
	                    </li>
	                    <li class="nav-item">
	                        <a class="nav-link waves-effect waves-light white-text" href="<c:url value = '/sign-out' />">
	                            <i class="fa fa-sign-out" aria-hidden="true"></i>
	                            <span> SIGN OUT </span>
	                        </a>
	                    </li>
	                </ul>
	
	        </div>
	
	    </nav>
	
	</header>
</security:authorize>



