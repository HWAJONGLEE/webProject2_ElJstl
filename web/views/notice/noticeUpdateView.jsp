<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    		Notice notice = (Notice)request.getAttribute("notice");
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
<h2 align="center"><%= notice.getNoticeNo() %> 번 글 수정페이지</h2>
<br>
<form action="/testel/nupdate.ad" method="post" enctype="multipart/form-data" >
<input type="hidden" name="no" value="<%= notice.getNoticeNo()%>">
<input type="hidden" name="ofile" value="<%= notice.getOriginalFilepath()%>">
<input type= "hidden" name= "rfile" value= "<%= notice.getRenameFilepath() %>">
<table align="center" width="500" border="1" cellspacing="0" 
cellpadding="5">
<tr><th>제 목</th><td><input type="text" name="title" size="50" value="<%= notice.getNoticeTitle() %>"></td></tr>
<tr><th>작성자</th><td><input type="text" name="writer" readonly value="<%= notice.getNoticeWriter() %>"></td></tr>
</tr>
<tr>
	<th>첨부 파일 :</th>
	<td>
			<% if (notice.getOriginalFilepath() != null){ %>
			<%= notice.getOriginalFilepath() %> &nbsp; 
			<input type="checkbox" name="deleteFlag" value="yes"> 파일삭제 <br>
			
			<%}else{ %>
					첨부파일 없음<br>
					<input type="file" name="upfile"><!--  여러개 등록하려면 인풋타입 여러개 해야함  첨부파일이 없다면 나오게 함-->
			<%} %>
	</td>
</tr>
<tr><th>내 용</th><td><textarea rows="5" cols="50" name="content"><%=notice.getNoticeContent() %></textarea></td></tr>
<tr><th colspan="2">
<input type="submit" value="수정하기"> &nbsp; 
<input type="reset" value="수정취소"> &nbsp;
<input type= "button" value="이전 페이지로" onclick="javascript:history.go(-1); return false;">
</th></tr>
</table>
</form>
</body>
</html>