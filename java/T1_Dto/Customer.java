package T1_Dto;

public class Customer {
String name;
String id;
String pw;
String phone;
String birth;
String gender;
int mileage;

public Customer() {}

public Customer(String name, String id, String pw, String phone, String birth, String gender, int mileage) {
	this.name = name;
	this.id = id;
	this.pw = pw;
	this.phone = phone;
	this.birth = birth;
	this.gender = gender;
	this.mileage = mileage;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}


public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}


public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}


public String getBirth() {
	return birth;
}
public void setBirth(String birth) {
	this.birth = birth;
}


public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}


public int getMileage() {
	return mileage;
}
public void setMileage(int mileage) {
	this.mileage = mileage;
}

@Override
public String toString() {
	return "Customer [name=" + name + ", id=" + id + ", pw=" + pw + ", phone=" + phone + ", birth=" + birth
			+ ", gender=" + gender + ", mileage=" + mileage + "]";
}



}
