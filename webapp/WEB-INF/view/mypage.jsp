<%@page import="T1_Dto.ResCustomer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="T1_Dto.Pay" %>
<%@ page import="T1_Dto.Customer" %>
<%@page import="T1_Dao.PkDao"%>
<%@page import="T1_Dao.ResCustomerDao"%>
<%@ page import="T1_Dto.Package" %>

<%String path = request.getContextPath();%>
<link rel="styLesheet" href="<%=path%>/css/mypage.css">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<style>
ul{ list-style: none;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function toggle(obj){  
	// 버튼에 해당하는  li 얻어오기
    let li  = obj.parentElement;
 
	//li영역을 기준으로   detail 영역,  패키지정보영역과, flag 영역 얻어오기
    let infoDiv  =  li.querySelector("#info");            
    let flagTag =   li.querySelector("#flag");
    let detail =    li.querySelector(".detail");
    
    //각 패키지의 상세영역 flag값 얻어오기
    let flag = flagTag.value;            
    if( flag ==0){            	         	
    	//package_list();   
        detail.style.display="block";
        infoDiv.innerHTML="패키지명: 행복한 패키지";
        flagTag.value=1;
    }else{      
        detail.style.display="none";
        flagTag.value=0;
    }
}
</script>
</head>
<body>

<%String id = (String)session.getAttribute("id");%>


<header>
<div class = "h_wrap">
<div class= "title">
AcornTourMypage
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
<table class="customer_info">
<caption>회원 정보</caption>
<tr>
<td>이름</td>
<td>아이디(이메일)</td>
<td>휴대폰번호</td>
<td>성별</td>
<td>마일리지</td>
</tr>
<% Customer customer = (Customer) request.getAttribute("customer"); 
%>
<tr>
<td><%=customer.getName() %></td>
<td><%=customer.getId() %></td>
<td><%=customer.getPhone() %></td>
<td><%=customer.getGender() %></td>
<td><%=customer.getMileage() %></td>
</tr>

</table>
<table>

</table>
<%
ArrayList<Pay> list = (ArrayList<Pay>)request.getAttribute("list");
PkDao pkdao = new PkDao();
	for(Pay pay : list){
Package pk = pkdao.package_where_pk_num(pay.getPk_num());
%>
<table>
<caption>결제내역</caption>
<tr>
<td>결제코드</td>
<td>아이디(이메일)</td>
<td>패키지명</td>
<td>결제금액</td>
<td>인원</td>
</tr>
<tr>
<td> <%= pay.getPay_code()%></td>
<td> <%= pay.getId() %></td>
<td> <a href="package_detail?pk_num=<%=pay.getPk_num() %>"><%= pk.getPk_name() %></a></td>
<td> <%= pay.getPrice() %></td>
<td> <%= pay.getPersons() %></td>
</tr>
</table>
<details>
<summary>예약자 정보 보기</summary>

<%
ResCustomerDao resdao = new ResCustomerDao();
ArrayList<ResCustomer> reslist = resdao.res(pay.getPay_code());
%>

<table>
<tr>
<td>예약 코드</td>
<td>성명</td>
<td>영문 성명</td>
<td>생년월일</td>
<td>휴대폰 번호</td>
<td>성별</td>
</tr>

</table>
<%
for(ResCustomer res : reslist){
 %>
<table>
<tr>
<td><%=res.getRes_code() %></td>
<td><%=res.getName() %></td>
<td><%=res.getEng_name() %></td>
<td><%=res.getBirth() %></td>
<td><%=res.getPhone() %></td>
<td><%=res.getGender() %></td>
</tr>

</table>

<%}
%></details><%	} %>

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