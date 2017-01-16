<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div style="width: 100%; height: 80%">
	<div class="w3-row" style="margin-top: 100px; margin-left: 10%; margin-bottom: 5%">
		<label><font style="font-size: 20px"><b>수강반 현황</b></font></label>&nbsp;&nbsp;
		<label onclick="location.href='/'" onmouseover="mouseOver(this)" onmouseleave="mouseLeave(this)">메인으로</label><br/><br/>
		<input type="button" class="w3-btn w3-dark-gray" value="수업 셋팅" onclick="setting()"/>&nbsp;
		<input type="button" class="w3-btn w3-dark-gray" value="신규반 개설" onclick="newClass()"/><br/><br/>
		<label><font style="font-size: 18px"><b>기간</b></font></label>&nbsp;
		<input type="date" id="date"/>&nbsp;&nbsp;
		<label><font style="font-size: 18px"><b>과목</b></font></label>&nbsp;
		<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="subject">
			<option>선택</option>
			<option>전체</option>
			<c:forEach var="t" items="${subject }">
				<option>
					${t.SUBJECT }
				</option>
			</c:forEach>
		</select>&nbsp;&nbsp;
		<input type="button" class="w3-btn w3-dark-gray" value="확인" onclick="search()"/><br/><br/>
		<table style="width: 80%" class="w3-table-all w3-hoverable w3-centered">
			<thead>
				<tr>
					<td style="background-color: #33c0a3; width: 7%" align="center">
						<label><font style="font-size: 18px"><b>반 명</b></font></label>
					</td>
					<td style="background-color: #33c0a3; width: 7%" align="center">
						<label><font style="font-size: 18px"><b>학년</b></font></label>
					</td>
					<td style="background-color: #33c0a3; width: 7%" align="center">
						<label><font style="font-size: 18px"><b>반</b></font></label>
					</td>
					<td style="background-color: #33c0a3; width: 7%" align="center">
						<label><font style="font-size: 18px"><b>담임</b></font></label>
					</td>
					<td style="background-color: #33c0a3; width: 7%" align="center">
						<label><font style="font-size: 18px"><b>수강료</b></font></label>
					</td>
					<td style="background-color: #33c0a3" align="center">
						<label><font style="font-size: 18px"><b>요일 및 시간</b></font></label>
					</td>
					<td style="background-color: #33c0a3" align="center">
						<label><font style="font-size: 18px"><b>과정</b></font></label>
					</td>
					<td style="background-color: #33c0a3" align="center">
						<label><font style="font-size: 18px"><b>교재</b></font></label>
					</td>
					<td style="background-color: #33c0a3;width: 10%" align="center">
						<label><font style="font-size: 18px"><b>변경사항</b></font></label>
					</td>
					<td style="background-color: #33c0a3" align="center">
						<label><font style="font-size: 18px"><b>수정/삭제/종강</b></font></label>
					</td>
				</tr>
			</thead>
			<tbody id="studyList">
				<c:forEach var="t" items="${studyList }">
					<tr align="center">
						<td><input type="text" readonly="readonly" value="${t.CLASSNAME }" id="className${t.NUM }" style="border: 0px; text-align: center; width: 100px"/></td>
						<td>${t.GRADE }</td>
						<td>${t.CLASS }</td>
						<td>${t.TEACHER }</td>
						<td>${t.PRICE }</td>
						<td>${t.DAY }<br/>${t.STARTTIME } ~ ${t.ENDTIME }</td>
						<td>${t.PROCESS }</td>
						<td>${t.BOOK }</td>
						<td>o</td>
						<td>
							<input type="button" class="w3-btn w3-black" value="수정" id="modify${t.NUM }" onclick="modify(this)"/>&nbsp;
							<input type="button" class="w3-btn w3-black" value="삭제" id="delete${t.NUM }" onclick="del(this)"/>&nbsp;
							<input type="button" class="w3-btn w3-black" value="종강" id="finish${t.NUM }" onclick="finish(this)"/>&nbsp;
							<input type="button" class="w3-btn w3-black" value="저장" id="save${t.NUM }" style="display: none" onclick="save(this)"/>&nbsp;
							<input type="button" class="w3-btn w3-black" value="취소" id="cancel${t.NUM }" style="display: none" onclick="cancel(this)"/>&nbsp;
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="w3-modal" id="searchModal" style="color: #e7e7e7; padding-top: 20%; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">날짜 또는 과목을 선택하세요.</font></label><br/>
	</div>
</div>

<script>
	// 수업셋팅
	function setting(){
		location.href="/class/set";
	}
	
	// 신규반 개설
	function newClass(){
		location.href="/class/create";
	}
	
	// 메인으로 마우스오버
	function mouseOver(element){
		element.style.color = "red";
	}
	
	// 메인에서 마우스리브
	function mouseLeave(element){
		element.style.color = "black";
	}
	
	// 검색
	function search(){
		var date = $("#date").val();
		var subject = $("#subject").val();
		if(subject!="선택"){
			$.ajax({
				type : "post",
				url : "/class/search?date="+date+"&subject="+subject,
				async : false,
				success : function(txt){
					$("#studyList").html(txt);
				}
			});
		} else {
			$("#searchModal").fadeIn(500).delay(700).fadeOut(500);
		}
	}
	
	// 수정
	function modify(element){
		
	}
</script>