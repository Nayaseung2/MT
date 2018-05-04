<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>메인이다!</h1>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<c:set var="ip" value="172.30.1.30" scope="application"/>
 <jsp:forward page="allBJ.lb"></jsp:forward> 
<%-- <jsp:forward page="WEB-INF/views/main/main.jsp"></jsp:forward> --%>
</body>
</html>