<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="board.model.vo.Board" %>
<%
		Board board = (Board)request.getAttribute("board");
		int currentPage = ((Integer)request.getAttribute("currentPage")).intValue();
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
<h2 align="center"><%= board.getBoardNum() %> 번 게시글 상세보기</h2>
<br>
<table align="center" width="500" border="1" cellspacing="0" 
cellpadding="5">
<tr><th width="120">제 목</th><td><%= board.getBoardTitle() %></td></tr>
<tr><th>작성자</th><td><%= board.getBoardWriter() %></td></tr>
<tr><th>등록날짜</th><td><%= board.getBoardDate() %></td></tr>
<tr>
	<th>첨부파일</th>
	<td>
		<% if(board.getBoardOriginalFileName() != null){ %>
		<a href="/testel/bfdown?ofile=<%= board.getBoardOriginalFileName() %>&rfile=<%= board.getBoardRenameFileName() %>"><%= board.getBoardOriginalFileName() %></a>
		<% }else{ %>
		&nbsp;
		<% } %>
	</td>
</tr>
<tr><th>내 용</th><td><%= board.getBoardContent() %></td></tr>
<tr><th colspan="2">
<% if(loginMember != null){ //댓글달기 , 수정페이지로 이동 둘 다 로그인 상태여야 함
	if(loginMember.getUserid().equals(board.getBoardWriter())){ 
	// 로그인한 유저 아이디와 작성자 아이디가 같으면 수정페이지로 이동 보이게 함%>
		<a href="/testel/bupview?bnum=<%=board.getBoardNum() %>&page=<%=currentPage %>">[수정페이지로 이동]</a>
		&nbsp; &nbsp;
		<a href="/testel/bdelete?bnum=<%= board.getBoardNum()%>&level=<%= board.getBoardLevel()%>
		&rfile=<%= board.getBoardRenameFileName() %>">[글삭제]</a> <!-- 글삭제 클릭하면 파일도 삭제하게 함 -->
		&nbsp; &nbsp; 
<% }else{ //로그인한 회원과 글 작성자가 다르면 댓글 달기 활성화함%>
		<a href="/testel/views/board/boardReplyForm.jsp?bnum=<%=board.getBoardNum()  %>&page=<%=currentPage %>">[댓글달기]</a>
<% }}%>
&nbsp; &nbsp;
<button onclick="javascript:location.href='/testel/blist?page=<%=currentPage %>'"> 목록</button></th>
</tr>

</table>
</body>
</html>