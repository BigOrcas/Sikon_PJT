<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
	<head>
<meta charset="EUC-KR">

 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   	
   	
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
    <title>���̵� ã��</title>
    
    <style>
    
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

* {
	font-family: 'Gowun Batang', serif;

  margin: 0;
  padding: 0;
  box-sizing: border-box;
  border: 0px solid silver;
  outline: none;
}

img {
  width: 100px;
}

body {
	font-family: 'Gowun Batang', serif;

padding-top: 100px;
  font-size: 0.9rem;
  color: #999;
  line-height: 1rem;
  letter-spacing: 0.1px;
}

h1, h2, h3 {
	font-family: 'Gowun Batang', serif;
  color: #444;
}
body {
  overflow: auto !important;
  -webkit-overflow-scrolling: touch;
  height: 100vh;
  width: 100%;
  margin: 0 auto;
}

body::-webkit-scrollbar {
  width: 10px;
}

body::-webkit-scrollbar-thumb {
  background-color: #444;
  border-radius: 10px;
}

body::-webkit-scrollbar-track {
  background-color: #eee;
  border-radius: 10px;
}
h4, h5 {
	font-family: 'Gowun Batang', serif;
  color: #444;
}

h1 {
  font-size: 4rem;
  line-height: 4.5rem;
  text-transform: uppercase;
  color: white;
  text-align: center;
}

h2 {
    padding-top: 70px;
  font-size: 2.4rem;
  line-height: 2.4rem;
  text-transform: uppercase;
  margin-bottom: 1rem;
}

h3 {
  font-size: 1.4rem;
  line-height: 1.4rem;
  margin-bottom: 1rem;
}

h4 {
  font-size: 1.1rem;
  line-height: 1.4rem;
}

h5 {
  font-size: 0.9rem;
  line-height: 2.8rem;
}

ul {
  list-style: none;
}

button {
  font-size: 0.7rem;
  text-transform: uppercase;
  padding: 10px 30px;
  border: 1px solid #ccc;
  background: white;
  cursor: pointer;
}

button:hover {
  color: white;
  background: black;
}

/*start*/
.header{
  padding-bottom: 15rem;
}
.login {
  margin: 0 auto;
  text-align: center;
  width: 450px;
  padding: 0rem 3rem;
  padding-bottom: 2rem;
  border: 1px solid #ccc;
  margin-bottom: 10rem;
}
.login a:hover{
  text-decoration: none;
}
.login> :nth-child(1)> :nth-child(2) h4{
  display: flex;
  justify-content: space-between;
  width: 100%;
}
.login> :nth-child(1)> :nth-child(2) {
  padding: 1rem 0;
  display: flex;
  justify-content: space-between;
}

.login> :nth-child(1)> :nth-child(2) a {
  font-size: 1.6rem;
  width: 100%;
  padding: 2rem 0;
}

.login> :nth-child(1)> :nth-child(2) a:nth-child(2) {
 color: #444;
  border-bottom: 3px solid #eee;
}

.login> :nth-child(1)> :nth-child(2) a:nth-child(1) {

    color: #937062;
    border-bottom: 3px solid #937062;
}

.login> :first-child>input {
  display: block;
  margin: 0 auto;
  padding: 10px;
  background: none;
  margin-bottom: 7px;
  width: 100%;
  height: 50px;
  border: 1px solid #ccc;

}
.login input:focus{
  border: 1px solid #000;
}
.login button {
  width: 100%;
  background: #937062;
  color: white;
  transition: 0.8s;
  height: 50px;
  font-size: 1rem;
  margin-bottom: 15px;
}

.login button:hover {
  background: #000;
  transition: 0.8s;
}

.login> :nth-child(2) {
  display: flex;
  justify-content: space-around;
  width: 250px;
  margin: 0 auto;
  margin-bottom: 2rem;
}

.login> :nth-child(2) {
  width: 100%;
}

.login h3 {
  font-weight: lighter;
  margin-bottom: 15px;
  cursor: pointer;
}
.login a{
  color: #444;
}
.login a:hover{
  color: #444;

}
.login img {
  width: 40px;
  height: 40px;
  margin: 0 10px;
  transition: 0.8s;
  cursor: pointer;
  margin-left:80px;
}

.login button{
  font-size: 1.5rem;
}
.login>div> :nth-child(4){
  display: flex;
  width: 352px;
  margin-bottom: 2rem;
}.login>div> :nth-child(4) select{
  width:80px;
  border: 1px solid #666;

padding: .8em .5em;

font-family: inherit;
background: url('https://cdn2.iconfinder.com/data/icons/font-awesome/1792/angle-down-512.png') no-repeat;
border-radius: 0px;
background-position: 95% 50%;
background-size: 25px;
-webkit-appearance: none;
-moz-appearance: none;
appearance: none;
opacity: 0.6;
margin-right: 10px;
cursor: pointer;

}

.login>div> :nth-child(4) input{
  border: 1px solid #ccc;
  width: 99px;
  height: 50px;
  padding: 5px;
}
.login>div> :nth-child(4) input:last-child{
  margin-left: 10px;
}
.login>div> :nth-child(4) input:focus{
  border: 1px solid #000;
}
.btn-w {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  padding: 11px 0;
  width:20%;
  font-size: large;
}
.btn-w:hover {
  background-color: #e7e2e2;
}

    </style>
  	
  </head>
   
   
  <body>


  <article class="login">
    <div>
      <h2>
        �� ����ã��
      </h2>
      <div>
        <h4>
          <a href="search.html">���̵�ã��</a><a href="password.html">��й�ȣ ã��</a>
        </h4>
      </div>
      
      <input type="text" name="userName" id="userName"  placeholder="�̸�" required>
      <input type="text" name="phone" id="phone"  placeholder="��ȭ��ȣ" width="352px" required>
   <!--  <input type="email" name="email" id="email" class="form-control" placeholder="�̸���" required><br>
        <p class="checks" id="checks">${findpw_checkf}</p><br/>
    -->
  	 </div>
  	 
	  			<button type="button" id="findUser" onclick="findUser_click()">���̵� ã��</button>&emsp;


  </article>
  	
  </body>
    <script type="text/javascript">

	
	  	//���̵� ���Խ�
	//	var idJ = /^[a-z0-9]{5,20}$/;
	/*	
		$("#userName").on("click",function(){
		     if($('#userName').val() == ""){
		   		$('#checks').text('�̸��� �Է����ּ���.');
		   	  	$('#checks').css('color', 'red');
		 }
		 });
		
  		$("#phone").on("click",function(){
	     if($('#phone').val() == ""){
	   		$('#checks').text('��ȭ��ȣ�� �Է����ּ���.');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  		
  		
  		$("#member_id").focusout(function(){
  			if(!idJ.test($(this).val())){
  			$('#checks').text('5~20���� ���� �ҹ���, ���ڸ� ��밡���մϴ�');
  			$('#checks').css('color', 'red');
  		}
  		 });
  		
  		
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#checks').text('�̸����� �Է����ּ���');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  	*/	
  		
  	
  	
  	
  	
  	
  		
		//ID ã�� 
	//	$("#findUser").on("click",function(){
		function findUser_click(){
			var name = $('#userName').val();
			console.log(userName);
			var phone = $('#phone').val();
			console.log(phone);
			
  		 $.ajax({
             type:'POST',
             url:'./json/findUser',
             data:{'userName':name, 'phone':phone},
             success:function(data){  console.log(data);
               if(data == 0){
            	   $('#id_value').text("ȸ�� ������ Ȯ�����ּ���!");
				   $('#userName').val('');
				   $('#phone').val('');
               }else{
            	   $('#id_value').text(data);
            	   console.log(data);
			 	   $('#userName').val('');
			 	  console.log(userName);
				   $('#phone').val('');
               }
            },   
             error:function(){
                alert("�����Դϴ�");
                } 
                   
                });
            };
            
         //    alert("���̵�� " + response.data + "�Դϴ�.");
  //  	window.onload=function(){
  		
  	
        
   //     };
  	 
  		       
 
         
  		$(function() {
  			  		
  			$( "a:contains('�α���')" ).on("click" , function() {
  			$(self.location).attr("href","/user/loginView.jsp");
  			});
 		});
  	</script>
  <script>
  const modal = document.getElementById("modal")
	 const btnModal = document.getElementById("findUser")
	const closeBtn = modal.querySelector(".close-area")
	
		btnModal.addEventListener("click", e => {
			console.log('aaaaa');
			modal.style.display = "flex"
			console.log('modal.style.display');
		});
		
		    
		
		closeBtn.addEventListener("click", e => {
			console.log('bbbbb');
		    modal.style.display = "none"
		});
		
		modal.addEventListener("click", e => {
			console.log('cccc');
		    const evTarget = e.target
		    if(evTarget.classList.contains("modal-overlay")) {
		        modal.style.display = "none"
		    }
		});
		
		
	/*	
		$(document).ready(function() {
			$('#findUser').click(function() {
				$('#modal-dialog').show();
				console.log("finduser");
			});
			
			
			
			
			
		});
	*/	
		
		
  </script> 
  

</html>