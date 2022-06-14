<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
div.container{
	 padding-top : 170px;
	font-family: 'Nanum Myeongjo', serif;
}

div.row{
	font-family: 'Nanum Myeongjo', serif;
}
 div{
	font-family: 'Nanum Myeongjo', serif;
}  

 input[type="checkbox"]:checked{
 	background: #bc8f8f;
 }

#totalprice{
	border:none;
	width:100px;
	text-align:right;
	background: #f7f7f7;
	font-weight: bold;
	font-size: x-large;
}

</style>
	<script type="text/javascript">


	$(document).ready(function() {
			 
			///* 
			<!-- ------------- �� �����ݾ� �ʱⰪ --------------- -->
			 
			 var totalprice = 0;
			 var price = $("div.price").attr("value");
			 var quantity = $("div.quantity").attr("value");
			 console.log(price);
			 console.log(quantity);
		
			 
			 var list = [];
		   		<c:forEach var="cartprod" items="${Cart}" >
		   		totalprice += (Number(${cartprod.cartProd.prodDisPrice})*Number(${cartprod.quantity}));
		   		</c:forEach>
		   		
			 console.log(totalprice);
			
			 $("#totalprice").val(totalprice);
			 
			 
			 <!-- ------------- ��ٱ��� ���� --------------- -->
			 
			 $( "button.delete" ).on("click" , function() {
				 var cartNo = $(this).val();
					console.log('delete');
					console.log(cartNo);
					self.location = "/cart/deleteCart?cartNo="+cartNo;
					
					alert('����');
			  });

	
			 <!-- ------------- ��ǰ���� ���� --------------- -->

			 //*
			 
			 $( "button.plus" ).on("click" , function() {
		         
				 var cartNo = $(this).val();
				 var quantity = $(this).parent().children().eq(1).val();
				 quantity = Number(quantity)+1;
				console.log('plus');
				console.log(cartNo);
				console.log(quantity);
				
		         $.ajax( 
		               {
		                  url : "/cart/json/updateCart?cartNo="+cartNo+"&quantity="+quantity ,
		                  method : "GET" ,
		                  dataType : "json" ,
		                  headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                  },
		                  success : function(JSONData , status) {

		                	 //$('input[name=quantity]').val(JSONData)
		                	 
		                  }
		            });
	  			 });
			 
			 $( "button.minus" ).on("click" , function() {
		         
				 var cartNo = $(this).val();
				 var quantity = $(this).parent().children().eq(1).val();
				 quantity = Number(quantity)-1;
					console.log('minus');
					console.log(cartNo);
					console.log(quantity);
				
		         $.ajax( 
		               {
		                  url : "/cart/json/updateCart?cartNo="+cartNo+"&quantity="+quantity ,
		                  method : "GET" ,
		                  dataType : "json" ,
		                  headers : {
		                     "Accept" : "application/json",
		                     "Content-Type" : "application/json"
		                  },
		                  success : function(JSONData , status) {
		                	  
		                	  //$('input[name=quantity]').val(JSONData)
		                	 
		                  }
		            });
	  			 });
			 
		 
			 //*/
			 
			$( "button:contains('����')" ).on("click" , function() {
				 console.log('����');
				 
				 $("form").attr("method" , "GET").attr("action" , "/purchase/addPurchaseByCart").submit();
				 
			});
			 
			 
			 
			 
			 <!-- ------------- �ϰ����� --------------- -->
			 
			$("#checkall").click(function(){
				
				if($("#checkall").prop("checked")){
					
					$("input[name=cartNo]").prop("checked",true);
					
				}else{
					
					$("input[name=cartNo]").prop("checked",false);
					
				}
				
			})
			 
			 
			$("input[name=cartNo]").click(function(){
				
				if($("#checkall").prop("checked")){
					
					$("#checkall").prop("checked",false);
					
				}
				
			})
						
			
			<!-- ------------------------------------ -->
			 
			 
		});	
	
	</script>		

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3 style="color:#bc8f8f">��ٱ�����ȸ</h3>
	    </div>
		
		
      
        <div class="row">
            <div class="col-md-1 text-center"><input type="checkbox" id="checkall" /></div>
            <div class="col-md-6 text-center">��ǰ����</div>
            <div class="col-md-2 text-center">��ǰ����</div>
            <div class="col-md-2 text-center">�� ��</div>
            <div class="col-md-1 text-center"></div>
        </div>
       
		<hr/>
		<form class="form-horizontal">
		  <c:set var="i" value="0" />
		  <c:forEach var="cart" items="${Cart}">
		  <div class="row">
			<c:set var="i" value="${ i+1 }" />
			  
			  <div class="col-md-1 text-center">
			  	<input type="checkbox" name="cartNo" value="${cart.cartNo}"/>		  	
			  </div>
			  
			  <div class="col-md-6 text-left">
				    
				<c:forEach var="name" items="${cart.cartProd.prodThumbnail.split('&')[0]}">
					<img src="/resources/images/uploadFiles/${name}" class="image" width="100" height="100">
				</c:forEach>
						
				&emsp;&emsp;${cart.cartProd.prodName }
			  </div>	 
			    	  
			    	  
			    	  
			  <div align="center" class="col-md-2 text-center quantity" value="${cart.quantity }">
			  	<c:choose>
			  		<c:when test="${cart.quantity == 1 }">
			  			<a href="#" class="btn btn-default btn-xs disabled" role="button" value="${cart.cartNo}">-</a>
			  		</c:when>
			  		<c:otherwise>
			  			<button class="btn btn-default btn-xs minus" value="${cart.cartNo}">-</button>
			  		</c:otherwise>
			  	</c:choose>
			  	<input type="text" name="quantity" value=" ${cart.quantity }" style="width:30px;" readonly/>
			  	<button class="btn btn-default btn-xs plus" value="${cart.cartNo}">+</button>
			  </div>
			  
			  
			  
			  <div align="center" class="col-md-2 text-center price" value="${cart.cartProd.prodDisPrice*cart.quantity }" >${cart.cartProd.prodDisPrice*cart.quantity } ��</div>
			  
			  
			  
			  <div class="col-md-1 text-center">
			  	<button class="btn btn-default btn-sm delete" value="${cart.cartNo}">����</button>
			  </div>
			  
			  
			  
           </div>
           <hr/>
          </c:forEach>
        
	      </form>
	      <div align="right">
	        �� �����ݾ� : <input type="text" id="totalprice" value="" min="0" readonly/> ��
	      </div>
     
      
	  <hr/>
	  
	  <div align="right">
	  	<button class="btn btn-default btn-sm">�����ϱ�</button>
	  </div>
	  
 	</div>
 	

	
</body>
</html>