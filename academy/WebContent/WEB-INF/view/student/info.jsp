<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div class="w3-row" align="center" style="margin-right: 30px">
	<div class="w3-col s12 m4 l4">
		<label><font style="font-size: 18px; color: black"><b>TEST 예약</b></font></label><br/>
	</div>
	<div class="w3-col s12 m2 l2">
		<input type="button" class="w3-btn w3-black" style="width: 100%" value="일자" id="date"/>
	</div>
	<div class="w3-col s12 m2 l2">
		<input type="button" class="w3-btn w3-black" style="width: 100%" value="과목" id="subject"/>
	</div>
	<div class="w3-col s12 m2 l2">
		<input type="button" class="w3-btn w3-black" style="width: 100%" value="범위" id="range"/>
	</div>
	<div class="w3-col s12 m2 l2">
		<input type="button" class="w3-btn w3-black" style="width: 100%" value="완료" id="commit"/>
	</div>
</div>
<div class="w3-row" style="margin-top: 10px; margin-right: 30px" align="center">
	<div class="w3-col s12 m4 l4">
		<label><font style="font-size: 16px; color: black"><b>상담</b></font></label><br/>
		<label><input type="radio" name="consult" id="call" class="w3-radio"/>&nbsp; <font style="color: black"><b>전화</b></font></label><br/>
		<label><input type="radio" name="consult" id="visit" class="w3-radio"/>&nbsp; <font style="color: black"><b>방문</b></font></label><br/><br/>
		<input type="button" class="w3-btn w3-black" value="저장하기" id="save"/>
	</div>
	<div class="w3-col s12 m8 l8">
		<textarea rows="6" cols="80" style="width: 100%; resize: none"></textarea>
	</div>
</div><br/>
<div class="w3-row" align="right" style="margin-right: 30px">
	<table style="border: solid black 1px; border-radius: 7px">
		<tr align="center"><td style="padding-bottom: 5px; padding-left: 3px; padding-right: 3px">
			<label><font style="font-size: 18px; color: black"><b>00월 미납</b></font></label><br/>
		</td></tr>
		<tr align="center"><td style="padding-top: 5px; padding-left: 3px; padding-right: 3px">
			<label><font style="font-size: 18px; color: black"><b>재원생</b></font></label>
		</td></tr>
	</table>
</div><br/>
<div class="w3-row" style="margin-right: 30px">
	<ul class="w3-navbar w3-black">
		<li><a href="javascript:void(0)" class="tablink w3-red" onclick="openTab(event, 'info');">학생정보</a></li>
		<li><a href="javascript:void(0)" class="tablink" onclick="openTab(event, 'study');">수업정보</a></li>
		<li><a href="javascript:void(0)" class="tablink" onclick="openTab(event, 'consult');">상담내역</a></li>
		<li><a href="javascript:void(0)" class="tablink" onclick="openTab(event, 'record');">학교성적</a></li>
	</ul>
	
	<!-- 학생정보 탭 -->
	<div id="info" class="w3-container w3-border info">
		<c:import url="/WEB-INF/view/student/infoTab.jsp"/>
	</div>
	
	<!-- 수업정보 탭 -->
	<div id="study" class="w3-container w3-border info" style="display:none">
		<h2>Paris</h2>
		<p>Paris is the capital of France.</p> 
	</div>
	
	<!-- 상담내역 탭 -->
	<div id="consult" class="w3-container w3-border info" style="display:none">
		<h2>Tokyo</h2>
		<p>Tokyo is the capital of Japan.</p>
	</div>
	
	<!-- 학교성적 탭 -->
	<div id="record" class="w3-container w3-border info" style="display:none">
		<h2>Tokyo</h2>
		<p>Tokyo is the capital of Japan.</p>
	</div>
</div><br/>
<div class="w3-row" align="center">
	<input type="button" class="w3-btn w3-black" value="확인" onclick="$('#viewStudentModal').fadeOut(500)"/>
</div>

<script>
	function openTab(evt, cityName) {
		var i, x, tablinks;
		x = document.getElementsByClassName("info");
		for (i = 0; i < x.length; i++) {
		    x[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablink");
		for (i = 0; i < x.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
		}
		document.getElementById(cityName).style.display = "block";
		evt.currentTarget.className += " w3-red";
	}
</script>