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
<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">

<style>
body{
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
}
.listUser{
	padding-top : 170px;
	padding-bottom: 200px;
}
.subtitles th{
	text-align:center;
	font-size: 14px;
}

.subtitles{
	border-bottom: 1px solid #937062;
	border-top: 2px solid #937062;
}

 div.row{
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
}
 
table {
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
}    
th{
	height: 50px;
	font-size: 15px
}
.pur{
	height: 50px;
	border-bottom:  1px solid #D7D7D7;
}
.status{
	font-weight: bold;
}
.cancel{
	color: #898989;
}
h3{
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
	color: #5a443b;
}
.pltitle{
	padding-top: 35PX;
	text-align: center;
}


</style>
	<script type="text/javascript">


	//�˻� & page	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/user/listUser").submit();
	}
			
	$(function() {
		$( "button.btn.btn-default" ).on("click" , function() {
			fncGetList(1);
		});
	 });
			
	//���� �󼼺���	
	$(function() {
		$( "td:nth-child(2)" ).on("click" , function() {
			 self.location ="/user/getUser?userId="+$(this).text().trim();
		});					
	});	
	</script>		

</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container listUser">
	<br>
	<c:choose>
	<c:when test="${search.orderCondition == 2 }">
		<h3 class="pltitle"  style="color:#333;font-family: 'Tiro Devanagari Sanskrit', serif;">| A P P L I E R &nbsp; L I S T |</h3>
	</c:when>
	<c:when test="${search.orderCondition == 3 }">
		<h3 class="pltitle"  style="color:#333;font-family: 'Tiro Devanagari Sanskrit', serif;">| M E N T O R &nbsp; L I S T |</h3>
	</c:when>
	<c:otherwise>
		<h3 class="pltitle"  style="color:#333;font-family: 'Tiro Devanagari Sanskrit', serif;">| U S E R &nbsp; L I S T |</h3>
	</c:otherwise>
	</c:choose>
	<div>

			    <!-- table ���� �˻� Start /////////////////////////////////////-->
			    <br>
			    <div class="row">
			    
				    <div class="col-md-6 text-left">
				    	<p class="text-primary" style="color:gray">
				    		��ü  ${resultPage.totalCount } ��, ���� ${resultPage.currentPage}  ������
				    	</p>
				    </div>
				  </div>  
				     <div class="row">
					    <form class="form-inline " id="form"> 
						 <div class="col-md-6 text-left"> 
						  <div class="form-group" align="left">
								<select name="orderCondition" class="form-control" style="width:175px">
								 	<option value="0"  ${ ! empty search.orderCondition && search.orderCondition==0 ? "selected" : "" }>--�����ϱ�--</option>
									<option value="1"  ${ ! empty search.orderCondition && search.orderCondition==1 ? "selected" : "" }>ȸ�����</option>
									<option value="2"  ${ ! empty search.orderCondition && search.orderCondition==2 ? "selected" : "" }>��ŷ�����û�ڸ��</option>
									<option value="3"  ${ ! empty search.orderCondition && search.orderCondition==3 ? "selected" : "" }>��ŷ������</option>
								</select>
						  </div>
						  <button type="button" class="btn btn-default" id="sorting">��ȸ</button>
						  </div>
						  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
						  <input type="hidden" id="currentPage" name="currentPage" value=""/>
						 
						</form>
			    </div>
			    	
				<!-- table ���� �˻� Start /////////////////////////////////////-->
				 <br/>
				
		      <!--  table1 Start /////////////////////////////////////-->
		      <table style="width: 100%">
		      
		        <thead>
		          <tr class="subtitles">
		            <th align="center">No</th>
		            <th align="center">ȸ��ID</th>
		            <th align="center">ȸ����</th>
		            <th align="center">�г���</th>
		          </tr>
		        </thead>
		       
				<tbody>
				
				  <c:set var="i" value="0" />
				  <c:forEach var="user" items="${list}">
					<c:set var="i" value="${ i+1 }" />
					
					<tr class="pur">
					  <td align="center">${ i }</td>
					  <td align="center" value1="${user.role}"
				  				   value2="${user.mentorApply}" title="Click : ȸ������ Ȯ��" style="cursor:pointer;">${user.userId}</td>
					  <td align="center">${user.userName}</td>
					  <td align="center">${user.userNickname}</td>
						</tr>
		          </c:forEach>
		        
		        </tbody>
		      
		      </table>
			 
			
	</div>
	<br>
	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	  
</div>
 	
 	

	
</body>
</html>