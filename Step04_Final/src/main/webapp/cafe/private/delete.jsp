<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 글의 번호
	int num=Integer.parseInt(request.getParameter("num"));

	//글의 작성자가 로그인된 아이디와 같은지 확인하기
	String id=(String)session.getAttribute("id");
	String writer=CafeDao.getInstance().getData(num).getWriter();
	//글 작성자가 로그인한 아이디와 다르면
	if(!writer.equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 글 삭제하기 없기!");
		return; //메소드를 여기서 끝내기
	}

	//DB에서 삭제
	boolean isSuccess=CafeDao.getInstance().delete(num);
	//응답
	String cPath=request.getContextPath();
	response.sendRedirect(cPath + "/cafe/list.jsp");
%>