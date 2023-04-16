

function check(){
	
	/*
	//alert("call");
	let frm = document.frm;
	let name = frm.name;
	let eng_name = frm.eng_name;
	let birth = frm.birth;
	let phone = frm.phone;
	let gender = frm.gender;
	*/
	let chk1 = frm.chk1;
	let chk2 = frm.chk2;
	let chk3 = frm.chk3;
	let chk4 = frm.chk4;
	let chk5 = frm.chk5;
	/*
	if(name.value ==""){
		alert("이름을 입력하세요.");
		name.focus();
	}else if(eng_name.vlaue == ""){
		alert("영문이름을 입력하세요.");
		eng_name.focus();
	}else if(birth.value == ""){
		alert("생년월일을 입력하세요.");
		birth.focus();
	}else if(phone.value ==""){
		alert("휴대폰 번호를 입력하세요.");
		phone.focus();
	}else if (gender.value ==""){
		alert("성별을 입력하세요.");
		gender.focus();
	}
	*/
	if(chk1.value ==""){
		alert("약관동의를 해주세요.");
		
	}else if(chk2.vlaue == ""){
		alert("약관동의를 해주세요.");
		
	}else if(chk3.value == ""){
		alert("약관동의를 해주세요.");
		
	}else if(chk4.value ==""){
		alert("약관동의를 해주세요.");
		
	}else if (chk5.value ==""){
		alert("약관동의를 해주세요.");
		
	}else{
		frm.submit();
	}
	
}