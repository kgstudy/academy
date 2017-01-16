<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="w3-row" align="center" id="div${title }">
	<div class="w3-col s12 m4 l4">
		<label><font style="font-size: 16px"><b>요일</b></font></label>
		<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="day${day }">
			<option>선택</option> 
			<option>월</option>
			<option>화</option>
			<option>수</option>
			<option>목</option>
			<option>금</option>
			<option>토</option>
			<option>일</option>
		</select>
	</div>
	<div class="w3-col s12 m4 l4">
		<label><font style="font-size: 16px"><b>시작</b></font></label>
		<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="startH${startH }">
			<c:forEach var="i" begin="1" end="23">
				<option>${i }</option>
			</c:forEach>
		</select>&nbsp;시&nbsp;
		<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="startM${startM }">
			<c:forEach var="i" begin="00" end ="59">
				<option>${i }</option>
			</c:forEach>
		</select>&nbsp;분&nbsp;~
	</div>
	<div class="w3-col s12 m4 l4">
		<label><font style="font-size: 16px"><b>종료</b></font></label>
		<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="endH${endH }">
			<c:forEach var="i" begin="1" end="23">
				<option>${i }</option>
			</c:forEach>
		</select>&nbsp;시&nbsp;
		<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="endM${endM }">
			<c:forEach var="i" begin="00" end ="59">
				<option>${i }</option>
			</c:forEach>
		</select>&nbsp;분&nbsp;
		<i class="fa fa-minus" onclick="minus(${title})" id="minus${title }"></i>
	</div>
</div>