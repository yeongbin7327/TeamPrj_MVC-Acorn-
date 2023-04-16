package T1_Dto;

public class Package {

	String pk_num;
	String pk_name; 
	String schedule; 
	String departure; 
	String destination;
	int price;
	String trv_place; 
	String ht_key;
	
	public Package() {
		
	}

	public Package(String pk_num, String pk_name, String schedule, String departure, String destination, int price,
			String trv_place, String ht_key) {
		super();
		this.pk_num = pk_num;
		this.pk_name = pk_name;
		this.schedule = schedule;
		this.departure = departure;
		this.destination = destination;
		this.price = price;
		this.trv_place = trv_place;
		this.ht_key = ht_key;
	}

	public String getPk_num() {
		return pk_num;
	}

	public void setPk_num(String pk_num) {
		this.pk_num = pk_num;
	}

	public String getPk_name() {
		return pk_name;
	}

	public void setPk_name(String pk_name) {
		this.pk_name = pk_name;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTrv_place() {
		return trv_place;
	}

	public void setTrv_place(String trv_place) {
		this.trv_place = trv_place;
	}

	public String getHt_key() {
		return ht_key;
	}

	public void setHt_key(String ht_key) {
		this.ht_key = ht_key;
	}

	@Override
	public String toString() {
		return "Package [pk_num=" + pk_num + ", pk_name=" + pk_name + ", schedule=" + schedule + ", departure="
				+ departure + ", destination=" + destination + ", price=" + price + ", trv_place=" + trv_place
				+ ", ht_key=" + ht_key + "]";
	}
	
}
