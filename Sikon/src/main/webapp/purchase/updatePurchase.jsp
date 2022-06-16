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
	padding-top: 220px;
	font-family: 'Nanum Myeongjo', serif;
	width: 652px;
	padding-bottom: 150px;
}


.update {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  font-size: large;
  padding: 12px 0;
  width: 49.3%;
}
.update:hover {
  background-color: #937062d4;
}

.check {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  font-size: large;
  padding: 11px 0;
  width: 49.3%;
}
.check:hover {
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

h5,h6{
	width: 15%;
	font-weight: bold;
}

label{
	width: 15%;
}

.sectd{
	display: flex;
}
.paycontent{
	border-top: 2px solid #937062;
	width: 652px;
	padding-top: 20px;
}
.payment{
	width:84%;
	text-align: right;
}

.totalpay{
	font-size: 20px;
}
.totals{
	color: #FF4800;
}
.form-group, .buttons{
	width: 652px;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(".check").on("click" , function() {
				history.go(-2);
			});
			
			$(".update").on("click" , function() {
				fncUpdatePurchase();
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
			
			
		function fncUpdatePurchase() {
			
			var addr = $("#sample6_postcode").val() + "/" +  $("#sample6_address").val() + "/" +  $("#sample6_detailAddress").val() + "/" + $("#sample6_extraAddress").val();
			console.log('submit');
			console.log(addr);
			$("input:hidden[name='divyAddr']").val( addr );
			
			$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchase.tranNo }").submit();
		
			
		}	
			
		
		
		
		
		 
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
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
        <jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">
<form>

			<br>
				<h1 class="bg-defualt text-center">��������</h1><br>

			<div class="subtitle">
			  <p>�������</p>
			</div><br>
		
				  
				 <div class="form-group">
				    <label for="receiverName">�޴º� �̸�</label>
				      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName }">
				  </div>
				  
				 <div class="form-group">
				    <label for="receiverPhone">����ó</label>
				      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}">
				  </div>
				  
				  <c:if test="${empty user}">
					  <div class="form-group">
					    <label for="receiverEmail">�̸���</label>
					    <input type="text" class="form-control" id="receiverEmail" name="receiverEmail" value="${purchase.receiverEmail}">
					   
					  </div>
				  </c:if>
				  
				  <c:if test="${!empty user}">
				      <input type="hidden" class="form-control" id="receiverEmail" name="receiverEmail" value="${purchase.receiverEmail}">
				  </c:if>
				  
				  <div class="form-group divyAddr">
				    <label for="divyAddr">�����</label>
				    <table style="width:652px">
				    	<tr>
				    	<td>
				        <input type="text" class="form-divy postcode" id="sample6_postcode" name="postcode" value="">
				        </td>
				        <td class="search" >
						<input type="button" class="form-divy searchpost" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
						</td>
						</tr>
						
						<tr>
						<td colspan="2">
						<input type="text" class="form-divy" id="sample6_address" name="address"  value=""><br>
						</td>
						</tr>
						<tr>
						<td colspan="2"  class="addr">
						<input type="text" class="form-divy" id="sample6_detailAddress" name="detailAddress" value=""><br>
						</td>
						</tr>
						<tr>
						<td colspan="2" class="addr">
						<input type="text" class="form-divy" id="sample6_extraAddress" name="extraAddress" value="">
						</td>
						</tr>
						
					</table>
				    	<input type="hidden" class="form-divy" name="divyAddr" value="${purchase.divyAddr}">
				  </div>
				  
				  
				   <div class="form-group">
				    <label for="divyMessage">��۸޽���</label>
				      <input type="text" class="form-control" id="divyMessage" name="divyMessage" value="${purchase.divyMessage}" >
				  </div>
				
		
				  
				  
			<div><br>
				  <div class="subtitle">
				  <p>�ֹ���ǰ</p>
				  </div><br>
				  
				  <div class="form-group">
				  <table style="width: 100%">
					  <tr>
						<td class="imagetd">
							<img src="/resources/images/uploadFiles/${purchase.purchaseProd.prodThumbnail.split('&')[0]}" class="image" width="120" height="120">
						</td>
						<td class="content">
							<p style="font-weight: bold;font-size: 15px">${purchase.purchaseProd.prodName}</p>
							<p>${purchase.purchaseProd.prodDisPrice} ��</p>
							<p>��ۺ�: 3000 ��</p><input type="hidden" class="form-control" id="divyFee" name="divyFee" value="3000">
							<p>���ż���: ${purchase.purchaseQuantity} ��</p><input type="hidden" min="0" class="form-control" id="purchaseQuantity" name="purchaseQuantity" value="${purchase.purchaseQuantity}"  />
							<c:if test="${purchase.purchaseProd.couponApply == 'N' }">
								<p style="color:#F0445C">*���� ������ �Ұ����� ��ǰ�Դϴ�.</p>
							</c:if>
						  	<input type="hidden" id="price" value="${purchase.purchaseProd.prodDisPrice}">
					  	
					  	</td>
					  </tr>
				 </table>		 
				</div>
			</div>	  
			
			
			<input type="hidden" name="paymentOpt" value="${purchase.paymentOpt}">
			<input type="hidden" name="usedCoupon" value="${purchase.usedCoupon}">
			<input type="hidden" name="usedPoint" value="${purchase.usedPoint}">
			<input type="hidden" name="earnPoint" value="${purchase.earnPoint}">
			
			
			
			
			
			
			
			<br>
				  
			<section class="paycontent">	    
				  
				  <div class="sectd">
				  	<h5>�� ��ǰ�ݾ�</h5>
				  	<div class="payment">${purchase.purchaseProd.prodDisPrice * purchase.purchaseQuantity}��</div>
				  </div>
				  
				  <div class="sectd">
				  	<h5>���� ���</h5>
				  	<div class="payment">
				  		<c:if test="${!empty purchase.usedCoupon}">- ${purchase.usedCoupon}��</c:if>
				  		<c:if test="${empty purchase.usedCoupon}">- 0��</c:if>
				  	</div>
				  </div>
				  
				  <div class="sectd">
				  	<h5>����Ʈ ���</h5>
				  	<div class="payment">- ${purchase.usedPoint}P</div>
				  </div>
				  
				  <div class="sectd">
				  	<h5>��ۺ�</h5>
				  	<div class="payment">+ ${purchase.divyFee}��</div>
				  </div>
				  
				  <br>
				  
				  <div class="sectd">
				  	<h5>�� �����ݾ�</h5>
				  	<div class="payment totals"><strong class="totalpay">${purchase.purchaseProd.prodDisPrice * purchase.purchaseQuantity - purchase.usedPoint + purchase.divyFee }</strong>��</div>
				  </div>
				  
				  <div class="sectd">
				  	<h6>���� ����Ʈ</h6>
				  	<div class="payment totals">+ ${purchase.earnPoint} P</div>
				  </div>
				  
				  
				  <hr>
				  
				  
				  <div class="sectd">
				  	<h5>��������</h5>
				  	<div class="payment">
				  		<c:if test="${purchase.paymentOpt == 'KA'}">īī�� �������</c:if>
						<c:if test="${purchase.paymentOpt == 'CA'}">�ſ�ī�� ����</c:if>
				  	</div>
				  </div>
				  
				  
			</section>
			
</form>
			<br><br>
			<div class="text-center buttons">
			
				<c:if test="${purchase.divyStatus.equals('001') }">	
				<button type="button" class="update" >�����ϱ�</button>	
				</c:if>
				
				<button type="button" class="check" >��&emsp;��</button>
			</div>
				
			<br>
			
			
 	</div>

	
</body>

</html>