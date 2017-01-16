<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="w3-row" align="center" id="bookDiv${num }">
	<div class="w3-col s12 m4 l4">&nbsp;</div>
	<div class="w3-col s12 m4 l4">&nbsp;</div>
	<div class="w3-col s12 m4 l4">
		<label><font style="font-size: 16px"><b>교재</b></font></label>&nbsp;&nbsp;
		<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="book${num }" onchange="change(this)">
			<option>선택</option>
			<c:forEach var="t" items="${book }">
				<option>${t.BOOK }</option>
			</c:forEach>
			<option>직접입력</option>
		</select>&nbsp;
		<i class="fa fa-minus" onclick="minus_(${num })" id="minus_${num }"></i><br/>
		<input type="text" placeholder="직접입력" id="book${num }Input" style="padding-left: 10px; width: 150px; margin-top: 10px; display: none"/>
	</div>
</div>