<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
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

<style>
body>div.container{
	padding-top : 150px;
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
	
				<div class="col-xs-6 col-md-6 text-center image">				
						<c:forEach var="name" items="${cook.cookFilename.split('/')[0]}">
								<img src="/resources/images/uploadFiles/${name}" width="400" height="400"/>
						</c:forEach>
				</div>	
			

				<div class="col-xs-4 col-md-4">
			
				<div class="row">
					<input type="hidden" name="cookNo" id="cookNo" value="${cook.cookNo }"/>
				</div>
				
				<hr/>
				
				<div class="row">
				
				
					
					<div><h4><strong>${cook.cookName}</strong></h4></div><br>
					<div>${cook.cookBrief }</div>
					<input type="hidden" name="detail" value="${cook.cookBrief }"/>
					<input type="hidden" name="cookName" value="${cook.cookName}"/>
				</div>
				
				<br/><br/>
				
				
				
				
				<div class="row">
					<div><h6><del>${cook.cookPrice } ��</del></h6></div>
					<div><h5><strong>�����ο�${cook.cookRecruit}&emsp;��</strong></h5></div>
				</div>
				
				<br/>
				
				<div class="row">
					��û�ο�: &emsp;
				      <input type="number" min="0" id="cookStatus" name="cookStatus" value="1" style="width:40px"/> ��
				</div>
				
				<br/><br/>
				
				<div class="row">
					------------------<br/>
					 ��ۺ� : 3000��<br/>
					------------------					
				</div>
				
				<hr/> 
				
				
				<div class="row">
			  		<div class="text-center">	
			  				<button type="button" class="btn btn-default btn-lg" id="wish">��ٱ���</button>&emsp;
			  				<button type="button" class="btn btn-warning btn-lg" id="buy" >�����ϱ�</button>
			  			
			  				<button type="button" class="btn btn-primary btn-lg" id="buy" >�����ϱ�</button>
			  				
			  		</div>
				</div>
		
				
		 	</div>
		 	
		 	<div class="col-xs-2 col-md-2">
		 	</div>
		 	
		 	</div>
		 	
		 	<hr/>
		 	
		 	
		 	
</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>