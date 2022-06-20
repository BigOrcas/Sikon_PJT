<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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
  padding-top : 40px;
      }
div.container {
	padding-top : 170px;
}
.h3{
	height: 40px;
}
.id_ok{
	color:#008000;
	display: none;
}
.id_already{
	color:#6A82FB; 
	display: none;
}
		
.id_ok2{
	color:#008000;
	display: none;
}

.id_already2{
	color:#6A82FB; 
	display: none;
}
   </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#previous").on("click" , function() {
				history.go(-1);
			});
		});	
		
		
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			
			var pw=$("input[name='password']").val();
			
			
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
			
			
			
		
			//Debug...
			//alert("phone : "+value);
			//$("input:hidden[name='phone']").val( value );
				
			//console.log('fnc');
			
			$("form").attr("method" , "POST").attr("action" , "/user/deleteUser").submit();
		}
	
		
		 
				
				
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" >
			
		<div class="text-center h3">
	       <h3 class=" text-info">ȸ��Ż��</h3>
	     </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		 <input type="hidden" name="role" value="${user.role}">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		       <span id="helpBlock" class="help-block">
		       </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control " id="password" name="password" placeholder="�����й�ȣ">
		    </div>
		  </div>
		  
	<!--  	 <input type="hidden" class="form-control 1" id="quitDate" name="quitDate" value="${user.quitDate}" > -->
		 
		 <input type="hidden" class="form-control 1" id="quitStatus" name="quitStatus" value="${user.quitStatus}" >
		 
	  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >Ȯ &nbsp;��</button>
			  <a class="btn btn-primary btn" id="previous" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	   
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>