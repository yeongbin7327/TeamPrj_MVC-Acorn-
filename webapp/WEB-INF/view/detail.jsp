<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="T1_Dto.package_info" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%String path = request.getContextPath();%>
<link rel="styLesheet" href="<%=path%>/css/detail.css">
<%package_info tour = (package_info)request.getAttribute("info");
String pk_num= (String)request.getAttribute("pk_num");%>

</head>
<body>

<%String id = (String)session.getAttribute("id");%>

<header>
<div class = "h_wrap">
<div class= "title">AcornTour</div>	

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

<div class="wrap">

<div class="detail_head">

<div class="detail_head_1">
<img src="<%=path %>/images/<%=tour.getPk_imgfile()%>">
</div>

<div class="detail_head_2">

<table>

<tr>
<td>패키지이름</td>
<td>일정</td>
<td>가격</td>
<td>여행지</td>
</tr>

<tr>
<td><span class="pk_name"><%=tour.getPk_name()%></span></td>
<td><%=tour.getSchedule() %></td>
<td><%=tour.getPrice()%>원 ~부터</td>
<td><%=tour.getTrv_place()%> </td>	
</tr>

</table>

<p>패키지번호 : <%=tour.getPk_num()%></p>

<button onclick="location.href='reservation?price=<%= tour.getPrice()%>&&pk_num=<%=pk_num%>'">지금당장 예약하기</button> 

</div>
</div>

<hr class="hr_1">

<table class="flight_info">

<tr>
<td>출ㆍ입국 분류</td>
<td>항공편 번호</td>
<td>출발일</td>
<td>출발 시간</td>
<td>도착일</td>
<td>도착시간</td>
<td>총 비행시간</td>
<td>항공사</td>	
<td>항공사 분류</td>
<td>출발지</td>
<td>도착지</td>
</tr>

<tr>
<td>출국 항공편</td>
<td><%=tour.getFlight_num()%></td>
<td><%=tour.getDep_date()%></td>
<td><%=tour.getDep_time() %></td>
<td><%=tour.getDes_date()%></td>
<td><%=tour.getDes_time()%></td>
<td><%=tour.getFlight_time()%></td>
<td><%=tour.getAirline()%> </td>	
<td><%=tour.getAlrline_class()%></td>
<td><%=tour.getDep_place()%></td>
<td><%=tour.getDes_place()%></td>
</tr>

<tr>
<td>입국항공편</td>
<td><%=tour.getFlight_num1()%></td>
<td><%=tour.getDep_date1()%></td>
<td><%=tour.getDep_time1() %></td>
<td><%=tour.getDes_date1()%></td>
<td><%=tour.getDes_time1()%></td>
<td><%=tour.getFlight_time1()%></td>
<td><%=tour.getAirline1()%> </td>	
<td><%=tour.getAlrline_class1()%></td>
<td><%=tour.getDep_place1()%></td>
<td><%=tour.getDes_place1()%></td>
</tr>

</table>

<table class="hotel_info"> 

<tr>
<td>호텔명</td>
<td>주소</td>
<td>객실 타입</td>
<td>체크인 & 아웃</td>
<td>객실 제공</td>
<td>호텔 제공</td>
</tr>

<tr>
<td><%=tour.getHt_name()%></td>
<td><%=tour.getHt_ad()%></td>
<td><%=tour.getRoom_type()%></td>
<td><%=tour.getCheck_time()%></td>
<td><%=tour.getAmenities()%></td>
<td><%=tour.getHt_offers()%> </td>
</tr>

</table>

</div>

</section>

<footer>
AcornTour Footer
</footer>

</body>
</html>
