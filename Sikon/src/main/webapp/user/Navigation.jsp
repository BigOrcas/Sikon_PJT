<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<!-- jQuery UI toolTip ��� CSS-->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<!-- jQuery UI toolTip ��� JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>









<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	//============= "����"  Event ���� =============
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncChangeUser();
		});
	});	
	
	
	//============= "���"  Event ó�� ��  ���� =============
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#previous").on("click" , function() {
			history.go(-1);
		});
	});	
	
	
	function fncChangeUser() {
		
		
		
	//	$("form").attr("method" , "POST").attr("action" , "/user/changeUserRole").submit();
		
		
		opener.location.href='http://192.168.0.11:8080/user/listUser'; 
		window.close();
		
		
	//	self.close();
	//	window.open("about:blank", "_self").close();
	}
	</script>

</head>
<body>

<div class="container">
    
        <h1 class="bg-white text-center">������ �Ϸ�Ǿ����ϴ�.</h1>
        
        <!-- <div class="col-2"></div> -->
       
              <form class="form-horizontal" >
              
                  <div class="form-group" style="padding:8px">
                    
              <input type="hidden" class="form-control 12" id="role" name="role" value="${role}" >        
                    
                  </div>
                  
         <input type="hidden" class="form-control" id="userId" name="userId" value="${userId}" >
         
         
           
           
		  
		  
		   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >Ȯ��</button>
		<!--  <a class="btn btn-primary btn" id="previous" role="button">��&nbsp;��</a>  -->
		    </div>
		  </div>
		  
		  
		  
		  
            </form>
       

        <div class="col-2"></div>
     <!-- END OF ROW -->
</div>



</body>
</html>