package T1_Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import T1_Dto.Customer;

public class CustomerDao {

	// db작업 
	// 연결정보
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "system";
	String password = "1234";
	Connection con = null; // Connection(전역변수) 초기화
			
	// controller -> service -> DAO -> view 순서
	
	// db연결
	private void dbCon() {
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.print("연결성공");
		
		
		
	}

	// 회원가입
	public void insert(Customer customer) {
		dbCon();
		String sql = "insert into cus_info values(?,?,?,?,?,?,?)";
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, customer.getName());
			pst.setString(2, customer.getId());
			pst.setString(3, customer.getPw());
			pst.setString(4, customer.getPhone());
			pst.setString(5, customer.getBirth());
			pst.setString(6, customer.getGender());
			pst.setInt(7, 0);
			pst.executeUpdate();
			
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public int loginCheck(String Id, String Pw) {
		dbCon();
	    String sql = "select Pw from Cus_info where Id = ? ";
	    try {
	        PreparedStatement pst = con.prepareStatement(sql);
	        pst.setString(1, Id);
	        ResultSet rs = pst.executeQuery();
	        if(rs.next()) {
	            if(rs.getString("Pw").equals(Pw)) {
	               return 1;
	            }else {
	               return 0;
	            }
	         }
	        return -1;
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return 2;
	 }
	
//	String loginid 넣어 모든 칼럼 값 불러오기
	public Customer cus_info_all_whereid(String loginid) {
		Customer customer = null;
		dbCon();
		String sql = "select * from cus_info where Id=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, loginid);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
			String name = rs.getString(1);
			String id = rs.getString(2);
			String pw = rs.getString(3);
			String phone = rs.getString(4);
			String birth = rs.getString(5);
			String gender = rs.getString(6);
			int mileage = rs.getInt(7);
			customer = new Customer(name, id, pw, phone, birth, gender, mileage);
			}
			rs.close();
			pst.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return customer;
		
	}
	
	public void update(Customer customer) {
		
		dbCon();
		String sql = "update cus_info set pw = ?, phone = ? where id = ? ";
		
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, customer.getPw());
			pst.setString(2, customer.getPhone());
			pst.setString(3, customer.getId());
			
			pst.executeUpdate();
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}
		
	}

	// 테스트용 메인입니다.
	public static void main(String[] args) {
		
		CustomerDao dao  = new CustomerDao();
		int result  = dao.loginCheck("bin7143@naver.com", "1q2w3e4r");
		System.out.println(result + "정상작동");
		
	}
	
}
