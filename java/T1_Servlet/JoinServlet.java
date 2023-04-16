package T1_Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import T1_Dao.CustomerDao;
import T1_Dto.Customer;
import T1_Service.CustomerService;

@WebServlet("/tourJoin")
public class JoinServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		request.getRequestDispatcher("WEB-INF/view/join.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("post성공");
		// 넘어온 데이터 가져오기
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		String gender = request.getParameter("gender");
		
		//회원 객체 생성
		Customer customer = new Customer(name, id, pw, phone, birth, gender, 0);
		
		// 회원 dao 생성
		CustomerDao cusdao = new CustomerDao();
		
		// 회원 서비스 회원dao매개변수로 생성
		CustomerService cusservice = new CustomerService(cusdao);
		
		// 회원 insert
		cusservice.insert(customer);
		 
		response.sendRedirect("tourLogin");
		
		
	}
}
