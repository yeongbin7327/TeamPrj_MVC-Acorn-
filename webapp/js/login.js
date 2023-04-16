function login(){
	// alert("로그인 성공!");
	let frm = document.loginfrm;
	let id = frm.id;
	let pw = frm.pw;
	
	if(id.value==""){
		alert("아이디를 입력해주세요");
		id.focus();
	}else if(pw.value==""){
		alert("비밀번호를 입력해주세요.");
		pw.focus();

	}else{
		frm.submit();
		// alert("로그인 성공!");
	}
}