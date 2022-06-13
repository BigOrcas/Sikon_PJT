<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
<meta charset="EUC-KR">
	
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<style>


.formall{
	padding:220px;
	font-family: 'Nanum Myeongjo', serif;
}

html {
  line-height: 1;
}

ol, ul {
  list-style: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

caption, th, td {
  text-align: left;
  font-weight: normal;
  vertical-align: middle;
}

q, blockquote {
  quotes: none;
}
q:before, q:after, blockquote:before, blockquote:after {
  content: "";
  content: none;
}

a img {
  border: none;
}

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
  display: block;
}

/* Colors */
/* ---------------------------------------- */
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  text-align: center;
  font-family: 'Nanum Myeongjo', serif;
  font-weight: 400;
}

a {
  text-decoration: none;
}


.info-text {
  text-align: left;
  width: 100%;
}

.form-group {
  margin-bottom: 20px;
}

h2.heading {
  font-size: 18px;
  text-transform: uppercase;
  font-weight: 300;
  text-align: left;
  color: #937062;
  border-bottom: 1px solid #937062;
  padding-bottom: 3px;
  margin-bottom: 20px;
}

.controls {
  text-align: left;
  position: relative;
}
.controls input[type=text],
.controls input[type=email],
.controls input[type=number],
.controls input[type=date],
.controls input[type=tel],
.controls textarea,
.controls button,
.controls select {
  padding: 12px;
  font-size: 14px;
  border: 1px solid #c6c6c6;
  width: 100%;
  margin-bottom: 18px;
  color: #888;
  font-family: 'Nanum Myeongjo', serif;
  font-size: 16px;
  font-weight: 300;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -ms-border-radius: 2px;
  -o-border-radius: 2px;
  border-radius: 2px;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}
.controls input[type=text]:focus, .controls input[type=text]:hover,
.controls input[type=email]:focus,
.controls input[type=email]:hover,
.controls input[type=number]:focus,
.controls input[type=number]:hover,
.controls input[type=date]:focus,
.controls input[type=date]:hover,
.controls input[type=tel]:focus,
.controls input[type=tel]:hover,
.controls textarea:focus,
.controls textarea:hover,
.controls button:focus,
.controls button:hover,
.controls select:focus,
.controls select:hover {
  outline: none;
  border-color: #937062;
}

.controls .fa-sort {
  position: absolute;
  right: 10px;
  top: 17px;
  color: #999;
}
.controls select {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  cursor: pointer;
}

.controls textarea {
  resize: none;
  height: 200px;
}

input:-webkit-autofill {
   -webkit-box-shadow: 0 0 0 1000px #fff inset;
   -webkit-text-fill-color: #888;
}

.submit {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  padding: 12px 0;
}
.submit:hover {
  background-color: #937062d4;
}

.cancel {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  padding: 11px 0;
}
.cancel:hover {
  background-color: #e7e2e2;
}

.point {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  padding: 12px 0;
  width: 30%;
}
.point:hover {
  background-color: #937062d4;
}
.DaumPostcode {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  padding: 12px 0;
  width:100%;
}
.DaumPostcode:hover {
  background-color: #937062d4;
}



.clear:after {
  content: "";
  display: table;
  clear: both;
}

.grid {
  background: #f7f7f7;
}
.grid:after {
  /* Or @extend clearfix */
  content: "";
  display: table;
  clear: both;
}

.grid [class*=col-]:last-of-type {
  padding-right: 0;
}

.col-2-3 {
  width: 66.66%;
}

.col-1-3 {
  width: 33.33%;
}

.col-1-2 {
  width: 50%;
}

.size {
  width: 25%;
}

[class*=col-] {
  float: left;
  padding-right: 10px;
}

@media (max-width: 760px) {
  .col-1-4-sm,
.col-1-3,
.col-2-3 {
    width: 100%;
  }

  [class*=col-] {
    padding-right: 0px;
  }
}
.col-1-8 {
  width: 12.5%;
}

</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
		//============= "����"  Event ���� =============
		
		/*	
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#iamportPayment" ).on("click" , function() {
				alert('����');
				console.log($("#usedCoupon").val());
				fncAddPurchase();
			});
		});	
		//*/
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.go(-1);
			});
		});	
	
		//============= �ּҰ� ǥ�� =============
		 $(function() {	
			var addr = $("input:hidden[name='divyAddr']").val();
			console.log(addr);
			///*
			if(addr.indexOf('/',0) != -1){
				var list = addr.split('/');
				
				$("#sample6_postcode").val(list[0]);
				$("#sample6_address").val(list[1]);
				$("#sample6_detailAddress").val(list[2]);
				$("#sample6_extraAddress").val(list[3]);
				
			}else{
				$("#sample6_address").val(addr);
			}
			//*/
		 });	

		//====================================================
		function fncAddPurchase() {
			
			
			var addr = $("#sample6_postcode").val() + "/" +  $("#sample6_address").val() + "/" +  $("#sample6_detailAddress").val() + "/" + $("#sample6_extraAddress").val();
			console.log('submit');
			console.log(addr);
			$("input:hidden[name='divyAddr']").val( addr );
			
			$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();

			
		}
		

		//======= �Ѱ����ݾ� �� ��������Ʈ ��� =============================================
		$(function() {
			var price = $( "#price" ).val();
			console.log("price: "+price);
			
			var quantity = $("#purchaseQuantity").val();
			console.log("quantity: "+quantity);
			
			var earnpoint = Math.round(price*0.05*quantity);
			console.log("earnpoint: "+earnpoint);
			
			$( "#earnPoint" ).val(earnpoint);
			$("#totalprice").val(price*quantity);
		});	
		
		
		//======= ����Ʈ ��λ�� =============================================	
		$(function() {
			$("#point" ).on("click" , function() {
			var allpoint = $(this).val();
			console.log("����Ʈ ��λ��: "+allpoint);
			
			$( "#usedPoint" ).val(allpoint);
			});
		});	
		 
	</script>		
<!-- �ּҷ� --> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var addr = ''; // �ּ� ����
                var extraAddr = ''; // �����׸� ����

                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    addr = data.roadAddress;
                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    addr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script> 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
  

/*

	
	$(function() {
		
		$("button.iamportPayment").on("click" , function() {
			console.log("������Ʈ");		
			
			var payopt = $("button.iamportPayment").attr('value');
			console.log("payopt: "+payopt);
			$("#paymentOpt").val(payopt);
			
			payment();	
		});
	});	
	
function payment(data) {
	
	var payment = $("#paymentOpt").val();
	console.log("payment: "+payment);
	
	var prodname = $("#prodname").val();
	console.log("prodname: "+prodname);
	
	var prodprice = $("#prodprice").val();
	console.log("prodprice: "+prodprice);

	var buyeremail = $("#buyeremail").val();
	console.log("buyeremail: "+buyeremail);

	var buyername = $("#buyername").val();
	console.log("buyername: "+buyername);

	var buyerphone = $("#buyerphone").val();
	console.log("buyerphone: "+buyerphone);
	
	var address = $("#sample6_address").val();
	console.log("address: "+address);
	
	var postcode = $("#sample6_postcode").val();
	console.log("postcode: "+postcode);
	
	var uid="${uid }";
	console.log("uid: "+uid);
	
	IMP.init('imp05238113'); 
    
    IMP.request_pay({
    	pg : "kakaopay", 
        pay_method : payment,
        merchant_uid : uid ,
        name : prodname ,
        amount : prodprice ,
        buyer_email : buyeremail ,
        buyer_name : buyername ,
        buyer_tel : buyerphone ,
        buyer_addr : address ,
        buyer_postcode : postcode 
    }, function(rsp) {
        if ( rsp.success ) {
            fncAddPurchase();
        } else {
        	alert("���� ����");
            
        }
    });
	
}
    //*/
    


    </script>
	
</head>

<body>

<div>
	<jsp:include page="/layout/toolbar.jsp" />
</div>

<div class="container">
<div class="formall">

<h2>| PURCHASE |</h2>

<br><br><br>

<form action="">
  <!--  General -->
  <div class="form-group">
    <h2 class="heading">�������</h2>
    
    <div class="controls">
    <label for="prodName">�޴º� �̸�</label>
      <input type="text" id="receiverName" class="floatLabel" name="receiverName" placeholder="${user.userName}">
    </div>
    
	<div class="controls">
	<label for="prodName">����ó</label>
	     <input type="text" id="receiverPhone" class="floatLabel" name="receiverPhone" placeholder="${user.phone}">
    </div>
    
	<c:if test="${!empty user}">
	    <input type="hidden" class="form-control" id="receiverEmail" name="receiverEmail" value="${user.userId}">
	</c:if>
    
   <c:if test="${empty user}"> 
   <div class="controls">
	<label for="prodName">�̸���</label>
	     <input type="text" id="receiverEmail" class="floatLabel" name="receiverEmail" placeholder="${user.phone}">
    </div>
    </c:if>
    
    <div class="controls">
	<label for="prodName">�����</label>
	<div>
	 <div class="grid">
		<div class="col-2-3 col-2-3-sm">
		<input type="text" id="sample6_postcode" name="postcode" placeholder="�����ȣ" value="">
		</div>
		<div class="col-1-3 col-1-3-sm">
		<input type="button" onclick="sample6_execDaumPostcode()" class="DaumPostcode" value="�����ȣ ã��"><br>
		</div>
	</div>
		<input type="text" id="sample6_address" name="address" placeholder="�ּ�" value=""><br>
		<input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="���ּ�" value=""><br>
		<input type="text" id="sample6_extraAddress" name="extraAddress" placeholder="�����׸�" value="">
	    <input type="hidden" name="divyAddr" value="${user.addr}">
    </div>
    </div>
    
	<div class="controls">
	<label for="prodName">��۸޽���</label>
	     <input type="text" id="divyMessage" class="floatLabel" name="divyMessage" placeholder="��û������ �����ּ���.">
    </div>
   
   <br>
   
  </div>
  

  <div class="form-group">
    <h2 class="heading">�ֹ���ǰ</h2>
    
    <input type="hidden" name="prodNo" value="${product.prodNo }" />
	<input type="hidden" name="userId" value="${user.userId }" />
      
	<div class="controls">
	     <div style="border: 1px solid #937062; height:100px;"></div>
    </div>
    
    <input type="hidden" id="price" value="${product.prodDisPrice}">
    <input type="hidden" min="0" class="form-control" id="purchaseQuantity" name="purchaseQuantity" value="${quantity}">
		
 </div>
 
 <br>
  
  <div class="form-group">
    <h2 class="heading">���� / ����Ʈ</h2>
    
    <div class="controls">
        <i class="fa fa-sort"></i>
        <c:if test="${product.couponApply == 'Y' }">
      		<select name="usedCoupon" id="usedCoupon" class="floatLabel">
	      		<option>����� ������ �������ּ���</option>
		      		<c:forEach var="couponlist" items="${coupon}">
		      		<option value="${couponlist.issueNo}">${couponlist.couponName}</option>
		      		</c:forEach>
      		</select>
      </c:if>
      <c:if test="${product.couponApply == 'N' }">
      	<input type="text" class="floatLabel" id="usedCoupon" name="usedCoupon" placeholder="���������� �Ұ��� ��ǰ�Դϴ�." readonly >
      </c:if>
      </div>  
    
    <div class="grid">
	    <div class="col-1-2 col-1-2-sm">
	      <div class="controls">
	        <input type="text" id="usedPoint" class="floatLabel" name="usedPoint" value="0">
	      </div>      
	    </div>
	    <div class="col-1-2 col-1-2-sm">
	      <button Type="button" class="point" id="point" value="${user.holdpoint }">��� ���</button>&emsp;     
	      ���� ����Ʈ ${user.holdpoint } P
	    </div>
	    
	
	</div>
    
    
  </div>
  <div class="form-group">
    <h2 class="heading">�����ݾ�</h2>
    
    <div class="controls">
    <label for="prodName">�� �����ݾ�</label>
      <input type="text" id="totalprice" class="floatLabel" name="totalprice" value="" style="border:none;width:10%;text-align:right;">��
    </div>
    <div class="controls">
    <label for="prodName">���� ����Ʈ</label>
      <input type="text" id="earnPoint" class="floatLabel" name="earnPoint" value="" style="border:none;width:10%;text-align:right;">P
    </div>
    
  </div>
  
  
  <h2 class="heading"></h2>
  
  	<button type="submit" value="Submit" class="size submit">�����ϱ�</button> &nbsp;
	<button class="size cancel">�� ��</button>
  
</form>


	</div>
</div>
	
</body>

</html>