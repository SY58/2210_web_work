<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//id 읽어오기
	String id=(String)session.getAttribute("id");
	//한 페이지에 표시할 글 개수, 한 페이지에 표시할 페이지 수
	int PAGE_ROW_COUNT=10;
	int PAGE_DISPLAY_COUNT=5;
	//pageNum의 기본값 설정
	int pageNum=1;
	//페이지 번호가 패러미터로 전달되는지 읽어오고, 값이 있을 경우 전달
	String strPageNum=request.getParameter("pageNum");
	if(strPageNum != null){
		pageNum=Integer.parseInt(strPageNum);	
	}
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow=FileDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //끝 페이지번호 값을 보정해준다.
	}

	//FileDto객체를 생성해서
	FileDto dto=new FileDto();
	//위에서 계산된 startRowNum, endRowNum을 담아서
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	List<FileDto> list=FileDao.getInstance().getList(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
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
					<%if(tmp.getWriter().equals(id)){ %>
						<a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a>
					<%} %>					
					</td>
				</tr>
				<%} %>
			<tbody>
			
			</tbody>		
		</table>
		<nav>
			<ul class="pagination justify-content-center">
				<%if(startPageNum!=1){ %>
				<li class="page-item">
					<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">이전</a>
				</li>
				<%} %>
				<%for(int i=startPageNum;i<=endPageNum;i++){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i %></a>
					</li>					
				<%} %>
				<%if(endPageNum<totalPageCount){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">다음</a>
					</li>
				<%} %>
			</ul>		
		</nav>
	</div>
	<script>
		function deleteConfirm(num){
			let isDelete=confirm("삭제하시겠습니까?");
			if(isDelete){
				location.href="${pageContext.request.contextPath }/file/private/delete.jsp?num="+num;
			}
		} 
	</script>
</body>
</html>