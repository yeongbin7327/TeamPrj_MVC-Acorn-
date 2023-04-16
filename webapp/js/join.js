function join(){
	let frm = document.joinfrm;
	let name = frm.name;
	let id = frm.id;
	let pw = frm.pw;
	let pwcheck = frm.pwcheck;
	let phone = frm.phone;
	let birth = frm.birth;
	let gender = frm.gender;
	
	if(name.value==""){
		alert("이름을 입력해주세요");
		name.focus();
	}else if(id.value==""){
		alert("아이디를 입력해주세요.");
		id.focus();
	}else if(pw.value==""){
		alert("비밀번호를 입력해주세요.");
		pw.focus();
	}else if(pwcheck.value==""){
		alert("비밀번호를 확인해주세요.");
		pwcheck.focus();
	}else if(pwcheck.value != pw.value){
		alert("비밀번호가 일치하지 않습니다.");
		pwcheck.focus();
	}else if(phone.value==""){
		alert("전화번호를 입력해주세요.");
		phone.focus();
	}else if(birth.value==""){
		alert("주민등록번호를 입력해주세요.");
		birth.focus();
	}else if(gender.value==""){
		alert("성별을 선택해주세요.");
		gender.focus();
	}else{
		alert("가입이 완료되었습니다.");
		frm.submit();
	}
}