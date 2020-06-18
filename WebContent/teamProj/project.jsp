<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
	<head>
		<style>
			body {
				font-family: 'Courier New' !important;
				margin: 0px;
				padding: 30px;
			}
			h1, h2, h3, h4 {padding:0;margin:0;}
			h1 {padding:10px 0; margin-bottom:15px;}
			h2 {padding:8px 0;}
			h3 {padding:6px 0;}
			h4 {padding:4px 0;}
			a {text-decoration:none;}
			.footer_name {text-align:left; padding-right:10px; padding-top:100px; color:#000000; font-weight:bold;}

		</style>
	</head>
	<body style="background-color:#CCFFCC;">
		<div style="text-align:center; padding-top:30px;">
			<div>
				
			</div>
				<img src="image.png" style="width:550px; height:500px; padding-bottom:5px;">
			<div>
				<a href="main.jsp"><span style="border-radius:30px; background-color:#006633; padding:20px; font-size:22px; font-weight:bold; color:#fff;">START</span></a>
			</div>
			<div style="height:80px;"></div>
			<!-- <h3>
				해당 페이지는 전국 응급 의료 센터를 안내해주는 페이지입니다....그리고
			
			</h3> -->
			<table style="width:100%;">
				<colgroup>
					<col style="width:30%;" />
					<col style="width:52%;" />
					<col style="width:28%;" />
				</colgroup>
				<tbody>
					<tr>
						<td></td>
						<td style="text-align:left; font-size:20px; color:#336600; line-height:30px;">
							<strong>해당 사이트는 전국 응급 의료 기관의 위치를 안내해주는 페이지입니다.
							<br />1. 119안전센터 2. AED(자동심장충격기)  3. 병원 및 약국 
							<br />start버튼을 누르면 해당 페이지로 이동하며 각 의료기관의 위치를 확인할 수 있습니다.
							<br /></strong>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
		<%@ include file="footer.jsp"%>
	</body>
	</html>