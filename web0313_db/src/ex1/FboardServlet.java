package ex1;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.FboardImpl;
import dao.FBoardDaoInter;
import vo.FboardVO;

/**
 * Servlet implementation class FboardServlet
 */
@WebServlet(name="/Fboard", urlPatterns="/tboard/Fboard")
public class FboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FboardServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));	
		int age=Integer.parseInt(request.getParameter("age"));		
		String writer= request.getParameter("writer");
		String pwd= request.getParameter("pwd");
		String subject= request.getParameter("subject");
		String content= request.getParameter("content");
		String reip= request.getRemoteAddr();	
		
		FBoardDaoInter dao = FboardImpl.getDao();
		FboardVO v = new FboardVO();
		v.setAge(age);
		v.setWriter(writer);
		v.setPwd(pwd);
		v.setSubject(subject);	
		v.setContent(content);
		v.setReip(reip);	
		System.out.println("doPost num: " + num + " writer:" + writer);
		//if(num == 0) {
			v.setPwd(pwd);
			v.setHit(0);			
			System.out.println("doPost addFboard num: " + num);
			dao.addFboard(v);		
		//}
//		else {
//			System.out.println("doPost updateFboard num: " + num + " writer:" + writer);
//			dao.updateFboard(v);
//		}
		response.sendRedirect("list.jsp");
//		
//		List<FboardVO> list = dao.list();
//		System.out.println("size: " + list.size());
		
	}
}
