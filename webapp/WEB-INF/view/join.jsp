<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>


<%String path = request.getContextPath();%>
<script src="<%=path %>/js/join.js"></script>

</head>


<link rel="styLesheet" href="<%=path%>/css/join.css">
<body>
 <%
    String id = (String)session.getAttribute("id");
    %>


<header>
<div class = "h_wrap">
<div class= "title">
AcornTourJoin
</div>	

<nav>
<div  class="nav">
<%if(id == null){ %>
|
<a href="package_list">홈으로</a>|
<a href="tourJoin">회원가입</a>|
<a href="tourLogin">로그인</a>|
<%} %>
<%if(id != null){ %>
|
<a href="package_list">홈으로</a> |
<a href="tourMypage">마이페이지</a> |
<a href="tourMypageUpdate">회원정보수정</a> |
<a href="logout">로그아웃</a> |
<%} %>
</div>
</nav>
</div>
</header>

<section>

<form name="joinfrm" action="tourJoin" method="post">
<table>
<tr>
	<th>이름</th>
	<td><input class = "box" type="text" name = "name"></td>
</tr>
<tr>
	<th>아이디</th>
	<td><input class = "box" type="text" name = "id" placeholder="ex) 1234@naver.com"></td>
	</tr>
<tr>
	<th>비밀번호</th>
	<td><input class = "box" type="password" name = "pw"></td>
</tr>
<tr>
	<th>비밀번호확인</th>
	<td><input class = "box" type="password" name = "pwcheck"></td>
</tr>
<tr>	
	<th>휴대폰번호</th>
	<td><input class = "box" type="text" name = "phone" placeholder="ex) 010-1234-5678"></td>
</tr>
<tr>
	<th>주민번호</th>
	<td><input class = "box" type="text" name = "birth" placeholder="ex) 990101-1234567"></td>
</tr>
<tr>
	<th>성별</th>
	<td>
		<input class = "circle" type="radio" name = "gender" value="남">남
		<input class = "circle" type="radio" name = "gender">여
	</td>
</tr>
<tr>
	<td colspan="2" class = "none">
		<button type="button" onclick="join()">가입하기</button>
	</td>
</tr>


</table>



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