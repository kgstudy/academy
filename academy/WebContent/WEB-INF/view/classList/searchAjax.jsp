<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="t" items="${studyList }">
	<tr align="center">
		<td>${t.CLASSNAME }</td>
		<td>${t.GRADE }</td>
		<td>${t.CLASS }</td>
		<td>${t.TEACHER }</td>
		<td>${t.PRICE }</td>
		<td>${t.DAY }<br/>${t.STARTTIME } ~ ${t.ENDTIME }</td>
		<td>${t.PROCESS }</td>
		<td>${t.BOOK }</td>
		<td>o</td>
		<td>
			<input type="button" class="w3-btn w3-black" value="수정"/>&nbsp;
			<input type="button" class="w3-btn w3-black" value="삭제"/>&nbsp;
			<input type="button" class="w3-btn w3-black" value="종강"/>&nbsp;
		</td>
	</tr>
</c:forEach>