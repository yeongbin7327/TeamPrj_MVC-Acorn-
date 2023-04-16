<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.util.ArrayList" %>
  <%@page import="T1_Dto.package_info" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%String path = request.getContextPath();%>
<link rel="styLesheet" href="<%=path%>/css/pklist.css">

<style>

 .detail{
 display:none;
 height: 100px;
 border-style: dotted;

 }
 a{
 text-decoration: none;
 }
 ul{
 list-style: none;
 }
</style>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function package_list( obj){

let li  = obj.parentElement;	
let noTag  = li.querySelector("#no");
let no =  noTag.value;


// alert("no ; " +  no);
$.ajax(
		{
			type:"get",
			dataType:"json",
			data:{ no : no} ,
			url:"/Team1_ex1/package_list.do",	    
			success: function( data, textStatus){
		        console.log( data);	  //콘솔에서 json 데이터 확인하기 			        
		        let pk_name = data.pk_name;
		        let trv_place = data.trv_place;
		        let price = data.price;
		        let schedule =data.schedule;
		        
		          
		        let pk_nameTag  = li.querySelector("#pk_name");
		        let trv_placeTag  = li.querySelector("#trv_place");
		        let priceTag  = li.querySelector("#price");
		        let scheduleTag  = li.querySelector("#schedule");
		        
		        pk_nameTag.value= pk_name;	
		        trv_placeTag.value=trv_place;
		        priceTag.value= price;
		        scheduleTag.value =schedule;
		}
			,
			error: function( data, textStatus){			 
			},		 
			complete:function(data, textStatus){
			 	}
			}
	 	);
}
</script>

<script>
//ajax로 데이터받기
function toggle(obj){  
    let li  = obj.parentElement;
    let detail  = li.querySelector(".detail");
    let flagTag  =  li.querySelector("#flag");
  
    let flag = flagTag.value;
   
    if( flag ==0){
       package_list(obj);         	
    	//package_list();   
        detail.style.display="block";
        flagTag.value=1;
    }else{      
        detail.style.display="none";
        flagTag.value=0;;
    }
}

</script>

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

	
<div><p id="id">고객님만을 위한 추천 패키지여행</p>

<section>
	
<h3>아시아/유럽/미주</h3>
<div class="wrap"> 

<ul id="list">
<li><a href="package_detail?pk_num=Pj123"><p><img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/07/04/10000/a895c128-729e-448b-a9f2-ba66e6ce3503.jpg" alt="오사카"></p>
<p class="pk">[슈퍼세이브] 행복한 오사카여행<br> 12월 20일부터 12월 23일까지 [로칸1일숙박]일상의 바쁜 당신을 위한  힐링 추천 상품!<br>여행기간 2박3일<br>평점 ★4.2</p></a>
<button onclick="toggle(this)">상품요약보기</button>
	
	<div class="detail">
		<input id="flag" type="hidden" value="0">
		<input id="no" type="hidden"  value="Pj123"/>	 
		 
		 <div id="info">
		     힐링+휴양 / 세이브투어
		     <input type="text"  id="pk_name" >	<br>
		     투어도시	
		     <input type="text"  id="trv_place" ><br>
		     가격(원)		
		     <input type="text"  id="price" ><br>
		     일정	
		     <input type="text"  id="schedule" ><br>	
		  </div>
 
	</div>
</li> 
</ul>

<ul>
<li><a href="package_detail?pk_num=PA987"><p><img src="https://image.hanatour.com/usr/cms/resize/400_0/2019/01/24/10000/483f20ed-6f50-4f32-be96-06208321a7ff.jpg"></p>
<p class="pk">[마감임박!!] 로스앤젤레스 관광<br>12월 10일부터 12월 17일일까지 미주여행 고민중이라면! [슈퍼세이브] 가족단위 추천 상품<br> 여행기간 8일<br>평점 ★4.5</p></a>
<button  onclick="toggle(this)">상품요약보기</button>
	
	<div  class="detail">
	
		<input id="flag" type="hidden" value="0">
		<input id="no" type="hidden"  value="PA987"/>	 
		 
		 <div id="info">
		     관광+쇼핑 / 얼리버드 
		     <input type="text"  id="pk_name" ><br>
		     투어도시		
		     <input type="text"  id="trv_place" ><br>	
		     가격(원)	
		     <input type="text"  id="price" ><br>	
		     일정
		     <input type="text"  id="schedule" ><br>		     
		  </div>

	</div>
</li> 
</ul>	

<ul>
<li><a href=" package_detail?pk_num=PU456 "><p ><img src="https://image.hanatour.com/usr/cms/resize/400_0/2020/10/19/10000/ce3f0165-c22f-4262-a922-130c079362d9.jpg" alt="런던"></p>
<p class="pk">[크리스마스 마켓투어포함] 영국 런던 깊이보기<br>12월 25일부터 12월 31일까지 크리스마스부터 연말분위기 유럽감성찬스! <br>[추천도1위] 크리스마스를 느끼고 싶은 당신을 위한 선택!<br> 여행기간 6박7일<br>평점 ★4.7</p></a>
<button  onclick="toggle(this)" >상품요약보기</button>
    
    <div class="detail" >
	
		<input id="flag" type="hidden" value="0">
		<input id="no" type="hidden"  value="PU456"/>	 
		 
		 <div id="info">
		     레저+투어포함 / 인기투어
		     <input type="text"  id="pk_name" ><br>
		     투어도시		
		     <input type="text"  id="trv_place" ><br>	
		     가격(원)	
		     <input type="text"  id="price" ><br>	
		     일정
		     <input type="text"  id="schedule" ><br>			     
		  </div>
	
    </div>
    </li> 
</ul>

<ul>
<li><a href="package_detail?pk_num=PU123 "><p><img src="https://image.hanatour.com/usr/cms/resize/400_0/2017/02/27/10000/fab5bddb-1dbe-452f-8c9c-b213123b5d24.jpg" alt="보라카이"></p>	
<p class="pk">[얼리버드 & 슈퍼세이브] 보라카이<br>10월 31일부터 11월 13일까지 즐기는 보라카이 특별 할인 찬스!  [슈퍼세이브] 알뜰한 해외여행을 준비하는 당신을 위한 선택! 가성비 추천 상품 !!<br>여행기간 4/5/6일<br>평점 ★4.2</p></a>
<button  onclick="toggle(this)"id="btn_p" >상품요약보기</button>
   
	<div class="detail">
	
       <input type="hidden" value="0">
		   힐링+휴양 / 얼리버드
		     <input type="text"  id="pk_name" ><br>
		     투어도시		
		     <input type="text"  id="trv_place" ><br>	
		     가격(원)	
		     <input type="text"  id="price" ><br>	
		     일정
		     <input type="text"  id="schedule" ><br>		


	</div>
	</li>
</ul>				
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
</div>

</body>
</html>