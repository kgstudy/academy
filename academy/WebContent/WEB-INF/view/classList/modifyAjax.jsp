<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:forEach var="t" items="${view }">
	<tr align="center">
		<td>${t.DAY }</td>
		<td>${t.BEFORE }</td>
		<td>${t.AFTER }</td>
	</tr>
</c:forEach>