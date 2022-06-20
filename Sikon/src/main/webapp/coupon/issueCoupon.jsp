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
	<style>
	
	  body {
            padding-top : 50px;
            font-family: 'Nanum Myeongjo', serif;
        }
        
      .form-control {
      	float:left;
      	width:200px;
      	margin-left:30px;
      }
      
      label{
      	float:left;
      	margin-left:30px;
      }
      
      p {

	    margin-bottom: 40px;
	  }
      
      .table {
      	margin-top:20px;
      }
      
      #couponName {
      	margin-left:59px;
      }
      
      #userId {
      	width:325.08px;
      }
      
      .soo{
			padding-top : 170px;
	  }
	  
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
		    border: 1px solid #d7d7d7;
		}
	
		.btn-b:hover {
			background-color: #937062d4;
		}
		
     
              
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/coupon/issueCouponView").submit();
		}
		

		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });
		
		 $(document).ready(function() {
				
			 $("#checkall").click(function(){
					
					if($("#checkall").prop("checked")){
						
						$("input[name=userId]").prop("checked",true);
						
					}else{
						
						$("input[name=userId]").prop("checked",false);
						
					}
					
				})
				 
				 
				$("input[name=userId]").click(function(){
					
					if($("#checkall").prop("checked")){
						
						$("#checkall").prop("checked",false);
						
					}
					
				})
			
		 });	
		
		$(function() {
			$("#issueCoupon").on("click" , function() {
							
				var startDate = $("input[name='startDate']").val();
				var endDate = $("input[name='endDate']").val();
				
				if(startDate == ""){
					alert("�����������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
					return;
				}
				
				if(endDate == ""){
					alert("�����������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
					return;
				}
				
				var checkCount = $("input[name='userId']:checked").length;
				
				//����ð� ���ϱ�
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var dateString = year + '-' + month  + '-' + day;

				console.log(dateString);
				
				if(dateString <= startDate && dateString+1 <= endDate && startDate <= endDate) {
					if(checkCount != 0) {
						alert("������ �߱��Ͻðڽ��ϱ�?")
						$("form").attr("method", "POST").attr("action", "/coupon/issueCoupon").submit();
					} else {
						alert("���õ� ȸ���� �����ϴ�.")						
					}
				} else if(dateString > startDate) {
					alert("�����߱����ڴ� ���� ���ķ� �����ϼž� �մϴ�.")
				} else if(dateString+1 > endDate) {
					alert("�����������ڴ� ���� ���ķ� �����ϼž� �մϴ�.")
				} else if (startDate > endDate ) {
					alert("�����߱����ڴ� ������������ ���ķ� �����ϼž� �մϴ�.")
				}
						
			});
		});
		
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container soo">
	
		<div class="page-header text-info">
	       <h3 style="color:#bc8f8f">�����߱�</h3>
	    </div>
	    
	    <form class="form-horizontal" name="detailForm"  enctype="multipart/form-data" >
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
	    <input type="hidden" id="currentPage" name="currentPage" value=""/>
	    <input type="hidden" id="issueStatus" name="issueStatus" value="��밡��"/>
	    
		 <p class="text-primary" style="color:gray">
		 	��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		 </p>
		  		    
		   <div class="form-group">
		    <label for="startDate">������������</label>
		      <input type="DATE" class="form-control" id="startDate"  name="startDate" placeholder="������������">
		  </div>
		  
		   <div class="form-group">
		    <label for="endDate">������������</label>
		      <input type="DATE" class="form-control" id="endDate"  name="endDate" placeholder="������������">
		   </div>
		    
		    <div class="form-group">
		    <label for="couponList">��������</label>
		        <select class="form-control" name="couponNo" id="couponName">
		     <c:forEach var="coup" items="${couponList}">
		       <c:choose>
         		<c:when test = "${coup.couponName != null}">
         			<option value="${coup.couponNo}"> ${coup.couponName}</option>
         		</c:when>
         		<c:otherwise>
				   <option>���� ����</option>
				</c:otherwise>
      		  </c:choose>
      		  </c:forEach>
         	</select>
		  </div>
		  
		  <button type="button" class="btn-b" id="issueCoupon" style="float:right">�� &nbsp;��</button>
		    
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
          	<th align="center" style="text-align:center;"><input type="checkbox" id="checkall" /></th>
            <th align="left" id="userId" style="text-align:center;">ȸ��ID</th>
            <th align="left" style="text-align:center;">ȸ����</th>
            <th align="left" style="text-align:center;">�г���</th>
          </tr>
         </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="user" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="ct_list_pop">
				<td align="left"><input type="checkbox" name="userId" value="${user.userId}"></td>
				<td align="left">${user.userId}</td>
				<td align="left">${user.userName}</td>
				<td align="left">${user.userNickname}</td>
				<td></td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
	</form>
</body>

</html>