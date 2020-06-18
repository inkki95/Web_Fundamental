<%@page import="kr.or.kpc.dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%
	String tempPage = request.getParameter("page");
	String tempNum = request.getParameter("num");
	int cPage = 0;
	int num = 0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}
	
	try {
		cPage = Integer.parseInt(tempPage);
		num = Integer.parseInt(tempNum);
	}catch(NumberFormatException e){
		cPage = 1;
		num = 1;
	}
	NoticeDao dao = NoticeDao.getInstance();
	NoticeDto dto = dao.select(num);
	
	String writer = dto.getWriter();
	String title = dto.getTitle();
	String content = dto.getContent();
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
	        	<h3>공지사항 상세내용</h3>
	        	<form method="post" name="f" action="">
				  <div class="form-group">
				    <label for="writer">작성자</label>
				    <input type="text" class="form-control" id="writer" name="writer" value="<%=writer %>" placeholder="작성자를 입력해주세요">
				  </div>
				  <div class="form-group">
				    <label for="title">제목</label>
				    <input type="text" class="form-control" id="title" name="title" value="<%=title %>" placeholder="제목을 입력해주세요">
				  </div>
				  <div class="form-group">
				    <label for="content">내용</label>
				    <textarea class="form-control" id="content" name="content" rows="10"><%=content %></textarea>
				  </div>
				  <input type="hidden" name="num" value="<%=num%>"/>
				  <input type="hidden" name="page" value="<%=cPage%>"/>
				</form>
				<div class="text-right" style="margin-bottom : 20px;">
					<a href="" id="updateNotice" class="btn btn-outline-success">수정</a>
					<a href="" id="deleteNotice" class="btn btn-outline-danger">삭제</a>
					<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-primary">목록</a>
				</div>
	        </div>
        </div>
    </div>
	<script>
		$(function(){
			$("#updateNotice").click(function(e){
				e.preventDefault();
				//유효성 체크
				let writer = $("#writer").val();
				let title = $("#title").val();
				let content = $("#content").val();
				//falcy value
				if(!writer){
					alert('작성자를 입력해주세요.');
					$("#writer").focus();
					return;
				}
				if(!title){
					alert('제목을 입력해주세요.');
					$("#title").focus();
					return;
				}
				if(!content){
					alert('내용을 입력해주세요.');
					$("#content").focus();
					return;
				}
				
				f.action="update.jsp";
				f.submit();
			});
			$("#deleteNotice").click(function(e){
				e.preventDefault();
				
				f.action="delete.jsp";
				f.submit();
			});
		});
	</script>
	
	
	
	
	
	
	
	
<%@ include file="../inc/footer.jsp"%>