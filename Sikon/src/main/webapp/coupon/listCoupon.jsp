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
	
	<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
	
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
	<style>
	
	.btn-b {
	  cursor: pointer;
	  background-color: #937062;
	  border: none;
	  color: #fff;
	  padding: 12px 0;
	  width:6%;
	  height: 34px;
	  justify-content: center;
      display: flex;
      align-items: center;
	  font-size: 17px;
	  border-radius: 5px;
	  border: 1px solid #d7d7d7
	}
	
	.btn-b:hover {
	  background-color: #937062d4;
	}
	
	body{
		font-family: 'Nanum Myeongjo', serif;
	}
	        
    .table{
    	margin-top:70px;
    }
       
    #noCoupon{
      	text-align:center;
    }
       
    .soo{
		padding-top : 170px;
	}

    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		function fncGetList(currentPage) {
			
			$("#currentPage").val(currentPage);
		  	$("form").attr("method" , "POST").attr("action", "/coupon/listCoupon").submit();
		}
	
		
		//===== ����Code �ּ� ó�� ��  jQuery ���� ======//
		 $(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1); 
			});
		 });
			
		
		 $(function() {
				
			$("#addCoupon").on("click" , function() {
						
				self.location = "/coupon/addCoupon.jsp";
			});
		});
		 
		 $(document).ready(function() {
		
			 $("#checkall").click(function(){
					
					if($("#checkall").prop("checked")){
						
						$("input[name=deleteCheck]").prop("checked",true);
						
					}else{
						
						$("input[name=deleteCheck]").prop("checked",false);
						
					}
					
				})
				 
				 
				$("input[name=deleteCheck]").click(function(){
					
					if($("#checkall").prop("checked")){
						
						$("#checkall").prop("checked",false);
						
					}
					
				})
			
		 });	
		 
		 
		 $(function() {
				
				$("button.delete").on("click" , function() {
					
					var checkCount = $("input[name='deleteCheck']:checked").length;
				    var array = new Array();
					$("input[name='deleteCheck']:checked").each(function() {
						array.push($(this).attr('id'));
				    });
					
					//Debug..
					if(checkCount != 0) {
						alert("������ �����Ͻðڽ��ϱ�?")
						self.location = "/coupon/deleteCoupon?checkCount="+checkCount+"&checkList="+array;
					} else {
						alert("���õ� ������ �����ϴ�.")						
					}
				});
		 });
				
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div class="container soo">
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="page-header text-info">
		<h3 style="color:#bc8f8f">�������</h3>
	</div>
		
		<form class="form-inline" name="detailForm">
      	    
	    <input type="hidden" id="currentPage" name="currentPage" value=""/>
	    
	    </form>
		 <p class="text-primary" align="left" style="color:gray">
		 <br>
		 ��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
		 </p>
		
		<button type="button" class="btn-b delete" style="float: right;  margin-right: 10px;" >��&nbsp;��</button>
		<button type="button" class="btn-b" id="addCoupon" style="float: right; margin-right: 10px;">�� &nbsp;��</button>
			
      <table class="table table-hover table-striped">
	
        <thead>
          <tr>
            <th align="center" style="text-align:center;"><input type="checkbox" id="checkall"/></th>
            <th align="center" style="text-align:center;">������ȣ</th>
            <th align="center" style="text-align:center;">�����̸�</th>
            <th align="center" style="text-align:center;">������</th>
            <th align="center" style="text-align:center;">���αݾ�</th>
          </tr>  
        </thead>
       
		<tbody>
			
		  <c:if test="${!empty list}">
		  <c:set var="i" value="0" />
		  <c:forEach var="coupon" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left"><input type="checkbox" name="deleteCheck" id="${coupon.couponNo}"></td>
			  <td align="left">${coupon.couponNo}</td> 
			  <td align="left">${coupon.couponName}</td>
			  <td align="left">${coupon.discountRate}</td>
			  <td align="left">${coupon.discountValue}</td>
			</tr>
          </c:forEach>
          </c:if>
         
        </tbody>
                 
      </table>
      
     <c:if test="${empty list}">
      	<h3 id="noCoupon">������ ������ �����ϴ�.</h3>
      	<br>
     </c:if>
                         
     </div>
                
      <jsp:include page="../common/pageNavigator_new.jsp"/>
     
</body>

</html>