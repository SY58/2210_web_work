<%@page import="test.file.dao.FileDao"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인된 아이디를 읽어온다(로그인을 하지 않았으면 null이다)
	String id=(String)session.getAttribute("id");
	
	//한 페이지에 몇개씩 표시한 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 테이지의 번호를 일단 1이라고 초기값 지정	
	int pageNum=1;
	
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
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
	//파일 목록을 select 해온다.
	List<FileDto> list=FileDao.getInstance().getList(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	.link{
		text-decoration-line: none;
	}
</style>
</head>
<body>
	<%-- 페이지를 include시킬 때는 WEB-INF 폴더에 있는 페이지도 include 가능하다. --%>
	<jsp:include page="/WEB-INF/include/navbar.jsp">
		<jsp:param value="file" name="thisPage"/>
	</jsp:include>	
	<div class="container">
		<a href="${pageContext.request.contextPath }/file/private/upload_form.jsp" class="btn btn-outline-primary" style="margin: 20px 0px 20px;">업로드 하기</a>
		<h3 style="margin: 0px 0px 10px; border-bottom:3px solid #0d6efd; padding:5px 0px 5px;">자료실 목록 보기</h3>
		<table class="table">
			<thead>
				<tr class="table-primary text-center">
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>크기</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(FileDto tmp:list) {%>
				<tr class="text-center">
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td>
						<a class="link" href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName() %></a>
					</td>
					<td><%=tmp.getFileSize() %></td>
					<td><%=tmp.getRegdate() %></td>
					<td>
						<%-- 글 작성자가 로그인된 아이디와 같을 때에만 삭제링크를 제공한다. --%>
						<%if(tmp.getWriter().equals(id)){ %>
							<a href="javascript:deleteConfirm(<%=tmp.getNum() %>)">삭제</a>							
						<%} %>
					</td>
				</tr>				
			<%} %>
			</tbody>
		</table>
		<nav>
			<ul class="pagination justify-content-center">
				<%if(startPageNum !=1) {%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a>
					</li>
				<%} %>				
				<%for(int i=startPageNum; i<=endPageNum; i++) {%>
					<li class="page-item <%=pageNum == i ? "active" : "" %>">
						<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
					</li>				
				<%} %>
				<%-- 마지막 페이지 번호가 전체 페이지의 갯수보다 작으면 Next링크를 제공한다. --%>
				<%if(endPageNum< totalPageCount) {%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">Next</a>
					</li>
				<%} %>
			</ul>
		</nav>
	</div>
	<script>
		function deleteConfirm(num){
			let isDelete=confirm("삭제하시겠습니까?");
			if(isDelete){
				location.href="delete.jsp?num="+num;
			}			
		}
	</script>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>