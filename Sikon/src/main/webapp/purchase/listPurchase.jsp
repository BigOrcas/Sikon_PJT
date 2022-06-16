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
body{
	 padding-top : 50px;
	font-family: 'Nanum Myeongjo', serif;
}

div.row{
	font-family: 'Nanum Myeongjo', serif;
}
 div.page-header{
	font-family: 'Nanum Myeongjo', serif;
}  
table {
	font-family: 'Nanum Myeongjo', serif;
}
th{
	font-weight: lighter;
	font-size: 15px;
}
.table>tbody>tr>td{
	vertical-align: middle;
	height: 120px;
}
.table>tbody>tr>th{

	border-top: 2px solid #afa5a5
}
div.list{
	padding-top : 200px;
}

.cancel{
	font-size: 14px;
	text-decoration: underline;
}
.status{
	font-size: 18px;
	font-weight: bold;
}

.prodname{
	font-size: 15px;
	font-weight: bold;
}

.prodcontent{
	text-align: left;
}

.image{
	width: 105px;
}
.prodcontent{
	width: 50%;
}
.rev{
	width: 10%;
}
.review:hover {
  display: block;
  border: none;
  width: 90px;
  height: 36px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
  margin-top: 20px;
  margin-bottom: 20px;
  background: #937062;
  float: right;
  font-family: 'Gowun Batang', serif;
  
}
.review {
  display: block;
  width: 90px;
  height: 36px;
  color: #937062;
  border: 1px solid #937062;
  font-size: 15px;
  cursor: pointer;
  margin-top: 20px;
  margin-bottom: 20px;
  background: #f7f7f7;
  float: right;
  font-family: 'Gowun Batang', serif;
  
}

div.emptyProd{
	padding : 20px;
	height: 100px;
	text-align: center;
	font-weight: bold;
	color: #333;
}


</style>
	<script type="text/javascript">


		function fncGetList(currentPage) {
			console.log("currentPage: "+currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		
		

		 $(function() {
			 
			 $(".getpurchase").on("click" , function() {
				 
				var serialNo = $(this).attr('value');
				console.log('serialNo: '+serialNo);
				
				self.location ="/purchase/getPurchaseBySerial?serialNo="+serialNo;
				
			});
			 
				 
			$(".getprod").on("click" , function() {
			 
				var prodNo = $(this).attr('value');
				console.log('��ǰ�󼼺���: '+prodNo);
				
				self.location ="/product/getProduct?menu=search&prodNo="+prodNo;
				
			});
			 
			$( "td.view" ).on("click" , function() {
				console.log('�󼼺���');
				var message = $(this).attr("value");
				console.log(message);
					self.location ="/purchase/getPurchase?tranNo="+message;
			});
			//*/
			$( "td.divy" ).on("click" , function() {
				console.log('���ǵ���');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
				
				self.location ="/purchase/updatedivyStatus?tranNo="+message1+"&divyStatus="+message2;
			});
			
			$( ".cancel" ).on("click" , function() {
				alert('���Ÿ� ����Ͻðڽ��ϱ�?');
				console.log('�������');
				var message1 = $(this).attr("value1");
				console.log(message1);
				var message2 = $(this).attr("value2");
				console.log(message2);
				
				self.location ="/purchase/cancelOrder?tranNo="+message1+"&divyStatus="+message2;
			});
			
			$( ".review" ).on("click" , function() {
				var textNo=$(this).attr("value");
				var category='PRD';
				window.open('/review/addReview.jsp?category='+category+'&textNo='+textNo, 'review', 'width=430, height=525, location=no, status=no, scrollbars=yes');
			});
			
		});	
	</script>		

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container list">
	
		<div class="text-info">
	       <h3 style="color:#bc8f8f">�ֹ������ȸ</h3><br>
	    </div>
	    
	    
		<form>
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
		</form>
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
      
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="purchase" items="${list}" varStatus="status">
		  
			<c:set var="i" value="${ i+1 }" />
			<tr>
			
			  <c:if test="${status.index eq 0 }">
			  	<tr>
			  		<th colspan="4" class="getpurchase" value="${purchase.serialNo }">
			  			<a href="#" class="deco" style="color: #333;text-decoration: none;">
			  			�ֹ�����: <span style="font-weight: bold;">${purchase.orderDate }</span> &emsp;
			  			�ֹ��Ϸù�ȣ: <span style="font-weight: bold;">${purchase.serialNo }</span>&ensp;<i class="fa-solid fa-angle-right"></i>
			  			</a>
			  		</th>
			  		
			  	</tr>
			  	<tr>
						
					<td align="left" class="image getprod" value="${purchase.purchaseProd.prodNo }">	
						<img src="/resources/images/uploadFiles/${purchase.purchaseProd.prodThumbnail.split('&')[0]}"  width="85" height="85">
					</td>
					<td align="left" class="prodcontent getprod"  value="${purchase.purchaseProd.prodNo }">
						<p class="prodname">${ purchase.purchaseProd.prodName }</p>
						<p>${ purchase.purchaseProd.prodDisPrice }��</p>
						<p>���ż��� ${ purchase.purchaseQuantity }��</p>
					</td>
					<c:choose>
					  <c:when test="${purchase.divyStatus.equals('002')}">
							<td align="center" class="status">�����</td>
						</c:when>
						<c:when test="${purchase.divyStatus.equals('001')}">
							<td align="center"><p  class="status">�����Ϸ�</p> <p class="cancel"  value1="${purchase.tranNo }" value2="${purchase.divyStatus}">�������</p></td>
						</c:when>
						<c:when test="${purchase.divyStatus.equals('000')}">
							<td align="center" class="complete status">��ҿϷ�</td>
						</c:when>
						<c:otherwise>
							<td align="center"><p class="end status">��ۿϷ�</p><p>CJ������� <a href="#">${purchase.invoiceNum }</a></p></td>
						</c:otherwise>
					 </c:choose>
					 
					 <c:choose>
					 	<c:when test="${purchase.divyStatus.equals('003') && purchase.reviewStatus.equals('001')}">
					 		<td class="rev"><button type="button" class="review" value="${purchase.purchaseProd.prodNo }">���侲��</button></td>
					 	</c:when>
					 	<c:otherwise>
					 		<td class="rev"></td>
					 	</c:otherwise>
					 </c:choose>
					 
				</tr>	 
					 
			  </c:if>
			  
			  <c:if test="${status.index ne 0 }">
			  	<c:set var="before" value="${list[status.index- 1].serialNo}" />
			  	<c:set var="after" value="${purchase.serialNo }" />
			  	
			  		<c:if test="${ before eq after }">
					  	<tr>
							
							<td align="left" class="image getprod" value="${purchase.purchaseProd.prodNo }">	
								<img src="/resources/images/uploadFiles/${purchase.purchaseProd.prodThumbnail.split('&')[0]}" width="85" height="85">
							</td>
							
							<td align="left"  class="prodcontent getprod" value="${purchase.purchaseProd.prodNo }">
								<p class="prodname">${ purchase.purchaseProd.prodName }</p>
								<p>${ purchase.purchaseProd.prodDisPrice }��</p>
								<p>���ż��� ${ purchase.purchaseQuantity }��</p>
							</td>
							
							<c:choose>
							  <c:when test="${purchase.divyStatus.equals('002')}">
									<td align="center" class="status">�����</td>
								</c:when>
								<c:when test="${purchase.divyStatus.equals('001')}">
									<td align="center"><p  class="status">�����Ϸ�</p> <p class="cancel"  value1="${purchase.tranNo }" value2="${purchase.divyStatus}">�������</p></td>
								</c:when>
								<c:when test="${purchase.divyStatus.equals('000')}">
									<td align="center" class="complete status">��ҿϷ�</td>
								</c:when>
								<c:otherwise>
									<td align="center"><p class="end status">��ۿϷ�</p><p>CJ������� <a href="#">${purchase.invoiceNum }</a></p></td>
								</c:otherwise>
							 </c:choose>
							 
							 <c:choose>
							 	<c:when test="${purchase.divyStatus.equals('003') && purchase.reviewStatus.equals('001')}">
							 		<td class="rev"><button class="review" value="${purchase.purchaseProd.prodNo }">���侲��</button></td>
							 	</c:when>
							 	<c:otherwise>
							 		<td class="rev"></td>
							 	</c:otherwise>
							 </c:choose>
			  	
						</tr>
			  		</c:if>
			  		
					<c:if test="${ before ne after }">
			  			<tr>
					  		<th colspan="4" class="getpurchase" value="${purchase.serialNo }">
					  			<a href="#" class="deco" style="color: #333;text-decoration: none;">
					  			�ֹ�����: <span style="font-weight: bold;">${purchase.orderDate }</span> &emsp;
					  			�ֹ��Ϸù�ȣ: <span style="font-weight: bold;">${purchase.serialNo }</span>&ensp;<i class="fa-solid fa-angle-right"></i>
					  			</a>
					  		</th>
			  		
					  	</tr>
					  	<tr>
							
							<td align="left" class="image getprod" value="${purchase.purchaseProd.prodNo }">	
								<img src="/resources/images/uploadFiles/${purchase.purchaseProd.prodThumbnail.split('&')[0]}" width="85" height="85">
							</td>
							<td align="left"  class="prodcontent getprod" value="${purchase.purchaseProd.prodNo }">
								<p class="prodname">${ purchase.purchaseProd.prodName }</p>
								<p>${ purchase.purchaseProd.prodDisPrice }��</p>
								<p>���ż��� ${ purchase.purchaseQuantity }��</p>
							</td>
							<c:choose>
							  <c:when test="${purchase.divyStatus.equals('002')}">
									<td align="center" class="status">�����</td>
								</c:when>
								<c:when test="${purchase.divyStatus.equals('001')}">
									<td align="center"><p  class="status">�����Ϸ�</p> <p class="cancel"  value1="${purchase.tranNo }" value2="${purchase.divyStatus}">�������</p></td>
								</c:when>
								<c:when test="${purchase.divyStatus.equals('000')}">
									<td align="center" class="complete status">��ҿϷ�</td>
								</c:when>
								<c:otherwise>
									<td align="center"><p class="end status">��ۿϷ�</p><p>CJ������� <a href="#">${purchase.invoiceNum }</a></p></td>
								</c:otherwise>
							 </c:choose>
							 
							 <c:choose>
							 	<c:when test="${purchase.divyStatus.equals('003') && purchase.reviewStatus.equals('001')}">
							 		<td class="rev"><button class="review" value="${purchase.purchaseProd.prodNo }">���侲��</button></td>
							 	</c:when>
							 	<c:otherwise>
							 		<td class="rev"></td>
							 	</c:otherwise>
							 </c:choose>
						</tr>	
			  		</c:if>
				  	
			  </c:if>
			  	
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <c:if test="${empty list}">
		<br><br>
		<div class="emptyProd">
			������ ��ǰ�� �����ϴ�.
		</div>
		<br>
	</c:if>
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>
</html>