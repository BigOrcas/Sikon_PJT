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
 	 
 	 
 <!--  ///////////////////////// CSS ////////////////////////// -->	 
<style>
	body > div.container{
         padding-top : 190px;
            
    }
	.id_ok{
	color:#008000;
	display: none;
	}

	.id_already{
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
			fncFindUser();
		});
	});	
	
	
	//============= "���"  Event ó�� ��  ���� =============
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("#previous").on("click" , function() {
			history.go(-1);
		});
	});	
	
	
	function fncFindUser() {
		
		var pw=$("input[name='password']").val();
		var pw_confirm=$("input[name='password2']").val();
		
		
		if(pw == null || pw.length <1){
			alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		if(pw_confirm == null || pw_confirm.length <1){
			alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/user/findUserpw").submit();
	}
	
	
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
      
	
		//�̸��� ����        
		$(function() {       
		  
		   var code = "";
		     $("#emailChk").click(function(){
		    	
		     	var userId = $('#userId').val();
		     	console.log(userId);
		     	
		     	
		     	
		       	$.ajax({
		                type:"GET",
		                url:"./json/mailCheckPw?userId=" +userId,
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
		     		$("#password").attr("disabled",false);
		     		$("#password2").attr("disabled",false);
		     		//$("#userId").attr("disabled",true);
		     	}else{
		     		$(".successEmailChk").text("������ȣ�� ��ġ���� �ʽ��ϴ�. Ȯ�����ֽñ� �ٶ��ϴ�.");
		     		$(".successEmailChk").css("color","red");
		     		$("#emailDoubleChk").val("false");
		     		$("#sm_email2").attr("autofocus",true);
		     	}
		     });
		        
		});	




	</script>
	
	
</head>
<body>

<div class="container">
    
        <h1 class="bg-white text-center">��й�ȣ ã��</h1>
        
        <!-- <div class="col-2"></div> -->
       
              <form class="form-horizontal" >
              
                  <div class="form-group" style="padding:8px">
                    
                    
                    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��(�̸���)</label>
                       
                    <div class="col-sm-5">
                            
                    <div class="col-sm-8" style="display: inline-block">
				     <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�" oninput = "checkId()" >
				    </div> 
                       <button type="button" id="emailChk" class="doubleChk" >������ȣ ������</button><br/> 	
                       
                        <div style="display: inline-block"> 
					      <span id="helpBlock" class="id_ok">������� ���� ���̵�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
						  <span id="helpBlock" class="id_already">������ȣ �����⸦ �����ּ���</span>
						</div> 
                        	
		            <div class="col-sm-8" style="display: inline-block">  
				      <input type="text" class="form-control" id="sm_email2" name="sm_email2" placeholder="������ȣ �Է�" disabled required>
				    </div>
				      <button type="button" id="emailChk2" class="doubleChk" style="float: left" >�̸�������</button>
		                  <br> 	
                      </div>
                      
                      
           <!--               
                       <div class="form-group">
					    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
					   	<div class="col-sm-4">
					      <input type="text" class="form-control" id="userName" name="userName" placeholder="ȸ���̸�">
					   	</div>
					  </div>
			-->			  
                        
                  </div>
                  
           
           
           
           		<div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">�� ��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="�� ��й�ȣ" disabled required>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">�� ��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="�� ��й�ȣ Ȯ��" disabled required>
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��й�ȣ����</button>
			  <a class="btn btn-primary btn" id="previous" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		  
		  
		  
		  
            </form>
       

        <div class="col-2"></div>
     <!-- END OF ROW -->
</div>



</body>
</html>