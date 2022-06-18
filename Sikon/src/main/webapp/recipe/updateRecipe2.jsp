<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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


<!-- include css/js -->
<link href="/resources/css/animate.min.css" rel="stylesheet">
<link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>

<!--  /////////////////////////summernote////////////////////////// -->

<script src="/resources/javascript/summernote-lite.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script src="/resources/javascript/lang/summernote-ko-KR.js"></script>
<!--  -->



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
	color: #75574B
}
.text-info {
	font-family: 'Gowun Batang', serif;
	font-weight: bold;
	color: #75574B
}
.row {
	font-family: 'Gowun Batang', serif;
}

table.type09 {
    border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
      width: 350px;
}

table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
     text-align: center;
     
}
table.type09 tbody th {
    width: 350px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>

<script type="text/javascript">
	$(function() {
		//���⼭ �� ��ǰ/������/Ŭ���� ���� �ɾ���ߵ�
		$("button:contains('���')").on("click", function() {
			self.location = "/recipe/listRecipe"
		});
		$("button:contains('�����Ǽ���')").on("click", function() {
			fncUpdateRecipe();
		});
		
	});
	
	function fncUpdateRecipe() {
		$("form").attr("method", "POST").attr("enctype", "multipart/form-data").attr("action", "/recipe/updateRecipe").submit();
		//$("form").attr("method", "POST").attr("action", "/recipe/addRecipe").submit();
	}
	
</script>
<script>
	$(document)
			.ready(
					function() {
						$('#summernote')
								.summernote(
										{
											height : 300, // ������ ����
											minHeight : null, // �ּ� ����
											maxHeight : null, // �ִ� ����
											focus : true, // ������ �ε��� ��Ŀ���� ������ ����
											placeholder : '�ִ� 2048�ڱ��� �� �� �ֽ��ϴ�', //placeholder ����
											callbacks : { //���� �κ��� �̹����� ÷���ϴ� �κ�
												onImageUpload : function(files) {
													uploadSummernoteImageFile(
															files[0], this);
												},
												onPaste : function(e) {
													var clipboardData = e.originalEvent.clipboardData;
													if (clipboardData
															&& clipboardData.items
															&& clipboardData.items.length) {
														var item = clipboardData.items[0];
														if (item.kind === 'file'
																&& item.type
																		.indexOf('image/') !== -1) {
															e.preventDefault();
														}
													}
												}
											}
										});
					});
	function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/recipe/json/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(JSONData, status) {
				//�׻� ���ε�� ������ url�� �־�� �Ѵ�.
				console.log('����');
				console.log(JSONData.url);
				$(editor).summernote('insertImage', JSONData.url);
			}
		});
	}
</script>



</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">

		<div class="page-header">

			<h3 class=" text-info" style="color: #75574B;">������ ���</h3>
		</div>



		<div class="form-group" >
			<form enctype="multipart/form-data">
				<div class="form-group">
					<label for="recipeName"
						class="col-lg-offset-1 col-lg-2 control-label ">����</label>
					<div class="col-lg-9">
						<input type="text" class="form-control" id="recipeName" value="${recipe.recipeName }"
							name="recipeName" placeholder="����">
					</div>
				</div>

<input type="hidden" name="recipeNo" value="${recipe.recipeNo }"/>

				<div class="form-group">
					<label for="recipeDetail"
						class="col-lg-offset-1 col-lg-2 control-label">��������</label>
					<div class="col-lg-9">
						<input type="text" class="form-control" id="recipeDetail" value="${recipe.recipeDetail }"
							name="recipeDetail" placeholder="50�� �̳��� �Է��ϼ���.">
					</div>
				</div>


				<div class="form-group">
					<label for="recipeImg"
						class="col-lg-offset-1 col-lg-2 control-label">��ǥ�̹���</label>
					<div class="col-lg-9">
						<input type="file" multiple="multiple" class="form-control" id="recipeImg" value="${recipe.recipeImg }"
							name="multiImg" placeholder="�������̹���">

					</div>
				</div>


				<div class="form-group">
					<label for="recipeDifficulty"
						class="col-lg-offset-1 col-lg-2 control-label">���̵�</label>
					<div class="col-lg-9">
						<select name="recipeDifficulty" class="form-control">
							<option value="1" selected="selected">�ʱ�</option>
							<option value="2">�߱�</option>
							<option value="3">����</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<label for="cookingTime"
						class="col-lg-offset-1 col-lg-2 control-label">�ҿ�ð�</label>
					<div class="col-lg-9">
						<input type="number" class="form-control" id="cookingTime" value="${recipe.cookingTime }"
							name="cookingTime" placeholder="�ҿ�ð�">
					</div>
				</div>
	
	
	
				<div class="form-group">
					<label for="ingredient"
						class="col-lg-offset-1 col-lg-2 control-label">���</label>

			<div class="col-lg-9">
				<table class="type09" style="border: 1px;" id="dynamicTable">
					<thead>
						<tr>
							<th>����</th>
							<th>����</th>
						</tr>
						<c:set var="i" value="0" />
					<c:forEach var="ingredient" items="${ingredient}">
						<tr>
						<td><input type="text" name="ingredientName" value="${ingredient. ingredientName}" >		<input type="hidden" name="ingredientNo" value="${ingredient.ingredientNo }"></td>
						<td><input type="text" name="ingredientAmount" value="${ingredient. ingredientAmount} "></td>
				
						</tr>
						
						</c:forEach>						
					</thead>
					<tbody id="dynamicTbody">
					</tbody>
				</table>
			</div>
			</div>




				<div class="form-group">
					<label for="recipeTheme" class="col-lg-offset-1 col-lg-2 control-label">ī�װ���</label>
					<div class="col-lg-9">
						<select name="recipeTheme" class="form-control">
							<option value="1" selected="selected">ī�װ���</option>
							<option value="2">�ѽ�</option>
							<option value="3">�߽�</option>
							<option value="4">���</option>
							<option value="5">�Ͻ�</option>
							<option value="6">����</option>
						</select>
					</div>
				</div>
				<br />
				<div class="form-group">
					<div class="col-lg-offset-1 col-lg-11">
						<br />

						<textarea id="summernote" class="form-control" name="recipeOrder">
      					${recipe.recipeOrder}
     					</textarea>
						<script>
							$('#summernote').summernote({
								tabsize : 2,
								height : 300
								
							});
						</script>
					</div>
				</div>

				<div class="form-group">
					<div class="col-lg-offset-1  col-lg-11 text-right">
						<br />
						<button type="button" class="btn btn-default"
							style="float: right;">�����Ǽ���</button>
						<button type="button" class="btn btn-default"
							style="float: right;">���</button>
					</div>
				</div>


			</form>
			
		</div>

	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>