<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//GET방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다.
	int num=Integer.parseInt(request.getParameter("num"));
	//MemberDao 객체를 이용해서 삭제하고 성공여부를 리턴받는다.	
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.delete(num);
	//boolean isSuccess=MemberDao.getInstance().delete(num);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
	<div class="container">
		<%-- 작업의 성공 여부에 따라 다른 내용을 응답해준다. --%>
		<%if(isSuccess){%>
			<p>
				<strong><%=num %></strong>번 회원의 정보가 삭제되었습니다.
				<a href="${pageContext.request.contextPath }/member/list.jsp">리스트로 돌아가기</a>
			</p>	
		<%}else{%>
			<p>
				회원정보 삭제 실패!
				<a href="${pageContext.request.contextPath }/member/list.jsp">리스트로 돌아가기</a>
			</p>
		<%}	%>
	</div>	
</body>
</html>