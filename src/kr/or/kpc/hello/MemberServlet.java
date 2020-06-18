package kr.or.kpc.hello;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kpc.dao.MemberDao;
import kr.or.kpc.dto.MemberDto;
//http://localhost:8080/hello.kpc?id=syh1011&pwd=1234
@WebServlet("/member.kpc")
public class MemberServlet extends HttpServlet{
	public void service(HttpServletRequest request, HttpServletResponse response) 
	throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>											");
		out.println("	<head>										");
		out.println("		<title>member servlet</title>			");
		out.println("	</head>										");
		out.println("	<body>										");
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> list = dao.select();
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>번호</th><th>이름</th><th>주소</th>");
		out.println("</tr>");
		
		for(MemberDto dto : list) {
			int num = dto.getNum();
			String name = dto.getName();
			String addr = dto.getAddr();
			out.println("<tr>");
			out.println("<td>"+num+"</td><td>"+name+"</td><td>"+addr+"</td>");
			out.println("</tr>");
		}
		out.println("</table>");
		out.println("</body>");
		out.println("</html>");
		
	}
}
