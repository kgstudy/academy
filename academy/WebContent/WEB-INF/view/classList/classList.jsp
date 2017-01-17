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
		<input type="button" class="w3-btn w3-dark-gray" value="확인" onclick="search()"/>&nbsp;
		<input type="button" class="w3-btn w3-dark-gray" value="전체보기" onclick="searchAll()"/><br/><br/>
		<table style="width: 80%" class="w3-table w3-bordered w3-centered">
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
						<td>
							<input type="text" readonly="readonly" value="${t.CLASSNAME }" id="className${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
						</td>
						<td>
							<input type="text" readonly="readonly" value="${t.GRADE }" id="grade${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
						</td>
						<td>
							<input type="text" readonly="readonly" value="${t.CLASS }" id="classList${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
						</td>
						<td>
							<input type="text" readonly="readonly" value="${t.TEACHER }" id="teacher${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
						</td>
						<td>
							<input type="text" readonly="readonly" value="${t.PRICE }" id="price${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
						</td>
						<td>
							<input type="text" readonly="readonly" value="${t.DAY }" id="day${t.NUM }" style="border: 0px; text-align: center; width: 70px"/><br/>
							<input type="text" readonly="readonly" value="${t.STARTTIME }" id="startTime${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
							&nbsp;~&nbsp;
							<input type="text" readonly="readonly" value="${t.ENDTIME }" id="endTime${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
						</td>
						<td>
							<input type="text" readonly="readonly" value="${t.PROCESS }" id="process${t.NUM }" style="border: 0px; text-align: center; width: 70px"/>
						</td>
						<td>
							<input type="text" readonly="readonly" value="${t.BOOK }" id="book${t.NUM }" style="border: 0px; text-align: center; width: 100px"/>
						</td>
						<td>
							<c:set var="brk" value="true"/>
							<c:if test="${brk }">
								<c:set var="num" value="0"/>
								<c:forEach var="v" items="${modifyList }">
									<c:if test="${v.STUDYNUM==t.NUM }">
										<c:set var="num" value="1"/>
										<c:set var="brk" value="false"/>
									</c:if>
								</c:forEach>
							</c:if>
							<c:choose>
							 	<c:when test="${num>0 }">
									<label onclick="modifyView(${t.NUM })"><font style="color: blue">O</font></label>
							 	</c:when>
							 	<c:otherwise>
									<label>X</label>
							 	</c:otherwise>
							 </c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${t.FINISH=='o' }">
									<label><font style="font-size: 16px"><b>종강되었습니다.</b></font></label>
								</c:when>
								<c:otherwise>
									<input type="button" class="w3-btn w3-black" value="수정" id="modify${t.NUM }" onclick="modify(this)"/>&nbsp;
									<input type="button" class="w3-btn w3-black" value="삭제" id="delete${t.NUM }" onclick="del(this)"/>&nbsp;
									<input type="button" class="w3-btn w3-black" value="종강" id="finish${t.NUM }" onclick="finish(this)"/>
									<input type="button" class="w3-btn w3-black" value="저장" id="save${t.NUM }" style="display: none" onclick="save(this)"/>&nbsp;
									<input type="button" class="w3-btn w3-black" value="취소" id="cancel${t.NUM }" style="display: none" onclick="cancel(this)"/>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<div class="w3-modal" id="searchModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">기간 또는 과목을 선택하세요.</font></label><br/>
	</div>
</div>

<div class="w3-modal" id="modifyModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">수정되었습니다.</font></label><br/>
	</div>
</div>

<div class="w3-modal" id="finishModal" style="color: #e7e7e7; padding-top: 150px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">종강되었습니다.</font></label><br/>
	</div>
</div>

<div class="w3-modal" id="deleteEndModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">삭제되었습니다.</font></label><br/>
	</div>
</div>

<div class="w3-modal" id="deleteModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">삭제하시겠습니까?</font></label><br/>
		<input type="button" class="w3-btn w3-black" value="삭제" onclick="delCommit()"/>&nbsp;
		<input type="button" class="w3-btn w3-black" value="취소" onclick="$('#deleteModal').fadeOut(500)"/>
	</div>
</div>

<div class="w3-modal" id="modifyViewModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 400px; max-height: 450px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px"><b>변경내용</b></font></label><br/><br/>
		<div align="center" style="overflow-y: auto; max-height: 330px">
			<table style="width: 350px">
				<thead>
					<tr align="center">
						<td style="background-color: #33c0a3">수정날짜</td>
						<td style="background-color: #33c0a3">수정 전 내용</td>
						<td style="background-color: #33c0a3">수정 후 내용</td>
					</tr>
				</thead>
				<tbody id="viewBody"></tbody>
			</table><br/>
		</div>
		<input type="button" class="w3-btn btn-black" onclick="$('#modifyViewModal').fadeOut(500)" value="확인"/>
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
		if(subject!="선택" && date!=""){
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
	
	// 전체보기
	function searchAll(){
		$.ajax({
			type : "post",
			url : "/class/searchAll",
			async : false,
			success : function(txt){
				$("#studyList").html(txt);
			}
		});
	}
	
	// 수정
	var className = "";
	var grade = "";
	var classList = "";
	var teacher = "";
	var price = "";
	var day = "";
	var startTime = "";
	var endTime = "";
	var process = "";
	var book = "";
	function modify(element){
		var id = element.id;
		id = id.substring(id.indexOf("y")+1);
		className = $("#className"+id).val();
		grade = $("#grade"+id).val();
		classList = $("#classList"+id).val();
		teacher = $("#teacher"+id).val();
		price = $("#price"+id).val();
		day = $("#day"+id).val();
		startTime = $("#startTime"+id).val();
		endTime = $("#endTime"+id).val();
		process = $("#process"+id).val();
		book = $("#book"+id).val();
		$("#modify"+id).hide();
		$("#delete"+id).hide();
		$("#finish"+id).hide();
		$("#save"+id).show();
		$("#cancel"+id).show();
		$("#className"+id).prop("readonly", false);
		document.getElementById("className"+id).style.border = "solid red 1px";
		$("#grade"+id).prop("readonly", false);
		document.getElementById("grade"+id).style.border = "solid red 1px";
		$("#classList"+id).prop("readonly", false);
		document.getElementById("classList"+id).style.border = "solid red 1px";
		$("#teacher"+id).prop("readonly", false);
		document.getElementById("teacher"+id).style.border = "solid red 1px";
		$("#price"+id).prop("readonly", false);
		document.getElementById("price"+id).style.border = "solid red 1px";
		$("#day"+id).prop("readonly", false);
		document.getElementById("day"+id).style.border = "solid red 1px";
		$("#startTime"+id).prop("readonly", false);
		document.getElementById("startTime"+id).style.border = "solid red 1px";
		$("#endTime"+id).prop("readonly", false);
		document.getElementById("endTime"+id).style.border = "solid red 1px";
		$("#process"+id).prop("readonly", false);
		document.getElementById("process"+id).style.border = "solid red 1px";
		$("#book"+id).prop("readonly", false);
		document.getElementById("book"+id).style.border = "solid red 1px";
	}
	
	// 취소
	function cancel(element){
		var id = element.id;
		id = id.substring(id.indexOf("l")+1);
		$("#modify"+id).show();
		$("#delete"+id).show();
		$("#finish"+id).show();
		$("#save"+id).hide();
		$("#cancel"+id).hide();
		$("#className"+id).prop("readonly", true);
		$("#className"+id).val(className);
		document.getElementById("className"+id).style.border = "0px";
		$("#grade"+id).prop("readonly", true);
		$("#grade"+id).val(grade);
		document.getElementById("grade"+id).style.border = "0px";
		$("#classList"+id).prop("readonly", true);
		$("#classList"+id).val(classList);
		document.getElementById("classList"+id).style.border = "0px";
		$("#teacher"+id).prop("readonly", true);
		$("#teacher"+id).val(teacher);
		document.getElementById("teacher"+id).style.border = "0px";
		$("#price"+id).prop("readonly", true);
		$("#price"+id).val(price);
		document.getElementById("price"+id).style.border = "0px";
		$("#day"+id).prop("readonly", true);
		$("#day"+id).val(day);
		document.getElementById("day"+id).style.border = "0px";
		$("#startTime"+id).prop("readonly", true);
		$("#startTime"+id).val(startTime);
		document.getElementById("startTime"+id).style.border = "0px";
		$("#endTime"+id).prop("readonly", true);
		$("#endTime"+id).val(endTime);
		document.getElementById("endTime"+id).style.border = "0px";
		$("#process"+id).prop("readonly", true);
		$("#process"+id).val(process);
		document.getElementById("process"+id).style.border = "0px";
		$("#book"+id).prop("readonly", true);
		$("#book"+id).val(book);
		document.getElementById("book"+id).style.border = "0px";
	}
	
	// 저장
	function save(element){
		var id = element.id;
		id = id.substring(id.indexOf("e")+1);
		var cn = $("#className"+id).val();
		var gr = $("#grade"+id).val();
		var cl = $("#classList"+id).val();
		var te = $("#teacher"+id).val();
		var pr = $("#price"+id).val();
		var da = $("#day"+id).val();
		var st = $("#startTime"+id).val();
		var et = $("#endTime"+id).val();
		var pro = $("#process"+id).val();
		var bo = $("#book"+id).val();
		var url = "/class/studyMod/"+cn+"/"+gr+"/"+cl+"/"+te+"/"+pr+"/"+da+"/"+st+"/"+et+"/"+pro+"/"+bo+"/"+id;
		$.ajax({
			type : "post",
			url : url,
			async : false,
			success : function(txt){
				if(txt){
					var ar = new Array(className, grade, classList, teacher, price, day, startTime, endTime, process, book);
					var br = new Array(cn, gr, cl, te, pr, da, st, et, pro, bo);
					for(var i=0; i<ar.length; i++){
						if(ar[i]!=br[i]){
							mod("/class/studyMod2/"+ar[i]+"/"+br[i]+"/"+id);
						}
					}
					$("#modifyModal").fadeIn(500).delay(700).fadeOut(500);
					setTimeout(function() {
						location.href="/classList";
					}, 1700);
				}
			}
		});
	}
	
	// 수정 이력 내부함수
	function mod(url){
		$.ajax({
			type : "post",
			url : url,
			async : false,
		});
	}
	
	// 수정사항 확인
	function modifyView(num){
		$.ajax({
			type : "post",
			url : "/class/modifyView/"+num,
			async : false,
			success : function(txt){
				$("#modifyViewModal").fadeIn(500);
				$("#viewBody").html(txt);
			}
		});
	}
	
	// 종강버튼 클릭
	function finish(element){
		var id = element.id;
		id = id.substring(id.indexOf("h")+1);
		$.ajax({
			type : "post",
			url : "/class/finish/"+id,
			async : false,
			success : function(txt){
				if(txt){
					$("#finishModal").fadeIn(500).delay(700).fadeOut(500);
					setTimeout(function() {
						location.href="/classList";
					}, 1700);
				} else {
					location.href="/classList";
				}
			}
		});
	}
	
	// 삭제버튼 클릭
	var delNum = "";
	function del(element){
		var id = element.id;
		id = id.substring(id.indexOf("te")+2);
		delNum = id;
		$("#deleteModal").fadeIn(500);
	}
	
	// 삭제 확인
	function delCommit(){
		$.ajax({
			type : "post",
			url : "/class/deleteStudy/"+delNum,
			async : false,
			success : function(txt){
				if(txt){
					$("#deleteModal").hide();
					$("#deleteEndModal").fadeIn(500).delay(700).fadeOut(500);
					setTimeout(function() {
						location.href="/classList";
					}, 1700);
				} else {
					location.href="/classList";
				}
			}
		});
	}
</script>