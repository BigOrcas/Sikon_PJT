<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
 <!-- //////////////////////////////////�����ϱ�////////////////////////////// -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
      <style>

        .bi-heart{
            font-size: 18px;
            line-height: 18px;
            color:#000;
        }

        .bi-heart-fill{
            font-size: 18px;
            line-height: 18px;
            color:#000;
        }

.bi-heart-fill::before{
color:crimson;
}

.bi-heart::before{
color:crimson;
}
    </style>
    <!--  ��� -->
<style>
.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	outline:none;
	background-color:#937062;
	color:#f7f7f7;
	padding:15px 20px;
}
.btn_gotop:hover{
	color: #f7f7f7;
}
.shape {

  width: 40%;
  height: 17px;
  text-align: center;
  font-weight:bold;
  color:rgb(158, 158, 158);
  font-size:0.5px;
  border-radius: 5px;
  position: absolute;
   top: 55px;
   left: 2px;
   width: 15px;
}

#wish_modal {
    display: none;
    width: 330px;
    padding: 20px 60px;
    background-color: #fefefe;
    border: 1px solid #888;
    border-radius: 3px;
    text-align: center;
}

#wish_modal .modal_close_btn {
    position: absolute;
    top: 5px;
    right: 5px;
}

modal_close_btn{
	text-decoration-line: none;
	width:20px;
	height: 20px;
}

div.message{
	text-align: center;
	font-size: 15px;
}

a.gowish{
	border: 1px solid #d7d7d7;
	text-align: center;
	height: 40px;
	width : 160px;
	padding: 10px;
	text-decoration-line: none;
	color: #333;
}



h3{
margin-left: 60px;
}
.reviewHeader{
	font-family: 'Nanum Myeongjo', serif;
 	width: 800px;
	margin-left: 60px;
	border-bottom: 2px solid rgb(147, 112, 98);
    font-size: 18px;
    line-height: 28px;
    letter-spacing: 0px;
    padding-bottom: 8px;
    border-bottom: 2px solid rgb(147, 112, 98);
    text-align: start;
    font-weight: bold;
    height:5;
}

.panel{
    width: 800px;
    text-align:left;
    margin-left: 60px;
}
.img-sm {
    width: 46px;
    height: 46px;
}

.panel {
    box-shadow: 0 2px 0 rgba(0,0,0,0.075);
    border-radius: 0;
    border: 0;
    margin-bottom: 15px;
}

.panel .panel-footer, .panel>:last-child {
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
}

.panel .panel-heading, .panel>:first-child {
    border-top-left-radius: 0;
    border-top-right-radius: 0;
}

.panel-body {
    padding: 25px 20px;
}


.media-block .media-left {
    display: block;
    float: left
}

.media-block .media-right {
    float: right
}

.media-block .media-body {
    display: block;
    overflow: hidden;
    width: auto
}

.middle .media-left,
.middle .media-right,
.middle .media-body {
    vertical-align: middle
}

.thumbnail {
    border-radius: 0;
    border-color: #e9e9e9
}

.tag.tag-sm, .btn-group-sm>.tag {
    padding: 5px 10px;
}

.tag:not(.label) {
    background-color: #fff;
    padding: 6px 12px;
    border-radius: 2px;
    border: 1px solid #cdd6e1;
    font-size: 12px;
    line-height: 1.42857;
    vertical-align: middle;
    -webkit-transition: all .15s;
    transition: all .15s;
}
.text-muted, a.text-muted:hover, a.text-muted:focus {
    color: #acacac;
}
.text-sm {
    font-size: 0.9em;
}
.text-5x, .text-4x, .text-5x, .text-2x, .text-lg, .text-sm, .text-xs {
    line-height: 1.25;
}

.btn-trans {
    background-color: transparent;
    border-color: transparent;
    color: #929292;
}

.btn-icon {
    padding-left: 9px;
    padding-right: 9px;
}

.btn-sm, .btn-group-sm>.btn, .btn-icon.btn-sm {
    padding: 5px 10px !important;
}

.mar-top {
    margin-top: 15px;
}


.btn-w {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  padding: 11px 0;
  width:40%;
  font-size: large;
}
.btn-w:hover {
  background-color: #e7e2e2;
}

.btn-u {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  padding: 11px 0;
  width:100px;
  font-size: small;
}
.btn-u:hover {
  background-color: #e7e2e2;
}


.btn-b {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  padding: 12px 0;
  width:40%;
  font-size: large;
}
.btn-b:hover {
  background-color: #937062d4;
}
</style>
<style>

.container {
	padding-top: 150px;
} 



</style> 

<style>
body>div.container{
	padding-top : 200px;
	font-family: 'Nanum Myeongjo', serif;
}
div.row{
	font-family: 'Nanum Myeongjo', serif;
}
div.page-header{
	font-family: 'Nanum Myeongjo', serif;
}
div.image{
	padding-top : 70px;
}
</style>
 <!-- //////////////////////////////////�����ϱ�////////////////////////////// -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
 
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">



//=========================================================================================//	
	$( document ).ready( function() {
		 
		
		
		 $('#cookStatus').change( function() {
			 var cookStatus = $('#cookStatus').val();
			 $('#cookStatus').val(cookStatus)
			 console.log('��û�ο�: '+cookStatus);
		 });
		
		 $( "#check" ).on("click" , function() {
			 self.location = "/cook/listCook?menu=manage"
		});
		 
		 $( "#cancel" ).on("click" , function() {
			 self.location = "/cook/listCook?menu=search"
		});
		 
		 $( "#mentor" ).on("click" , function() {
			 self.location = "/cook/listCook?menu=search"
		}); 
		 
		 $( ".addPurchase" ).on("click" , function() {
			 var cookStatus = $('#cookStatus').val();
			 self.location = "/apply/addApply?cookNo=${cook.cookNo}&cookStatus="+cookStatus;
		});
		 
		 $( "#listMyCook" ).on("click" , function() {
			 self.location = "/cook/mentor?mentorId=${cook.mentor.userId}"
		}); 		 

		 
		 $( ".updateCook" ).on("click" , function() {
			 var cookNo = $('#cookNo').val();
			 self.location = "/cook/updateCook?cookNo="+cookNo
		});
		 
		 

			
		 $( ".addWish" ).on("click" , function() {
			 console.log('��ŷ��ٱ���');
			 var cookStatus = $('#cookStatus').val();
			 
			 
			 $.ajax({
	                  url : "/wish/json/addWish?cookNo=${cook.cookNo}&cookStatus="+cookStatus ,
	                  method : "GET" ,
	                  dataType : "json" ,
	                  headers : {
	                     "Accept" : "application/json",
	                     "Content-Type" : "application/json"
	                  },
	                  success : function(response) {
	                	  console.log("[response] : " + response);
	                	  modal('wish_modal'); 
	                  }
	            });
			 
		});	
		
		 $( ".gowish" ).on("click" , function() {
			 
			 var cookStatus = $('#cookStatus').val();
			 
			 self.location="/wish/getWish"
				
			 			 
			console.log("���Ƕ�");
			 
		});			 
		 
	});
//=========================================���ƿ�=========================================//	
			$(document).on("click" ,"p.like_btn", function(){

				var userId = $("input[name='userId']").val();
				var userNickname = $("input[name='userNickname']").val();
				var cookNo = $(this).attr("value");
			
				console.log(cookNo);
				console.log(userId);

			     $.ajax({
			            type : "POST",  
			            url : "/heart/json/updateHeart",       
			            dataType : "json",   
			            data : {'cookNo' : cookNo, 'userId' : userId },
			            error : function(){
			               alert("��� ����");
			            },
			            success : function(heartCheck) {
			                
			                    if(heartCheck == 0){
			                    	alert("��õ�Ϸ�.");
			                    	                    	
			                    	
			                    	

			                    	console.log(userId);
			                    	console.log(cookNo);
			                    	console.log(userNickname);
			                    	
			                    	pushAlarm(userId, userNickname, cookNo);
			                    							           
				   
						           
			                    location.reload();
			                    	
			                    	
			    					
			                    }
			                    else if (heartCheck == 1){
			                     alert("��õ���");
			                     
			                     location.reload();
						         
			                  
			                    	
			                }
			                    
			                    
			            }
			        })
			 });
	 
			//���ƿ� push �˸�
			 function pushAlarm(userId, userNickname, cookNo){
													
					$.ajax({
				        url : "/cook/json/addHeart",
				        type : 'POST',
				        dataType : "json",   
			            data : {'cookNo' : cookNo, 'userId' : userId, 'userNickname' : userNickname }, 
			            async: false, 
			            error : function(){
				            alert("��� ����");
				        },
				        success : function(data){
				        	
				        	alert("�˶� ���� �Ϸ�!!");
				        	      	          
				           		if(socket){
				        			let socketMsg = "heart,"+data.userId+","+data.userNickname+","+data.mentorId+","+data.cookName;
				        			console.log(socketMsg);
				        			socket.send(socketMsg);
				           		}
				        }
				    
				    })
			 };
			 
//=========================================================================================//	
//===================== ������� �̵� ====================================
	
	$(window).scroll(function(){
		if ($(this).scrollTop() > 300){
			$('.btn_gotop').show();
		} else{
			$('.btn_gotop').hide();
		}
	});
	
	$('.btn_gotop').click(function(){
		$('html, body').animate({scrollTop:0},400);
		return false;
	});
		
	
	function CloseModal(){
        var CloseModal = document.querySelector(".popup");
        CloseModal.classList.add("CloseModal");
     }
	
	
//===================== �˾�â ���� ====================================	

	function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);
    var cookStatus = $('#cookStatus').val();

    // ��� div �ڿ� ��������� ���̾�
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // ���̾� ������ ���⼭ �ٲٸ� ��
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // �ò��� ���̾� ���� ��ĭ ���� ���̱�
            zIndex: zIndex + 1,

            // div center ����
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // �ݱ� ��ư ó��, �ò��� ���̾�� ��� div �����
        .find('.modal_close_btn')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
}	
		
	
	</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	



	<div class="container">
	 
	
		<div class="row">
		
	
				<div class="images col-xs-6 col-md-6 text-center image">				
   	<c:choose>
		    	<c:when test="${cook.cookFilename.contains('/')}">
						<c:choose>
						<c:when test="${cook.cookFilename.contains('mp4')}">
							<c:forEach var="name" items="${cook.cookFilename.split('/')}">
								<video width="400" height="400" controls autoplay src="/resources/images/uploadFiles/${name}" type="video/mp4"  value="${name}"></video>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="name" items="${cook.cookFilename.split('/')}">
								<img src="/resources/images/uploadFiles/${name}" width="400" height="400" align="absmiddle"/>
								<input type="hidden" name="image" value="${name }"/>
							</c:forEach>
						</c:otherwise>
						</c:choose>
				</c:when>
				<c:otherwise>
					<img src="/resources/images/uploadFiles/${cook.cookFilename}" width="400" height="400" align="absmiddle" class="image" value="${prodThumbnail}"/>
				</c:otherwise>
		    	</c:choose>
	    	
		    	
				</div>	
				
				
				
			

				<div class="col-xs-4 col-md-4">
			
				<div class="row">
					<input type="hidden" name="cookNo" id="cookNo" value="${cook.cookNo}"/>
						<input type="hidden" name="userId" id="userId" value="${user.userId}"/>
						<input type="hidden" name="userNickname" id="userNickname" value="${user.userNickname}"/>
					<input type="hidden" name="image" id="image" value="${cook.cookFilename}"/>
					<input type="hidden" name="cookName" id="cookName" value="${cook.cookName}"/>
					<input type="hidden" name="cookBrief" id="cookBrief" value="${cook.cookBrief}"/>
				</div>
				
				<hr/>
				
				<div class="row">
				
					<div class="text-right">		    	
		    	
		    	
		    	
		    	<table >
		    		<tr class="liketable" align="left">
						<td>	
							<c:choose>
					 		<c:when test = "${cook.heartCount == '0'}">
					 		<p align="right" class="bi bi-heart like_btn" value="${cook.cookNo}" id="like_btn"></p>
					 		<span class="shape">${cook.hearthit}</span>
							</c:when>    
					 		<c:otherwise>
					 		<p align="right" class="bi bi-heart-fill like_btn" value="${cook.cookNo}" id="like_btn"></p>
					 		<span class="shape">${cook.hearthit}</span>
					 		</c:otherwise>
					 		</c:choose>
						</td>
						<td>
						
						</td>
					
					</tr>
				</table>	
						<a class ="kakao" id="kakao-link-btn" href="javascript:kakaoShare()">
					    	<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="30" height="30"/>
					    </a>
					    
					    
					    	<c:if test="${sessionScope.user.role == 'mentor'}">
			  				<button type="button" class="btn-u updateCook"  >�����ϱ�</button>
			  			  </c:if>	
			  			
				  			<c:if test="${sessionScope.user.role == 'admin'}">
			  				<button type="button" class="btn-u updateCook"  >�����ϱ�</button>
			  			  </c:if>	
					</div>
				
				
					
					<div><h4><strong>${cook.cookName}</strong></h4></div><br>
				
					<div><strong>${cook.cookBrief }</strong></div>
						<br/>

					<div  id="listMyCook"><h5><strong>��ŷ���� ${cook.mentor.userNickname }</strong></h5></div>
					
					

					
					
				</div>
				
				<br/>
				
						<div class="row">
					��û�ο�: &emsp;
				      <input type="number" min="0" id="cookStatus" name="cookStatus" value="1" style="width:40px"/> ��
				</div>
				
				
				
				<div class="row">
					<div><h6>${cook.cookPrice } ��</h6></div>
					<div><h5><strong>�����ο�${cook.cookRecruit}��</strong></h5></div>
				</div>
				
				<br/>
				
				<div class="row">
			<c:if test = "${cook.cookTheme =='KO'}">
			 <h5><strong>�׸� : �ѽ�</strong></h5>
			</c:if>
			<c:if test = "${cook.cookTheme == 'JA'}">
			 <h5><strong>�׸� : �Ͻ�</strong></h5>
			</c:if>
			<c:if test = "${cook.cookTheme == 'AM'}">
		 <h5><strong>�׸� : ���</strong></h5>
			</c:if>
			<c:if test = "${cook.cookTheme == 'CH'}">
			 <h5><strong>�׸� : �߽�</strong></h5>
			</c:if>
			<c:if test = "${cook.cookTheme == 'DE'}">
			 <h5><strong>�׸� : ����</strong></h5>
			</c:if>		
				</div>
				<div class="row">
			<c:if test = "${cook.cookDifficuty =='1'}">
			 <h5><strong>���̵� : �ʱ�</strong></h5>
			</c:if>
			<c:if test = "${cook.cookDifficuty == '2'}">
			 <h5><strong>���̵� : �߱�</strong></h5>
			</c:if>
			<c:if test = "${cook.cookDifficuty == '3'}">
		 <h5><strong>���̵� : ���</strong></h5>
			</c:if>
				

				</div>				

				<div class="row">
			
					<div id="cookLocation" value="${cook.cookLocation}"><h5><strong>��� : ${cook.cookLocation}</strong></h5></div>
				</div>				
				
			
				
				<div class="row">
				<div><h5><strong>�����Ⱓ : ${cook.aplstarTime}&emsp;~&emsp;${cook.aplendTime}</strong></h5></div>				
				</div>
				
				<div class="row">
				<div><h5><strong>�����ð� : ${cook.startTime}&emsp;~&emsp;${cook.endTime}</strong></h5></div>				
				</div>
		
				
		
				
				
				<div class="form-group">
			  		<div class="text-right">	
			  			
			  				<button type="button" class="btn-b addPurchase" id="buy" >��û�ϱ�</button>
			  				
			  	
			  				<button type="button" class="btn-w addWish" id="popup_open_btn">��ٱ���</button>&emsp;
					
									  				
		  				
			  		</div>
				</div>
		
				
		 	</div>
		 	
		 	<div class="col-xs-2 col-md-2">
		 	</div>
		 	
		 	</div>
		 	
		 	<hr/>

		<div class="col-xs-10 col-md-10 text-center">

			<div><h4><strong>Ŭ���� ����</strong></h4> 
			
				
				</br>
					</br>
			<div>
			
			${cook.cookContent}
			</div>
			
			</div>
</br>
					</br>					 
		<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
    
        </a>
    </em>
</p>

<div class="row text-center"><h5><strong>��ŷŬ���� ���</strong></h5>
<div id="map" style="width:700px;height:500px; text-align: center; margin:36px auto;" ></div>
</div>
	<hr/>
	<br/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bdc66313a731d6cd370ddce26735db6a&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new kakao.maps.services.Geocoder();
var cookLocation = $("#cookLocation").attr('value');
console.log(cookLocation);
// �ּҷ� ��ǥ�� �˻��մϴ�
geocoder.addressSearch(cookLocation, function(result, status) {

    // ���������� �˻��� �Ϸ������ 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">������ ���!</div>'
        });
        infowindow.open(map, marker);

        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
        map.setCenter(coords);
    } 
});    
</script>	
					<a href="#" class="btn_gotop">
		  <span class="glyphicon glyphicon-chevron-up">
		  </span>
		</a>		
			<h4 class="reviewHeader">����(${reviewNum})</h4>
			
			<c:forEach var="review" items="${review}">
				<div class="panel">
					<div class="panel-body">
						<div class="media-block">
							<a class="media-left" href="#"><img class="img-circle img-sm"
								alt="Profile Picture" src="/resources/images/168939.jpg"></a>
							<div class="media-body">
								<div class="mar-btm">
									<a href="#"
										class="btn-link text-semibold media-heading box-inline">${review.writerNickname }</a>
									<p class="text-muted text-sm">
										<fmt:formatDate pattern="yyyy-MM-dd HH:mm"
											value="${review.reviewRegdate}" />
									</p>
								</div>
								<c:if test="${review.reviewImg != null }">
									<img src="/resources/images/uploadFiles/${review.reviewImg }"
										width="200" height="200">
								</c:if>
								<p>${review.reviewContent }</p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
				  <c:if test="${empty review}">
		<br><br>
		<div class="emptyProd">
			<h3>��ϵ� ���䰡 �����ϴ�.</h3>
			<br>
		</div>
		<br>
	</c:if>
			
		</div>

		
			
 	<div id="wish_modal">
 		<a class="modal_close_btn"><i class="bi bi-x"></i></a>
 		<br>
 		<div class="message">
	    Ŭ������ �����ϴ�.
	    </div><br>
	    <div class="forcenter">
	    <a href="#" class="gowish">
	    ���� Ŭ�������� &nbsp;
	    <i class="fa-solid fa-angle-right"></i>
	    </a>
	    </div>
	    <br>
	</div>	 	
	
	
		 	</div>
	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>		 	
<script type="text/javascript">	
		///*
	Kakao.init('bdc66313a731d6cd370ddce26735db6a');
	  // SDK �ʱ�ȭ ���θ� �Ǵ��մϴ�.
	  console.log(Kakao.isInitialized());
	  
	  function kakaoShare() {
		  
		  var image = $("input:hidden[name='image']").val();
		  console.log(image);
		  var cookName = $("input:hidden[name='cookName']").val();
		  console.log(cookName);
		  var cookBrief = $("input:hidden[name='cookBrief']").val();
		  console.log(cookBrief);
		  var cookNo = $("input:hidden[name='cookNo']").val();
		 console.log(cookNo);
		  
	    Kakao.Link.sendDefault({
	      objectType: 'feed',
	      content: {
	        title: cookName,
	        description: cookBrief,
	        imageUrl: 'http://192.168.0.50:8080/resources/images/uploadFiles/'+image ,
	        link: {
	          mobileWebUrl: 'http://192.168.0.50:8080/cook/getCook?cookNo='+cookNo,
	          webUrl: 'http://192.168.0.50:8080/cook/getCook?cookNo='+cookNo,
	        },
	      },
	      buttons: [
	        {
	          title: '������ ����',
	          link: {
	            mobileWebUrl: 'http://192.168.0.50:8080/cook/getCook?cookNo='+cookNo,
	            webUrl: 'http://192.168.0.50:8080/cook/getCook?cookNo='+cookNo,
	          },
	        },
	      ],
	      // īī���� �̼�ġ �� īī���� ��ġ ����̵�
	      installTalk: true,
	    })
	  }
//*/	
	//=====================�����ϱ�====================================	 	
	$(document).ready(function() {
	});
</script>
 	<!--  ���â ���� /////////////////////////////////////-->
 



</body>
</html>