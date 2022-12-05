<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//삭제할 데이터의 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	FileDto dto=FileDao.getInstance().getData(num);
	
	//작성자와 id가 동일하지 않으면 삭제할 수 없도록 하는 메소드
	String id=(String)session.getAttribute("id");	
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일을 삭제하면 안됩니다.");	
		return;
	}
	
	//3. 파일 시스템에서 삭제한다(webapp/upload 폴더에서 해당파일을 삭제)
	String path=application.getRealPath("/upload")+File.separator+dto.getSaveFileName();
	//삭제할 파일의 전체 경로를 이용해서 File 객체 생성 후 해당 파일 삭제하기
	File f=new File(path);
	f.delete();
	//4. DB에서도 해당 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	//5. 응답하기(redirect 응답)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp"); //파일 목록보기로 다시 이동시킨다.	
%>
