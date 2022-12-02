<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파일 시스템 상에서 webapp의 upload 폴더까지의 절대경로를 얻어낸다.
	String realPath=application.getRealPath("/upload");
	//해당 경로를 access할 수 있는 파일 객체 생성
	File f=new File(realPath);
	if(!f.exists()){ //만일 폴더가 존재하지 않으면
		f.mkdir();//upload 폴더 만들기
	}	
	//cos.jar에 있는 MultipartRequest 클래스로 객체 생성하기
	MultipartRequest mr=new MultipartRequest(request,//내부적으로 필요한 HttpServletRequest 객체 전달 
			realPath, 	//업로드된 파일을 저장할 경로 
			1024*1024*100, 	//최대 업로드 사이즈 제한
			"utf-8", 	//한글 파일명 깨지지 않도록 
			new DefaultFileRenamePolicy()); //동일한 파일이 존재하면 자동으로 파일을 rename해서 저장하도록
	/*
		위의 MultipartRequest 객체가 예외가 발생하지 않고 잘 생성되었다면 파일 업로드가 성공한 것이다.
		따라서 mr에 들어있는 참조값을 이용해서 폼 전송된 값을 추출해서 저장만 잘 하면 된다.	
	*/
	//2. 폼 전송되는 title을 읽어온다.
	String title=mr.getParameter("title");
	//3. 파일의 작성자(업로더)는 HttpSession 객체에서 읽어온다.
	String writer=(String)session.getAttribute("id");
	//4.추가로 원본 파일명, 저장된 파일명, 파일 사이즈도 얻어내서 FileDto 객체에 담아서
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	long fileSize=mr.getFile("myFile").length();	
	//업로드된 파일의 정보를 FileDto에 담고
	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	boolean isSuccess=FileDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
	<script>
		<%if(isSuccess){%>
			alert("파일 저장에 성공했습니다.")
			location.href="${pageContext.request.contextPath }/file/list.jsp";
		<% }else{%>
			alert("파일 저장에 실패했습니다.")
			location.href="upload_form.jsp";		
		<%}%>
	</script>
</body>
</html>