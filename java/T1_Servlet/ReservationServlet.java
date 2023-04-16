package T1_Servlet;

import java.io.IOException;
import java.lang.ProcessHandle.Info;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import T1_Dao.PayDao;
import T1_Dao.ResCustomerDao;
import T1_Dto.Pay;
import T1_Dto.ResCustomer;
import T1_Service.ResCustomerService;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String price = request.getParameter("price");
		String pk_num  = request.getParameter("pk_num");
		
		System.out.println( "price=" + price);
		
		request.setAttribute("price", price);
		request.setAttribute("pk_num", pk_num);
		
		request.getRequestDispatcher("WEB-INF/view/res.jsp").forward(request, response);
		System.out.println("가져와요");
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("가져와요2");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		String pk_num  = request.getParameter("pk_num_h");
		String price = request.getParameter("price_h");
		String persons = request.getParameter("persons");
		Integer totalprice = Integer.valueOf(price)*Integer.valueOf(persons);
		
		System.out.print(id);
		System.out.print(pk_num);
		System.out.print(price);
		System.out.print(persons);
		
		Pay pay = new Pay(id, pk_num, totalprice, Integer.valueOf(persons));
		System.out.print(pay);
		
		
		PayDao paydao = new PayDao();
		String pay_seq = paydao.insert(pay);
		
		System.out.print(pay_seq);
		
		String[] names = request.getParameterValues("name");
		String[] eng_names = request.getParameterValues("eng_name");
		String[] births = request.getParameterValues("birth");
		String[] phones = request.getParameterValues("phone");
		String[] genders = request.getParameterValues("genders");
		
		for(int i=0; i < names.length ;i++) {
			
			String name = names[i];
			String eng_name = eng_names[i];
			String birth = births[i];
			String phone = phones[i];
			String gender = genders[i];
			
			ResCustomer res = new ResCustomer(pay_seq, name, eng_name, Integer.valueOf(birth), phone, gender);
			System.out.print(res);
			ResCustomerDao dao = new ResCustomerDao();
			ResCustomerService service = new ResCustomerService(dao);		
			service.insert(res);
			
			System.out.print(name);
			System.out.print(eng_name);
			System.out.print(birth);
			System.out.print(phone);
			System.out.print(gender);
		}
		
		response.sendRedirect("tourMypage");
			
	}
	
}