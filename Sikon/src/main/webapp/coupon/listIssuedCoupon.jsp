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
		body{
			font-family: 'Nanum Myeongjo', serif;
		}
	         
        .table{
        	margin-top:70px;
        }
        
        #noIssuedCoupon{
        	text-align:center;
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
	
		function fncGetList(currentPage) {
			
			$("#currentPage").val(currentPage);
		  	$("form").attr("method" , "POST").attr("action", "/coupon/listIssuedCoupon").submit();
		}
	
		 $(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1); 
			});
		 });
		 
		 
		 $(function() {
				
				$("#issueCoupon").on("click" , function() {
							
					self.location = "/coupon/issueCouponView";
				});
			});
		 
		 
		 $(document).ready(function() {
				
			 $("#checkall").click(function(){
					
					if($("#checkall").prop("checked")){
						
						$("input[name=retrieveCheck]").prop("checked",true);
						
					}else{
						
						$("input[name=retrieveCheck]").prop("checked",false);
						
					}
					
				})
				 
				 
				$("input[name=retrieveCheck]").click(function(){
					
					if($("#checkall").prop("checked")){
						
						$("#checkall").prop("checked",false);
						
					}
					
				})
			
		 });	
		 
		
		 $(function() {
				
				$("button.retrieve").on("click" , function() {
					var checkCount = $("input[name='retrieveCheck']:checked").length;
				    var array = new Array();
					$("input[name='retrieveCheck']:checked").each(function() {
						array.push($(this).attr('id'));
				    });
					
					//Debug..
					if(checkCount != 0) {
						alert("������ ȸ���Ͻðڽ��ϱ�?")
						self.location = "/coupon/updateIssueStatus?checkCount="+checkCount+"&checkList="+array;
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
		<h3 style="color:#bc8f8f">�����߱޸��</h3>
	</div>
		
      <form class="form-inline" id="detailForm">
                
		<p class="text-primary" align="left" style="color:gray">
		<br>
		��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage}  ������
		</p>
		
			<select name="orderCondition" class="form-control" style="width:125px">
			<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>-�����ϱ�-</option>
			<option value="1"  ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>��밡��</option>
			<option value="2"  ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>���Ϸ�</option>
			<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>ȸ��</option>
			</select>
			<button type="button" class="btn btn-default" id="sorting">��ȸ</button>

		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
		</form>
		
		<button type="button" class="btn-b retrieve" style="float: right; margin-right: 10px;">ȸ &nbsp;��</button>
		<button type="button" class="btn-b" id="issueCoupon" style="float: right;  margin-right: 10px;" >�� &nbsp;��</button>
	
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center" style="text-align:center;"><input type="checkbox" id="checkall" /></th>
            <th align="center" style="text-align:center;">�߱޹�ȣ</th>
            <th align="left" style="text-align:center;">�߱�����</th>
            <th align="left" style="text-align:center;">�������� ȸ��</th>
            <th align="left" style="text-align:center;">�߱޳�¥</th>
            <th align="left" style="text-align:center;">���ᳯ¥</th>
            <th align="left" style="text-align:center;">�������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:if test="${!empty list}">
		  <c:set var="i" value="0" />
		  <c:forEach var="coupon" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <c:if test = "${coupon.issueStatus != '003'}">
			  <td align="left"><input type="checkbox" name="retrieveCheck" id="${coupon.issueNo}"></td>
			  </c:if>
			  <c:if test = "${coupon.issueStatus == '003'}">
			  <td align="left"></td>
			  </c:if>
			  <td align="left">${coupon.issueNo}</td>
			  <td align="left">${coupon.couponName}</td>
			  <td align="left">${coupon.couponUser.userId}</td> 
			  <td align="left">${coupon.startDate}</td>
			  <td align="left">${coupon.endDate}</td>
			  <c:choose>
			  	<c:when test="${coupon.issueStatus.equals('001')}">
					<td align="left">��밡��</td>
				</c:when>
				<c:when test="${coupon.issueStatus.equals('002')}">
					<td align="left">���Ϸ�</td>
				</c:when>
				<c:when test="${coupon.issueStatus.equals('003')}">
					<td align="left">ȸ��</td>
				</c:when>
				<c:when test="${coupon.issueStatus.equals('004')}">
					<td align="left">����</td>
				</c:when>
				</c:choose>
			</tr>
          </c:forEach>
          </c:if> 
       		
        </tbody>
      
      </table>
      
      <c:if test="${empty list}">
      	<div id="noIssuedCoupon"><h3>�߱޵� ������ �����ϴ�.</h3></div>
      	<br>
      </c:if> 
         
      </form>
      
      <jsp:include page="../common/pageNavigator_new.jsp"/>
      
 </div>
 
   
 
</body>

</html>