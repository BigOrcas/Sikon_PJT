<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			
			 $( "button:contains('Ȯ��')" ).on("click" , function() {
					self.location = "/cook/listCook?menu=search"
				});
			
		});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<form class="form-horizontal" enctype="multipart/form-data">
		 <input type="hidden" name="cookNo" value="${cook.cookNo}"/>
		
		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">��û���</h3>
			<br></br>
		</div>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ŷŬ�����̹���</strong>
			</div>
			<div class="col-xs-8 col-md-4">		    	
		<img src="/resources/images/uploadFiles/${cook.cookFilename}" width="300" height="300" align="absmiddle"/></div>
		</div>

		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ŷŬ������ȣ</strong>
			</div>
			<div class="col-xs-8 col-md-4">${apply.classCook.cookNo}</div>
		</div>

		<hr/>
		
		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��ŷŬ��������</strong>
			</div>
			<div class="col-xs-8 col-md-4">${apply.classCook.cookPrice}</div>
		</div>

		<hr/>
		
			

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�����ð�</strong>
			</div>
			<div class="col-xs-4 col-md-2">
<input type="TIME" class="form-control" id="startTime"  name="startTime" value="${cook.startTime}" placeholder="�������۽ð�">
</div>
	<div class="col-xs-4 col-md-2">
  <input type="TIME" class="form-control" id="endTime"  name="endTime"  value="${cook.endTime}" placeholder="��������ð�">
</div>
		</div>

		<hr/>		
				<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>��û�ھ��̵�</strong>
			</div>
			<div class="col-xs-8 col-md-4">${apply.applier.userId}</div>
		</div>

		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������¥</strong></div>
			<div class="col-xs-8 col-md-4">${apply.checkDate}</div>
		</div>
		
		<hr/>
		

	
	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ڿ���ó</strong></div>
			<div class="col-xs-8 col-md-4">${user.phone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������ּ�</strong></div>
			<div class="col-xs-8 col-md-4">${user.addr}</div>
		</div>
		
		<hr/>
			<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��û�ڼ�</strong></div>
			<div class="col-xs-8 col-md-4">${apply.cookStatus }</div>
		</div>
		
		<hr/>
		
		
		
		
		<hr/>
	
		
		
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  		<button type="button" class="btn btn-default">Ȯ��</button>
	  		
		
	  		</div>
		</div>
		
		<br/>
		</form>	
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>