<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%
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
	        	<h3>공지사항 작성</h3>
	        	<form method="post" name="f" action="save.jsp">
				  <div class="form-group">
				    <label for="writer">작성자</label>
				    <input type="text" class="form-control" id="writer" name="writer" placeholder="작성자를 입력해주세요">
				  </div>
				  <div class="form-group">
				    <label for="title">제목</label>
				    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
				  </div>
				  <div class="form-group">
				    <label for="content">내용</label>
				    <textarea class="form-control" id="content" name="content" rows="10"></textarea>
				  </div>
				</form>
				<div class="text-right" style="margin-bottom : 20px;">
					<a href="" id="saveNotice" class="btn btn-outline-danger">저장</a>
					<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">목록</a>
				</div>
	        </div>
        </div>
    </div>
	<script>
		$(function(){
			$("#saveNotice").click(function(e){
				//a 기능은 href 속성에 있는 주소로 이동하는데 이런 기능을 제거한다는 의미
				e.preventDefault();
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
				
				f.submit();
			});
		});
	</script>
<%@ include file="../inc/footer.jsp"%>







