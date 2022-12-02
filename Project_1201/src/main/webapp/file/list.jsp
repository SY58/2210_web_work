<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");

	List<FileDto> list=FileDao.getInstance().getList();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
</head>
<body>
	<div class="container">
		<h1>갤러리 목록 보기</h1>
		<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp">파일 업로드</a>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일</th>
					<th>크기</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
				<%for(FileDto tmp:list) {%>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td><img src="${pageContext.request.contextPath }/upload/<%=tmp.getOrgFileName() %>" width="100" height="100" /></td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getRegdate() %></td>					
					<%-- 작성자 본인인 경우에만 노출되도록 --%>
					<td>
					<%if(tmp.getWriter()==id){ %>
						<a href="/delete.jsp">삭제</a>
					<%} %>					
					</td>
				</tr>
				<%} %>
			<tbody>
			
			</tbody>		
		</table>	
	</div>
</body>
</html>