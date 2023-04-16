package T1_Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import T1_Dto.Package;
import T1_Dto.package_info;

public class PkDao {

	
	//연결정보
	String driver = "oracle.jdbc.driver.OracleDriver" ;
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="system";
	String password="1234";
	Connection con= null;
		
	private void dbCon() {
		
		try {
			Class.forName(driver);
			con  = DriverManager.getConnection(url, user, password);
			if( con != null) {
				System.out.println(" 연결성공");
			}	
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
	}
		
	// 패키지 1개 조회
	public package_info pk(String pk_num) {
			
		dbCon();
		String sql = " select pk_num,pk_name,schedule,departure,destination,price,trv_place,hotel_number,pk_imgfile, ";
		sql += " f.flight_num,to_char(f.dep_date, 'yyyy-mm-dd dy'),f.DEP_TIME,to_char(f.des_date, 'yyyy-mm-dd dy'),f.DES_TIME,f.FLIGHT_TIME,f.AIRLINE,f.ALRLINE_CLASS,f.DEP_PLACE,f.DES_PLACE, ";
		sql += " l.FLIGHT_NUM,to_char(l.dep_date, 'yyyy-mm-dd dy'),l.DEP_TIME,to_char(l.des_date, 'yyyy-mm-dd dy'),l.DES_TIME,l.FLIGHT_TIME,l.AIRLINE,l.ALRLINE_CLASS,l.DEP_PLACE,l.DES_PLACE, ";
		sql += " h.HT_KEY,h.HT_NAME,h.HT_AD,h.ROOM_TYPE,h.CHECK_TIME,h.AMENITIES,h.HT_OFFERS";
		sql += " from package_info p join flight_info f on p.departure = f.flight_num join flight_info l on p.destination = l.flight_num join hotel_info h on p.hotel_number = h.ht_key where pk_num = ? ";
		package_info pk = null;
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, pk_num);
			ResultSet  rs= pst.executeQuery();

			if(rs.next()) {
				// package_info
				String pk_name = rs.getString(2);
				String schedule = rs.getString(3);
				String Departure = rs.getString(4);
				String Destination = rs.getString(5);
				int Price = rs.getInt(6);
				String trv_place = rs.getString(7);
				String hotel_number = rs.getString(8);
				String pk_imgfile = rs.getString(9);
				
				// 출국항공편
				String flight_num = rs.getString(10);
				String dep_date = rs.getString(11);
				String dep_time = rs.getString(12);
				String des_date = rs.getString(13);
				String des_time = rs.getString(14);
				String flight_time = rs.getString(15);
				String airline = rs.getString(16);
				String alrline_class = rs.getString(17);
				String dep_place = rs.getString(18);
				String des_place = rs.getString(19);

				// 입국항공편
				String flight_num1 = rs.getString(20);
				String dep_date1 = rs.getString(21);
				String dep_time1 = rs.getString(22);
				String des_date1 = rs.getString(23);
				String des_time1 = rs.getString(24);
				String flight_time1 = rs.getString(25);
				String airline1 = rs.getString(26);
				String alrline_class1 = rs.getString(27);
				String dep_place1 = rs.getString(28);
				String des_place1 = rs.getString(29);

				// 호텔예약
				String ht_key = rs.getString(30);
				String ht_name = rs.getString(31);
				String ht_ad = rs.getString(32);
				String room_type = rs.getString(33);
				String check_time = rs.getString(34);
				String amenities = rs.getString(35);
				String ht_offers = rs.getString(36);
					
				pk = new package_info(pk_num,pk_name,schedule,Departure,Destination,Price,trv_place,hotel_number,pk_imgfile,flight_num,dep_date,dep_time,des_date,des_time,flight_time,airline,alrline_class,dep_place,des_place,flight_num1,dep_date1,dep_time1,des_date1,des_time1,flight_time1,airline1,alrline_class1,dep_place1,des_place1,ht_key,ht_name,ht_ad,room_type,check_time,amenities,ht_offers);
			}	
				
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 		
		return pk;
	}
	
	public ArrayList<Package> packagelist(){
		
		ArrayList<Package> list = new ArrayList<>();
		dbCon();
		String sql = "select * from package_info";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()) {
				String pk_num = rs.getString(1);
				String pk_name = rs.getString(2);
				String schedule = rs.getString(3);
				String departure = rs.getString(4);
				String destination = rs.getString(5);
				int price = rs.getInt(6);
				String trv_place = rs.getString(7);
				String hotel_number = rs.getString(8);
				
				Package pack_age = new Package(pk_num,pk_name,schedule,departure,destination,price,trv_place,hotel_number);
				list.add(pack_age);
			}
			
			rs.close();
			st.close();
			con.close();
			
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return list;
	}
	
	public Package package_where_pk_num(String input_pk_num){
		
		dbCon();
		Package package1=null;
		String sql = "select * from package_info where pk_num=?";
		try {
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, input_pk_num);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String pk_name = rs.getString(2);
				String schedule = rs.getString(3);
				String departure = rs.getString(4);
				String destination = rs.getString(5);
				int price = rs.getInt(6);
				String trv_place = rs.getString(7);
				String ht_key = rs.getString(8);
				
				package1 = new Package(input_pk_num, pk_name, schedule, departure, destination, price, trv_place, ht_key);
			}
			
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
				e.printStackTrace();
		}
		return package1;
	}
	
	// 테스트용 메인입니다.
	public static void main(String[] args) {
		PkDao dao = new PkDao();
		package_info result = dao.pk("Pj123");
		System.out.println(result + "정상작동");	
	}
		
}