<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	//한 페이지에 몇개씩 표시한 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정	
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
	int totalRow=CafeDao.getInstance().getCount();
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //끝 페이지번호 값을 보정해준다.
	}
	
	//CafeDto 객체를 생성해서
	CafeDto dto=new CafeDto();
	//위에서 계산된 startRowNum, endRowNum을 담고
	dto.setStartNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//CafeDto를 인자로 전달해서 글목록 얻어오기
	List<CafeDto> list=CafeDao.getInstance().getList(dto);
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	.link{
		text-decoration-line: none;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
	<jsp:param value="cafe" name="thisPage"/>
	</jsp:include>
	<div class="container">
		<a href="${pageContext.request.contextPath }/cafe/private/insertform.jsp" class="btn btn-outline-info" style="margin: 20px 0px 20px;">새글 작성</a>
		<h3 style="margin: 0px 0px 10px; border-bottom:3px solid #0dcaf0; padding:5px 0px 5px;">카페 글 목록입니다.</h3>
		<table class="table">
			<thead class="table-info text-center">
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성일</th>
				</tr>				
			</thead>
			<tbody>
				<%for(CafeDto tmp:list) {%>
					<tr class="text-center">
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getWriter() %></td>
						<td>
							<a class="link" href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a>
						</td>
						<td><%=tmp.getViewCount() %></td>
						<td><%=tmp.getRegdate() %></td>
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
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>