package T1_Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import T1_Dao.CustomerDao;
import T1_Service.CustomerService;

@WebServlet("/tourLogin")
public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println(id);
		System.out.println(pw);
		
		CustomerDao cusdao = new CustomerDao();
		CustomerService service = new CustomerService(cusdao);
		int result = service.checkLogin(id, pw);
		
		System.out.println(result);
		
		if(result == 1 ){
			
		  HttpSession  session= 	request.getSession();
		  session.setAttribute("id", id);
            request.getRequestDispatcher("package_list").forward(request, response);
            
         } else if (result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>alert('비밀번호가 틀립니다.'); history.back(); </script>");
         } else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>alert('등록되지 않은 아이디입니다.'); history.back(); </script>");
         } else if (result == 2){
            PrintWriter script = response.getWriter();
            script.println("<script>alert('DB 오류'); history.back(); </script>");
         }

	}
}
