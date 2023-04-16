package T1_Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import T1_Dao.PkDao;
import T1_Service.PkListService;
import T1_Dto.package_info;

@WebServlet("/package_detail")
public class PackageDetailServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String pk_num  = request.getParameter("pk_num");
		
		response.setCharacterEncoding("UTF-8");	
		response.setContentType("text/plain;charset=utf-8");
		
	  	PkDao pkdao = new PkDao();
	  	package_info info = pkdao.pk(pk_num); 
		
		//PkListService service = new PkListService(); // <==패키지목록다오(sql불러오기전)에 꼭 붙여넣기
		//service.setPkDao(pkdao) ;

	  
		request.setAttribute("info", info);
		request.setAttribute("pk_num", pk_num);
		request.getRequestDispatcher("/WEB-INF/view/detail.jsp").forward(request, response);
}
}