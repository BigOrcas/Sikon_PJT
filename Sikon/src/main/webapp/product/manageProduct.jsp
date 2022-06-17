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
body{
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
.head{
 	background: #b19b92;
 
}

.head th{
 	text-align:center;
 	color : #f7f7f7;
 	font-weight: lighter;
}
.list{
	padding-top : 200px;
}

.submit:hover {
  display: block;
  border: none;
  width: 150px;
  height: 36px;
  border-radius: 30px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
  margin-top: 20px;
  margin-bottom: 20px;
  background: #937062;
  float: right;
  font-family: 'Gowun Batang', serif;
  
}

.submit{
  display: block;
  width: 150px;
  height: 36px;
  border-radius: 30px;
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

.pltitle{
	padding-top: 35px;
	text-align: center;
}
.prodinfo{
	text-align: left;
	padding-left: 30px;
}
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
    padding: 6px;
    line-height: 1.42857143;
    vertical-align: middle;
    border-top: 1px solid #ddd;
}
</style>
	<script type="text/javascript">


		function fncGetList(currentPage) {
			console.log("currentPage: "+currentPage);
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/manageProduct").submit();
		}
		
		 $(function() {
				 
			 $( ".submit" ).on("click" , function() {
				self.location = "/product/addProductView.jsp"
			 });
			 
			 $( ".toget" ).on("click" , function() {
				 
				 var prodNo = $(this).attr('value');
				 console.log(prodNo);
				 
				 self.location = "/product/getProduct?menu=manage&prodNo="+prodNo
			 });
				 
			 $( "button.btn.btn-default:contains('�˻�')" ).on("click" , function() {
				fncGetList(1);
			 });
			
			
			 
			$("#orderCondition").on( "change", function() { 
		      	fncGetList(1);
			  });
				
		});	
		 
		 
		 function enterkey() { 
			if(window.event.keyCode == 13){
				fncGetList(1);
			}
		} 
		 
		 
	</script>		

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container list">
	
	       <h3 class="pltitle" style="color:#333">| PRODUCT MANAGEMENT |</h3>
	    <br><br><br>
	    
		
		<form class="form-inline" name="detailForm">
	   			
	   			<input type="hidden" id=themeCondition name=themeCondition value="${search.themeCondition }">
	   			
	<div class="row">
		<table width="100%">
			<tr>
			
			
				<td class="col-md-6 text-left"> 
					  <div class="form-group">
							<select name="orderCondition" id="orderCondition" class="form-control" style="width:125px">
								<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>��ü����</option>
								<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>�Ǹ���</option>
								<option value="4"  ${ ! empty search.orderCondition && search.orderCondition==4 ? "selected" : "" }>�Ǹ�����</option>
								<option value="5"  ${ ! empty search.orderCondition && search.orderCondition==5 ? "selected" : "" }>������</option>
							</select>
					  </div>
					  
				  </td>
				  
	   			<td class="col-md-6 text-right">
				  <div class="form-group">
						<select name="searchCondition" id="searchCondition" class="form-control" style="width:110px">
						 	<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
							<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
							<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
						</select>
				  </div>
				  
				  <div class="form-group">
				    <input type="text" style="display: none;">
				    <input type="text" class="form-control" id="prodname" name="searchKeyword"  placeholder="�˻�"
				    		onkeyup="enterkey()"  value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="search">�˻�</button>
				  
				</td>
				
				
			</tr>
		</table>
	</div>				  
					<div class="row">
						<table width="100%">
						<tr>
							
							<td class="col-md-6 text-left">
						    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������
							</td>
							
							<td class="col-md-6 text-right"><button type="button" class="submit">��ǰ���</button></td>
							
						</tr>
						</table>
					</div>
				  
					
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				  
				  
				</form>
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped">
      
        <thead>
          <tr class="head">
            <th align="center">No</th>
            <th align="center">��ǰ��ȣ</th>
            <th align="center" width="80"></th>
            <th align="left">��ǰ����</th>
            <th align="center">������</th>
            <th align="center">�ǸŻ���</th>
          </tr>
        </thead>
       
		<tbody>

		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  	<td align="center" class="view">${ i }</td>
			  
			  
			  	<td align="center" class="toget view" value="${product.prodNo }">${product.prodNo }</td>	
			  
				<td align="right" class="toget" value="${product.prodNo }">
					<img src="/resources/images/uploadFiles/${product.prodThumbnail.split('&')[0]}" class="image" width="80" height="80">
				</td>
			  
			  	<td align="left" class="toget prodinfo" value="${product.prodNo }">
			  	
			  		<p style="font-weight:bold">${product.prodName }</p> <br>
			  		
			  		<p>
				  		<c:if test="${product.couponApply == 'N' }">
					  		<span style="color:#ffb6c1">��������Ұ�</span>
					  	</c:if>
					  	<c:if test="${product.couponApply == 'Y' }">
					  		�������밡��
					  	</c:if>
			  		</p>
			  </td>	
			  
			  
			  <td align="center" class="view">
			  	<c:if test="${product.prodStock == 0 }">
			  		<span style="color:#ffb6c1">${product.prodStock } ��</span>
			  	</c:if>
			  	<c:if test="${product.prodStock != 0 }">
			  		${product.prodStock } ��
			  	</c:if>
			  </td>	
			  
			  
			  <td align="center" class="view">
			  	<c:if test="${product.prodStatus == 'N' }">
			  		<span style="color:#ffb6c1">�Ǹ�����</span>
			  	</c:if>
			  	<c:if test="${product.prodStatus == 'Y' }">
			  		�Ǹ���
			  	</c:if>
			  </td>	
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  <c:if test="${empty list}">
		<br><br>
		<div class="emptyProd">
			�Ǹ����� ��ǰ�� �����ϴ�.
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