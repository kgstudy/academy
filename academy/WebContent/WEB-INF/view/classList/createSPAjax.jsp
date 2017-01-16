<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<option>선택</option>
<c:forEach var="t" items="${process }">
	<option>${t.PROCESS }</option>
</c:forEach>
<option>직접입력</option>