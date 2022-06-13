<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            font-size: 30px;
            line-height: 30px;
            color:crimson;
        }

        .bi-heart-fill{
            font-size: 30px;
            line-height: 30px;
            color:crimson;
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
	padding-top : 30px;
}
</style>
 <!-- //////////////////////////////////�����ϱ�////////////////////////////// -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
 
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">



//=========================================================================================//	
	$( document ).ready( function() {
		 
		
		
		 $('#cookStatus').change( function() {
			 var quantity = $('#cookStatus').val();
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
		 
		 $( "button.btn-warning" ).on("click" , function() {
			 var quantity = $('#quantity').val();
			 self.location = "/apply/addApply?menu=${param.menu}&cookNo=${cook.cookNo}"
		});
		 

		 
		 $( "button.btn-primary" ).on("click" , function() {
			 var cookNo = $('#cookNo').val();
			 self.location = "/cook/updateCook?cookNo="+cookNo
		});
		 
	});
//=========================================��ٱ���=========================================//	
	
function fncAddWish() {
	
	var cookStock=$("#cookStock").val();
	var cookStatus=$("input[name='cookStatus']").val();
	console.log(cookStock);
	console.log(cookStatus);
	if (cookStock < cookStatus) {
		alert("��ٱ��� ��Ⱑ�� ������ �ʰ��Ǿ����ϴ�");
		return;
	}
	
	
	$("form").attr("method" , "POST").attr("action" , "/wish/addWish").submit();
	
}
	 
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$( "#wish" ).on("click" , function() {
		console.log('��ٱ���');
		fncAddWish();
	});
});
//=========================================================================================//	
	
		
	
	</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	



	<div class="container">
	
				<div class="row">
					<input type="hidden" name="cookNo" id="cookNo" value="${cook.cookNo}"/>
					  <input type="hidden" id="menu" name = "menu" value="${param.menu }"/>
				</div>		 
	
		<div class="row">
		
	
				<div class="col-xs-6 col-md-6 text-center image">				
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
								<img src="/resources/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
								<input type="hidden" name="image" value="${name }"/>
							</c:forEach>
						</c:otherwise>
						</c:choose>
				</c:when>
				<c:otherwise>
					<img src="/resources/images/uploadFiles/${cook.cookFilename}" width="300" height="300" align="absmiddle" class="image" value="${prodThumbnail}"/>
				</c:otherwise>
		    	</c:choose>
				</div>	
			

				<div class="col-xs-4 col-md-4">
			
				<div class="row">
					<input type="hidden" name="cookNo" id="cookNo" value="${cook.cookNo }"/>
					<input type="hidden" name="cookRegdate" id="cookRegdate" value="${cook.cookRegdate }"/>
				</div>
				
				<hr/>
				
				<div class="row">
				
					<div class="text-right">
						<a id="kakao-link-btn" href="javascript:kakaoShare()">
					    	<img src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" width="30" height="30"/>
					    </a>
					</div>
				
				
					
					<div><h4><strong>${cook.cookName}</strong></h4></div><br>
				
					<div>${cook.cookBrief }</div>
					
					
					<input type="hidden" name="cookBrief" value="${cook.cookBrief }"/>
					<input type="hidden" name="cookName" value="${cook.cookName}"/>
					
					
				</div>
				
				<br/><br/>
				
				
				
				
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
			
					<div id="cookLocation" value="${cook.cookLocation}"><h5><strong>��� : ${cook.cookLocation}</strong></h5></div>
				</div>				
				
			
				
				<div class="row">
				<div><h5><strong>�����Ⱓ : ${cook.aplstarTime}&emsp;~&emsp;${cook.aplendTime}</strong></h5></div>				
				</div>
				
				<div class="row">
				<div><h5><strong>�����ð� : ${cook.startTime}&emsp;~&emsp;${cook.endTime}</strong></h5></div>				
				</div>
		
				
		
				
				
				<div class="form-group">
			  		<div class="text-center">	
			  			
			  				<button type="button" class="btn btn-warning btn-lg" id="buy" >�����ϱ�</button>
			  			
			  				<button type="button" class="btn btn-primary btn-lg" id="buy" >�����ϱ�</button>
			  				
			  			
			  				
			  		</div>
				</div>
		
				
		 	</div>
		 	
		 	<div class="col-xs-2 col-md-2">
		 	</div>
		 	
		 	</div>
		 	
		 	<hr/>

		<div class="col-xs-10 col-md-10 text-center">
		<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
    
        </a>
    </em>
</p>
<div id="map" style="width:1100px;height:500px; text-align: center; margin:36px auto;" ></div>

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
			<div><strong>${cook.cookContent}</strong></div>
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
 
 	<div id="my_modal">
 		<a class="modal_close_btn"><i class="bi bi-x"></i></a>
 		<br>

	    <br>
	</div>		 	


</body>
</html>