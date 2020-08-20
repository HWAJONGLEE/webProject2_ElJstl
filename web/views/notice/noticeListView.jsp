<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testel</title>
</head>
<body>
	<%-- <%@ include file="../common/header.jsp" %> --%>
	<c:import url="../common/header.jsp" />
	<hr>
	<h1 align="center">공지사항</h1>
	<br>
	<table align="center" width="500" border="1" cellspacing="0"
		cellpadding="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>첨부파일</th>
			<th>날짜</th>
		</tr>
		<c:forEach items="${ requestScope.list }" var="n">
			<%-- <% for(Notice n : list){ %> --%>
			<tr>
				<td align="right">${ n.noticeNo }</td>
				<td><a href="/testel/ndetail?noticeno=${ n.noticeNo }">${ n.noticeTitle }</a></td>
				<td>${ n.noticeWriter }</td>
				<td align="center">
				<c:if test="${ !empty n.originalFilepath }">

						<%-- <% if(n.getOriginalFilepath() != null){ %> --%>
	◎
				</c:if> 
		<c:if test="${ empty n.originalFilepath}">
		&nbsp;
		<%-- <% } %> --%>
		</c:if></td>
				<td align="center"><fmt:formatDate value="${ n.noticeDate }" /></td>
			</tr>
		</c:forEach>
		<%-- <% } %> --%>
	</table>
</body>
</html>








