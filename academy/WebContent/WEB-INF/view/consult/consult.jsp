<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div style="width: 100%; height: 100%">
	<div class="w3-row" style="margin-top: 100px; margin-left: 10%; margin-bottom: 5%">
		<label><font style="font-size: 20px"><b>신규상담</b></font></label>&nbsp;
		<label onclick="location.href='/'" onmouseover="mouseOver(this)" onmouseleave="mouseLeave(this)">메인으로</label><br/>
		<label><input type="radio" class="w3-radio" name="type" id="call"/>&nbsp;전화상담</label>&nbsp;&nbsp;
		<label><input type="radio" class="w3-radio" name="type" id="visit" style="margin-bottom: 10px"/>&nbsp;방문상담</label>
		<input type="date" id="date" style="display: none"/><br/>
		<table style="width: 80%; border: solid black 1px">
			<tr>
				<td rowspan="8" style="width: 20%; background-color: #e7e7e7" align="center">
					<label><font style="font-size: 18px"><b>상담</b></font></label>
				</td>
				<td align="left" style="width: 10%; padding-left: 10px">
					<label><b>이름</b></label>&nbsp;
				</td>
				<td style="width: 30%">
					<input type="text" placeholder="ex) 홍길동" id="name" style="width: 100%; padding-left: 10px"/>
				</td>
				<td rowspan="8" style="width: 20%" align="center">
					<label><font style="font-size: 18px"><b>과목</b></font></label>
				</td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px">
					<label><b>학교</b></label>&nbsp;
				</td>
				<td>
					<input type="text" placeholder="ex) 한국고등학교" id="school" style="width: 100%; padding-left: 10px"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px">
					<label><b>학년</b></label>&nbsp;
				</td>
				<td>
					<input type="text" placeholder="ex) 1학년" id="grade" style="width: 100%; padding-left: 10px"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px">
					<label><b>학부모 HP</b></label>&nbsp;
				</td>
				<td>
					<input type="text" placeholder="ex) 010-1234-5678" id="pPhone" style="width: 100%; padding-left: 10px"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px">
					<label><b>학생 HP</b></label>&nbsp;
				</td>
				<td>
					<input type="text" placeholder="ex) 010-1234-5678" id="sPhone" style="width: 100%; padding-left: 10px"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px">
					<label><b>집 TEL</b></label>&nbsp;
				</td>
				<td>
					<input type="text" placeholder="ex) 02-123-4567" id="tell" style="width: 100%; padding-left: 10px"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px">
					<label><b>주소</b></label>&nbsp;
				</td>
				<td>
					<input type="text" placeholder="ex) 서울시 강남구 역삼동 123-4번지 101호" id="address" style="width: 100%; padding-left: 10px"/>
				</td>
			</tr>
			<tr>
				<td align="left" style="padding-left: 10px">
					<label><b>비고</b></label>&nbsp;
				</td>
				<td>
					<input type="text" id="etc" style="width: 100%; padding-left: 10px"/>
				</td>
			</tr>
			<tr>
				<td style="background-color: #e7e7e7" align="center">
					<label><font style="font-size: 18px"><b>상담내용</b></font></label>
				</td>
				<td colspan="3">
					<textarea rows="4" cols="60" style="resize: none; width: 100%; padding-left: 10px"></textarea>
				</td>
			</tr>
		</table><br/><br/>
		
		<!-- 중학교 테이블 -->
		<table style="width: 80%">
			<tr align="center" style="background-color: #e7e7e7">
				<td colspan="2" style="width: 20%">
					<b>내신성적</b>
				</td>
				<td style="width: 10%">
					<b>점수</b>
				</td>
				<td style="width: 10%">
					<b>반등수</b>
				</td>
				<td style="width: 10%">
					<b>전교등수</b>
				</td>
				<td style="width: 10%">
					<b>등급</b>
				</td>
				<td style="width: 10%">
					<b>백분위</b>
				</td>
				<td style="width: 10%">
					<b>전과목등수</b>
				</td>
				<td>
					<b>비고</b>
				</td>
			</tr>
			<c:forEach var="i" begin="1" end="3">
				<tr align="center">
					<td rowspan="4" style="background-color: #e7e7e7">
						<b>중${i }</b>
					</td>
					<td rowspan="2" style="background-color: #e7e7e7">
						1학기
					</td>
					<td>
						중간
					</td>
					<td>
						<input type="text" id="m${i }mClassRank" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="m${i }mAllRank" style="width: 100%" placeholder="ex) 1/450 "/>
					</td>
					<td>
						<input type="text" id="m${i }mGrade" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="m${i }mhundred" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="m${i }mSubjectRank" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="m${i }mEtc" style="width: 100%"/>
					</td>
				</tr>
				<tr align="center">
					<td>
						기말
					</td>
					<td>
						<input type="text" id="m${i }eClassRank" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="m${i }eAllRank" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="m${i }eGrade" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="m${i }ehundred" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="m${i }eSubjectRank" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="m${i }eEtc" style="width: 100%"/>
					</td>
				</tr>
				<tr align="center">
					<td rowspan="2" style="background-color: #e7e7e7">
						2학기
					</td>
					<td>
						중간
					</td>
					<td>
						<input type="text" id="m${i }mClassRank2" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="m${i }mAllRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="m${i }mGrade2" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="m${i }mhundred2" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="m${i }mSubjectRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="m${i }mEtc2" style="width: 100%"/>
					</td>
				</tr>
				<tr align="center">
					<td>
						기말
					</td>
					<td>
						<input type="text" id="m${i }eClassRank2" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="m${i }eAllRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="m${i }eGrade2" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="m${i }ehundred2" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="m${i }eSubjectRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="m${i }eEtc2" style="width: 100%"/>
					</td>
				</tr>
			</c:forEach>
			
			<!-- 고등학교 테이블 -->
			<c:forEach var="i" begin="1" end="3">
				<tr align="center">
					<td rowspan="4" style="background-color: #e7e7e7">
						<b>고${i }</b>
					</td>
					<td rowspan="2" style="background-color: #e7e7e7">
						1학기
					</td>
					<td>
						중간
					</td>
					<td>
						<input type="text" id="h${i }mClassRank" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="h${i }mAllRank" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }mGrade" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="h${i }mhundred" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="h${i }mSubjectRank" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }mEtc" style="width: 100%"/>
					</td>
				</tr>
				<tr align="center">
					<td>
						기말
					</td>
					<td>
						<input type="text" id="h${i }eClassRank" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="h${i }eAllRank" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }eGrade" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="h${i }ehundred" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="h${i }eSubjectRank" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }eEtc" style="width: 100%"/>
					</td>
				</tr>
				<tr align="center">
					<td rowspan="2" style="background-color: #e7e7e7">
						2학기
					</td>
					<td>
						중간
					</td>
					<td>
						<input type="text" id="h${i }mClassRank2" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="h${i }mAllRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }mGrade2" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="h${i }mhundred2" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="h${i }mSubjectRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }mEtc2" style="width: 100%"/>
					</td>
				</tr>
				<tr align="center">
					<td>
						기말
					</td>
					<td>
						<input type="text" id="h${i }eClassRank2" style="width: 100%" placeholder="ex) 1/40"/>
					</td>
					<td>
						<input type="text" id="h${i }eAllRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }eGrade2" style="width: 100%" placeholder="ex) 1등급"/>
					</td>
					<td>
						<input type="text" id="h${i }ehundred2" style="width: 100%" placeholder="ex) ??"/>
					</td>
					<td>
						<input type="text" id="h${i }eSubjectRank2" style="width: 100%" placeholder="ex) 1/450"/>
					</td>
					<td>
						<input type="text" id="h${i }eEtc2" style="width: 100%"/>
					</td>
				</tr>
			</c:forEach>
		</table><br/><br/>
		
		<!-- 모의고사 테이블 -->
		<table style="width: 80%">
			<tr align="center" style="background-color: #e7e7e7">
				<td style="width: 20%; background-color: #e7e7e7">
					모의고사
				</td>
				<td style="width: 10%; background-color: #e7e7e7">
					회차
				</td>
				<td style="width: 10%; background-color: #e7e7e7">
					점수
				</td>
				<td style="width: 10%; background-color: #e7e7e7">
					등급
				</td>
				<td style="width: 10%; background-color: #e7e7e7">
					백분위
				</td>
				<td style="width: 10%; background-color: #e7e7e7">
					반등수
				</td>
				<td style="width: 10%; background-color: #e7e7e7">
					전과목등수
				</td>
				<td style="background-color: #e7e7e7">
					비고
				</td>
			</tr>
			<tr>
				<c:forEach var="i" begin="1" end="3">
					<tr>
						<td rowspan="4" align="center" style="background-color: #e7e7e7">
							고${i }
						</td>
						<td align="center">
							3월
						</td>
						<td>
							<input type="text" id="h${i }aPoint3" style="width: 100%" placeholder="ex) 95.2점"/>
						</td>
						<td>
							<input type="text" id="h${i }aGrade3" style="width: 100%" placeholder="ex) 1등급"/>
						</td>
						<td>
							<input type="text" id="h${i }ahundred3" style="width: 100%" placeholder="ex) ??"/>
						</td>
						<td>
							<input type="text" id="h${i }aClassRank3" style="width: 100%" placeholder="ex) 1/40"/>
						</td>
						<td>
							<input type="text" id="h${i }aAllRank3" style="width: 100%" placeholder="ex) 1/450"/>
						</td>
						<td>
							<input type="text" id="h${i }aEtc3" style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							6월
						</td>
						<td>
							<input type="text" id="h${i }aPoint6" style="width: 100%" placeholder="ex) 95.2점"/>
						</td>
						<td>
							<input type="text" id="h${i }aGrade6" style="width: 100%" placeholder="ex) 1등급"/>
						</td>
						<td>
							<input type="text" id="h${i }ahundred6" style="width: 100%" placeholder="ex) ??"/>
						</td>
						<td>
							<input type="text" id="h${i }aClassRank6" style="width: 100%" placeholder="ex) 1/40"/>
						</td>
						<td>
							<input type="text" id="h${i }aAllRank6" style="width: 100%" placeholder="ex) 1/450"/>
						</td>
						<td>
							<input type="text" id="h${i }aEtc6" style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							9월
						</td>
						<td>
							<input type="text" id="h${i }aPoint9" style="width: 100%" placeholder="ex) 95.2점"/>
						</td>
						<td>
							<input type="text" id="h${i }aGrade9" style="width: 100%" placeholder="ex) 1등급"/>
						</td>
						<td>
							<input type="text" id="h${i }ahundred9" style="width: 100%" placeholder="ex) ??"/>
						</td>
						<td>
							<input type="text" id="h${i }aClassRank9" style="width: 100%" placeholder="ex) 1/40"/>
						</td>
						<td>
							<input type="text" id="h${i }aAllRank9" style="width: 100%" placeholder="ex) 1/450"/>
						</td>
						<td>
							<input type="text" id="h${i }aEtc9" style="width: 100%"/>
						</td>
					</tr>
					<tr>
						<td align="center">
							11월
						</td>
						<td>
							<input type="text" id="h${i }aPoint11" style="width: 100%" placeholder="ex) 95.2점"/>
						</td>
						<td>
							<input type="text" id="h${i }aGrade11" style="width: 100%" placeholder="ex) 1등급"/>
						</td>
						<td>
							<input type="text" id="h${i }ahundred11" style="width: 100%" placeholder="ex) ??"/>
						</td>
						<td>
							<input type="text" id="h${i }aClassRank11" style="width: 100%" placeholder="ex) 1/40"/>
						</td>
						<td>
							<input type="text" id="h${i }aAllRank11" style="width: 100%" placeholder="ex) 1/450"/>
						</td>
						<td>
							<input type="text" id="h${i }aEtc11" style="width: 100%"/>
						</td>
					</tr>
				</c:forEach>
			</tr>
		</table><br/>
		<div>
			<input type="button" class="w3-btn w3-dark-gray" value="TEST 예약" onclick="test()"/>&nbsp;
			<input type="date" id="testDate" style="display: none"/>
			<select id="testSelect" style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px; display: none">
				<option>
					선택
				</option>
				<c:forEach var="t" items="${process }">
					<option>
						${t.PROCESS }
					</option>
				</c:forEach>
			</select>&nbsp;&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="예약" style="display: none" onclick="reserve()" id="reserve"/>
			<input type="button" class="w3-btn w3-dark-gray" value="취소" style="display: none" id="rcancel"/>
		</div><br/>
		<div align="center" style="width: 80%">
			<input type="button" class="w3-btn w3-dark-gray" value="저장"/>&nbsp;&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="취소" onclick="cancel()"/>
		</div>
	</div>
</div>

<script>
	// 방문상담 클릭
	$("#visit").click(function(){
		$("#date").show();
	});
	
	// 전화상담 클릭
	$("#call").click(function(){
		$("#date").hide();
	});
	
	// TEST 예약 클릭
	function test(){
		$("#testDate").show();
		$("#testSelect").show();
		$("#reserve").show();
		$("#rcancel").show();
	}
	
	// TEST 예약 취소 클릭
	$("#rcancel").click(function(){
		$("#testDate").val("");
		$("#testDate").hide();
		$("#testSelect").hide();
		$("#testSelect").val("선택");
		$("#reserve").hide();
		$("#rcancel").hide();
	});
	
	// TEST 예약 - 예약 클릭
	function reserve(){
		alert("aa");
	}
	
	// 취소 클릭
	function cancel(){
		location.href="/";
	}
	
	// 메인으로 마우스오버
	function mouseOver(element){
		element.style.color = "red";
	}
	
	// 메인에서 마우스리브
	function mouseLeave(element){
		element.style.color = "black";
	}
</script>