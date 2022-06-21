<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>


div.container {
	padding-top: 200px;
	font-family: 'Nanum Myeongjo', serif;
	width: 652px;
	padding-bottom: 200px;
}


.buy {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  font-size: large;
  padding: 12px 0;
  width: 49.3%;
}
.buy:hover {
  background-color: #937062d4;
}

.wish {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  font-size: large;
  padding: 11px 0;
  width: 49.3%;
}
.cancel {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  font-size: large;
  padding: 11px 0;
  width: 49.3%;
}
.cancel:hover {
  background-color: #e7e2e2;
}

html input[type=button]{
	background-color: #937062;
	border: none;
	color: #fff;
}

html input[type=button]:hover{
	background-color: #937062d4;
}


.point{
	background-color: #f7f7f7;
	border: 1px solid #937062;
	color: #937062;
}

.point:hover{
	background-color: #e7e2e2;
}

.search{
	display: flex;
	padding: 5px;
}

.form-divy{
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

.addr{
	padding-top : 5px;
}


.subtitle{
	border-top: 2px solid #937062;
	border-bottom: 1px solid #937062;
	width: 652px;
	margin-left: -15px;
    height: 50px;
	padding: 15px;
	font-weight: bold;
	font-size: 18px;
}
.imagetd{
	width:20%;
}
.content{
	text-align: left;
	padding-left: 20px
}

</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">



function fncAddApply() {
	
	var cookStock=$("#cookStock").val();
	var cookStatus=$("input[name='cookStatus']").val();
	
	console.log(cookStock);
	console.log(cookStatus);
	if (cookStock < cookStatus) {
		alert("�����ο��� �����Ǿ����ϴ�");
		return;
	}
	
	
	$("form").attr("method" , "POST").attr("action" , "/apply/addApply?cookNo=${cook.cookNo}").submit();	
}
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

	$( "#buyjust" ).on("click" , function() {
		fncAddApply();
	});
});	
	 
$(function() {

	$(".cancel").on("click" , function() {
		history.go(-1);
	});
});	







</script>



</head>

<body>
        <jsp:include page="/layout/toolbar.jsp" />

	


	<div class="container" >
	
		<div class="layout">
		<h1 class="bg-defualt text-center">��ŷŬ���� ��û</h1><br>
		
	<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
	<input type="hidden" id="userId" value="${user.userId }"/>
	<input type="hidden" id="cookNo" value="${cook.cookNo}"/>
		

			<div>		  
		
		
		
				  <div class="subtitle">
				  <p>��ŷŬ��������</p>
				  </div><br>
				  
		  	<input type="hidden" id="userName"  value="${user.userName }" />  
		  <div class="form-group">
		    <label for="userName" class="form-control">��û���̸�</label>
		 
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="�������̸�" value="${user.userName}"> 
		    
		  </div>
		  
		   <input type="hidden" id="phone"  value="${user.phone }" />
		    <div class="form-group">
		    <label for="phone" class="form-control">��û�ڿ���ó</label>		    
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="��û�ڿ���ó"  value="${user.phone}">
		    
		  </div>
		  
		  
	  
		  
			<div><br>
				  <div class="subtitle">
				  <p>��ŷŬ����</p>
				  </div><br>
				  
				  <div class="form-group">
				  <table style="width: 100%">
					  <tr>
						<td class="imagetd">
							<img src="/resources/images/uploadFiles/${cook.cookFilename}" width="300" height="300" align="absmiddle"/>
						</td>
						<td class="content">
							<p style="font-weight: bold;font-size: 15px">${cook.cookName}</p>
							<p>${cook.cookPrice} ��</p>

							
							

		<p>��ŷŬ���� ���: ${cook.cookLocation} </p>
		<p>�׸� : 	
				
		    <c:if test = "${cook.cookTheme =='KO'}">
			�ѽ�
			</c:if>
			<c:if test = "${cook.cookTheme == 'JA'}">
			�Ͻ�
			</c:if>
			<c:if test = "${cook.cookTheme == 'AM'}">
			���
			</c:if>
			<c:if test = "${cook.cookTheme == 'CH'}">
			�߽�
			</c:if>
			<c:if test = "${cook.cookTheme == 'DE'}">
			����
			</c:if>	</p>
			
			<p>���̵� :
			<c:if test = "${cook.cookDifficuty == '1'}">
			�ʱ� 
			</c:if>
			<c:if test = "${cook.cookDifficuty == '2'}">
			�߱�
			</c:if>
			<c:if test = "${cook.cookDifficuty == '3'}">
			���
			</c:if>			
			
			
			</p>		  	
					  	</td>
					  </tr>
				 </table>		 
				</div>
			</div>	 				  
				  
				  
				<div class="subtitle">
				  <p>���� </p>
				  </div><br>
				  
				 
				 <div class="form-group">
				    <label for="usedCoupon">���� ��¥</label>
<input type="date" class="form-control" id="checkDate" name="checkDate" placeholder="������¥" value="${apply.checkDate}" >
				  </div>
		  		  				  			

	  
		  

		  
		  	  
		  <div class="form-group">
		    <label for="userId" >��û�ھ��̵� :  ${user.userId} </label>
		   
		     
		  
		  </div>
		  
		  	  
		  <div class="form-group">
		    <label for="paymentOption" >�������</label>
		   
		      <select 	name="paymentOption"		class="form-control" >
				<option value="1" selected="selected">īī�����̱���</option>
				<option value="2">�ſ�ī�屸��</option>
			</select>
		   
		  </div>
		  
		    <div class="form-group">
		    <label for="text">�����ð� :&emsp;</label>
		    
		   ${cook.startTime}&emsp;~&emsp; ${cook.endTime}
		   
		    
		      
		     
		    
		  </div>		  
		  


		   <input type="hidden" id="cookStock"  value="${cook.cookStock }" />
		      <div class="form-group">
		  
		  
		    
		  <strong> <p>��û�ο�: ${cookStatus} ��</p><input type="hidden" min="0" class="form-control" id="cookStatus" name="cookStatus" value="${cookStatus}" /></strong>
		  </div>
	  	
	  
			<br>

			
				<div class="subtitle">
				  <p>��������</p>
				  </div><br>
				  
				 
				 <div class="form-group">
				 <ul class="payul">
				 	<li>
				 
				 		<input type="radio" name="payoption" id="paybyca" checked/> <span style="font-size:16px; font-weight: bold;">�ſ�ī��</span>
				    </li>
				    <li> 
				    	<input type="radio" name="payoption"/> <img src="https://storage.wcuisine.net/web-assets/images/img-pay-kakao@3x.png" alt="kakaopay icon" width="58" height="24">
				  	</li>
				  </ul>
				  </div>			
	<input type="hidden" name="impNumber" id="impNumber" value="">
	  <input type="hidden" name="paymentOpt" id="paymentOpt" value="">	
	  
	  	</form>  
	 <input type="hidden" id="cookNo" value="${cook.cookNo }"/> 	
	<input type="hidden" id="cookName" value="${cook.cookName }"/>
	<input type="hidden" id="cookPrice" value="${cook.cookPrice }"/>
	<input type="hidden" id="phone" value="${user.phone }"/>
	<input type="hidden" id="userName" value="${user.userName }"/>
	<input type="hidden" id="userId" value="${user.userId }"/>
	<input type="hidden" id="cookLocation" value="${cook.cookLocation }"/>		
			<br>
			
			<div class="text-center  buttons">
				 <input type="hidden" id="cookNo" value="${cook.cookNo }"/> 	
			 	<button type="button" class="btn.btn-primary" id="buyjust">�׳ɰ����ϱ�</button>
				<button type="button" class="buy" id="iamportPayment" value="">�����ϱ�</button>					
				<button type="button" class="cancel" href="#" role="button">��&emsp;��</button>
			</div>			
			
			
 	</div>
</div>	


		  
	     
  

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script>
  
	
$(function() {
	
	$("#iamportPayment").on("click" , function() {
		console.log("������Ʈ");		
		
		if($("#paybyca").prop("checked")){
			
			$("input[name=paymentOpt]").val("CA");
			paymentCA();
			
		}else{
			
			$("input[name=paymentOpt]").val("KA");
			paymentKA();
			
		}
	});
});	
	
	function paymentKA(data) {
		
		var payment = $("#paymentOpt").val();
		console.log("payment: "+payment);
		
		var cookName = $("#cookName").val();
		console.log("cookName: "+cookName);
		
		var cookPrice = $("#cookPrice").val();
		console.log("cookPrice: "+cookPrice);
		
		var phone = $("#phone").val();
		console.log("phone: "+phone);


		var userName = $("#userName").val();
		console.log("userName: "+userName);

		var cookLocation = $("#cookLocation").val();
		console.log("cookLocation: "+cookLocation);
		
		var uid="${uid }";
		console.log("uid: "+uid);
		
		
		
		IMP.init('imp05238113'); 
	    
	    IMP.request_pay({
	    	pg : "kakaopay", 
	        pay_method : payment,
	        merchant_uid : uid ,
	        name : cookName ,
	        amount : cookPrice ,
	        buyer_name : userName ,
	        buyer_tel : phone ,
	        cookLocation : cookLocation

	    }, function(rsp) {
	    	console.log(rsp);
	    	$.ajax({

	        	type : "POST",
	        	url : "/apply/json/verifyIamport?imp_uid=" + rsp.imp_uid 
	        	
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	if(rsp.paid_amount == data.response.amount){
	        		$("#impNumber").val(rsp.imp_uid);
		        	alert("���� �� ���������Ϸ�");
		        	fncAddApply();
	        	} else {
	        		alert("���� ����");
	        	}
	        });
	    });
	}
	function paymentCA(data) {
		
		var payment = $("#paymentOpt").val();
		console.log("payment: "+payment);
		
		var cookName = $("#cookName").val();
		console.log("cookName: "+cookName);
		
		var cookPrice = $("#cookPrice").val();
		console.log("cookPrice: "+cookPrice);
		
		var phone = $("#phone").val();
		console.log("phone: "+phone);


		var userName = $("#userName").val();
		console.log("userName: "+userName);

		var cookLocation = $("#cookLocation").val();
		console.log("cookLocation: "+cookLocation);
		
		var uid="${uid }";
		console.log("uid: "+uid);
		
		
		
		IMP.init('imp05238113'); 
	    
	    IMP.request_pay({
	    	pg : "html5_inicis", 
	        pay_method : payment,
	        merchant_uid : uid ,
	        name : cookName ,
	        amount : cookPrice ,
	        buyer_name : userName ,
	        buyer_tel : phone ,
	        cookLocation : cookLocation

	    }, function(rsp) {
	    	console.log(rsp);
	    	$.ajax({

	        	type : "POST",
	        	url : "/apply/json/verifyIamport?imp_uid=" + rsp.imp_uid 
	        	
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	if(rsp.paid_amount == data.response.amount){
	        		$("#impNumber").val(rsp.imp_uid);
		        	alert("���� �� ���������Ϸ�");
		        	fncAddApply();
	        	} else {
	        		alert("���� ����");
	        	}
	        });
	    });
	}	
	    //*/
    
    </script>
		
		  
		
		  
		  
		

		
		  
		  
	


<!-- �����ϱ� /////////////////////////////////////-->		
  


 
	
</body>

</html>