<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 기본정보 -->
<div class="w3-row" style="margin-top: 10px">
	<div class="w3-col s12 m2 l2" align="center" style="height: 200px; padding-top: 50px">
		<font style="font-size: 18px; color: black"><b>기본<br/>정보</b></font><br/><br/>
		<input type="button" class="w3-btn w3-black" id="mofidy" value="수정"/>
	</div>
	<div class="w3-col s12 m10 l10">
		<table style="width: 100%">
			<tr align="center">
				<td rowspan="4" style="width: 26%">
					<img src="/image/profile.jpg" style="width: 90%; height: 55%"/>
					<!-- 사진 없으면 ==> 사진<br/>(3X4) -->
				</td>
				<td style="widht: 10%"><b>이름</b></td>
				<td style="width: 18%"><input type="text" style="width: 100%; padding-left: 10px" id="name"/></td>
				<td style="width: 10%"><b>학교</b></td>
				<td style="width: 13%"><input type="text" style="width: 100%; padding-left: 10px" id="school"/></td>
				<td style="width: 10%"><b>학년</b></td>
				<td style="width: 13%"><input type="text" style="width: 100%; padding-left: 10px" id="grade"/></td>
			</tr>
			<tr align="center">
				<td><b>학생<br/>연락처</b></td>
				<td><input type="text" style="width: 100%; padding-left: 10px" id="sPhone"/></td>
				<td><b>생년월일</b></td>
				<td colspan="3"><input type="text" style="width: 100%; padding-left: 10px" id="birth"/></td>
			</tr>
			<tr align="center">
				<td><b>학부모<br/>연락처</b></td>
				<td><input type="text" style="width: 100%; padding-left: 10px" id="pPhone"/></td>
				<td><b>주소</b></td>
				<td colspan="3"><input type="text" style="width: 100%; padding-left: 10px" id="address"/></td>
			</tr>
			<tr align="center">
				<td><b>집전화</b></td>
				<td><input type="text" style="width: 100%; padding-left: 10px" id="tel"/></td>
				<td><b>입학일</b></td>
				<td><input type="text" style="width: 100%; padding-left: 10px" id="enterDay"/></td>
				<td><b>퇴원일</b></td>
				<td><input type="text" style="width: 100%; padding-left: 10px" id="exitDay"/></td>
			</tr>
			<tr align="center">
				<td><b>비고</b></td>
				<td colspan="6"><input type="text" style="width: 100%; padding-left: 10px" id="etc"/></td>
			</tr>
		</table>
	</div>
</div><hr/>

<!-- 수강정보 -->
<div class="w3-row" style="width: 100%">
	<div class="w3-col s12 m2 l2" align="center" style="height: 200px; padding-top: 50px">
		<font style="font-size: 18px; color: black"><b>수강<br/>정보</b></font><br/><br/>
		<input type="button" class="w3-btn w3-black" id="write1" value="입력"/>&nbsp;
		<input type="button" class="w3-btn w3-black" id="mofidy1" value="수정"/>
	</div>
	<div class="w3-col s12 m10 l10" align="center" style="max-height: 200px; overflow-y: auto">
		<table style="width: 100%">
			<tr align="center">
				<td style="width: 10%"><b>학년</b></td>
				<td style="width: 10%"><b>과목</b></td>
				<td style="width: 26%"><b>수강반</b></td>
				<td style="width: 10%"><b>담임</b></td>
				<td style="width: 22%"><b>요일 및 시간</b></td>
				<td style="width: 22%"><b>수강기간</b></td>
			</tr>
			<c:forEach var="t" begin="1" end="7">
				<tr align="center">
					<td><input type="text" value="고1" id="grade${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/></td>
					<td><input type="text" value="수학" id="subject${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/></td>
					<td><input type="text" value="여름방학 특강 수1" id="study${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/></td>
					<td><input type="text" value="이혁진" id="teacher${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/></td>
					<td>
						<input type="text" value="평일" id="day${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/><br/>
						<input type="text" value="14:00" id="startTime${i }" style="width: 35%; border: 0px; text-align: center" readonly="readonly"/>&nbsp;~
						<input type="text" value="18:00" id="endTime${i }" style="width: 35%; border: 0px; text-align: center" readonly="readonly"/>
					</td>
					<td>
						<input type="text" value="2017-01-01 ~" id="startDate${i }" style="width: 85%; border: 0px; text-align: center" readonly="readonly"/><br/>
						<input type="text" value="2017-12-31" id="endDate${i }" style="width: 85%; border: 0px; text-align: center" readonly="readonly"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div><hr/>

<!-- 등록현황 -->
<div class="w3-row" style="width: 100%">
	<div class="w3-col s12 m2 l2" align="center" style="height: 200px; padding-top: 50px">
		<font style="font-size: 18px; color: black"><b>등록<br/>정보</b></font><br/><br/>
		<input type="button" class="w3-btn w3-black" id="write2" value="입력"/>&nbsp;
		<input type="button" class="w3-btn w3-black" id="mofidy2" value="수정"/>
	</div>
	<div class="w3-col s12 m10 l10" align="center" style="max-height: 200px; overflow-y: auto">
		<table style="width: 100%">
			<tr align="center">
				<td style="width: 15%"><b>학년</b></td>
				<td style="width: 26%"><b>수강반</b></td>
				<td style="width: 12%"><b>결제금액</b></td>
				<td style="width: 22%"><b>수강기간</b></td>
				<td style="width: 15%"><b>결제일자</b></td>
				<td style="width: 10%"><b>결제수단</b></td>
			</tr>
			<c:forEach var="t" begin="1" end="7">
				<tr align="center">
					<td><input type="text" value="2016-09" id="division${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/></td>
					<td><input type="text" value="고1 Green" id="studyName${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/></td>
					<td><input type="text" value="600,000" id="price${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/></td>
					<td>
						<input type="text" value="2017-01-01 ~" id="studyStartDate${i }" style="width: 85%; border: 0px; text-align: center" readonly="readonly"/><br/>
						<input type="text" value="2017-01-31" id="studyEndDate${i }" style="width: 85%; border: 0px; text-align: center" readonly="readonly"/>
					</td>
					<td>
						<input type="text" value="2016-12-27" id="payDate${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/>
					</td>
					<td>
						<input type="text" value="현대카드" id="payHow${i }" style="width: 100%; border: 0px; text-align: center" readonly="readonly"/>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div><br/>

<script>
	
</script>