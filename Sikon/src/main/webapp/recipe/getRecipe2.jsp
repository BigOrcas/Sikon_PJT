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
	
	<!--  ///////////////////////// font ////////////////////////// -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Batang&display=swap"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
body {
	padding-top: 50px;
	font-family: 'Gowun Batang', serif;
}
</style>


<style>
.page-header {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: brown
}

.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: brown
}

.row {
	font-family: 'Gowun Batang', serif;
}
</style>
     
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			 $( "button:contains('Ȯ��')" ).on("click" , function() {
					self.location = "/review/listReview"
				});
			 
			 $( "button:contains('���')" ).on("click" , function() {
					history.go(-1);
				});
			 
			 $( "button:contains('å����')" ).on("click" , function() {
				 self.location = "/bookmark/addBookmark?recipeNo="+${recipe.recipeNo }
				//alert(${recipe.recipeNo});
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

		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">�����ǻ���ȸ</h3>
			<br></br>
		</div>
		
		<div class="row">
			<img src="/resources/images/uploadFiles/${recipe.recipeImg}" width="300" height="300"><br/>
			<button type="button" class="btn btn-default" >å����</button>
			
		</div>
		<hr />

		<div class="row">
			<div class="col-xs-4 col-md-2">
				<strong>�����Ǹ�</strong>
			</div>
			<div class="col-xs-8 col-md-4">${recipe.recipeName}</div>
		</div>

		<hr />

		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�����ǰ�������</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.recipeDetail}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�ҿ�ð�</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.cookingTime}</div>
		</div>
		
		<hr/>
		
		<div class="row">
		<div class="col-xs-4 col-md-2 "><strong>���</strong></div>
				<div class="col-xs-8 col-md-4">
		
		<table class="type09"  style="border: 1px;">
		<thead>
						<tr>
							<th>����</th>
							<th>����</th>
						</tr>
						<c:set var="i" value="0" />
			<c:forEach var="ingredient" items="${list}">
						<tr>
						<td>${ingredient.ingredientName}</td>
						<td>${ingredient.ingredientAmount}</td>
						</tr>
						</c:forEach>
					</thead>
					</tbody>
					</table>
					</div>
					</div>
		<hr/>

	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�׸�</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.recipeTheme}</div>
		</div>
		<hr/>
				<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${recipe.recipeOrder}</div>
		</div>
		
		<hr/>
		
		<div class="tab-content" id="myTabContent">
				<div class="xans-element- xans-product xans-product-review">
					<div class="ec-base-table typeList">
						<br>
						<h3>REVIEW</h3>
						<p class="desc">��ǰ�� ����ı⸦ �����ּ���.</p>
						<table border="1" width="100%">
							<caption></caption>
							<colgroup>
								<col style="width: 80px;">
								<col style="width: 500px">
								<col style="width: auto;">
								<col style="width: auto;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">��ȣ</th>
									<th scope="col">����</th>
									<th scope="col">�ۼ���</th>
									<th scope="col">�ۼ���</th>
								</tr>
							</thead>

							<tbody id="reviewList" name="reviewList">
							</tbody>

						</table>
					</div>
				</div>
				
				
				
	  		</div>
		</div>
		
		<br/>
		
	

 	</div> <!-- container -->
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
<script>
$(document).ready(function() {
	fn_selectReviewList(1); // ���丮��Ʈ ����¡ó��	

	$("a[name='review_detail']").on("click", function(e){ //���� Ŭ��
		e.preventDefault();
		fn_openBoardDetail($(this));
	});
});

function fn_selectReviewList(pageNo) {
	var comAjax = new ComAjax();
	//alert(${orderBy});
	comAjax.setUrl("<c:url value='/review/goodsDetailList.do' />");
	comAjax.setCallback("fn_selectReviewListCallback");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 9);
	comAjax.addParam("IDX", $("#IDX").val());
	comAjax.ajax();
}
function fn_selectReviewListCallback(data) {
	var total = data.TOTAL1;
	var body = $("#reviewList");
	body.empty();
	
	if (total == 0) {
		var str = "<tr>" + "<td colspan='5' align='center'>��ȸ�� ����� �����ϴ�.</td>"
				+ "</tr>";
		body.append(str);
	} else {
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			recordCount : 9,
			eventName : "fn_selectReviewList"
		};
		gfn_renderPaging(params);
		var str = "";
		var cnt = 1;
		$.each(data.reviewList, function(key, value) {
							var date = moment(value.REVIEW_DATE).format("YYYY-MM-DD");
							var img = "<img src='/stu/img/icon_201602021908415400.jpg' >"
							var REVIEW_IMG = value.REVIEW_IMG;
							var gubun = value.REVIEW_NO;
							var imgpath = "<img src='/resources/images/uploadFiles/"+value.REVIEW_IMG+"' width='500' height='400'>";
							
							
							if(REVIEW_IMG == null){
							str += " <tr id='show1"+cnt+"'> "
								+  " <td class='td1'>"+value.NUM+"</td> "
								+  " <td class='td2'>&nbsp;&nbsp;"+value.REVIEW_TITLE+"</td> "
								+  " <td class='td1'>"+value.MEMBER_NAME+"</td> "
								+  " <td class='td1'>"+date+"</td> "
								+  " </tr> "
								+  " <tr id='hide1"+cnt+"' style='display:none;'> "
								+  " <td colspan='5'> "+value.REVIEW_CONTENT+" </td>"
								+  " </tr> ";
								cnt++;
								
							}else{
								str += " <tr id='show1"+cnt+"'> "
									+  " <td class='td1'>"+value.NUM+"</td> "
									+  " <td class='td2'>&nbsp;&nbsp;"+value.REVIEW_TITLE+" "+img+ "</td> "
									+  " <td class='td1'>"+value.MEMBER_NAME+"</td> "
									+  " <td class='td1'>"+date+"</td> "
									+  " </tr> "
									+  " <tr id='hide1"+cnt+"' style='display:none;'> "
									+  " <td colspan='5'> "+value.REVIEW_CONTENT+" </td>"
									+  " </tr> ";
								cnt++;
							}
							
						});
		body.append(str);
</script>
</html>
