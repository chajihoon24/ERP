<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="flex h-full">

	<div class=" h-full w-1/2  ">
		<jsp:include page="userM_list.jsp"></jsp:include>
	</div>
	
	<div class="flex flex-col h-full w-1/2">
		<jsp:include page="userM_detail.jsp"></jsp:include>
		
		<jsp:include page="userM_register.jsp"></jsp:include>
	</div>

</div>