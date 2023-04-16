<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="T1_Dto.package_info"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<%
String path = request.getContextPath();
%>
<script src="<%=path%>/js/res.js"></script>
<link rel="styLesheet" href="<%=path%>/css/res.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function abc() {
 
	
	let select = document.querySelector("#persons");
	let option = select.value;
	//alert(option);
	//인원수 
	
	let input1 = document.querySelector("#price");
	let price = input1.value;
	//alert(price);
	
	
	let input2 = document.querySelector("#totalprice");
	
	input2.value = option*price;
	$("#wrap").empty();
	for(let i = 0 ; i < option ; i ++){
		tempHtml = `<table id="res_table">
			<caption><h1>예약자 정보</h1></caption>

			<tr>
				<th>성함</th><td><input class = "box" type = "text" id="name" name ="name" Placeholder=""></td>
			</tr>
			<tr>
				<th>영문이름</th><td><input class = "box" type = "text" id="eng_name" name ="eng_name" Placeholder="ex) LimYoungbin"></td>
			</tr>
			<tr>
				<th>생년월일</th><td><input class = "box" type = "text" id="birth" name ="birth" Placeholder="ex) 981125"></td>
			</tr>
			<tr>
				<th>휴대폰번호</th><td><input class = "box" type = "text" id="phone" name ="phone" Placeholder="ex) 010-7143-7327"></td>
			</tr>
			<tr>
			<th>성별</th>
			<td><select onchange="test(this)" id="gender">
					<option value="">선택</option>
					<option value="남">남</option>
					<option value="여">여</option>
			</select></td>
			<td><input type="hidden" value="" id="genders" name="genders"></td>
		</tr>
			
		</table>`;
		$("#wrap").append(tempHtml);
	}
			 
}

function test(obj){
	
	//alert(obj);
	let div  =  obj.parentElement.parentElement;
	//alert(div);
	 div.querySelector("#genders").value = obj.value;
	
	 
}
</script>

</head>

<body>

	
	<%
	String id = (String) session.getAttribute("id");
	%>


	<header>
		<div class="h_wrap">
			<div class="title">AcornTourReservation</div>

			<nav>
				<div class="nav">
					<%
					if (id == null) {
					%>
					| <a href="package_list">홈으로</a>| <a href="tourJoin">회원가입</a>| <a
						href="tourLogin">로그인</a>|
					<%
					}
					%>
					<%
					if (id != null) {
					%>
					| <a href="package_list">홈으로</a> | <a href="tourMypage">마이페이지</a> |
					<a href="tourMypageUpdate">회원정보수정</a> | <a href="logout">로그아웃</a> |
					<%
					}
					%>
				</div>
			</nav>
		</div>
	</header>

<section>

<form name="frm" action="reservation" method="post">
<%
	String price = (String) request.getAttribute("price");
	String pk_num = (String) request.getAttribute("pk_num");
	
	
	%>
<input type="hidden" name="price_h" value="<%= price%>">
<input type="hidden" name="pk_num_h" value="<%=pk_num%>">
<div id="wrap">
<table table id="res_table">
<caption><h1>예약자 정보</h1></caption>

	<tr>
		<th>성함</th><td><input class = "box" type = "text" name ="name" Placeholder=""></td>
	</tr>
	<tr>
		<th>영문이름</th><td><input class = "box" type = "text" name ="eng_name" Placeholder="ex) LimYoungbin"></td>
	</tr>
	<tr>
		<th>생년월일</th><td><input class = "box" type = "text" name ="birth" Placeholder="ex) 981125"></td>
	</tr>
	<tr>
		<th>휴대폰번호</th><td><input class = "box" type = "text" name ="phone" Placeholder="ex) 010-7143-7327"></td>
	</tr>
	<tr>
					<th>성별</th>
					<td><select onchange="test(this)" id="gender">
							<option value="">선택</option>
							<option value="남">남</option>
							<option value="여">여</option>
					</select></td>
					<td><input type="hidden" value="" id="genders" name="genders"></td>
				</tr>
	
</table>
</div>
<table>
	<caption><h3>최종결제금액</h3></caption>
	
	<tr>
		<th>인원</th>
		<td>
			<select id="persons" name="persons" onchange="abc()">
					<option value="1">1인</option>
					<option value="2">2인</option>
					<option value="3">3인</option>
					<option value="4">4인</option>
					<option value="5">5인</option>
					<option value="6">6인</option>
					<option value="7">7인</option>
					<option value="8">8인</option>
					<option value="9">9인</option>
					<option value="10">10인</option>
				</select>
		</td>
	</tr>
	
	<tr>
		<td colspan ="2">
		<span>유류할증료&제세공과금 포함</span>
		</td>
	</tr>
	
	<tr>
		<th>총 상품금액</th>
		<td>가격 : <input type="text" id="totalprice" value="<%=price%>">
						<input type="hidden" id="price" value="<%=price%>"></td>
	</tr>
	
	<tr>	
		<th>선택사항 추가금액</th>
		<td>0원</td>
	</tr>
	
	<tr>	
		<th>-선택관광-</th>
		<td>0원</td>
	</tr>
	
	<tr>	
		<th>-호텔변경-</th>
		<td>0원</td>
	</tr>

</table>

<table>
	<caption><h3>약관동의</h3></caption>
	
	<tr>
		<th>국내여행 특별약관 (필수)</th>
		<td>
		<input type="radio" name = "chk1">동의합니다.
		<input type="radio" name = "chk1">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>개인정보 수집 및 이용 동의 (필수)</th>
		<td>
		<input type="radio" name = "chk2">동의합니다.
		<input type="radio" name = "chk2">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>개인정보 제3자 제공 동의 (필수)</th>
		<td>
		<input type="radio" name = "chk3">동의합니다.
		<input type="radio" name = "chk3">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>민감정보 수집 및 이용 (필수)</th>
		<td>
		<input type="radio" name = "chk4">동의합니다.
		<input type="radio" name = "chk4">동의하지 않습니다.
		</td>
	</tr>
	
	<tr>
		<th>위치정보 이용약관 (필수)</th>
		<td>
		<input type="radio" name = "chk5">동의합니다.
		<input type="radio" name = "chk5">동의하지 않습니다.
		</td>
	</tr>

</table>

<div class = "pay_btn">
	<button type="button" onclick="check()">결제하기</button>
	<button type="button" onclick="location.href='package_list'">결제취소</button>
</div>

</form>

</section>

<footer>

<div class = "footer_wrap">
	<div class = "footer">
		<div class = "footer1">
			<div class = "footer1_1">
				<h4>회사소개 | 이용약관 | 개인정보처리방침 | 여행약관 | 해외여행자보험 | 마케팅제휴 | 공식인증예약센터 검색 </h4>
				
				(주)Acorn | 대표 : 이호진, 김소영 | 주소 : (03161) 서울특별시 종로구 인사동 5길 41<br>
				사업자등록번호 : 102-81-39440 | <a href = "#">사업자정보확인</a> | 통신판매업신고번호 : 종로01-1806호 | 관광사업자 등록번호 : 제1993-000006호<br>
				개인정보 보호책임자 : 원재호 | 영업보증보험 : 22억 1천만원 가입 | 팩스: 02-734-0392 | 이메일 : <a href = "#">15771233@hanatour.com</a><br>
				고객센터 1577-1233 | 해외항공권문의 1899-1833
			</div>
			<div class = "footer1_2">
				※ 부득이한 사정에 의해 여행일정이 변경되는 경우 사전 동의를 받습니다.<br>
				※ Acorn투어는 개별 항공권, 단품 및 일부 여행상품에 대하여 통신판매중개자로서 통신판매의 당사자가 아니며 해당상품의 거래정보 및 거래등에 대해 책임을 지지 않습니다.<br><br>
				COPYRIGHTⓒ AcornTOUR SERVICE INC. ALL RIGHTS RESERVED
			</div>
		
		</div>
		<div class = "footer2">
			<h4>하나은행 구매안전 서비스</h4>
			<span>
			고객님은 안전거래를 위해 현금으로 결제시<br>
			(주)Acorn투어에서 가입한 하나은행으로<br>
			구매안전서비스를 이용하실 수 있습니다.<br>
			</span>
			<a href = "#">서비스 가입사실 확인</a>
		
		</div>
	</div>
	
	
	
</div>





</footer>

</body>
</html>