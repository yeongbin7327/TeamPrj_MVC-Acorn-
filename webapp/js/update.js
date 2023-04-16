function update(){
	// alert("가입이 완료되었습니다.");
	let frm = document.updatefrm;
	let new_pw = frm.new_pw;
	let pwcheck = frm.pwcheck;
	let new_phone = frm.new_phone;
	
	if(new_pw.value==""){
		alert("새 비밀번호를 입력해주세요");
		new_pw.focus();
	}else if(pwcheck.value==""){
		alert("비밀번호를 확인해주세요.");
		pwcheck.focus();		
	}else if(pwcheck.value != new_pw.value){
		alert("비밀번호가 일치하지 않습니다.");
		pwcheck.focus();
	}else if(new_phone.value==""){
		alert("새 전화번호를 입력해주세요.");
		new_phone.focus();
	}else{
		frm.submit();
		alert("변경이 완료되었습니다.");
	}
}