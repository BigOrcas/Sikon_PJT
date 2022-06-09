<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	
		.row{
			padding-top: 150px;
		}
	
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            
         }
        
         .bg-image-vertical {
			position: relative;
			overflow: hidden;
			background-repeat: no-repeat;
			background-position: right center;
			background-size: auto 100%;
			}

		@media (min-width: 1025px) {
			.h-custom-2 {
			height: 100%;
			}
		}
    </style>
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "�α���"  Event ���� =============
		$( function() {
			
			$("#userId").focus();
			
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button").on("click" , function() {
				var id=$("input:text").val();
				var pw=$("input:password").val();
				
				if(id == null || id.length <1) {
					alert('ID �� �Է����� �����̽��ϴ�.');
					$("#userId").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('�н����带 �Է����� �����̽��ϴ�.');
					$("#password").focus();
					return;
				}
				
				$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();
			});
		});	
		
		
		//============= ȸ��������ȭ���̵� =============
		$( function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#!' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
	</script>		
	
	
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<section class="vh-200">
		<!--  row Start /////////////////////////////////////-->
		<div class="container">
		<div class="row">
		  <div class="col-sm-5 text-black">
	 	 	
		 	 					
				 <div class="form-horizontal">

         		 <form style="width: 23rem;">

           			 <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">�α���</h3>
					  <br>
			          <div class="form-outline mb-4">
			              <input type="text" name="userId" id="userId" class="form-control" placeholder="���̵�" />
			              <label class="form-label" for="form2Example18"></label>
			          </div>
		  
		  			  <div class="form-outline mb-4">
			              <input type="password" name="password" id="password" class="form-control" placeholder="��й�ȣ" />
			              <label class="form-label" for="form2Example28"></label>
			          </div>
			          
			          <div class="pt-1 mb-4">
             			  <button class="btn btn-info btn-lg btn-block" type="button">Login</button>
           			  </div>
           			  
           			  <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#">Forgot password?</a></p>
           			  <p>Don't have an account? <a href="#!" role="button" class="link-info">Register here</a></p>
           			  
           			  
           			  
				<!--  	<div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">�� �� ��</label>
					    <div class="col-sm-6">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="���̵�" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">�� �� �� ��</label>
					    <div class="col-sm-6">
					      <input type="password" class="form-control" name="password" id="password" placeholder="�н�����" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-sm-offset-3 col-sm-7 text-center">
					      <button type="button" class="btn btn-primary"  >�� &nbsp;�� &nbsp;��</button>
					      <a class="btn btn-primary btn" href="#" role="button">ȸ &nbsp;�� &nbsp;�� &nbsp;��</a>
					    </div>
					  </div>
				-->
					
			   	 
				</form>
			</div>
			
  	 	</div>
  	 	
  	 	 <div class="col-sm-6 px-0 d-none d-sm-block">
        <img src="/resources/images/uploadFiles/�׷���ĳ��.jpg"
          alt="Login image" class="w-100 vh-200" style="object-fit: cover; object-position: left;">
     	 </div>
  	   </div>
 	 </div>
 	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	</section>
	
</body>

</html>