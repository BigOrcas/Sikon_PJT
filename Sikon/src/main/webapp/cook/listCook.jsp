

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">



<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">

<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style>
.bi-heart {
	font-size: 20px;
	line-height: 20px;
	color: #000;
}

.bi-heart-fill {
	font-size: 20px;
	line-height: 20px;
	color: #000;
}

.bi-heart-fill::before {
	color: crimson;
}

.bi-heart::before {
	color: crimson;
}
</style>

<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
div.container {
	padding-top: 180px;
}

div.channel {
	padding-top: 10px;
}

.page-header.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}

.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}

.row {
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
}

.table.table-hover.table-striped {
	font-family: 'Gowun Batang', serif;
}

.ref-sort {
	display: block;
	margin-bottom: 50px;
	text-align: center;
}

.ref-sort ul {
	margin: 0;
	padding: 0;
	list-style: none;
	text-transform: uppercase;
	font-family: 'Gowun Batang', serif;
}

.ref-sort li {
	display: inline-block;
	position: relative;
	margin: 0 10px 0 0;
	padding: 0 20px 0 0;
}

.ref-sort li::after {
	position: absolute;
	top: 0;
	right: 0;
	content: "|";
}

.ref-sort li:last-child {
	margin: 0;
	padding: 0;
}

.ref-sort li:last-child::after {
	display: none;
}

.ref-sort li a {
	
}
/* References */
.ref-sort li a {
	color: #333;
	font-weight: bold;
}

.ref-sort li a:hover, #references .ref-sort li.current a {
	color: #937062;
	text-decoration-line: none;
}

.sectiontitle, #introblocks ul, #references .ref-sort {
	text-align: left;
}

.sectiontitle {
	display: block;
	max-width: 55%;
	margin: 0 auto 80px;
	text-align: center;
}

.sectiontitle .heading {
	margin: 0;
	padding: 0;
	line-height: 1;
}

.sectiontitle {
	max-width: none;
	margin-bottom: 50px;
}

.sectiontitle, #introblocks ul, #references .ref-sort {
	text-align: left;
}
/* Latest */
.excerpt time {
	border-color: #D7D7D7;
}

#latest article {
	max-width: 348px;
}

#footer {
	padding-bottom: 50px;
} /* Not required, just looks a little better */
.latestimg>li {
	display: inline-block;
	float: none;
	width: auto;
	margin: 0 5% 5% 0;
}

.latestimg>li img {
	width: auto;
}

* Latest
--------------------------------------------------------------------------------------------------------------- *
	/
#latest {
	
}

#latest>li:last-child {
	margin-bottom: 0;
} /* Used when elements stack in small viewports */
article {
	
}

article img {
	width: 100%;
} /* Force the image to have the full width of parent at all times */
.excerpt {
	padding: 30px 0 0;
}

.excerpt time {
	display: block;
	margin: 0 0 30px 0;
	padding: 0 0 15px 0;
	font-style: normal;
	font-size: .8rem;
	line-height: 1;
	border-bottom: 1px solid;
}

.excerpt time i {
	margin-right: 5px;
}

.excerpt .heading {
	margin: 0 0 10px 0;
	font-size: 1.3rem;
}

`
.excerpt .meta {
	margin: 0 0 30px 0;
	padding: 0;
	list-style: none;
	text-align: left;
}

.excerpt .meta li {
	display: inline-block;
	font-size: .8rem;
}

.excerpt .meta li::after {
	margin-left: 5px;
	content: "|";
}

.excerpt .meta li:last-child::after {
	margin: 0;
	content: "";
}

.excerpt p {
	
}

.excerpt footer {
	margin-top: 30px;
}

.latestimg {
	
}

.latestimg>li {
	display: inline-block;
	float: left;
	width: 30%;
	margin: 0 0 5% 5%;
}

.latestimg>li:nth-last-child(-n+3) {
	margin-bottom: 0;
}
	/* Removes bottom margin from the last three items - margin is restored in the media queries when items stack */
.latestimg>li:nth-child(3n+1) {
	margin-left: 0;
	clear: left;
} /* Removes the need to add class="first" */
.latestimg>li img {
	width: 100%;
}
	/* Force the image to resize to take the full space - may have to be changed for tablets, depends on personal preference */
.latestimg>li a.imgover {
	display: block;
}

.carousel-inner>.item>img {
	top: 0;
	left: 0;
	min-width: 100%;
	max-height: 500px;
}
/* [PRODUCT LIST] ��Ʈ ���� */
.wrapper {
	font-family: 'Tiro Devanagari Sanskrit', serif;
}
/* �˻�, �������� css */
.condition {
	font-family: 'Gowun Batang', serif;
	width: 100px;
	float: right;
	border-color: #D7D7D7;
}
/* ��� ��ư�̶� hr�̶� �浹=> margin-top:20px���� 60px�� �����ؼ� ����*/
hr {
	margin-top: 60px;
	margin-bottom: 20px;
	border: 0;
	border-top: 1px solid #eee;
}
/* ��ü �Ǽ� ǥ��� ��� ��ư�� ���� ���� margin: 10px 0 0 ���� 0 0 0���� ���� */
p {
	margin: 0 0 0px;
}

#image {
	width: 300px;
	height: 300px;
}

.image:hover {
	opacity: 0.8;
}

div.emptyProd {
	padding: 20px;
	height: 100px;
	text-align: center;
	font-weight: bold;
	color: #333;
}

.btn_gotop {
	display: none;
	position: fixed;
	bottom: 30px;
	right: 30px;
	z-index: 999;
	outline: none;
	background-color: #937062;
	color: #f7f7f7;
	padding: 15px 20px;
}

.btn_gotop:hover {
	color: #f7f7f7;
}

.likes {
	font-weight: bold;
	font-size: large;
}

.theme:hover {
	border: none;
	width: 100px;
	height: 36px;
	color: #fff;
	font-size: 15px;
	background: #937062;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
}

.theme {
	width: 100px;
	height: 36px;
	color: #937062;
	border: 1px solid #937062;
	font-size: 15px;
	background: #f7f7f7;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
}

.act {
	border: none;
	width: 100px;
	height: 36px;
	color: #fff;
	font-size: 15px;
	background: #937062;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
}

.col-md-6 text-right {
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
}
</style>


<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/cook/listCook").submit();
		
		}
		
		 $(function() {
				
				$("button.delete").on("click" , function() {
					
					var checkCount = $("input[name='cookCheck']:checked").length;
				    var array = new Array();
					$("input[name='cookCheck']:checked").each(function() {
						array.push($(this).attr('id'));
				    });
					
					if(checkCount != 0) {
						alert("��ŷŬ������ �����Ͻðڽ��ϱ�?")
						self.location = "/cook/deleteCook?checkCount="+checkCount+"&checkList="+array;
					} else {
						alert("���õ� �Խù��� �����ϴ�.")	
					}
				});
			});		
	
		 //�׸���ư ���� ����
		 $(function() {
			 
				$( ".theme" ).on("click" , function() {
					var theme = $(this).attr('value');
					console.log(theme);
					$("#themeCondition").val(theme);
					fncGetList(1);
				 });
			 
			 
			 var themeCondition = $("#themeCondition").val();
			 console.log(themeCondition);
			 ///* 
			 if(themeCondition == 'de'){
				 
				 $(".theme").removeClass('act');
				 $(".themede").addClass('act');
				 
			 }else if(themeCondition == 'ko'){
				 
				 $(".theme").removeClass('act');
				 $(".themeko").addClass('act');
				 
			 }else if(themeCondition == 'ch'){
				 
				 $(".theme").removeClass('act');
				 $(".themech").addClass('act');
				 
			 }else if(themeCondition == 'am'){
				 
				 $(".theme").removeClass('act');
				 $(".themeam").addClass('act');
				 
			 }else if(themeCondition == 'ja'){
				 
				 $(".theme").removeClass('act');
				 $(".themeja").addClass('act');
				 
			 }else{
				 
				 $(".theme").removeClass('act');
				 $(".themeAll").addClass('act');
				 
			 }
			
		 });
		 

		
		//���ƿ� push �˸�
		 function pushAlarm(userId, userNickname, cookNo){
												
				$.ajax({
			        url : "/cook/json/pushAlarm",
			        type : 'POST',
			        dataType : "json",   
		            data : {'cookNo' : cookNo, 'userId' : userId, 'userNickname' : userNickname }, 
		            async: false, 
		            error : function(){
			            alert("��� ����");
			        },
			        success : function(data){
			        	
			        	alert("�˶� ���� �Ϸ�!!");
			        	      	          
			           		if(socket){
			        			let socketMsg = "heart,"+data.userId+","+data.userNickname+","+data.mentorId+","+data.cookName;
			        			console.log(socketMsg);
			        			socket.send(socketMsg);
			           		}
			        }
			    
			    })
		 };
		 
	
		 
		 $( document ).ready(function() {
			
			
		
			$(document).on("click" ,"p.like_btn", function(){
				var userId = $("input[name='userId']").val();
				var userNickname = $("input[name='userNickname']").val();
				var cookNo = $(this).attr("value");
			
			
			     $.ajax({
			            type : "POST",  
			            url : "/heart/json/updateHeart",       
			            dataType : "json",   
			            data : {'cookNo' : cookNo, 'userId' : userId },
			            error : function(){
			               alert("��� ����");
			            },
			            success : function(heartCheck) {
			                
			                    if(heartCheck == 0){
			                    	alert("��õ�Ϸ�.");
			                    	                    	
			                    	
			                    	var userNickname = $("input[name='userNickname']").val();
			      
			                    	
			                    	pushAlarm(userId, userNickname, cookNo);
			                    							           
				   
						           
			                    location.reload();
			                    	
			                    	
			    					
			                    }
			                    else if (heartCheck == 1){
			                     alert("��õ���");
			                     
			                     location.reload();
						         
			                  
			                    	
			                }
			                    
			                    
			            }
			        })
			 });
				//=====================================================
				$( "button.btn.btn-default:contains('�˻�')" ).on("click" , function() {
					fncGetList(1);
				 
			 });
				
				//==== �˻�â �Է� �� enter�� �˻� �̺�Ʈ ===========================================================
				
				function enterkey() { 
					if(window.event.keyCode == 13){
						fncGetList(1);
					}
				} 				
				
				 $(document).on('click', 'a.btn-defualt', function(){
					 var cookNo =$(this).attr("value");
					 console.log('������');
					 self.location = "/cook/getCook?menu=search&cookNo="+cookNo
				});
				 
				
				 $(document).on('click', 'a.update', function(){
					 var cookNo =$(this).attr("value");
					 console.log('�����ϱ�');
					 self.location = "/cook/updateCook?cookNo="+cookNo
				});
				 
				 $(document).on('click', '.image', function(){
					 var cookNo =$(this).attr("value");
					 console.log('����� Ŭ��'+cookNo);
					 self.location = "/cook/getCook?menu=search&cookNo="+cookNo
				});
				 
				 
				 
			
			   		
				   	//====================================================================
					 
				   	 $(window).scroll(function() {
			                if($(window).scrollTop() == $(document).height() - $(window).height()) { 
			                	
			                	var cpage = $("#currentPage").val();
			                	console.log(cpage);
			                	cpage = Number(cpage)+1;
			                	console.log(cpage);
			                	
			                	var keyword = $("#cookname").val();
			        	   		console.log("keyword: "+keyword);
			        	   		
			        	   		var search = $("#searchCondition").val();
			        	   		console.log("search: "+search);
			        	   		
			        	   		var themeCon = $("#themeCondition").val();
			        	   		console.log("theme: "+themeCon);			                	
				                	
			        	   		
			        	   		
						            $.ajax({
						                
						                  url : "/cook/json/listCook?&menu=${param.menu }" ,
						                  method : "POST" ,
						                  data : JSON.stringify({
						                	  currentPage : cpage,						                	 
						                	  searchKeyword : keyword,
						                	  searchCondition : search,
						                	  themeCondition : themeCon						                	  
						                  }), 
						                  dataType : "json" ,
						                  headers : {
						                     "Accept" : "application/json",
						                     "Content-Type" : "application/json"
						                  },
						                success : function(JSONData , status) {
						                	 
						                	$("#currentPage").val(cpage)
						                	//console.log(cpage); 
						                	//alert(JSONData.list[0].cookName);
						                	//alert(JSONData.list.length);
						                	console.log(JSONData.list[0].cookName);
						                	   
						                	for(var i=0; i<JSONData.list.length; i++){
						                		///*
						                		var image;
						                		var message;
						                		var cancel;
						                		var button;
						                		var cookTheme;
						                		var heartCount;
						                		
													
						                
						                		if(JSONData.list[i].cookStock == '0'){
					                				
					                					image = "<img src='/resources/images/uploadFiles/"+JSONData.list[i].cookFilename.split('/')[0]+"' width='300' height='300' id='image'>";
					                				
						                			
						                		}else{
						                			
					                					image = "<img src='/resources/images/uploadFiles/"+JSONData.list[i].cookFilename.split('/')[0]+"' width='300' height='300' id='image'>";
					                				
						                		}
						                		
						                		
						                		if(JSONData.list[i].cookTheme == 'KO'){
					                				
						                			cookTheme = "<h5><strong>�׸� : �ѽ�</strong></h5>";               				
					                			
					                			}else if(JSONData.list[i].cookTheme == 'JA'){
					                			
					                				cookTheme = "<h5><strong>�׸� : �Ͻ�</strong></h5>";			                				
					                			}else if(JSONData.list[i].cookTheme == 'AM'){
					                				cookTheme = "<h5><strong>�׸� : ���</strong></h5>";
					                			}else if(JSONData.list[i].cookTheme == 'CH'){
					                				cookTheme = "<h5><strong>�׸� : �߽�</strong></h5>";
					                			}else if(JSONData.list[i].cookTheme == 'DE'){
					                				cookTheme = "<h5><strong>�׸� : ����</strong></h5>";
					                			}
						                		
						                		if(JSONData.list[i].heartCount == '0'){
						                			heartCount= "<p align='right' class='bi bi-heart like_btn' value='"+JSONData.list[i].cookNo+"'  id='like_btn' >&nbsp; ���ƿ�&nbsp;"+JSONData.list[i].hearthit+"��</p>";
						                			
						                			
						                		}else{
						                			
						                			heartCount= "<p align='right' class='bi bi-heart-fill like_btn' value='"+JSONData.list[i].cookNo+"'  id='like_btn' >&nbsp; ���ƿ�&nbsp;"+JSONData.list[i].hearthit+"��</p>";
						                			
						                			
						                		}
						                		
						                		if(JSONData.list[i].cookStock == '0'){
						                		
						                		recruit ="<div><h6 style='color:#e90f30'><strong>��û����� ��ŷŬ�����Դϴ�</strong></h6></div>"
						                			
						                			
						                		}else{ 
						                		
						                			recruit="<div></div>"
						                			
						                		}
						                			
						                
						                			
						                			
						                		
						                		
							                     var displayValue = "<div class='container channel'>"
							                    	 				+"<div class='row' id='target'>"
							                    	 				+"<td align='left'></td>"
							                    	 				+"<div class='row'>"
							                     					+"<div class='col-xs-4 col-md-6 text-lefr image' align='center'  value='"+JSONData.list[i].cookNo+"'><br>"
							                     					+image
							                     					+"<br/><br/>"
							                     					+"<table><tr class='liketable'>"
							                     					+"<td>"							                     					
							                     					+"</td><td class='likes'></td></tr>	</table></div>"
							                     					+"<div class='col-xs-4 col-md-4'>"
						                     						+"<div class='row'>"
						                     						+"<div><h3><strong>"+JSONData.list[i].cookName+"</strong></h3>"
						                     						+recruit
						                     						+"</div><br><div><strong>"+JSONData.list[i].cookBrief+"</strong></div>"
						                     						+"</div><br>"
						                     						+"<div class='row'>"
						                     						+"<div><h5><strong>�����ο� : "+JSONData.list[i].cookRecruit+" ��</strong></h5></div>"
						                     						+"</div>"
						                     						+"<div class='row'>"
						                     						+"<div><h5><strong>"+JSONData.list[i].cookPrice+" ��</strong></h5></div>"						                     						
						                     						+"</div>"
						                     						+"<div class='row'>"
						                     						+"<h5><strong> "+cookTheme+"</strong></h5></div>"
						                     						+"<div class='row'>"
						                     						+"<h5><strong>��� : "+JSONData.list[i].cookLocation+"</strong></h5></div>"					                     						
						                     						+"<div class='row'>"
						                     						+"<div><h5><strong>�����Ⱓ: "+JSONData.list[i].aplstarTime+"&emsp;~&emsp;"+JSONData.list[i].aplendTime+"</strong></h5></div>"
						                     						+"</div>"
						                     						+"<div class='row'>"
						                     						+"<div><h5><strong>�����ð�: "+JSONData.list[i].startTime+"&emsp;~&emsp;"+JSONData.list[i].endTime+"</strong></h5></div>"
						                     						+"</div>"	
						                     						+"</div>"
						                     						+"<div class='col-xs-2 col-md-2'>"
						                     						+"</div>"
						                     						+"</div>"
						                     						+"<hr/>"
						                     					  
						                     		//*/				
							               	$( '#scrollList' ).append(displayValue);	
						                     						
							             	 		
						                    						
						                     						
						                	}//for 
						                 }
						            });//ajax
						           
			                }//if
			            });//function
			 
			   });
			 
		</script>



</head>

<body>


	
	<jsp:include page="/layout/toolbar.jsp" />
	

	

	<div class="container">
		<div class="text-info text-left"></div>
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>


			<div class="carousel-inner" role="listbox">

				<div class="item active">
					<img src="/resources/images/uploadFiles/fallkim.jpg" alt="First slide">
				</div>

				<div class="item">
					<img src="/resources/images/uploadFiles/cooking.jpg" alt="Second slide">
				</div>

				<div class="item">
					<img src="/resources/images/uploadFiles/wow.jpg" alt="Third slide">
				</div>

			</div>
			<!-- carousel-inner end -->

			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
			</a>
		</div>
		<br />

		<div class="wrapper row3">
			<section class="hoc container clear">
				<div class="center btmspace-50">
					<br />


					<h3 class="font-x2 nospace" align="center">
						<br>
						<span style="color: #937062">COOKING&nbsp;CLASS</span>
					</h3>


				</div>


				

				<br />
				<hr />
				<br />


				<nav class="ref-sort">
					<button type="button" class="theme themeAll" id="themeAll" value="all">��κ���</button>
					<button type="button" class="theme themeko" id="themeko" value="ko">�ѽ�</button>
					<button type="button" class="theme themeja" id="themeja" value="ja">�Ͻ�</button>
					<button type="button" class="theme themeam" id="themeam" value="am">���</button>
					<button type="button" class="theme themech" id="themech" value="ch">�߽�</button>
					<button type="button" class="theme themede" id="themede" value="de">����</button>
					<button type="button" class="theme themede" id="themede" value="no">��û����</button>
				</nav>
				<form class="form-inline" name="detailForm">

					<input type="hidden" id="themeCondition" name="themeCondition" value="${search.themeCondition}" />



					<table width="100%">
						<tr>
							<td class="col-md-6 text-right">

								<div class="form-group">
									<label class="sr-only" for="searchKeyword">�˻�</label>
									 <input type="text" style="display: none;">
									  <input type="text" class="form-control" id="cookname" name="searchKeyword" placeholder="�˻�� �Է��ϼ���" onkeyup="enterkey()" value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
								</div>

								<button type="button" class="btn btn-default" id="search">�˻�</button>
							</td>
						</tr>
					</table>





					<input type="hidden" id="currentPage" name="currentPage" value="1" />
					 <input type="hidden" id="menu" name="menu" value="${param.menu }" />
					  <input type="hidden" name="cookNo" value="${cook.cookNo}">

				</form>

			</section>

			


		</div>
	</div>





	<div class="container channel">




		<div class="row" id="target">
			<c:set var="i" value="0" />


			<c:forEach var="cook" items="${list}">


				<input type="hidden" name="userNickname" value="${user.userNickname}">
				<input type="hidden" name="userId" value="${user.userId}">
				<input type="hidden" name="cookNo" value="${cook.cookNo}">
				<input type="hidden" name="cookNo" value="${cook.cookStock}">
				<input type="hidden" name="hearthit" value="${cook.hearthit}">



				<div class="row">


					<div class="col-xs-4 col-md-6 text-lefr image" align="center" value="${cook.cookNo }">
						<br>
						<c:choose>
							<c:when test="${cook.cookFilename.contains('/')}">
								<c:choose>
									<c:when test="${cook.cookFilename.contains('mp4')}">
										<c:forEach var="name" items="${cook.cookFilename.split('/')}">
											<video width="400" height="400" controls autoplay src="/resources/images/uploadFiles/${name}" type="video/mp4" value="${name}"></video>
										</c:forEach>
									</c:when>

									<c:otherwise>
										<c:forEach var="name" items="${cook.cookFilename.split('/')}">
											<img src="/resources/images/uploadFiles/${name}" width="300" height="300" align="absmiddle" />
											<input type="hidden" name="image" value="${name }" />
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<img src="/resources/images/uploadFiles/${cook.cookFilename}" width="300" height="300" align="absmiddle" class="image" value="${prodThumbnail}" />
							</c:otherwise>
						</c:choose>

						<br>
						<br>


					</div>


					<div class="col-xs-4 col-md-4">

						<div class="row">
							<input type="hidden" name="cookNo" id="cookNo" value="${cook.cookNo }" />
							 <input type="hidden" name="cookRegdate" id="cookRegdate" value="${cook.cookRegdate }" />
						</div>



						<div class="row">



							<div>
								<h3>
									<strong>${cook.cookName}</strong>
								</h3>
								<c:choose>

									<c:when test="${cook.cookStock == '0'}">
										<div>
											<h6 style="color: #e90f30">
												<strong>��û����� ��ŷŬ�����Դϴ�</strong>
											</h6>
										</div>
									</c:when>
									<c:otherwise>

									</c:otherwise>

								</c:choose>
							</div>
							<br>
							<div>
								<strong>${cook.cookBrief }</strong>
							</div>
							<br> <input type="hidden" name="cookBrief" value="${cook.cookBrief }" />
							 <input type="hidden" name="cookName" value="${cook.cookName}" /> 
							 <input type="hidden" name="cookRecruit" value="${cook.cookRecruit}" />


						</div>
						<div class="row">

							<div>
								<h5>
									<strong>�����ο� : ${cook.cookRecruit}��</strong>
								</h5>
							</div>
						</div>

						<div class="row">
							<div>
								<h5>
									<strong>���� : ${cook.cookPrice } �� </strong>
								</h5>
							</div>

						</div>



						<div class="row">
							<c:if test="${cook.cookTheme =='KO'}">
								<h5>
									<strong>�׸� : �ѽ�</strong>
								</h5>
							</c:if>
							<c:if test="${cook.cookTheme == 'JA'}">
								<h5>
									<strong>�׸� : �Ͻ�</strong>
								</h5>
							</c:if>
							<c:if test="${cook.cookTheme == 'AM'}">
								<h5>
									<strong>�׸� : ���</strong>
								</h5>
							</c:if>
							<c:if test="${cook.cookTheme == 'CH'}">
								<h5>
									<strong>�׸� : �߽�</strong>
								</h5>
							</c:if>
							<c:if test="${cook.cookTheme == 'DE'}">
								<h5>
									<strong>�׸� : ����</strong>
								</h5>
							</c:if>
						</div>


						<div class="row">

							<div>
								<h5>
									<strong>��� : ${cook.cookLocation}</strong>
								</h5>
							</div>
						</div>



						<div class="row">
							<div>
								<h5>
									<strong>�����Ⱓ : ${cook.aplstarTime}&emsp;~&emsp;${cook.aplendTime}</strong>
								</h5>
							</div>
						</div>

						<div class="row">
							<div>
								<h5>
									<strong>�����ð� : ${cook.startTime}&emsp;~&emsp;${cook.endTime}</strong>
								</h5>
							</div>


						</div>


						


					</div>



				</div>

				<hr />

			</c:forEach>
			<c:if test="${empty list}">
				<br>
				<br>
				<div class="emptyProd">�Ǹ����� ��ŷŬ������ �����ϴ�.</div>
				<br>
			</c:if>
		</div>
	</div>



	<div id="scrollList"></div>




</body>

</html>
