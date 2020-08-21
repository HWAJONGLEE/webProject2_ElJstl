<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testel</title>
</head>
<body>
<%-- <%@ include file="../common/header.jsp" %> --%>
<c:import url="/views/common/header.jsp"/>
<hr>
<h2 align="center">${ board.boardNum } 번 게시글 상세보기</h2>
<br>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
<tr><th width="120">제 목</th><td>${ board.boardTitle }</td></tr>
<tr><th>작성자</th><td>${ board.boardWriter }</td></tr>
<tr><th>등록날짜</th><td><fmt:formatDate value="${ board.boardDate }" type="date" pattern=""/> </td></tr>
<tr>
	<th>첨부파일</th>
	<td>
		<c:if test="${ !empty board.boardOriginalFileName }">
		<%-- <% if(board.getBoardOriginalFileName() != null){ %> --%>
		<c:url var="ubf" value="/bfdown">
			<c:param name="ofile" value="${ board.boardOriginalFileName }" />
			<c:param name="rfile" value="${ board.boardRenameFileName }" />
		</c:url>
		<a href="${ ubf }">${ board.boardOriginalFileName }</a>
		</c:if>
		<c:if test="${ empty board.boardOriginalFileName }">
		<%-- <% }else{ %> --%>
		&nbsp;
		<%-- <% } %> --%>
		</c:if>
	</td>
</tr>
<tr><th>내 용</th><td>${ board.boardContent }</td></tr>
<tr><th colspan="2">
<%-- <% if(loginMember != null){ //댓글달기 , 수정페이지로 이동 둘 다 로그인 상태여야 함 --%>
	<c:if test="${ !empty sessionScope.loginMember }">
	<c:if test="${ sessionScope.loginMember.userid eq board.boardWriter }">
	<!-- if(loginMember.getUserid().equals(board.getBoardWriter())){  -->
	<!-- // 로그인한 유저 아이디와 작성자 아이디가 같으면 수정페이지로 이동 보이게 함%> -->
		<c:url var="ubup" value="bupview">
			<c:param name="bnum" value="${ board.boardNum }" />
			<c:param name="page" value="${ currentPage }" />
 		</c:url>
		<a href="${ ubup }">[수정페이지로 이동]</a>
		&nbsp; &nbsp;
		<c:url var="ubd" value="/bdelete" >
			<c:param name="bnum" value="${ board.boardNum }" />
			<c:param name="level" value="${ board.boardLevel }" />
			<c:param name="rfile" value="${ board.boardRenameFileName }" />
		</c:url>
		<a href="${ ubd }">[글삭제]</a> <!-- 글삭제 클릭하면 파일도 삭제하게 함 -->
		&nbsp; &nbsp; 
		</c:if>
<%-- <% }else{ //로그인한 회원과 글 작성자가 다르면 댓글 달기 활성화함%> --%>
		<c:if test="${ sessionScope.loginMember.userid ne board.boardWriter }">
			<c:url var="brf" value="/views/board/boardReplyForm.jsp">
				<c:param name="bnum" value="${ board.boardNum }"/>
				<c:param name="page" value="${ currentPage }"/>
			</c:url>
		<a href="${ brf }">[댓글달기]</a>
		</c:if>
	</c:if>
<%-- <% }}%> --%>
&nbsp; &nbsp;
<c:url var="ubl" value="/blist">
	<c:param name="page" value="${ currentPage }" />
</c:url>
<button onclick="javascript:location.href='${ ubl }'"> 목록</button></th>
</tr>

</table>
</body>
</html>