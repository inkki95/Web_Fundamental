<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	int displayCount = 3;
	int displayPageCount = 5;
	String tempPage = request.getParameter("page");
	int cPage = 0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	
	try {
		cPage = Integer.parseInt(tempPage);
	}catch(NumberFormatException e){
		cPage = 1;
	}
	/*
	cPage = 1  => 1 - 10  => start : 0
	cPage = 2  => 11 - 20 => start : 10
	cPage = 3  => 21 - 30 => start : 20
	
	An = a1 + (n-1) * d
	
	*/
	
	NoticeDao dao = NoticeDao.getInstance();
	int start   =  (cPage-1)*displayCount;
	ArrayList<NoticeDto> list = dao.select(start ,  displayCount );
	
	
%>
	<nav aria-label="breadcrumb ">
	  <ol class="breadcrumb justify-content-end">
	    <li class="breadcrumb-item "><a href="#">홈</a></li>
	    <li class="breadcrumb-item active">공지사항</li>
	  </ol>
	</nav>
	
    <div class="container">
    	<div class="row">
	        <div class="col-md-12">
	        	<h3>공지사항 리스트</h3>
	        	<div class="table-responsive">
	        	<table class="table table-hover">
	        	  <colgroup>
	        	  	<col width = "10%"/>
	        	  	<col width = "15%"/>
	        	  	<col width = "60%"/>
	        	  	<col width = "15%"/>
	        	  </colgroup>
				  <thead>
				    <tr>
				      <th scope="col">번호</th>
				      <th scope="col">작성자</th>
				      <th scope="col">제목</th>
				      <th scope="col">등록날짜</th>
				    </tr>
				  </thead>
				  <tbody>
				    <%for(NoticeDto dto : list){%>
				    <tr>
				      <th scope="row"><%=dto.getNum() %></th>
				      <td><%=dto.getWriter() %></td>
				      <td><a href="view.jsp?page=<%=cPage%>&num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>
				      <td><%=dto.getRegdate() %></td>
				    </tr>
				    <%}%>
				    
				  </tbody>
				</table>
				<%
					/*
					128개
					Previous 1 2 3 4 5 6 7 8 9 10 Next  => currentBlock : 1block
					Previous 11 12 13 Next              => currentBlock : 2block
					
					65개
					Previous 1 2 3 4 5 6 7 Next
					*/
					int totalRows = dao.getRows();//11
					int totalPage = 0;
					int currentBlock = 0;
					int totalBlock = 0;
					
					if(totalRows%displayCount==0){
						totalPage = totalRows/displayCount;
					}else{
						totalPage =  totalRows/displayCount +1;
					}
					if(totalPage == 0){
						totalPage = 1;
					}
					
					if(cPage % displayPageCount == 0){
						currentBlock = cPage/displayPageCount;
					}else{
						currentBlock = cPage/displayPageCount +1;
					}
					
					if(totalPage%displayPageCount==0){
						totalBlock = totalPage/displayPageCount;
					}else{
						totalBlock = totalPage/displayPageCount +1;
					}
					
					int startPage = 1+(currentBlock -1) *displayPageCount;
					int endPage = displayPageCount +(currentBlock -1) *displayPageCount;
					
					if(currentBlock == totalBlock){
						endPage = totalPage;
					}
					
					
					
				%>
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  	<%if(currentBlock==1){ %>
				    <li class="page-item disabled">
				      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
				    </li>
				    <%}else{ %>
				    <li class="page-item">
				      <a class="page-link" href="list.jsp?page=<%=startPage-1 %>" tabindex="-1" aria-disabled="true">Previous</a>
				    </li>
				    <%} %>
				    <%for(int i=startPage;i<=endPage;i++){ %>
				    <li class="page-item"><a class="page-link" href="list.jsp?page=<%=i%>"><%=i %></a></li>
				    <%} %>
				    <%if(totalBlock==currentBlock){ %>
				    <li class="page-item disabled">
				      <a class="page-link" href="#">Next</a>
				    </li>
				    <%}else{ %>
				    <li class="page-item">
				      <a class="page-link" href="list.jsp?page=<%=endPage+1%>">Next</a>
				    </li>
				    <%} %>
				  </ul>
				</nav>
				
				<div class="text-right"  style="margin-bottom : 20px;">
					<a href="write.jsp?page=<%=cPage %>" class="btn btn-outline-danger">글쓰기</a>
				</div>
	        	
	        	</div>
	        </div>
        </div>
    </div>




<%@ include file="../inc/footer.jsp"%>