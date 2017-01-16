<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div style="width: 100%; height: 80%">
	<div class="w3-row" style="margin-top: 100px; margin-left: 10%; margin-bottom: 10px">
		<c:choose>
			<c:when test="${login!=null }">
				<div class="w3-col s12 m4 l4" style="width: 35%; float: left;">
					<label><b><font style="color: blue">${login.NAME }</font></b></label>님 안녕하세요.&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" value="로그아웃" onclick="logout()"/>&nbsp;
					<c:if test="${login.ID == 'admin' }">
						<input type="button" class="w3-btn w3-dark-gray" value="학원현황"/>
					</c:if>
				</div>
			</c:when>
			<c:otherwise>
				<div class="w3-col s12 m4 l4" style="width: 35%; float: left;">
					ID: <input type="text" id="id" style="width: 20%"/>&nbsp;&nbsp;
					PW: <input type="password" id="pw" style="width: 20%"/>&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" value="회원가입" id="join"/>&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" value="로그인" id="login"/><br/>
					<font style="color: red; display: none" id="loginFail">아이디 또는 비밀번호를 확인해주세요.</font>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="w3-rest" style="width: 35%"></div>
		<div class="w3-col s12 m4 l4" style="width: 30%; float: right;">
			<input type="button" class="w3-btn w3-dark-gray" value="직원관리"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="MY"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="공지사항"/>
		</div>
	</div>
	<div class="w3-row" align="center">
		<table style="width: 80%; border: solid black 1px">
			<tr align="center">
				<td style="width: 20%; background-color: #e7e7e7">
					<label><font style="font-size: 18px"><b>학원생관리</b></font></label>
				</td>
				<td style="width: 20%; background-color: #e7e7e7">
					<label><font style="font-size: 18px"><b>등록현황</b></font></label>
				</td>
				<td style="width: 20%; background-color: #e7e7e7">
					<label><font style="font-size: 18px"><b>매입 / 매출</b></font></label>
				</td>
				<td style="width: 20%; background-color: #e7e7e7">
					<label><font style="font-size: 18px"><b>수업관리</b></font></label>
				</td>
				<td style="width: 20%; background-color: #e7e7e7">
					<label><font style="font-size: 18px"><b>업무보고</b></font></label>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center" style="padding-top: 10px; padding-bottom: 10px">
					<div style="border: solid gray 2px; border-radius: 5px; background-color: #e7ffe7">
						<label><font style="font-size: 30px">2016년 00월 00일 00요일</font></label>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<div>
						<label>검색</label>&nbsp;
						<input type="text" id="search" style="width: 70%; padding-left: 10px"/><br/><br/>
						<div style="border: solid gray 1px; width: 90%" align="center">
							<label><b>신규</b></label>&nbsp;00명<br/>
							<label><b>퇴원</b></label>&nbsp;00명<br/>
							<label><b>상담</b></label>&nbsp;00명<br/>
							<label><b>TEST</b></label>&nbsp;00명<br/>
							<input type="button" class="w3-btn w3-dark-gray" value="보기"/>
						</div>
					</div>
				</td>
				<td align="center">
					<div style="border: solid gray 1px; width: 90%" align="center">
						<label><font style="font-size: 20px"><b>9월 등록 현황</b></font></label><br/>
						9월 미납자 00명<br/><br/>
						8월 미납자 00명
					</div>
				</td>
				<td align="center">
					<div style="border: solid gray 1px; width: 90%" align="center">
						<label><font style="font-size: 20px"><b>오늘 할일</b></font></label><br/>
						관리지 납부하기
					</div>
				</td>
				<td align="center">
					<div style="border: solid gray 1px; width: 90%" align="center">
						<label><font style="font-size: 20px"><b>오늘 강좌</b></font></label><br/>
						고1 green 원장 5-10<br/>
						고1 blue 최성하 6-10
					</div>
				</td>
				<td align="center">
					<div style="border: solid gray 1px; width: 90%">
						<table>
							<tr align="center">
								<td rowspan="2">
									<label><b>할 일</b></label>
								</td>
								<td>
									등록 안내문 만들기
								</td>
							</tr>
							<tr align="center">
								<td>
									상담 전화하기
								</td>
							</tr>
							<tr align="center">
								<td>
									<label><b>원장알림</b></label>
								</td>
								<td>
									기말고사 시간표 안내
								</td>
							</tr>
							<tr align="center">
								<td>
									<label><b>최성하</b></label>
								</td>
								<td>
									ㅁㅁ
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" style="padding-top: 50px">
					<input type="button" class="w3-btn w3-dark-gray" value="신규상담" style="margin-bottom: 5px" onclick="consult()"/><br/>
					<input type="button" class="w3-btn w3-dark-gray" value="수강생통계" style="margin-bottom: 5px"/><br/>
					<input type="button" class="w3-btn w3-dark-gray" value="학생현황보기"/>
				</td>
				<td align="center" style="padding-top: 50px">
					<input type="button" class="w3-btn w3-dark-gray" value="등록현황보기"/>
				</td>
				<td align="center" style="padding-top: 50px">
					<input type="button" class="w3-btn w3-dark-gray" value="매입" style="margin-bottom: 5px"/><br/>
					<input type="button" class="w3-btn w3-dark-gray" value="매출" style="margin-bottom: 5px"/>
				</td>
				<td align="center" style="padding-top: 50px">
					<input type="button" class="w3-btn w3-dark-gray" value="반 만들기" style="margin-bottom: 5px"/><br/>
					<input type="button" class="w3-btn w3-dark-gray" value="수강반 현황" style="margin-bottom: 5px" id="classList"/><br/>
					<input type="button" class="w3-btn w3-dark-gray" value="개설" style="margin-bottom: 5px"/>
				</td>
				<td align="center" style="padding-top: 50px">
					<input type="button" class="w3-btn w3-dark-gray" value="업무진행" style="margin-bottom: 5px"/><br/>
					<input type="button" class="w3-btn w3-dark-gray" value="쪽지보내기" style="margin-bottom: 5px"/>
				</td>
			</tr>
		</table>
	</div>
</div>

<div class="w3-modal" id="joinModal" style="background-color: #e7e7e7; display: none">
	<div style="padding-top: 150px; padding-left: 20%; padding-right: 20%">
		<div align="center">
			<label class="w3-label"><font style="font-size: 20px"><b>회원가입</b></font></label><br/><br/>
			<table>
				<tr>
					<td colspan="2" align="center">
						<label class="w3-label">
							<input type="radio" name="radio" class="w3-radio" id="student"/>&nbsp;학생(학부모)
						</label>&nbsp;&nbsp;
						<label class="w3-label">
							<input type="radio" name="radio" class="w3-radio" id="teacher"/>&nbsp;선생님
						</label>
					</td>
				</tr>
				<tr>
					<td>
						<label class="w3-label">아이디(*)</label><br/>
					</td>
					<td style="padding-left: 20px">
						<input type="text" class="w3-input" placeholder="ID (4자 이상)" id="joinId" style="padding-left: 10px"/>
						<font style="display: none" id="idCheck"></font>
					</td>
				</tr>
				<tr>
					<td>
						<label class="w3-label">비밀번호(*)</label>
					</td>
					<td style="padding-left: 20px">
						<input type="password" class="w3-input" placeholder="비밀번호 (8자 이상)" id="joinPw" style="padding-left: 10px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label class="w3-label">비밀번호 확인(*)</label>
					</td>
					<td style="padding-left: 20px">
						<input type="password" class="w3-input" placeholder="비밀번호 확인" id="joinPw2" style="padding-left: 10px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label class="w3-label">이름(*)</label>
					</td>
					<td style="padding-left: 20px">
						<input type="text" class="w3-input" placeholder="ex) 홍길동" id="joinName" style="padding-left: 10px"/>
					</td>
				</tr>
				<tr>
					<td>
						<label class="w3-label">연락처(*)</label>
					</td>
					<td style="padding-left: 20px">
						<input type="text" class="w3-input" placeholder="ex) 010-1234-5678" id="joinPhone" style="padding-left: 10px"/>
						<font style="display: none" id="phoneCheck"></font>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" style="padding-top: 20px">
						<input type="button" class="w3-btn w3-dark-gray" value="가입" id="commit"/>&nbsp;&nbsp;
						<input type="button" class="w3-btn w3-dark-gray" value="취소" onclick="cancel()"/><br/>
						<font style="display: none" id="commitRst"></font>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<div class="w3-modal" id="endModal" style="color: #e7e7e7; padding-top: 20%; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">가입되었습니다.</font></label>
	</div>
</div>

<script>
	// 회원가입
	$("#join").click(function(){
		$("#joinModal").fadeIn(500);
	});
	
	// 회원가입 취소
	function cancel(){
		$("#joinModal").fadeOut(500);
		$("#joinId").val("");
		$("#joinPw").val("");
		$("#joinPw2").val("");
		$("#joinName").val("");
		$("#joinPhone").val("");
		$("#idCheck").hide();
		$("#commitRst").hide();
		$(".w3-radio").prop("checked", false);
	}
	
	// 아이디 중복체크
	$("#joinId").keyup(function(){
		var id = $("#joinId").val();
		if(id.length>=4){
			$.ajax({
				type : "post",
				url : "/member/idCheck/"+id,
				async : false,
				success : function(txt){
					if(txt){
						$("#idCheck").prop("color", "green");
						$("#idCheck").html("사용 가능한 아이디입니다.");
					} else {
						$("#idCheck").prop("color", "red");
						$("#idCheck").html("이미 사용중인 아이디입니다.");
					}
				}
			});
		} else {
			$("#idCheck").prop("color", "red");
			$("#idCheck").html("아이디는 4자 이상으로 설정해주세요.");
		}
		$("#idCheck").show();
	});
	
	// 비밀번호 입력란에서 엔터키 입력
	$("#pw").keydown(function(txt){
		if(txt.keyCode==13){
			$("#login").trigger("click");
		}
	});
	
	// 로그인버튼 클릭
	$("#login").click(function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		if(id.length>0 && pw.length>0){
			$.ajax({
				type : "post",
				url : "/member/login/"+id+"/"+pw,
				async : false,
				success : function(txt){
					if(txt){
						location.href="/";
					} else {
						$("#loginFail").show();
					}
				}
			});
		}
	});
	
	// 회원가입 가입버튼 클릭
	$("#commit").click(function(){
		var id = $("#joinId").val();
		var pw = $("#joinPw").val();
		var pw2 = $("#joinPw2").val();
		var name = $("#joinName").val();
		var phone = $("#joinPhone").val();
		var student = $("#student");
		var teacher = $("#teacher");
		var rst = $("#commitRst");
		var type = "";
		if(student.prop("checked")){
			type = "학생";
		} else if(teacher.prop("checked")){
			type = "선생님";
		}
		if(!(student.prop("checked") || teacher.prop("checked"))){
			rst.prop("color", "red");
			rst.html("학생(학부모) 또는 선생님을 선택해주세요.");
			rst.show();
		} else if(id.length<1 || pw.length<1 || pw2.length<1 || name.length<1 || phone.length<1){
			rst.prop("color", "red");
			rst.html("누락된 항목이 있습니다.");
			rst.show();
		} else {
			if(pw==pw2){
				if(pw.length>=8){
					$.ajax({
						type : "post",
						url : "/member/join/"+id+"/"+pw+"/"+name+"/"+phone+"/"+type,
						async : false,
						success : function(txt){
							if(txt){
								$("#endModal").fadeIn(500);
								setTimeout(function() {
									$("#endModal").fadeOut(500);
									cancel();
								}, 700);
							} else {
								rst.prop("color", "red");
								rst.html("회원가입중 오류가 발생하였습니다.\n잠시후 다시 시도해 주세요.");
								rst.show();
							}
						}
					});
				} else {
					rst.prop("color", "red");
					rst.html("비밀번호는 8자 이상으로 설정해주세요.");
					rst.show();
				}
			} else {
				rst.prop("color", "red");
				rst.html("비밀번호와 확인이 일치하지 않습니다.");
				rst.show();
			}
		}
	});
	
	// 로그아웃 버튼클릭
	function logout(){
		$.ajax({
			type : "post",
			url : "/member/logout",
			async : false,
			success : function(){
				location.href="/";
			}
		});
	}
	
	// 신규상담 버튼클릭
	function consult(){
		location.href="/consult";
	}
	
	// 수강반 현황 클릭
	$("#classList").click(function(){
		location.href="/classList";
	});
</script>