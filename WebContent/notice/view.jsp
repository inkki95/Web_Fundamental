


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
   <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/js/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	<style>
        
    </style>
</head>
<body>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-expand-md navbar-dark" style="background-color:#7952b3;">
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
	    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">홈 <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/notice/list.jsp">공지사항</a>
	      </li>
	      
	    </ul>
	    <!-- 
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>
	   	 -->
	  </div>
	</nav>
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
	        	<form method="post" name="f" action="save.jsp">
				  <div class="form-group">
				    <label for="writer">작성자</label>
				    <input type="text" class="form-control" id="writer" name="writer" value="성영한" placeholder="작성자를 입력해주세요">
				  </div>
				  <div class="form-group">
				    <label for="title">제목</label>
				    <input type="text" class="form-control" id="title" name="title" value="타이틀" placeholder="제목을 입력해주세요">
				  </div>
				  <div class="form-group">
				    <label for="content">내용</label>
				    <textarea class="form-control" id="content" name="content" rows="10">안녕하세요...</textarea>
				  </div>
				</form>
				<div class="text-right" style="margin-bottom : 20px;">
					<a href="" id="updateNotice" class="btn btn-outline-success">수정</a>
					<a href="" id="deleteNotice" class="btn btn-outline-danger">삭제</a>
					<a href="list.jsp" class="btn btn-outline-primary">목록</a>
				</div>
	        </div>
        </div>
    </div>


<footer class="bd-footer bg-dark text-muted">
	  <div class="container-fluid p-3 p-md-5">
	    
	    <p>Designed and built with all the love in the world by the <a href="/docs/4.5/about/team/">Bootstrap team</a> with the help of <a href="https://github.com/twbs/bootstrap/graphs/contributors">our contributors</a>.</p>
	    <p>Currently v4.5.0. Code licensed <a href="https://github.com/twbs/bootstrap/blob/master/LICENSE" target="_blank" rel="license noopener">MIT</a>, docs <a href="https://creativecommons.org/licenses/by/3.0/" target="_blank" rel="license noopener">CC BY 3.0</a>.</p>
	  </div>
	</footer>
	
</body>
</html>