package T1_Service;

import T1_Dao.ResCustomerDao;
import T1_Dto.ResCustomer;

public class ResCustomerService {
	
	ResCustomerDao dao;
	
	public ResCustomerService() {
		// TODO Auto-generated constructor stub
	}
	public ResCustomerService(ResCustomerDao dao) {
		this.dao = dao;
	}
	
	public void insert(ResCustomer cusomer) {
		dao.insert(cusomer);
	}

}