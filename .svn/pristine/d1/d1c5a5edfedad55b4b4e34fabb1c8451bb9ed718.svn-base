<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
        
	<meta charset="utf-8" />
	<title>Sign In | Dashonic - Admin & Dashboard Template</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
	<meta content="Pichforest" name="author" />
	<!-- App favicon -->
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/wsi.png">
	
	<!-- Bootstrap Css -->
	<link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
	<!-- Icons Css -->
	<link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
	<!-- App Css-->
	<link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<c:if test="${not empty message }">
	<script type="text/javascript">
	alert("${message}");
	<c:remove var="message" scope="request"/>
	<c:remove var="message" scope="session"/>
	
	</script>
</c:if>

<body>

	<tiles:insertAttribute name="content"/>

    <!-- JAVASCRIPT -->
    <script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/metismenujs/metismenujs.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/libs/feather-icons/feather.min.js"></script>

</body>
</html>