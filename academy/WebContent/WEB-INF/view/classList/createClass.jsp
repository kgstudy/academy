<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div style="width: 100%; height: 80%">
	<div class="w3-row" style="margin-top: 100px; margin-left: 10%; margin-bottom: 5%; margin-right: 10%">
		<label><font style="font-size: 20px"><b>반 만들기</b></font></label>&nbsp;&nbsp;
		<label onclick="location.href='/'" onmouseover="mouseOver(this)" onmouseleave="mouseLeave(this)">메인으로</label>&nbsp;
		<label onclick="location.href='/classList'" onmouseover="mouseOver(this)" onmouseleave="mouseLeave(this)">이전으로</label><br/><br/><br/>
		<div class="w3-row" align="center">
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 18px"><b>반 명</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="className">
					<option>선택</option>
					<c:forEach var="t" items="${className }">
						<option>${t.CLASSNAME }</option>
					</c:forEach>
				</select>
			</div>
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 18px"><b>학년</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="grade">
					<option>선택</option>
					<c:forEach var="t" items="${grade }">
						<option>${t.GRADE }</option>
					</c:forEach>
				</select>
			</div>
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 18px"><b>반</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="classList">
					<option>선택</option>
					<c:forEach var="t" items="${classList }">
						<option>${t.CLASS }</option>
					</c:forEach>
				</select>
			</div>
		</div><br/>
		<div class="w3-row" align="center">
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 18px"><b>담임</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="teacher" onchange="change(this)">
					<option>선택</option>
					<c:forEach var="t" items="${teacher }">
						<option>${t.TEACHER }</option>
					</c:forEach>
					<option>직접입력</option>
				</select><br/>
				<input type="text" placeholder="직접입력" id="teacherInput" style="padding-left: 10px; width: 150px; margin-top: 10px; display: none"/>
			</div>
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 18px"><b>수강료</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="price">
					<option>선택</option>
					<c:forEach var="t" items="${price }">
						<option>${t.PRICE }</option>
					</c:forEach>
				</select>
			</div>
			<div class="w3-col s12 m4 l4"></div>
		</div><br/> 
		<div class="w3-row" align="center" id="dayDiv">
			<div class="w3-col s12 m12 l12">
				<label><font style="font-size: 18px"><b>요일 및 시간</b></font></label>&nbsp;&nbsp;
			</div>
			<div class="w3-col s12 m12 l12">
				<input type="date" id="startDate"/>&nbsp;~&nbsp;
				<input type="date" id="endDate"/>
			</div>
			<div class="w3-row" align="center" id="div1">
				<div class="w3-col s12 m4 l4">
					<label><font style="font-size: 16px"><b>요일</b></font></label>
					<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="day">
						<option>선택</option> 
						<option>월</option>
						<option>화</option>
						<option>수</option>
						<option>목</option>
						<option>금</option>
						<option>토</option>
						<option>일</option>
						<option>평일</option>
						<option>주말</option>
						<option>매일</option>
					</select>
				</div>
				<div class="w3-col s12 m4 l4">
					<label><font style="font-size: 16px"><b>시작</b></font></label>
					<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="startH">
						<c:forEach var="i" begin="0" end="23">
							<option>${i }</option>
						</c:forEach>
					</select>&nbsp;시&nbsp;
					<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="startM">
						<c:forEach var="i" begin="0" end ="59">
							<c:choose>
								<c:when test="${i<10 }">
									<option>0${i }</option>
								</c:when>
								<c:otherwise>
									<option>${i }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>&nbsp;분&nbsp;~
				</div>
				<div class="w3-col s12 m4 l4">
					<label><font style="font-size: 16px"><b>종료</b></font></label>
					<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="endH">
						<c:forEach var="i" begin="0" end="23">
							<option>${i }</option>
						</c:forEach>
					</select>&nbsp;시&nbsp;
					<select style="width: 70px; height: 30px; border-radius: 7px; padding-left: 10px" id="endM">
						<c:forEach var="i" begin="0" end ="59">
							<c:choose>
								<c:when test="${i<10 }">
									<option>0${i }</option>
								</c:when>
								<c:otherwise>
									<option>${i }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>&nbsp;분&nbsp;
					<i class="fa fa-plus" onclick="plus()" id="plus1"></i>
				</div>
			</div>
		</div><br/>
		<div class="w3-row" align="center" id="subjectDiv">
			<div class="w3-col s12 m12 l12">
				<label><font style="font-size: 18px"><b>과정</b></font></label>&nbsp;&nbsp;
			</div>
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 16px"><b>과목</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px" id="subject">
					<option>선택</option>
					<c:forEach var="t" items="${subject }">
						<option>${t.SUBJECT }</option>
					</c:forEach>
				</select>
			</div>
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 16px"><b>과정</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px; display: none" id="process" onchange="change(this)">
				</select><br/>
				<input type="text" placeholder="직접입력" id="processInput" style="padding-left: 10px; width: 150px; margin-top: 10px; display: none"/>
			</div>
			<div class="w3-col s12 m4 l4">
				<label><font style="font-size: 16px"><b>교재</b></font></label>&nbsp;&nbsp;
				<select style="width: 100px; height: 30px; border-radius: 7px; padding-left: 10px; display: none" id="book" onchange="change(this)">
				</select>&nbsp;
				<i class="fa fa-plus" onclick="plus_()" id="plus1_" style="display: none"></i><br/>
				<input type="text" placeholder="직접입력" id="bookInput" style="padding-left: 10px; width: 150px; margin-top: 10px; display: none"/>
			</div>
		</div><br/>
		<div class="w3-row" align="center">
			<label><font style="font-size: 18px"><b>특징</b></font></label><br/>
			<input type="text" id="special" style="padding-left: 10px; width: 80%; margin-top: 10px"/>
		</div><br/>
		<div class="w3-row" align="center">
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="save"/>&nbsp;&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="취소" onclick="location.href='/classList'"/><br/>
			<div style="margin-top: 10px"><font style="color: red; display: none" id="error"></font></div>
		</div>
	</div>
</div>

<div class="w3-modal" id="createEndModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">저장되었습니다.</font></label><br/>
	</div>
</div>

<script>
	//메인으로 마우스오버
	function mouseOver(element){
		element.style.color = "red";
	}
	
	// 메인에서 마우스리브
	function mouseLeave(element){
		element.style.color = "black";
	}
	
	var startH = 0;
	var startM = 0;
	var endH = 0;
	var endM = 0;
	var day = 0;
	var title = 1;
	// 시간 + 클릭
	function plus(){
		$.ajax({
			type : "post",
			url : "/class/time/"+startH+"/"+startM+"/"+endH+"/"+endM+"/"+day+"/"+title,
			async : false,
			success : function(txt){
				$("#dayDiv").append(txt);
				startH = startH+1;
				startM = startM+1;
				endH = endH+1;
				endM = endM+1;
				day = day+1;
				title = title+1;
				arday[arday.length] = $("#day"+day);
			}
		});
	}
	
	// 시간 - 클릭
	function minus(title){
		$("#div"+title).remove();
	}
	
	// 과목 선택시
	$("#subject").change(function(){
		var subject = $("#subject").val();
		if(subject!="선택"){
			$.ajax({
				type : "post",
				url : "/class/create/process/"+subject,
				async : false,
				success : function(txt){
					$("#process").html(txt)
					$("#process").show();
				}
			});
			$.ajax({
				type : "post",
				url : "/class/create/book/"+subject,
				async : false,
				success : function(txt){
					$("#book").html(txt);
					$("#book").show();
				}
			});
			$("#plus1_").show();
		}
	});
	
	// 교재 + 선택
	var num = 0;
	function plus_(){
		var subject = $("#subject").val();
		$.ajax({
			type : "post",
			url : "/class/create/book/"+subject+"/"+num,
			async : false,
			success : function(txt){
				$("#subjectDiv").append(txt);
				num = num+1;
				arbook[arbook.length] = $("#book"+num);
			}
		});
	}
	
	// 교재 - 선택
	function minus_(num){
		$("#bookDiv"+num).remove();
	}
	
	// 직접입력 선택
	function change(element){
		var id = element.id;
		if(element.value == "직접입력"){
			$("#"+id+"Input").show();
		} else {
			$("#"+id+"Input").hide();
			$("#"+id+"Input").val("");
		}
	}
	
	// 저장클릭
	var arday = new Array($("#day"));
	var arstartH = new Array($("#startH"));
	var arstartM = new Array($("#startM"));
	var arendH = new Array($("#endH"));
	var arendM = new Array($("#endM"));
	var arbook = new Array($("#book"));
	$("#save").click(function(){
		var className = $("#className").val();
		var grade = $("#grade").val();
		var classList = $("#classList").val();
		var teacher = $("#teacher").val();
		if(teacher=="직접입력"){
			teacher = $("#teacherInput").val();
		}
		var price = $("#price").val();
		var special = $("#special").val();
		var process = $("#process").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		if(process=="직접입력"){
			process = $("#processInput").val();
		}
		var subject = $("#subject").val();
		var a = isChoose(arday);
		var b = isChoose(arstartH);
		var c = isChoose(arstartM);
		var d = isChoose(arendH);
		var e = isChoose(arendM);
		var g = isChoose(arbook);
		if(startDate!="" && endDate!=""){
			if(className!="선택" && grade!="선택" && classList!="선택" && teacher!="선택" && price!="선택" && process!="선택"){
				if(a && b && c && d && e && g){
					if(special!=""){
						arChange(arday);
						arChange(arstartH);
						arChange(arstartM);
						arChange(arendH);
						arChange(arendM);
						arChange(arbook);
						var url = "/class/save/"+className+"/"+grade+"/"+classList+"/"+teacher+"/"+price+"/"+arday+"/"
										+arstartH+"/"+arstartM+"/"+arendH+"/"+arendM+"/"+process+"/"+arbook+"/"+special+"/"+subject+"/"
										+startDate+"/"+endDate;
						$.ajax({
							type : "post",
							url : url,
							async : false,
							success : function(txt){
								$("#createEndModal").fadeIn(500);
								setTimeout(function() {
									location.href="/class/create";
								}, 700);
							}
						});
					} else {
						$("#error").html("특징을 입력해 주세요..");
						$("#error").show();
					}
				} else {
					$("#error").html("선택하지 않은 항목이 있습니다.");
					$("#error").show();
				}
			} else {
				$("#error").html("선택하지 않은 항목이 있습니다.");
				$("#error").show();
			}
		} else {
			$("#error").html("선택하지 않은 항목이 있습니다.");
			$("#error").show();
		}
	});
	
	// 항목 선택 여부
	function isChoose(ar){
		for(var i=0; i<ar.length; i++){
			if(ar[i]=="선택"){
				return false;
			}
		}
		return true;
	}
	
	// 각 항목 배열 값 변경
	function arChange(ar){
		for(var i=0 ;i<ar.length; i++){
			if(ar[i].val()=="직접입력"){
				ar[i] = $("#"+ar[i].prop("id")+"Input").val();
			} else {
				ar[i] = ar[i].val();
			}
		}
	}
</script>