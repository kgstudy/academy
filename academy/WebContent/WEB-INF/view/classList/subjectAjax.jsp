<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<c:forEach var="t" items="${list }">
	<input type="text" readonly="readonly" value="${t.SUBJECT }" id="${t.SUBJECT }" style="width: 70px; margin-top: 10px; margin-right: 2px; text-align: center"/>&nbsp;
	<input type="button" class="w3-btn w3-dark-gray" id="${t.SUBJECT }sel" value="선택" onclick="sel(this)" style="margin-right: 2px"/>
	<input type="button" class="w3-btn w3-dark-gray" id="${t.SUBJECT }mod" value="수정" onclick="modcom(this)" style="margin-right: 2px"/>
	<input type="button" class="w3-btn w3-dark-gray" id="${t.SUBJECT }del" value="삭제" onclick="del(this)"/><br/>
</c:forEach>