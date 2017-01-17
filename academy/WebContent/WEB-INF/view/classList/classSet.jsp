<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<div style="width: 100%; height: 80%">
	<div class="w3-row" style="margin-top: 100px; margin-left: 10%; margin-right: 10%">
		<label><font style="font-size: 20px"><b>수업 셋팅</b></font></label>&nbsp;&nbsp;
		<label onclick="location.href='/'" onmouseover="mouseOver(this)" onmouseleave="mouseLeave(this)">메인으로</label>&nbsp;
		<label onclick="location.href='/classList'" onmouseover="mouseOver(this)" onmouseleave="mouseLeave(this)">이전으로</label><br/><br/>
		<!-- 학년 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px">
			<label><font style="font-size: 18px"><b>학년</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="grade"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="gradeSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="gradeDiv">
				<c:forEach var="t" items="${grade }">
					<input type="text" readonly="readonly" value="${t.GRADE }" id="${t.GRADE }" style="width: 70px; margin-top: 10px; margin-right: 2px; text-align: center"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.GRADE }mod" value="수정" onclick="modcom(this)" style="margin-right: 2px"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.GRADE }del" value="삭제" onclick="del(this)"/><br/>
				</c:forEach>
			</div>
		</div>
		<!-- 반 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px">
			<label><font style="font-size: 18px"><b>반</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="classList"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="classListSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="classListDiv">
				<c:forEach var="t" items="${classList }">
					<input type="text" readonly="readonly" value="${t.CLASS }" id="${t.CLASS }" style="width: 70px; margin-top: 10px; margin-right: 2px; text-align: center"/>&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" id="${t.CLASS }mod" value="수정" onclick="modcom(this)" style="margin-right: 2px"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.CLASS }del" value="삭제" onclick="del(this)"/><br/>
				</c:forEach>
			</div>
		</div>
		<!-- 반 명 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px">
			<label><font style="font-size: 18px"><b>반 명</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="className"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="classNameSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="classNameDiv">
				<c:forEach var="t" items="${className }">
					<input type="text" readonly="readonly" value="${t.CLASSNAME }" id="${t.CLASSNAME }" style="width: 70px; margin-top: 10px; margin-right: 2px; text-align: center"/>&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" id="${t.CLASSNAME }mod" value="수정" onclick="modcom(this)" style="margin-right: 2px"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.CLASSNAME }del" value="삭제" onclick="del(this)"/><br/>
				</c:forEach>
			</div>
		</div>
		<!-- 담임 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px">
			<label><font style="font-size: 18px"><b>담임</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="teacher"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="teacherSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="teacherDiv">
				<c:forEach var="t" items="${teacher }">
					<input type="text" readonly="readonly" value="${t.TEACHER }" id="${t.TEACHER }" style="width: 70px; margin-top: 10px; margin-right: 2px; text-align: center"/>&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" id="${t.TEACHER }mod" value="수정" onclick="modcom(this)" style="margin-right: 2px"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.TEACHER }del" value="삭제" onclick="del(this)"/><br/>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="w3-row" style="margin-left: 10%; margin-right: 10%; margin-bottom: 5%">
		<!-- 수강료 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px">
			<label><font style="font-size: 18px"><b>수강료</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="price"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="priceSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="priceDiv">
				<c:forEach var="t" items="${price }">
					<input type="text" readonly="readonly" value="${t.PRICE }" id="${t.PRICE }" style="width: 70px; margin-top: 10px; margin-right: 2px; text-align: center"/>&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" id="${t.PRICE }mod" value="수정" onclick="modcom(this)" style="margin-right: 2px"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.PRICE }del" value="삭제" onclick="del(this)"/><br/>
				</c:forEach>
			</div>
		</div>
		<!-- 과목 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px">
			<label><font style="font-size: 18px"><b>과목</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="subject"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="subjectSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="subjectDiv">
				<c:forEach var="t" items="${subject }">
					<input type="text" readonly="readonly" value="${t.SUBJECT }" id="${t.SUBJECT }" style="width: 70px; margin-top: 10px; margin-right: 2px; text-align: center"/>&nbsp;
					<input type="button" class="w3-btn w3-dark-gray" id="${t.SUBJECT }sel" value="선택" onclick="sel(this)" style="margin-right: 2px"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.SUBJECT }mod" value="수정" onclick="modcom(this)" style="margin-right: 2px"/>
					<input type="button" class="w3-btn w3-dark-gray" id="${t.SUBJECT }del" value="삭제" onclick="del(this)"/><br/>
				</c:forEach>
			</div>
		</div>
		<!-- 과정 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px; display: none" id="pro">
			<label><font style="font-size: 18px"><b>과정</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="process"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="processSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="processDiv"></div>
		</div>
		<!-- 교재 DIV -->
		<div class="w3-col s12 m3 l3" align="center" style="margin-top: 20px; display: none" id="boo">
			<label><font style="font-size: 18px"><b>교재</b></font></label><br/>
			<input type="text" style="padding-left: 10px; width: 150px; margin-top: 10px" id="book"/>&nbsp;
			<input type="button" class="w3-btn w3-dark-gray" value="저장" id="bookSave" onclick="save(this)"/><br/><br/>
			<div style="overflow-y: auto; max-height: 310px" id="bookDiv"></div>
		</div>
	</div>
</div>

<div class="w3-modal" id="delModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">삭제하시겠습니까?</font></label><br/>
		<input type="button" class="w3-btn w3-black" value="삭제" onclick="delCommit()"/>&nbsp;
		<input type="button" class="w3-btn w3-black" value="취소" onclick="$('#delModal').fadeOut(500)"/>
	</div>
</div>

<div class="w3-modal" id="delEndModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">삭제되었습니다.</font></label><br/>
	</div>
</div>

<div class="w3-modal" id="modEndModal" style="color: #e7e7e7; padding-top: 200px; display: none" align="center">
	<div style="width: 300px; background-color: white; border-radius: 10px; padding-bottom: 10px; padding-top: 10px" align="center">
		<label><font style="color: blue; font-size: 20px">수정되었습니다.</font></label><br/>
	</div>
</div>

<script>
	var name = "";
	var delId = "";
	var subject = "";
	// 저장 클릭
	function save(element){
		var id = element.id;
		id = id.substring(0, id.indexOf("Save"));
		var text = $("#"+id).val();
		$.ajax({
			type : "post",
			url : "/class/add/"+id+"/"+text,
			async : false,
			success : function(txt){
				$("#"+id+"Div").html(txt);
				$("#"+id).val("");
			}
		});
	}
	
	// 수정 / 완료
	function modcom(element){
		var id = element.id;
		if(id.indexOf("mod")>0){
			id = id.substring(0, id.indexOf("mod"));
			name = $("#"+id).val();
			$("#"+id).prop("readonly", false);
			$("#"+id+"mod").val("완료");
			$("#"+id+"mod").prop("id", id+"com");
			$("#"+id+"del").val("취소");
			$("#"+id+"del").prop("id", id+"can");
		} else if(id.indexOf("com")>0){
			id = id.substring(0, id.indexOf("com"));
			var newName = $("#"+id).val();
			var url = "";
			$("#"+id+"com").val("수정");
			$("#"+id+"com").prop("id", id+"mod");
			$("#"+id+"can").val("삭제");
			$("#"+id+"can").prop("id", id+"del");
			if(subject==""){
				url = "/class/modify/"+name+"/"+newName;
			} else {
				url = "/class/modify/"+name+"/"+newName+"/"+subject;
			}
			$.ajax({
				type : "post",
				url : url,
				async : false,
				success : function(txt){
					if(txt==true){
						$("#modEndModal").fadeIn(500).delay(700).fadeOut(500);
						$("#"+id).val(newName);
					} else {
						$("#"+id).val(name);
					}
					$("#"+id).prop("readonly", true);
				}
			});
		}
	}
	
	// 삭제 / 취소
	function del(element){
		var id = element.id;
		if(id.indexOf("del")>0){
			id = id.substring(0, id.indexOf("del"));
			delId = id;
			$("#delModal").fadeIn(500);
		} else if(id.indexOf("can")>0){
			id = id.substring(0, id.indexOf("can"));
			$("#"+id).val(name);
			$("#"+id+"com").val("수정");
			$("#"+id+"com").prop("id", id+"mod");
			$("#"+id+"can").val("삭제");
			$("#"+id+"can").prop("id", id+"del");
			$("#"+id).prop("readonly", true);
		}
	}

	// 최종 삭제
	function delCommit(){
		var url = "";
		if(subject==""){
			url = "/class/delete/"+delId;
		} else {
			url = "/class/delete/"+delId+"/"+subject;
		}
		$.ajax({
			type : "post",
			url : url,
			async : false,
			success : function(txt){
				if(txt){
					$("#delEndModal").fadeIn(500);
					setTimeout(function() {
						$("#delModal").fadeOut(500);
						$("#delEndModal").fadeOut(500);
						setTimeout(function() {
							location.href="/class/set";
						}, 500)
					}, 700);
				} else {
					
				}
			}
		});
	}
	
	// 과목 선택 클릭
	function sel(element){
		var id = element.id;
		id = id.substring(0, id.indexOf("sel"));
		subject = id;
		$("#pro").show();
		$("#boo").show();
		$.ajax({
			type : "post",
			url : "/class/process/"+id,
			async : false,
			success : function(txt){
				$("#processDiv").html(txt);
				$.ajax({
					type : "post",
					url : "/class/book/"+id,
					async : false,
					success : function(txt){
						$("#bookDiv").html(txt);
					}
				});
			}
		});
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