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
			$(".cancel").on("click" , function() {
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
  

///*

	
	$(function() {
		
		$("#iamportPayment").on("click" , function() {
			console.log("������Ʈ");		
			
			var payopt = $("#iamportPayment").attr('value');
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
    	console.log(rsp);
    	$.ajax({

        	type : "POST",
        	url : "/purchase/json/verifyIamport?imp_uid=" + rsp.imp_uid 
        	
        }).done(function(data) {
        	
        	console.log(data);
        	
        	if(rsp.paid_amount == data.response.amount){
	        	alert("���� �� ���������Ϸ�");
	        	fncAddPurchase();
        	} else {
        		alert("���� ����");
        	}
        });
    });
	
}
    //*/
    


    </script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
        <jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">
	<div class="layout">
			<br>
				<h1 class="bg-defualt text-center">PURCHASE</h1><br>
				
				<!-- form Start /////////////////////////////////////-->
				<form class="form-horizontal">
				
				  <input type="hidden" name="prodNo" value="${product.prodNo }" />
				  <input type="hidden" name="userId" value="${user.userId }" />
		
			  
			<div>
				  
				  <div class="subtitle">
				  <p>�������</p>
				  </div><br>
				  	  
				  <div class="form-group">
				    <label for="receiverName">�޴º� �̸�</label>
				      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}">
				  </div>
				  
				 <div class="form-group">
				    <label for="receiverPhone">����ó</label>
				      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
				  </div>
				  
				  <c:if test="${!empty user}">
				      <input type="hidden" class="form-control" id="receiverEmail" name="receiverEmail" value="${user.userId}">
				  </c:if>
				  
				  <c:if test="${empty user}">
					  <div class="form-group">
					    <label for="receiverEmail">�̸���</label>
					      <input type="text" class="form-control" id="receiverEmail" name="receiverEmail" placeholder="��ȸ�� ����" >
					  </div>
				  </c:if>
				  
				  <div class="form-group divyAddr">
				    <label for="divyAddr">�����</label>
				    <table style="width:652px">
				    	<tr>
				    	<td>
				        <input type="text" class="form-divy postcode" id="sample6_postcode" name="postcode" placeholder="�����ȣ" value="">
				        </td>
				        <td class="search" >
						<input type="button" class="form-divy searchpost" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
						</td>
						</tr>
						
						<tr>
						<td colspan="2">
						<input type="text" class="form-divy" id="sample6_address" name="address" placeholder="�ּ�" value=""><br>
						</td>
						</tr>
						<tr>
						<td colspan="2"  class="addr">
						<input type="text" class="form-divy" id="sample6_detailAddress" name="detailAddress" placeholder="���ּ�" value=""><br>
						</td>
						</tr>
						<tr>
						<td colspan="2" class="addr">
						<input type="text" class="form-divy" id="sample6_extraAddress" name="extraAddress" placeholder="�����׸�" value="">
						</td>
						</tr>
						
					</table>
				    	<input type="hidden" class="form-divy" name="divyAddr" value="${user.addr}">
				  </div>
				  
				  
				   <div class="form-group">
				    <label for="divyMessage">��۸޽���</label>
				      <input type="text" class="form-control" id="divyMessage" name="divyMessage" placeholder="��û������ �����ּ���."  >
				  </div>
				
			</div>
				  
				  
			<div><br>
				  <div class="subtitle">
				  <p>�ֹ���ǰ</p>
				  </div><br>
				  
				  <div class="form-group">
				  <table style="width: 100%">
					  <tr>
						<td class="imagetd">
							<img src="/resources/images/uploadFiles/${product.prodThumbnail.split('&')[0]}" class="image" width="120" height="120">
						</td>
						<td class="content">
							<p style="font-weight: bold;font-size: 15px">${product.prodName}</p>
							<p>${product.prodDisPrice} ��</p>
							<p>��ۺ�: 3000 ��</p><input type="hidden" class="form-control" id="divyFee" name="divyFee" value="3000">
							<p>���ż���: ${quantity} ��</p><input type="hidden" min="0" class="form-control" id="purchaseQuantity" name="purchaseQuantity" value="${quantity}" />
							<c:if test="${product.couponApply == 'N' }">
								<p style="color:#F0445C">*���� ������ �Ұ����� ��ǰ�Դϴ�.</p>
							</c:if>
						  	<input type="hidden" id="price" value="${product.prodDisPrice}">
					  	
					  	</td>
					  </tr>
				 </table>		 
				</div>
			</div>	  
			<div>	  
				 <br>
				<div class="subtitle">
				  <p>���� / ����Ʈ</p>
				  </div><br>
				  
				 
				 <div class="form-group">
				    <label for="usedCoupon">���� ���</label>
				   	  <c:if test="${product.couponApply == 'Y' }">
				   	  		
				      		<select name="usedCoupon" class="form-control" id="usedCoupon">
				      			<option value=""> ����� ������ �������ּ��� </option>
						      		<c:forEach var="couponlist" items="${coupon}">
						      			<option value="${couponlist.issueNo}">${couponlist.couponName}</option>
						      		</c:forEach>
				      		</select>
				      		
				      </c:if>
				      <c:if test="${product.couponApply == 'N' }">
				      	<input type="text" class="form-control" id="usedCoupon"  placeholder="���������� �Ұ��� ��ǰ�Դϴ�." readonly >
				      </c:if>
				  </div>
				  
				  
				  
				  <div class="form-group">
				    <label for="usedPoint">����Ʈ ���</label>
				     <table>
				    	<tr>
				    	<td>
				      <input type="text" class="form-control" id="usedPoint" name="usedPoint" value="0">
				      </td>
				      <td class="search">
				      <button type="button" class="point" id="point" value="${user.holdpoint }">��� ���</button>
				      <h5>&emsp;���� ����Ʈ ${user.holdpoint } P</h5>
				      </td>
				      </tr>
				      </table>
				  </div>
				  
			</div>
				  
			<div>	    
				  
				  <div class="form-group">
				  <label for="purchaseQuantity">�� �����ݾ�</label>
				    <input type="text" id="totalprice" name="totalprice" value=""  style="border:none;width:50px;text-align: right;">��
				  </div>
				  
				   <div class="form-group">
				  <label for="purchaseQuantity">���� ����Ʈ</label>
				    <input type="text" id="earnPoint" name="earnPoint" value=""  style="border:none;width:50px;text-align: right;">P
				  </div>
				  
			</div>
			
			
			<input type="hidden" name="paymentOpt" id="paymentOpt" value="">
			
			</form>
			
			<!-- �����ϱ� /////////////////////////////////////-->	
			<input type="hidden" id="prodname" value="${product.prodName }"/>
			<input type="hidden" id="prodprice" value="${product.prodDisPrice }"/>
			<input type="hidden" id="buyeremail" value="${user.userId }"/>
			<input type="hidden" id="buyername" value="${user.userName }"/>
			<input type="hidden" id="buyerphone" value="${user.phone }"/>
			
	
			<br>
			<div class="text-center">
				<button type="button" class="buy" id="iamportPayment" value="KA">�����ϱ�</button>	
				<button type="button" class="cancel" href="#" role="button">��&emsp;��</button>
			</div>
				
			<br>
 	</div>
</div>	
	
</body>

</html>