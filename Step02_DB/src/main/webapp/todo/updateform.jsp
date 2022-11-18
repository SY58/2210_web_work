<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 회원의 번호를 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	//해당 할일의 번호를 DB에서 불러온 다음
	TodoDao dao=TodoDao.getInstance();
	TodoDto dto=dao.getData(num);
	//수정할 수 있는 폼을 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
</head>
<body>
	<div class="container">
	<h1>할일 수정 폼입니다.</h1>	
		<form action="${pageContext.request.contextPath }/todo/update.jsp" method="post" >
			<div>
				<label for="num">번호</label>
				<input type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly />
			</div>
			<div>
				<label for="content">내용</label>
				<input type="text" name="content" id="content" value="<%=dto.getContent() %>" />		
			</div>
			<div>
				<label for="regdate">등록일</label>
				<input type="text" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" readonly />		
			</div>
			<button type="submit">수정</button>			
			<button type="reset">취소</button>		
		</form>
		
	</div>
</body>
</html>