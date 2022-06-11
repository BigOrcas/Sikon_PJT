<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- datepicker -->
	<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">

	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

	<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	
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
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='userName']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var nickname=$("input[name='userNickname']").val();
			
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}	
			if(nickname == null || nickname.length <1){
				alert("�г����� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
			if ($("#phone").val() == "" || $("#phone").val().length != 11 || isNaN($("#phone").val())) {
				alert("�޴�����ȣ�� ��Ȯ�� �Է��� �ּ���");
				return;
			}
		
			//Debug...
			//alert("phone : "+value);
			//$("input:hidden[name='phone']").val( value );
				
			//console.log('fnc');
			
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
		
		 function checkNickname(){
		        var userNickname = $('#userNickname').val(); //�г��Ӱ��� "userNickname"�� �Է¶��� ���� ����
		        console.log(userNickname);
		        
		        $.ajax({
		            url:'./json/checkNickname', //Controller���� ��û ���� �ּ�
		            type:'post', //POST ������� ����
		            data:{userNickname:userNickname},
		            success:function(cnt){ //��Ʈ�ѷ����� �Ѿ�� cnt���� �޴´� 
		                if(cnt == 0){ //cnt�� 1�� �ƴϸ�(=0�� ���) -> ��� ������ �г���
		                    $('.id_ok2').css("display","inline-block"); 
		                    $('.id_already2').css("display", "none");
		                } else { // cnt�� 1�� ��� -> �̹� �����ϴ� �г���
		                    $('.id_already2').css("display","inline-block");
		                    $('.id_ok2').css("display", "none");
		                    alert("�г����� �ٽ� �Է����ּ���");
		                  //  $('#userNickname').val('');
		                }
		            },
		            error:function(){
		                alert("�����Դϴ�");
		            }
		        });
		        };
		
		        
		     // �������
				 $(function() {
						$('#userBirth').datepicker({
							dateFormat: "yy-mm-dd"
						});
				});
				
				// �ٹ����۳�¥
				 $(function() {
						$('#startDate').datepicker({
							dateFormat: "yy-mm-dd"
						});
				});
				
				// �ٹ����۳�¥2
				 $(function() {
						$('#startDate2').datepicker({
							dateFormat: "yy-mm-dd"
						});
				});
				
				// �ٹ����ᳯ¥
				 $(function() {
						$('#endDate').datepicker({
							dateFormat: "yy-mm-dd"
						});
				});
				
				// �ٹ����ᳯ¥2
				 $(function() {
						$('#endDate2').datepicker({
							dateFormat: "yy-mm-dd"
						});
				});
				
				// �������
				 $(function() {
						$('#licenseDate').datepicker({
							dateFormat: "yy-mm-dd"
						});
				});
			   
				// �������2
				 $(function() {
						$('#licenseDate2').datepicker({
							dateFormat: "yy-mm-dd"
						});
				});	  
		        
				// ���θ� �ּ�
				 function findAddr(){
						new daum.Postcode({
					        oncomplete: function(data) {
					        	
					        	console.log(data);
					        	
					            // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
					            // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
					            // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
					            var roadAddr = data.roadAddress; // ���θ� �ּ� ����
					            var jibunAddr = data.jibunAddress; // ���� �ּ� ����
					            // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
					            document.getElementById('member_post').value = data.zonecode;
					            if(roadAddr !== ''){
					                document.getElementById("member_addr").value = roadAddr;
					            } 
					            else if(jibunAddr !== ''){
					                document.getElementById("member_addr").value = jibunAddr;
					            }
					        }
					    }).open();
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
	       <h3 class=" text-info">ȸ����������</h3>
	     </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="�ߺ�Ȯ���ϼ���"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" value="${user.password}" placeholder="�����й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="�����й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="����ȸ���̸�">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${user.userNickname}" placeholder="����г���" oninput = "checkNickname()">
		      <span id="helpBlock" class="id_ok2">��� ������ �г����Դϴ�.</span>
			  <span id="helpBlock" class="id_already2">������ �� �г����� ����ϰ� �־��.</span>
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userBirth" name="userBirth"  value="${user.userBirth}" placeholder="�������">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="addr" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    
		      <div class="col-sm-4">
		     <input id="member_post" class="form-control"  type="text" name="addr" value="${user.addr}" placeholder="�����ȣ" readonly onclick="findAddr()">
  			 <input id="member_addr" class="form-control"  type="text" name="addr"  placeholder="�ּ�" readonly>
  			 <input type="text" class="form-control" name="addr"  placeholder="���ּ�">
		    </div>
		   
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}"   placeholder="�����ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
    		<label class="col-sm-offset-1 col-sm-3 control-label" for="userImage">ȸ���̹���</label>
   			<div class="col-sm-4">
       		<input multiple="multiple" class="form-control" type="file" id ="uploadFile"  name="uploadFile" value="${user.userImage}"  placeholder="ȸ���̹���">
 			</div>
 		  </div>
 		  
 		  <hr style="border: solid 1px #d7d7d7;" width="650px;">
 	 	
 	 	   <div class="form-group">
    		<label for="mentorApply" class="col-sm-offset-1 col-sm-3 control-label" >��ŷ���� ��û ����</label>
   			<div class="col-sm-4">
      	 	<input type="radio" name="mentorApply" value="N" >�̽�û  &nbsp
			<input type="radio" name="mentorApply" value="Y" checked="checked">��û
    		</div>
 	 	  </div>
		  
		   <hr style="border: solid 1px #d7d7d7;" width="650px;">	
 	 	  
 	 	  <p align="center"><label>��»���</label> </p>
 	 	 
 	 	  
 	 	  <div class="form-group">
		    <label for="career" class="col-sm-offset-1 col-sm-3 control-label">�Ҽ�</label>
		   	<div class="col-sm-4">
		   	
		   	 
		   
		      <input type="text" class="form-control" id="company" name="company" value="${career.COMPANY}" placeholder="�Ҽ�1">
		   
		      
		    </div>
		 </div>   
 	 	  
 	 	   <div class="form-group">
    		<label for="startDate" class="col-sm-offset-1 col-sm-3 control-label" >�ٹ����۳�¥</label>
   			<div class="col-sm-4">
      	  	  <input type="text" class="form-control" id="startDate" name="startDate" placeholder="�ٹ����۳�¥1">
      	  	  
    		</div>
 	 	  </div>
 	 	  
 	 	   <div class="form-group">
    		<label for="endDate" class="col-sm-offset-1 col-sm-3 control-label" >�ٹ����ᳯ¥</label>
   			<div class="col-sm-4">
      	 	  <input type="text" class="form-control" id="endDate" name="endDate" placeholder="�ٹ����ᳯ¥1">
      	 	  
    		</div>
 	 	  </div>
 	 	  
 	 	  <div class="form-group">
		    <label for="careerExperience" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <textarea type="text" class="form-control" id="careerExperience" name="careerExperience" placeholder="��������1"></textarea>
		     <hr>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="career" class="col-sm-offset-1 col-sm-3 control-label">�Ҽ�</label>
		   	<div class="col-sm-4">
		      <input type="text" class="form-control" id="company" name="company" placeholder="�Ҽ�2">
		    </div>
		 </div>   
 	 	  
 	 	   <div class="form-group">
    		<label for="startDate" class="col-sm-offset-1 col-sm-3 control-label" >�ٹ����۳�¥</label>
   			<div class="col-sm-4">
      	  	  <input type="text" class="form-control" id="startDate2" name="startDate" placeholder="�ٹ����۳�¥2">
    		</div>
 	 	  </div>
 	 	  
 	 	   <div class="form-group">
    		<label for="endDate" class="col-sm-offset-1 col-sm-3 control-label" >�ٹ����ᳯ¥</label>
   			<div class="col-sm-4">
      	 	  <input type="text" class="form-control" id="endDate2" name="endDate" placeholder="�ٹ����ᳯ¥2">
    		</div>
 	 	  </div>
 	 	  
 	 	  <div class="form-group">
		    <label for="careerExperience" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <textarea type="text" class="form-control" id="careerExperience" name="careerExperience" placeholder="��������2"></textarea>		    
		    </div>
		  </div>
 	 	  
 	 	  <hr style="border: solid 1px #d7d7d7;" width="650px;">	
 	 	  
 	 	  <p align="center"><label>�ڰ���</label> </p>
 	 	  
 	 	  <div class="form-group">
		    <label for="licenseName" class="col-sm-offset-1 col-sm-3 control-label">�ڰ�����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="licenseName" name="licenseName" placeholder="�ڰ�����1">
		    </div>
		  </div>
 	 	  
 	 	  <div class="form-group">
		    <label for="licenseInstitution" class="col-sm-offset-1 col-sm-3 control-label">�߱ޱ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="licenseInstitution" name="licenseInstitution" placeholder="�߱ޱ��1">
		    </div>
		  </div>
 	 	  
 	 	  <div class="form-group">
    		<label for="licenseDate" class="col-sm-offset-1 col-sm-3 control-label" >�������</label>
   			<div class="col-sm-4">
      	  	  <input type="text" class="form-control" id="licenseDate" name="licenseDate" placeholder="�������1">
      	  	  <hr>
      	  	</div>
      	  </div>
 	 	  
 	 	  
 	 	   <div class="form-group">
		    <label for="licenseName" class="col-sm-offset-1 col-sm-3 control-label">�ڰ�����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="licenseName" name="licenseName" placeholder="�ڰ�����2">
		    </div>
		  </div>
 	 	  
 	 	  <div class="form-group">
		    <label for="licenseInstitution" class="col-sm-offset-1 col-sm-3 control-label">�߱ޱ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="licenseInstitution" name="licenseInstitution" placeholder="�߱ޱ��2">
		    </div>
		  </div>
 	 	  
 	 	  <div class="form-group">
    		<label for="licenseDate" class="col-sm-offset-1 col-sm-3 control-label" >�������</label>
   			<div class="col-sm-4">
      	  	  <input type="text" class="form-control" id="licenseDate2" name="licenseDate" placeholder="�������2">
    		</div>
 	 	  </div>
 	 	  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	   
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>