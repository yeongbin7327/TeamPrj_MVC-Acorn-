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

@WebServlet("/tourMypage")
public class MypageServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		if(id != null) {
			PayDao dao = new PayDao();
			PayService payservice = new PayService(dao);
			ArrayList<Pay> list = payservice.cus_paylist(id);
			
			// 회원정보
			CustomerDao cusdao = new CustomerDao();
			CustomerService cusservice = new CustomerService(cusdao);
			Customer customer = cusservice.cus_info_all_whereid(id);
			
			// data 심기
			request.setAttribute("list",list);
			request.setAttribute("customer", customer);
			
			request.getRequestDispatcher("WEB-INF/view/mypage.jsp").forward(request, response);
		}
	}

}