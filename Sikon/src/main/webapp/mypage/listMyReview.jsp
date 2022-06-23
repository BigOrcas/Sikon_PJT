<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--  ///////////////////////// �ۼ���¥ ����  ////////////////////////// -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

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
	
	
		<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">
	
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <!-- sweetalert -->
	
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	@import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap');
	.container{
	padding-top: 200px
	}
	         

body{
    font-family: 'Open Sans', sans-serif;
    
}
.search{
  
  top:6px;
  left:10px;
}

.form-control{
    
    border:none;
    padding-left:32px;
}

.form-control:focus{
    
    border:none;
    box-shadow:none;
}

.green{
    
    color:green;
}

.table {
width:1140px;
	margin-top: 20px;
}

#noCoupon {
	text-align: center;
}


/* ���� ���� ��ư css */
.submit {
	display: block;
	border: none;
	width: 80px;
	height: 30px;
	border-radius: 10px;
	color: #fff;
	font-size: 15px;
	cursor: pointer;
	margin-top: -30px;
	margin-bottom: 40px;
	background: #d4af7a;
	float: right;
	font-family: 'Gowun Batang', serif;
}

th{
text-align: center
}

.emptyReview{
	padding : 90px;
	height: 200px;
	text-align: center;
	font-weight: bold;
	color: #808080;
}

body > div.container.mt-5.px-2 > div.container.text-center{
padding-top: 0;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage);
	  	$("form").attr("method" , "POST").attr("action", "/review/listMyReview").submit();
	}

			
		 $(function() {
				
				$("button.submit").on("click" , function() {
					
					var checkCount = $("input[name='deleteCheck']:checked").length;
				    var array = new Array();
					$("input[name='deleteCheck']:checked").each(function() {
						array.push($(this).attr('id'));
				    });
					
					//Debug..
					if(checkCount != 0) {
						Swal.fire({
							  title: checkCount+'���� ���並 �����Ͻðڽ��ϱ�?',
							  text: "������ ����� �ǵ��� �� �����ϴ�.",
							  icon: 'warning',
							  showCancelButton: true,
							  confirmButtonColor: '#3085d6',
							  cancelButtonColor: '#d33',
							  confirmButtonText: '����',
							  cancelButtonText: '���'
							}).then((result) => {
							  if (result.isConfirmed) {
								  self.location = "/review/deleteReview?checkList="+array;
							  }
							})
					//	alert(checkCount+"���� ���並 �����Ͻðڽ��ϱ�?")
					//	self.location = "/review/deleteReview?checkList="+array;
					} else {


						Swal.fire({
							  icon: 'error',
							  text: '���õ� ���䰡 �����ϴ�.',
							  confirmButtonText: 'Ȯ��'
							})
						
						
						
						
						
						
						
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
<div class="container mt-5 px-2">
     <br>
     
     <div class="center btmspace-50">
			<br />
			<h3 class="font-x2 nospace" align="center" style="font-family: 'Tiro Devanagari Sanskrit', serif;">
				<br> | M Y R E V I E W | <br><br><br><br>
			</h3>
		<button type="button" class="submit" style="float: right;  margin-right: 10px;" >��&nbsp;��</button>
		</div>
		
		<form>
						  <input type="hidden" id="currentPage" name="currentPage" value="1"/>
	
        
        <div class="table-responsive"  style="width: 1140px">
        <p class="text-primary"  style="color:gray">
		 ��ü  ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
		 </p>
    <table class="table table-responsive table-borderless">
        
      <thead>
        <tr class="bg-light">
          <th scope="col" width="10%">#</th>
          <th scope="col" width="30%">���䱸��</th>
          <th scope="col" width="30%" >���䳻��</th>
          <th scope="col" width="30%">�ۼ���¥</th>
        </tr>
      </thead>
      
  <tbody>
			
		  <c:if test="${!empty list}">
		  <c:set var="i" value="0" />
		  <c:forEach var="review" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left"><input type="checkbox" name="deleteCheck" id="${review.reviewNo}"></td>
			  <td align="left">
			  <c:choose>
			  <c:when test="${review.reviewCategory=='COOK'}">
			  ��ŷŬ����
			  </c:when>
			  <c:when test="${review.reviewCategory=='PRD'}">
			  �����
			  </c:when>
			  <c:otherwise>
			  ������
			  </c:otherwise>
			  </c:choose>
			  </td> 
			  <td align="left" class="updateClick" onclick="window.open('/review/updateReview?reviewNo=${review.reviewNo}', 'review', 'width=430, height=525, location=no, status=no, scrollbars=yes');">${review.reviewContent}</td>
			  <td align="left"><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewRegdate}"/></td>
			</tr>
          </c:forEach>
          </c:if>
         
        </tbody>
                 
      </table>
     
    <c:if test="${empty list}">
		<br><br>
		<div class="emptyReview">
			�ۼ��� ���䰡 �����ϴ�.
		</div>
		<br>
	</c:if>
                         
     </div>
      </form>
      
      <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
     </div>
     
</body>

</html>