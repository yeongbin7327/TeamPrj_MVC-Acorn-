package T1_Dto;

public class ResCustomer {

	String res_code;
	String pay_code;
	String name;
	String eng_name;
	int birth;
	String phone;
	String gender;
	
	public ResCustomer() {
	}

	public ResCustomer(String res_code, String pay_code, String name, String eng_name, int birth, String phone,String gender) {
		this.res_code = res_code;
		this.pay_code = pay_code;
		this.name = name;
		this.eng_name = eng_name;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
	}

	public ResCustomer(String name, String eng_name, int birth, String phone, String gender) {
		this.name = name;
		this.eng_name = eng_name;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
	}

	public ResCustomer(String pay_code, String name, String eng_name, int birth, String phone, String gender) {
		this.pay_code = pay_code;
		this.name = name;
		this.eng_name = eng_name;
		this.birth = birth;
		this.phone = phone;
		this.gender = gender;
	}

	public String getRes_code() {
		return res_code;
	}

	public void setRes_code(String res_code) {
		this.res_code = res_code;
	}

	public String getPay_code() {
		return pay_code;
	}

	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEng_name() {
		return eng_name;
	}

	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Customer [res_code=" + res_code + ", pay_code=" + pay_code + ", name=" + name + ", eng_name=" + eng_name
				+ ", birth=" + birth + ", phone=" + phone + ", gender=" + gender + "]";
	}

}
