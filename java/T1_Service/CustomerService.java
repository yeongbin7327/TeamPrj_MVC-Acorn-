package T1_Service;

import T1_Dao.CustomerDao;
import T1_Dto.Customer;

public class CustomerService {

	CustomerDao dao;

	public CustomerService() {

	}

	public CustomerService(CustomerDao dao) {
		this.dao = dao;
	}

	public void insert(Customer customer) {
		dao.insert(customer);
	}

	public int checkLogin(String id, String pw) {
		int result = dao.loginCheck(id, pw);
		return result;
	}

	public Customer cus_info_all_whereid(String loginid) {
		Customer customer = dao.cus_info_all_whereid(loginid);
		return customer;
	}
	
	public void CustomerUpdate(Customer customer) {
		dao.update(customer);
	}
}
