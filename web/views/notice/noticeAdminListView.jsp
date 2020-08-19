<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, notice.model.vo.Notice" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testel</title>
</head>
<body>
<%-- <%@ include file="../common/header.jsp" %> --%>
<c:import url="../common/header.jsp"/>
<hr>
<h1 align="center">공지사항</h1>
<div style="text-align:center;">
<button onclick="javascript:location.href='/testel/views/notice/noticeWriteForm.jsp';">공지글 등록</button>
</div>
<br>
<table align="center" width="500" border="1" cellspacing="0" 
cellpadding="1">
<tr><th>번호</th><th>제목</th><th>작성자</th><th>첨부파일</th>
<th>날짜</th></tr>
<% for(Notice n : list){ %>
<tr>
<td align="right"><%= n.getNoticeNo() %></td>
<td><a href="/testel/andetail?noticeno=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a></td>
<td><%= n.getNoticeWriter() %></td>
<td align="center">
	<% if(n.getOriginalFilepath() != null){ %>
	◎
	<% }else{ //첨부파일이 없을 때 %>
	&nbsp;
	<% } %>
</td>
<td align="center"><%= n.getNoticeDate() %></td>
</tr>
<% } %>
</table>
</body>
</html>