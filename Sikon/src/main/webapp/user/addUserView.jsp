<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
	
	<!-- jQuery UI toolTip ��� CSS-->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<!-- jQuery UI toolTip ��� JS-->
 	 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
            padding-top : 190px;
            
        }
       
      
    </style>
    
    <style>
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
				fncAddUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#previous").on("click" , function() {
				history.go(-1);
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var name=$("input[name='userName']").val();
			var nickname=$("input[name='userNickname']").val();
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
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
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
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
			
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		
		//�̸��� ����        
		$(function() {       
		  
		   var code = "";
		     $("#emailChk").click(function(){
		    	
		     	var userId = $('#userId').val();
		     	console.log(userId);
		     	
		     	
		     	
		       	$.ajax({
		                type:"GET",
		                url:"./json/mailCheck?userId=" +userId,
		                cache : false,
		                success:function(data){ console.log(data);
		                	if(data == "error"){
		                		alert("�̸��� �ּҰ� �ùٸ��� �ʽ��ϴ�. ��ȿ�� �̸��� �ּҸ� �Է����ּ���.");
		        				$("#userId").attr("autofocus",true);
		        				$(".successEmailChk").text("��ȿ�� �̸��� �ּҸ� �Է����ּ���.");
		        				$(".successEmailChk").css("color","red");
		                	}else{	        		
		        				alert("������ȣ �߼��� �Ϸ�Ǿ����ϴ�.\n�Է��� �̸��Ͽ��� ������ȣ Ȯ���� ���ֽʽÿ�.");
		                		$("#sm_email2").attr("disabled",false);
		                		$("#emailChk2").css("display","inline-block");
		                		$(".successEmailChk").text("������ȣ�� �Է��� �� �̸��� ������ �����ֽʽÿ�.");
		                		$(".successEmailChk").css("color","green");
		                		code = data;
		                	}
		                }
		            });
		     	
		     	
		     	
		        });
		     
		   
		   //�̸��� ������ȣ ����
		     $("#emailChk2").click(function(){
		     	if($("#sm_email2").val() == code){
		     		$(".successEmailChk").text("������ȣ�� ��ġ�մϴ�.");
		     		$(".successEmailChk").css("color","green");
		     		$("#emailDoubleChk").val("true");
		     		$("#sm_email2").attr("disabled",true);
		     		//$("#userId").attr("disabled",true);
		     	}else{
		     		$(".successEmailChk").text("������ȣ�� ��ġ���� �ʽ��ϴ�. Ȯ�����ֽñ� �ٶ��ϴ�.");
		     		$(".successEmailChk").css("color","red");
		     		$("#emailDoubleChk").val("false");
		     		$("#sm_email2").attr("autofocus",true);
		     	}
		     });
		        
		});	
		
	
	
		// ���̵� �ߺ�üũ
		function checkId(){
	        var userId = $('#userId').val(); //id���� "id"�� �Է¶��� ���� ����
	        console.log(userId);
	        
	        $.ajax({
	            url:'./json/checkId', //Controller���� ��û ���� �ּ�
	            type:'post', //POST ������� ����
	            data:{userId:userId},
	            success:function(cnt){ //��Ʈ�ѷ����� �Ѿ�� cnt���� �޴´� 
	            	console.log(cnt);
	                if(cnt == 0){ //cnt�� 1�� �ƴϸ�(=0�� ���) -> ��� ������ ���̵�  
	                    $('.id_ok').css("display","inline-block"); 
	                    $('.id_already').css("display", "none");
	                } else { // cnt�� 1�� ��� -> �̹� �����ϴ� ���̵�
	                    $('.id_already').css("display","inline-block");
	                    $('.id_ok').css("display", "none");
	                 //   alert("���̵� �ٽ� �Է����ּ���");
	                 //   $('#userId').val('');
	                }
	            },
	            error:function(){
	                alert("�����Դϴ�");
	            }
	        });
	        };
	        
		//==>"�̸������� ���̵�" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='userId']").on("change" , function() {
				
				 var email=$("input[name='userId']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});
		
		// �г��� ��ȿ��üũ 
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
	
		 
		 
//		//==>"ID�ߺ�Ȯ��" Event ó�� �� ����
//		 $(function() {
//			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
//			 $("button.btn.btn-info").on("click" , function() {
//				popWin 
//				= window.open("/user/checkDuplication.jsp",
//											"popWin", 
//											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
//											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
//			});
//		});	

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-white text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		 
		   <div class="form-group">
		   
		  
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��(�̸���)</label>
		 
		    <div class="col-sm-5">
		     <div class="col-sm-8" style="display: inline-block">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�" oninput = "checkId()" >
		     </div> 
		      <button type="button" id="emailChk" class="doubleChk" >������ȣ ������</button><br/>
		     
		     <div style="display: inline-block"> 
		      <span id="helpBlock" class="id_ok">��� ������ ���̵��Դϴ�.</span>
			  <span id="helpBlock" class="id_already">������ �� ���̵� ����ϰ� �־��.</span>
			 </div>
			  
		    <div class="col-sm-8" style="display: inline-block">  
		      <input type="text" class="form-control" id="sm_email2" name="sm_email2" placeholder="������ȣ �Է�" disabled required>
		    </div>
		      <button type="button" id="emailChk2" class="doubleChk" style="float: left;" >�̸�������</button>
		      
		    <div style="display: inline-block">
		      <span class="point successEmailChk"></span> 
		    </div> 		      
		      
			</div>
		
		    </div>
		 
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
		    </div>
		  </div>
		  
	  	  <div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" placeholder="�г���" oninput = "checkNickname()">
		      
		      <span id="helpBlock" class="id_ok2">��� ������ �г����Դϴ�.</span>
			  <span id="helpBlock" class="id_already2">������ �� �г����� ����ϰ� �־��.</span>
		    </div>
		  </div>
	
		  <div class="form-group">
    		<label for="userBirth" class="col-sm-offset-1 col-sm-3 control-label" >�������</label>
   			<div class="col-sm-4">
      	  <input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="�������">
    		</div>
 	 	  </div>
  
		  	  	     
		  <div class="form-group">
		   <label for="addr" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		     <input id="member_post" class="form-control"  type="text" name="addr" placeholder="�����ȣ" readonly onclick="findAddr()">
  			 <input id="member_addr" class="form-control"  type="text" name="addr" placeholder="�ּ�" readonly>
  			 <input type="text" class="form-control" name="addr" placeholder="���ּ�">
		    </div>
		  </div>
		  
		  <div class="form-group">
    		<label for="phone" class="col-sm-offset-1 col-sm-3 control-label" >�޴���</label>
   			<div class="col-sm-4">
      	  	<input type="text" class="form-control" id="phone" name="phone" placeholder="�޴���">
      	  		<span id="helpBlock" class="help-block">
		      	 <strong class="text-danger">" -  " ���� 11�ڸ��Է��ϼ���</strong>
		  		</span>
    		</div>
 	 	  </div>
 	 	  
 	 	  <div class="form-group">
    		<label class="col-sm-offset-1 col-sm-3 control-label" for="userImage">ȸ���̹���</label>
   			<div class="col-sm-4">
       		<input multiple="multiple" class="form-control" type="file" id ="uploadFile"  name="uploadFile"  placeholder="ȸ���̹���">
 			</div>
 		  </div>
 		  
		  <hr style="border: solid 1px #d7d7d7;" width="650px;">	
 	 	
 	 	   <div class="form-group">
    		<label for="mentorApply" class="col-sm-offset-1 col-sm-3 control-label" >��ŷ���� ��û ����</label>
   			<div class="col-sm-4">
      	 	<input type="radio" name="mentorApply" value="N" checked="checked">�̽�û  &nbsp
			<input type="radio" name="mentorApply" value="Y" >��û
    		</div>
 	 	  </div>
 	 	  
 	 	  <hr style="border: solid 1px #d7d7d7;" width="650px;">	
 	 	  
 	 	  <p align="center"><label>��»���</label> </p>
 	 	 
 	 	  
 	 	  <div class="form-group">
		    <label for="career" class="col-sm-offset-1 col-sm-3 control-label">�Ҽ�</label>
		   	<div class="col-sm-4">
		      <input type="text" class="form-control" id="company" name="company" placeholder="�Ҽ�1">
		      
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
	
		  <br>
		
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" id="previous" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>