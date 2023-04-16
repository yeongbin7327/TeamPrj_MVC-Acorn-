package T1_Dto;

public class Pay {

	String pay_code;
	String id;
	String pk_num;
	int price;
	int persons;
	
	public String getPay_code() {
		return pay_code;
	}
	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPk_num() {
		return pk_num;
	}
	public void setPk_num(String pk_num) {
		this.pk_num = pk_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPersons() {
		return persons;
	}
	public void setPersons(int persons) {
		this.persons = persons;
	}
	
	public Pay(String pay_code, String id, String pk_num, int price, int persons) {
		super();
		this.pay_code = pay_code;
		this.id = id;
		this.pk_num = pk_num;
		this.price = price;
		this.persons = persons;
	}
	
	public Pay(String id, String pk_num, int price, int persons) {
		this.id = id;
		this.pk_num = pk_num;
		this.price = price;
		this.persons = persons;
	}
	@Override
	public String toString() {
		return "Res [pay_code=" + pay_code + ", id=" + id + ", pk_num=" + pk_num + ", price=" + price + ", persons="
				+ persons + "]";
	}
	
}
