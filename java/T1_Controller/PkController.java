package T1_Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import T1_Dao.PkDao;
import T1_Service.PkListService;
import T1_Dto.package_info;

@WebServlet("/package_list.do")
public class PkController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 response.setCharacterEncoding("UTF-8");	
		 response.setContentType("text/plain;charset=utf-8");
		
		//패키지번호 얻어오기
		 String no = request.getParameter("no");
		 System.out.println( " 패키지 no = " + no);
		 
		PkDao dao = new PkDao();		 
		PkListService service = new PkListService(); // <==패키지목록다오(sql불러오기전)에 꼭 붙여넣기
		service.setPkDao(dao) ;		
		
		
		//no="Pj123";
	    String result = service.getListPk(no);	    
	    System.out.println(  result);	    
	    response.getWriter().print(result); //페이지 이동없이데이터만 변경(html)
		
	    //페이지이동
		//request.setAttribute("list", result);
		//request.getRequestDispatcher("/WEB-INF/view/Pklist.jsp").forward(request, response);
	}

}