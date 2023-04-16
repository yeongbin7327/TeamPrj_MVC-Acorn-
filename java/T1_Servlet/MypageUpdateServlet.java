package T1_Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import T1_Dao.CustomerDao;
import T1_Dao.PayDao;
import T1_Dto.Customer;
import T1_Dto.Pay;
import T1_Service.CustomerService;
import T1_Service.PayService;

@WebServlet("/tourMypageUpdate")
public class MypageUpdateServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		// dao 디비작업
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		if(id != null) {
			
			// 회원정보
			CustomerDao cusdao = new CustomerDao();
			CustomerService cusservice = new CustomerService(cusdao);
			Customer customer = cusservice.cus_info_all_whereid(id);
			
			// data 심기
			request.setAttribute("customer", customer);
			
			request.getRequestDispatcher("WEB-INF/view/mypageupdate.jsp").forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String new_pw = request.getParameter("new_pw");
		String new_phone = request.getParameter("new_phone");
		String id = request.getParameter("id");
		
		CustomerDao dao = new CustomerDao();
		CustomerService service = new CustomerService(dao);
		Customer customer = new Customer();
		
		customer.setPw(new_pw);
		customer.setPhone(new_phone);
		customer.setId(id);
		
		service.CustomerUpdate(customer);
		
		response.sendRedirect("tourMypageUpdate");
	}

}