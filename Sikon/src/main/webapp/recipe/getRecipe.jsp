<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!--  ///////////////////////// �ۼ���¥ ����  ////////////////////////// -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="EUC-KR">

<!-- ���� : http://getbootstrap.com/css/   ���� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-dropdownhover.min.css"
	rel="stylesheet">

<!-- Bootstrap Dropdown Hover JS -->
<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  ///////////////////////// CSS ////////////////////////// -->
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">


<style>
.btn-sm {
	background-color: red;
}

@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
		format('truetype');
}

.nanumbarungothic * {
	font-family: 'NanumBarunGothic', sans-serif;
}

@font-face {
	font-family: 'YeolrinMyeongjo-Medium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/YeolrinMyeongjo-Medium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.container {
	padding-top: 200px;
	margin-left: 50%;
	width: 800px;
	font-family: 'NanumBarunGothic', sans-serif;
}

body {
	font-family: 'NanumBarunGothic', sans-serif;
	width: 750px;
}

.image {
	padding-top: 30px;
}

.row {
	margin-right: 0px;
	margin-left: 0px;
}

.updateButton{
text-align: right;
}
.updateButton button {
	background-color: #75574B;
	color: #fff;
	border: none;
	font-size: 12px
}


</style>

<style>
.text-center {
	text-align: left;
}

.iEJcKGheader {
	font-family: 'YeolrinMyeongjo-Medium';
	border-bottom: 2px solid rgb(147, 112, 98);
	font-size: 18px;
	line-height: 28px;
	letter-spacing: 0px;
	padding-bottom: 8px;
	border-bottom: 2px solid rgb(147, 112, 98);
	text-align: start;
	font-weight: bold;
	height: 5;
}

.ingredientName {
	width: 420px;
	text-align: left;
}

.ingredientAmount {
	text-align: right;
}

.table {
	margin-top: 20px;
}

.table td {
	margin-bottom: 10px;
}

.kgiNry {
	display: grid;
	align-items: flex-start;
	grid-template-columns: 48px 30px;
	float: right;
}
</style>

<!--  ��� -->
<style>
body {
	margin-top: 20px;
	background: #ebeef0;
}

.img-sm {
	width: 46px;
	height: 46px;
}

.panel {
	box-shadow: 0 2px 0 rgba(0, 0, 0, 0.075);
	border-radius: 0;
	border: 0;
	margin-bottom: 15px;
}

.panel .panel-footer, .panel>:last-child {
	border-bottom-left-radius: 0;
	border-bottom-right-radius: 0;
}

.panel .panel-heading, .panel>:first-child {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}

.panel-body {
	padding: 25px 20px;
}

.media-block .media-left {
	display: block;
	float: left
}

.media-block .media-right {
	float: right
}

.media-block .media-body {
	display: block;
	overflow: hidden;
	width: auto
}

.middle .media-left, .middle .media-right, .middle .media-body {
	vertical-align: middle
}

.thumbnail {
	border-radius: 0;
	border-color: #e9e9e9
}

.tag.tag-sm, .btn-group-sm>.tag {
	padding: 5px 10px;
}

.tag:not(.label) {
	background-color: #fff;
	padding: 6px 12px;
	border-radius: 2px;
	border: 1px solid #cdd6e1;
	font-size: 12px;
	line-height: 1.42857;
	vertical-align: middle;
	-webkit-transition: all .15s;
	transition: all .15s;
}

.text-muted, a.text-muted:hover, a.text-muted:focus {
	color: #acacac;
}

.text-sm {
	font-size: 0.9em;
}

.text-5x, .text-4x, .text-5x, .text-2x, .text-lg, .text-sm, .text-xs {
	line-height: 1.25;
}

.btn-trans {
	background-color: transparent;
	border-color: transparent;
	color: #929292;
}

.btn-icon {
	padding-left: 9px;
	padding-right: 9px;
}

.btn-sm, .btn-group-sm>.btn, .btn-icon.btn-sm {
	padding: 5px 10px !important;
}

.mar-top {
	margin-top: 15px;
}

/* ��Ʈ���  */
.deleteReview, .updateReview {
	font-family: FontAwesome;
	border: none;
	background-color: #fff;
}

.btn_upload {
	cursor: pointer;
	display: inline-block;
	overflow: hidden;
	position: relative;
	padding: 5px 10px;
}

.yes {
	display: flex;
	align-items: flex-start;
	margin-top: 10px !important;
}

.btn_upload input {
	cursor: pointer;
	height: 100%;
	position: absolute;
	filter: alpha(opacity = 1);
	-moz-opacity: 0;
	opacity: 0;
}

.it {
	height: 100px;
	margin-left: 10px;
}

.btn-rmv1, .btn-rmv2, .btn-rmv3, .btn-rmv4, .btn-rmv5 {
	display: none;
}

.rmv {
	cursor: pointer;
	color: #fff;
	border-radius: 30px;
	border: 1px solid #fff;
	display: inline-block;
	background: rgba(255, 0, 0, 1);
	margin: -5px -10px;
}

.rmv:hover {
	background: rgba(255, 0, 0, 0.5);
}

.submit, .update
 {
  display: block;
  border: none;
  width: 40px;
  height: 30px;
  color: #fff;
  font-size: 15px;
  cursor: pointer;
  margin-bottom: 10px;
  background: #d4af7a;
  float: right;
  	font-family: 'Gowun Batang', serif;
  
}

.bi-bookmark-plus::before,.bi-bookmark-plus-fill::before  {
	color:#d4af7a;
    display: inline-block;
    font-family: bootstrap-icons !important;
    font-style: normal;
    font-weight: normal !important;
    font-variant: normal;
    text-transform: none;
    line-height: 1;
    font-size:33px;
    vertical-align: -0.125em;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}
</style>

</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<input type="hidden" name="userId" value="${user.userId}"> <input
			type="hidden" name="userNickname" value="${user.userNickname}">

		<div class="col-xs-12 col-md-12  col-lg-12"
			style="padding-right: 88px">
		  	<button type="button" class="update">����</button>
		  	<button type="button" class="submit">����</button>

			<br/>
		</div>

		<div class="col-xs-12 col-md-12  col-lg-12" style="text-align: center">
			<c:forEach var="name" items="${recipe.recipeImg.split('/')[0]}">
				<input type="hidden" name="image" value="${recipe.recipeImg}">
				<img id="thum" src="/resources/images/uploadFiles/${name}"
					width="600" height="400" style="text-align: center;" />
			</c:forEach>
		</div>

		<br/> <input type="hidden" name="recipeNo" id="recipeNo"
			value="${recipe.recipeNo }" />





		<div class="col-xs-12 col-md-12  col-lg-12">
			<br />
			<br />
			<div style="font-family: 'YeolrinMyeongjo-Medium'; font-size: 17px">${recipe.recipeDetail }</div>
			<div>
				<div class="kgiNry" style="text-align: right;" align="right">
					<c:if test="${recipe.bookmarkStatus =='0'}">
					<i id="bookmarkBtn" class="bi bi-bookmark-plus"></i>
					</c:if>
					<c:if test="${recipe.bookmarkStatus =='1'}">
					<i id="bookmarkBtn" class="bi bi-bookmark-plus-fill"></i>
					</c:if>
					<a id="kakao-link-btn" href="javascript:kakaoShare()"> <img
						src="https://developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
						width="30" height="30" />
					</a> 
				</div>
				<h4>
					<strong style="font-family: 'YeolrinMyeongjo-Medium';">${recipe.recipeName}</strong>
				</h4>
			</div>
			<br> <input type="hidden" name="detail"
				value="${recipe.recipeDetail }" /> <input type="hidden" name="name"
				value="${recipe.recipeName}" />


			<h5>
				���̵�
				<c:choose>
					<c:when test="${recipe.recipeDifficulty.equals('100') }">
					�ʱ�
					</c:when>
					<c:when test="${recipe.recipeDifficulty.equals('200') }">
					�߱�
					</c:when>
					<c:otherwise>
					���
					</c:otherwise>
				</c:choose>


				&nbsp;�ҿ�ð� ${recipe.cookingTime }��
				<div style="float: right">��ȸ��: ${recipeViews}</div>
			</h5>
			<hr />
			${recipe.detail }
			 <br />



			<div class="iEJcKG">
				<h3 class="iEJcKGheader">�⺻ ���</h3>
				<div class="table">
					<table class="type09" style="width: 740px">
						<c:set var="i" value="0" />
						<c:forEach var="ingredient" items="${list}">
							<tr>
								<td class="ingredientName">${ingredient.ingredientName}</td>
								<td class="ingredientAmount">${ingredient.ingredientAmount}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>


			<hr />


			<div class="iEJcKG">
				<h3 class="iEJcKGheader">������</h3>
				<br /> ${recipe.recipeOrder }
			</div>
			<hr />


			<h3 class="iEJcKGheader">����</h3>
			<div class="card" id="comments">
			
				<div class="card-body">
					<!-- ��� �ۼ� â -->

					<form enctype="multipart/form-data">
						<div class="form-group">
							<label>��� �ۼ�</label>
							<textarea class="form-control" name="reviewContent" rows="2"
							placeholder="�����ǿ� ���� �ı⸦ �ۼ����ּ���!"></textarea>
						</div>
						
						<input type="hidden" name="writerNickname" value="${user.userNickname }">
						
						<button type="button" class="btn btn-primary"
							id="comment-create-btn">����</button>
					
		
					<!-- ��� ��� -->
					<c:forEach var="review" items="${review}">
					
					<ul class="list-unstyled">
						
						<li class="media mt-4" id="comment-{{id}}">
						<img src="https://api.adorable.io/avatars/64/{{author}}.png" class="mr-3" alt="avata">
							<div class="media-body">
							
								<!-- ��� -->
								<h5 class="mt-0 mb-1">
									 <small> <!-- ��Ʈ��Ʈ�� collapse Ȱ��, https://getbootstrap.com/docs/4.5/components/collapse/ -->
										<a href="#" class="comment-edit-btn" data-toggle="collapse"
										data-target=".multi-collapse-{{id}}">����</a>
									</small>
								</h5>
								
								<!-- ���� ��� -->
								<p class="collapse multi-collapse-{{id}} show">${review.reviewContent }</p>
								
								<!-- ���� ��� -->
									<div class="form-group">
										<textarea class="form-control" id="comment-content" rows="3">${review.reviewContent }</textarea>
										<input type="hidden" name="reviewContent" value="${review.reviewContent }">
									</div>
									<input type="hidden" id="comment-id" value="{{id}}"> 
									<button type="button" class="btn btn-info comment-update-btn">����
										�Ϸ�</button>
							</div></li> 
					</ul>
					</c:forEach>
				</div>
				
			</div>


			<!--===================================================-->




			</form>
		</div>
	</div>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
</body>
<script type="text/javascript">

		$(document).on('click','.update',function() {
			var recipeNo = $("input:hidden[name='recipeNo']").val();
			self.location ="/recipe/updateRecipe?recipeNo="+recipeNo
			});
		
		$(document).on('click','.submit',function() {
			var recipeNo = $("input:hidden[name='recipeNo']").val();

		    var array = new Array();
			array.push(recipeNo);
			
			alert("�����Ǹ� �����Ͻðڽ��ϱ�?");

			self.location = "/recipe/deleteRecipe?recipeList="+array;
			
		});
		
		
		
		//���� ���&����&����
		$(document).on("click" ,"#comment-create-btn", function(){
			var textNo = $("input:hidden[name='recipeNo']").val();
			var writerNickname = $("input:hidden[name='writerNickname']").val();
			var reviewContent  = $("input:hidden[name='reviewContent']").val();

			$.ajax({
				url : "/review/json/addReview",
				type : 'POST',
				dataType : "json",
				data : {
					'textNo' : textNo,
					'writerNickname' : writerNickname,
					'reviewContent' : reviewContent
				},
				async : false,
				error : function() {
					alert("��� ����");
				},
				success : function(content) {

							alert(content);
					}
			})
	});
	
	//���� push �˸�
	function pushAlarm(userId, userNickname, recipeNo) {

		$.ajax({
			url : "/recipe/json/pushAlarm",
			type : 'POST',
			dataType : "json",
			data : {
				'recipeNo' : recipeNo,
				'userId' : userId,
				'userNickname' : userNickname
			},
			async : false,
			error : function() {
				alert("��� ����");
			},
			success : function(data) {

				if (data.userId != data.writerId) {
					if (socket) {

						alert("�˶� ���� �Ϸ�!!");

						let socketMsg = "recipeReview," + data.userId + ","
								+ data.userNickname + "," + data.writerId + ","
								+ data.recipeName;
						console.log(socketMsg);
						socket.send(socketMsg);
					}
				}
			}
		})
	};

	//å���� ���&����
	$(document).on("click", "#bookmarkBtn", function() {
		var recipeNo = $("input:hidden[name='recipeNo']").val();
		var userId = $("input:hidden[name='userId']").val();
		console.log(recipeNo);
		console.log(userId);

		$.ajax({
			type : "POST",
			url : "/recipe/json/updateBookmark",
			dataType : "json",
			data : {
				'recipeNo' : recipeNo,
				'userId' : userId
			},
			error : function() {
				alert("��� ����");
			},
			success : function(bookmarkStatus) {

				if (bookmarkStatus == 0) {
					alert("�ϸ�ũ ����");

					$("#bookmarkBtn").removeClass('bi-bookmark');
					$("#bookmarkBtn").addClass('bi-bookmark-plus');

					location.reload();

				} else if (bookmarkStatus == 1) {
					alert("�ϸ�ũ ���");

					$("#bookmarkBtn").removeClass('bi-bookmark-plus');
					$("#bookmarkBtn").addClass('bi-bookmark');

					location.reload();
				}

			}
		})
	});
</script>


<!-- //////////////////////////////////�����ϱ�////////////////////////////// -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<!--  ///////////////////////// JavaScript ////////////////////////// -->
<script type="text/javascript">
	///*
	Kakao.init('92dfe0703b7ef1d171ddfba9cfe0e6e6');

	// SDK �ʱ�ȭ ���θ� �Ǵ��մϴ�.
	console.log(Kakao.isInitialized());

	function kakaoShare() {

		var image = $("input:hidden[name='image']").val();
		console.log(image);
		var name = $("input:hidden[name='name']").val();
		console.log(name);
		var detail = $("input:hidden[name='detail']").val();
		console.log(detail);
		var recipeNo = $("input:hidden[name='recipeNo']").val();
		console.log(recipeNo);

		Kakao.Link
				.sendDefault({
					objectType : 'feed',
					content : {
						title : name,
						description : detail,
						imageUrl : 'http://192.168.0.31:8080/resources/images/uploadFiles/'
								+ image,
						link : {
							mobileWebUrl : 'http://192.168.0.31:8080/recipe/getRecipe?recipeNo='
									+ recipeNo,
							webUrl : 'http://192.168.0.31:8080/recipe/getRecipe?recipeNo='
									+ recipeNo,
						},
					},
					buttons : [
							{
								title : '������ ����',
								link : {
									mobileWebUrl : 'http://192.168.0.31:8080/recipe/getRecipe?recipeNo='
											+ recipeNo,
									webUrl : 'http://192.168.0.31:8080/recipe/getRecipe?recipeNo='
											+ recipeNo,
								},
							}, ],
					// īī���� �̼�ġ �� īī���� ��ġ ����̵�
					installTalk : true,
				})
	}
	//=====================�����ϱ�====================================
</script>
</html>