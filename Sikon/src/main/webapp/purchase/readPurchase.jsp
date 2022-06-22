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
<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">
<style>


div.container {
	padding-top: 220px;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
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
html input[type=text]{
	background-color: #f7f7f7;
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

h5,h6{
	width: 15%;
	font-weight: bold;
}

label{
	width: 15%;
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
.golist {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  font-size: large;
  padding: 11px 0;
  width: 49.3%;
}
.golist:hover {
  background-color: #e7e2e2;
}

.paycontent{
	border-top: 2px solid #937062;
	width: 652px;
	margin-left: -15px;
	padding-top: 20px;
}
.sectd{
	display: flex;
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
.info{
	width: 15%;
	font-weight: bold;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
		$(function() {
			$(".check").on("click" , function() {
				self.location = "/product/listProduct";
			});
		
		});	

		$(function() {
			
			var why = "${purchaseInfo.couponRate}";
			
			var prodprice = Number("${purchaseInfo.prodprice}");
			var quantity = Number("${purchaseInfo.prodquantity}");
			
			prodprice = prodprice*quantity;
			
			var divyfee = Number("${purchaseInfo.divyfee}");
			var couponvalue = Number("${purchaseInfo.couponvalue}");
			var couponRate = prodprice*("${purchaseInfo.couponRate}");
			var pointpay = Number("${purchaseInfo.pointpay}");
			var serial = "${purchaseInfo.serial}";
			
			var couponpay = couponvalue+(couponRate);
			
			console.log("why: "+why);
			console.log("==========");
			
			console.log("prodprice: "+prodprice);
			console.log("quantity: "+quantity);
			console.log("divyfee: "+divyfee);
			console.log("couponvalue: "+couponvalue);
			console.log("couponRate: "+couponRate);
			console.log("pointpay: "+pointpay);
			console.log("serial: "+serial);
			console.log("couponpay: "+couponpay);
			
			
			
			$("#totalProdPrice").val(prodprice);
			$("#couponuse").val("- "+couponpay);
			$("#usingpoint").val("- "+pointpay);
			$("#divyfee").val("+ "+divyfee);
			$("#totalpayment").val(prodprice-couponpay-pointpay+divyfee);
			$("#earnPoint").val(prodprice*0.05);
			
		});	 
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
				<h1 class="bg-defualt text-center" style="color:#333;font-family: 'Tiro Devanagari Sanskrit', serif;">| P A Y M E N T |</h1><br><br>
				
				<!-- form Start /////////////////////////////////////-->


				
			  
			<div>	  
				  <div class="subtitle">
				  <p>�������</p>
				  </div><br>
				  	  
				  <div class="form-group">
				    <label for="receiverName">�޴º� �̸�</label>
				      ${purchase.receiverName }
				  </div>
				  
				 <div class="form-group">
				    <label for="receiverPhone">����ó</label>
				      ${purchase.receiverPhone }
				  </div>
				  
				  
				  <c:if test="${empty user}">
					  <div class="form-group">
					    <label for="receiverEmail">�̸���</label>
					    ${purchase.receiverEmail }
					  </div>
				  </c:if>
				  
				  <div class="form-group divyAddr">
				    <label for="divyAddr">�����</label>
				    	<c:forEach var="addr" items="${purchase.divyAddr.split('/')}" begin="1">
				    	${addr }&nbsp;
				    	</c:forEach>
				  </div>
				  
				  
				   <div class="form-group">
				    <label for="divyMessage">��۸޽���</label>
				      ${purchase.divyMessage }
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
							<img src="/resources/images/uploadFiles/${purchase.purchaseProd.prodThumbnail.split('&')[0]}" class="image" width="120" height="120">
						</td>
						<td class="content">
							<p style="font-weight: bold;font-size: 15px">${purchase.purchaseProd.prodName}</p>
							<p>${purchase.purchaseProd.prodDisPrice} ��</p>
							<p>��ۺ�: 3000 ��</p>
							<p>���ż���: ${purchase.purchaseQuantity} ��</p><input type="hidden" id="purchaseQuantity" value="${purchase.purchaseQuantity}">
							<c:if test="${purchase.purchaseProd.couponApply == 'N' }">
								<p style="color:#F0445C">*���� ������ �Ұ����� ��ǰ�Դϴ�.</p>
							</c:if>
					  	
					  	</td>
					  </tr>
				 </table>		 
				</div>
				
				<input type="hidden" class="quantity" value="${purchase.purchaseQuantity}" />
				<input type="hidden" class="price" value="${purchase.purchaseProd.prodDisPrice}" />
				
	
			</div>	  
			
			<br>
				  
			<section class="paycontent">	    
				  
				  <div class="sectd">
				  	<h5 class="info">�� ��ǰ�ݾ�</h5>
				  	<div class="payment"><input type="text" id="totalProdPrice" value="" size="" style="border:none;text-align:right">��</div>
				  </div>
				  
				  <div class="sectd">
				  	<h5 class="info">���� ���</h5>
				  	<div class="payment"><input type="text" id="couponuse" value="" size=""  style="border:none;text-align:right">��</div>
				  </div>
				  
				  <div class="sectd">
				  	<h5 class="info">����Ʈ ���</h5>
				  	<div class="payment"><input type="text" id="usingpoint" value="" size=""  style="border:none;text-align:right">P</div>
				  </div>
				  
				  <div class="sectd">
				  	<h5 class="info">��ۺ�</h5>
				  	<div class="payment"><input type="text" id="divyfee" value="" size=""  style="border:none;text-align:right">��</div>
				  </div>
				  
				  <br>
				  
				  <div class="sectd">
				  	<h5 class="info">�� �����ݾ�</h5>
				  	<div class="payment totals"><strong class="totalpay"><input type="text" id="totalpayment" value="" size=""  style="border:none;text-align:right"></strong>��</div>
				  </div>
				  
				  <div class="sectd">
				  	<h6 class="info">���� ����Ʈ</h6>
				  	<div class="payment totals"><input type="text" id="earnPoint" name="earnPoint" value="" size=""  style="border:none;text-align:right"> P</div>
				  </div>
				  
				  
				  <hr>
				  
				  
			</section>
			

			<br><br>
			
			<div class="text-center">
				<button type="button" class="check" >Ȯ&emsp;��</button>
			</div>
			
				
			<br>
 	</div>
</div>	
	
</body>

</html>