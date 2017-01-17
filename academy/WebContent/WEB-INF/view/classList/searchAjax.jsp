<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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