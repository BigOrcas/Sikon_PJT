<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">

<style>
body{
	padding-top : 50px;
	font-family: 'Nanum Myeongjo', serif;
	font-family: 'Open Sans', sans-serif;
}
div.container{
	padding-top : 170px;
}
</style>

<script type="text/javascript">

function fncUpdatePurchase() {
	
	var addr = $("#sample6_postcode").val() + "/" +  $("#sample6_address").val() + "/" +  $("#sample6_detailAddress").val() + "/" + $("#sample6_extraAddress").val();
	console.log('submit');
	console.log(addr);
	$("input:hidden[name='divyAddr']").val( addr );
	
	$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase?tranNo=${purchase.tranNo }").submit();

	
}
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

$(function() {
	
	 $( "a[href='#' ]" ).on("click" , function() {
		 history.go(-1);
	});
	
});

///*
$(function() {
	
	$("button.btn-primary").click(function(){
		console.log('����');
		fncUpdatePurchase();
		
	});
	
	
});

$(function() {
	var price = $( "#price" ).val();
	console.log("price: "+price);
	
	var quantity = $("#purchaseQuantity").val();
	console.log("quantity: "+quantity);
	
	$("#totalprice").val(price*quantity);
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
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="text-center" style="color:#bc8f8f">������������</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <input type="hidden" name="prodNo" value="${product.prodNo }" />
		  <input type="hidden" name="userId" value="${user.userId }" />
		  
		  
		  <hr/>
		 <h4 align="center">�ֹ���ǰ</h4>
		 <hr/>
		 
		 <div class="row">
		<div class="col-xs-12 col-md-12" align="center">
		
		<c:choose>
		
		<c:when test="${purchase.purchaseProd.prodThumbnail.contains('&')}">
		
			<td class="ct_write01">
				<c:choose>
				<c:when test="${purchase.purchaseProd.prodThumbnail.contains('mp4')}">
					<c:forEach var="name" items="${purchase.purchaseProd.prodThumbnail.split('&')}">
						<video width="400" height="300" controls autoplay src="/resources/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${purchase.purchaseProd.prodThumbnail.split('&')}">
						<img src="/resources/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/resources/images/uploadFiles/${purchase.purchaseProd.prodThumbnail}" width="300" height="300" align="absmiddle"/>
		</c:otherwise>
		</c:choose>

		</div>
		</div>
		  <br>
		 <div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseProd.prodName}</div>
		</div>
			  		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�����ݾ�</strong></div><br>
			<div class="col-xs-8 col-md-8">��ǰ����: ${purchase.purchaseProd.prodDisPrice} ��</div>
			<div class="col-xs-8 col-md-8">+ ��ۺ�: ${purchase.divyFee} ��</div>
		</div>
			  		<hr/>
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���ż���</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.purchaseQuantity} ��</div>
		</div>
		
		<hr/>
			  		
		<input type="hidden" id="price" value="${purchase.purchaseProd.prodDisPrice}">
		<input type="hidden" id="purchaseQuantity" value="${purchase.purchaseQuantity}">
			  		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>�� �����ݾ�</strong></div>
			<div class="col-xs-8 col-md-8">
		     <input type="text" id="totalprice" value="" style="border:none;width:50px"> ��</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>���� ����Ʈ</strong></div>
			<div class="col-xs-8 col-md-8">+
		      ${purchase.earnPoint} P</div>
		</div>
		  
		  
		  <hr/>
		  <h4 align="center">�������</h4>
		  <hr/>
		  
		  	  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">�޴º� �̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}"> 
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="divyAddr" class="col-sm-offset-1 col-sm-3 control-label">�����</label>
		    <div class="col-sm-4">
		        <input type="text" id="sample6_postcode" name="postcode" placeholder="�����ȣ" value="">
				<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
				<input type="text" id="sample6_address" name="address" placeholder="�ּ�" value=""><br>
				<input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="���ּ�" value=""><br>
				<input type="text" id="sample6_extraAddress" name="extraAddress" placeholder="�����׸�" value="">
		    </div>
		    <input type="hidden" name="divyAddr" value="${user.addr}">
		  </div>
		  
		    <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}">
		    </div>
		  </div>
		  
		  <c:if test="${!empty user}">
		      <input type="hidden" class="form-control" id="receiverEmail" name="receiverEmail" value="${user.userId}">
		  </c:if>
		  <c:if test="${empty user}">
		  <div class="form-group">
		    <label for="receiverEmail" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverEmail" name="receiverEmail" placeholder="��ȸ�� ����" >
		    </div>
		  </div>
		  </c:if>
		  
		  
		   <div class="form-group">
		    <label for="divyMessage" class="col-sm-offset-1 col-sm-3 control-label">��۸޽���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyMessage" name="divyMessage" placeholder="��û������ �����ּ���."  >
		    </div>
		  </div>

		  
		  <hr/>
		  <h4 align="center">���� / ����Ʈ</h4>
		  <hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��� ����</strong></div>
			<div class="col-xs-8 col-md-8">${purchase.usedCoupon }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-4"><strong>��� ����Ʈ</strong></div>
			<div class="col-xs-8 col-md-8">- ${purchase.usedPoint } P</div>
		</div>
		  
		  
		</form>
		<!-- form Start /////////////////////////////////////-->
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button"  class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-default btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		  
		
 	</div>
	
</body>

</html>