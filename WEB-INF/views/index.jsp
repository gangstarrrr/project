<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 매덩여행 </title>
	<link rel="stylesheet" type="text/css" href="resources/index.css">

   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 1200px)" href="resources/tab.css">

   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 670px)" href="resources/phone.css">
    
	<link rel='shortcut icon' href='resources/icon/send.png'>
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
	
		/******************* 슬라이드 이미지 데려오기 *****************/
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url:"selectSlide"
			}).done(function(data){
				var d = JSON.parse(data);
				var list = d.list;
				for(var i=0;i<list.length;i++){
					var html="<section id='s'>";
					html += "<div style='background-image: url("+list[i].fileURL+")'></div></section>";
					$("#contents").prepend(html);
				}
			});
		});
		/******************* 버튼이미지데려오기 *****************/
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url:"selectButton"
			}).done(function(data){
				var d = JSON.parse(data);
				var list = d.list;
				for(var i=0;i<list.length;i++){
					var html="<li style='background-image: url("+list[i].fileURL+")' class='b_img'><div><p>";
					html+=list[i].fileName+"</p></div></li>";
					$("#b div ul").prepend(html);
				}
			});
		});
		/******************* list 불러오기 *****************/
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url:"selectList"
			}).done(function(data){
				var d = JSON.parse(data);
				var list = d.list;
				for(var i=0;i<list.length;i++){
					var html="<li class='l_list'><div class='l_img'>";
					html+="<img src='"+list[i].fileURL+"' class='pick_img'>";
					html+="<div class='middle_img'>"+list[i].fileName+"</div></div></div></div>";
					html+="<div class='l_r'><h1>"+list[i].boardTitle+"</h1>";
					html+="<p>"+list[i].boardContents+"</p></div></li>";
					$("#l ul").prepend(html);
					console.log(html);
				}
			});
		});
		/******************* 유투브 좋아요 최고에요 *****************/
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url : "selectyoutube"
			}).done(function(data){
				var d = JSON.parse(data);
				var list=d.list;
				var html1 = "";
	             html1 += '<iframe src="';
	             html1 += list[0].iframe;
	             html1 += '" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
	             $("#v_div1").append(html1);
	         
	             var html2 = "";
	             for (var i = 1; i< list.length; i++){
	                    html2 += '<li class="v_m_l"><iframe src="';
	                   html2 += list[i].iframe;
	                   html2 +='" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
	                   html2 +='<div class="v_m_r"><h1>';
	                   html2 +=list[i].utitle;
	                   html2 +=         '</h1><p>';
	                   html2 +=  list[i].ucontents;
	                   html2 +=        '</p><ul>';
	                   html2 +=     '<li id = "tooltip" class="v_heart v_icon" onclick="likeButton('+list[i].utubeNo+')"><span class="tooltiptext">좋아요</span></li><li>';
	                   html2 +=      list[i].likee;
	                   html2 +=      '</li><li id = "tooltip" class="v_thumb v_icon" onclick="thumbButton('+list[i].utubeNo+')"><span class="tooltiptext">최고예요</span></li><li>';
	                   html2 +=      list[i].thumb
	                   html2 +=     '</li><li class="v_share v_icon"></li>';
	                   html2 +=     '<li class="v_li_r">공유</li></ul></div></li>';
	             }
	             
	             $("#v_m ul").append(html2);
			})
		});
		function thumbButton(utubeNo){
	         $.ajax({
	             type: "post",
	             url : "thumb",
	             data: {"utubeNo" : utubeNo}
	          }).done(function(data){
	        	 alert("최고에요");
	             location.href = "index";
	              
	          });
	      }
	      function likeButton(utubeNo){
	         $.ajax({
	             type: "post",
	             url : "like",
	             data: {"utubeNo" : utubeNo}
	          }).done(function(data){
	        	 alert("좋아요");
	             location.href = "index";
	              
	          });
	      }

	</script>
</head>

<body>
    <header>
        <div id="main_header">
            <div class=logo></div>
                <h1 onclick="location.href='index'">매덩여행</h1>
        </div>
    </header>
    <!--메뉴창-->
    <div class="menu_block">  
         <img id="menu_icon" src="resources/icon/ic_reorder_black_24px.svg"><br>
    <div class="menubar">
        <ul >
            <li><a href="index">HOME</a></li>
            <li><a href="#">유럽</a>
                <ul>
                    <div></div>
                     <li><a href="london">런던</a></li>
                     <li><a href="Barcelona">바르셀로나</a></li>
                     <li><a href="#">독일</a></li>
                </ul>
            </li>
            <li><a href="#">아시아</a>
             <ul>
                    <div></div>
                     <li><a href="#">일본</a></li>
                     <li><a href="#">중국</a></li>
                </ul>
            </li>
            <li><a href="#">아메리카</a>
             <ul>
                    <div></div>
                     <li><a href="#">미국</a></li>
                     <li><a href="#">캐나다</a></li>
                     <li><a href="#">멕시코</a></li>
                </ul>
            </li>
            <li><a href="#">아프리카</a>
             <ul>
                    <div></div>
                     <li><a href="#">남아공</a></li>
                     <li><a href="#">케냐</a></li>
                </ul>
            </li>
            <li><a href="#">오세아니아</a>
             <ul>
                     <div></div>
                     <li><a href="#">호주</a></li>
                     <li><a href="#">뉴질랜드</a></li>
                </ul>
            </li>
            <li id="menu_site"><a href="admin" >관리자페이지</a></li>
            <li id="menu_site"><a href="#" >제휴사이트</a>
             <ul>
                    <div></div>
                     <li><a href="https://www.tripadvisor.co.kr/">Trip Advisor</a></li>
                     <li><a href="https://www.myrealtrip.com/">MyRealTrip</a></li>
                     <li><a href="https://magazine.dingo.tv/dingotravelkorea">Dingo Travel</a></li>
                </ul>
            </li>
        </ul>
    </div>
    </div>
      
    <div id="blank"></div>
    <div id="contents">
    
    <!--슬라이드-->

    
    
    <!--버튼눌러서 화면 넘기기-->
    <section id="b">
        <div>
            <input type="radio" name="radio" id="b_1" checked>
            <input type="radio" name="radio" id="b_2">
            <input type="radio" name="radio" id="b_3">
            <input type="radio" name="radio" id="b_4">
            <ul>
            </ul>
        </div>
    </section>
 
    
    <!--유투브 리스트-->
  
    <section id="v">
        <div id="v_div1">  
           <h1>매덩's youtube</h1> <hr>
           
        </div>
        
        <!--영상 리스트 -->
        <div id="v_div2" >
            
            <div id="v_icon">
                <div id="icon2">
                <img src="resources/icon/playlist_add.svg" id="i_p">
               </div>
            </div>
                      
             <div id="v_m">
                <ul>
		        </ul>
            </div>
            </div>
    </section>
    
    
   <!--여행지 리스트-->
    <section id="l">
        <div id="l_div1">  
            <h1>매덩's Picks</h1> <hr>
        </div>
     
     <ul>
    </ul>

    </section>
    
    
    </div> 
    
    
    <!--탑버튼-->
    
    <div id="top_button">
        <a href="#"><img src="resources/icon/top_icon.png" width="70px"></a>
    </div>
    
    <!---->
    
    <footer>
        <div id= "comment" >
            <h4>
                전 세계 우리의 여행 사이트. 풍부한 정보.즐거운 여행    
            
             <div>
                <div id="face" class="co_icon"onclick="location.href='https://ko-kr.facebook.com/dingo.travel.kr/'" ></div>
                <div id="insta"   class="co_icon" onclick="location.href='https://www.instagram.com/dingo_travel/'"  ></div>
                <div id="twitt" class="co_icon"onclick="location.href='https://twitter.com/myrealtrip'"></div>
                <div id="whats" class="co_icon"></div>
            </div>
            </h4>
            
            <h5>copyrighter by 갱 and 쟌 and 굥은</h5>
        </div>
    </footer>

</body>
</html>
