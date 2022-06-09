<%@ page contentType="text/html; charset=euc-kr"%>

<html lang="ko">
<head>
<meta charset="EUC-KR">

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>


<!-- jQuery UI toolTip ��� CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip ��� JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">

<!--  ///////////////////////// SummerNote ////////////////////////// -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<style>



body>div.container {
	padding-top: 200px;
	font-family: 'Nanum Myeongjo', serif;
}
h1.text-center {
	font-family: 'Nanum Myeongjo', serif;
}
#prodDetail {
	font-family: 'Nanum Myeongjo', serif;
}
div.form-group{
	font-family: 'Nanum Myeongjo', serif;
}
</style>

<script type="text/javascript">



	function fncAddProduct() {
		
		var summernote=$("#summernote").val();
		
		if(id == null || id.length <1){
			alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/product/addProduct").submit();
		
	}


	$(function() {
		$("button.btn.btn-warning").on("click", function() {
			
			console.log($('input[name=prodDisRate]').val());
			alert($("button.btn.btn-primary").text());
			fncAddProduct();
		})
	})

	$(function() {
		$("a[href='#' ]").on("click", function() {
			// resetData();
			$("form")[0].reset();
		})
	})
</script>
</head>

<body>
<div>
	<jsp:include page="/layout/toolbar.jsp" />
</div>

	<div class="container">

		<h1 class="text-center"  style="color:#bc8f8f">��ǰ���</h1>
		<br>
		<form class="form-horizontal" enctype="multipart/form-data">
		

			<div class="form-group">
		    <label for="prodName" class="col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ��">
		    </div>
		  </div>

			<div class="form-group">
		    <label for="prodDetail" class="col-sm-3 control-label">��ǰ��������</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ�������� �Է�">
		    </div>
		  </div>

		  <div class="form-group">
		    <label for="prodTheme" class="col-sm-3 control-label">��ǰ�׸�</label>
		    <div class="col-sm-6">
		      <select class="form-control" name="prodTheme" id="prodTheme">
				  <option value="TW" selected="selected">�ı��</option>
				  <option value="CW">��������</option>
				  <option value="MK">��ŰƮ</option>
			  </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodStatus" class="col-sm-3 control-label">�Ǹſ���</label>
		    <div class="col-sm-6">
		       <div class="btn-group" data-toggle="buttons">
				    <input type="radio" name="prodStatus" id="option1" value="Y" checked> �Ǹ���
				    <input type="radio" name="prodStatus" id="option2" value="N"> �Ǹ�����
				</div>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="couponApply" class="col-sm-3 control-label">�������뿩��</label>
		    <div class="col-sm-6">
		       <div class="btn-group" data-toggle="buttons">
				    <input type="radio" name="couponApply" id="option1" value="Y" checked> ���밡��
				    <input type="radio" name="couponApply" id="option2" value="N"> ����Ұ�
				</div>
		    </div>
		  </div>

			<div class="form-group">
			    <label for="prodStock" class="col-sm-3 control-label">��ǰ���</label>
			    <div class="col-sm-6">
			      <input type="text" class="form-control" id="prodStock" name="prodStock" placeholder="�����Է�">
			    </div>
			  </div>

			<div class="form-group">
		    <label for="prodPrice" class="col-sm-3 control-label">����</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="prodPrice" name="prodPrice" placeholder="����">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDisRate" class="col-sm-3 control-label">������</label>
		    <div class="col-sm-6">
		      <input type="number" step="0.1" class="form-control" id="prodDisRate" name="prodDisRate" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodDisPrice" class="col-sm-3 control-label">���ΰ�</label>
		    <div class="col-sm-6">
		      <input type="text" class="form-control" id="prodDisPrice" name="prodDisPrice" placeholder="���ΰ�">
		    </div>
		  </div>

			<div class="form-group">
		    <label for="fileName" class="col-sm-3 control-label">��ǰ�����</label>
		    <div class="col-sm-6">
		      <input type="file" id="fileName" name="uploadfiles[]" multiple="multiple" >
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="prodContent" class="col-sm-3 control-label">��ǰ�󼼳���</label>
		    <div class="col-sm-6 text-center" height=100px>
	      <textarea id="summernote" class="form-control col-sm-5" rows="5" name="prodContent"
					placeholder="����" style="resize: none"></textarea>
	    </div>
		</div>
		
		


			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-warning"  >���</button>
			  <button type="button" class="btn btn-default" href="#" >�ʱ�ȭ</button>
		    </div>
		  </div>

		</form>


	</div>


<script>
 
   $(document).ready(function() {

   	 $('#summernote').summernote({
   	        placeholder: '������ �Է����ּ���.',
   	        tabsize: 2,
   	        height: 500,
   	        lang : 'ko-KR',
   	        maximumImageFileSize : 20 * 1024 * 1024,
   	  	  // �����Ϳ� Ŀ�� �̵� (inputâ�� autofocus��� �����Ͻø� �˴ϴ�.)
   	  	  focus : true,
   	  	  ///*
   	  	  toolbar: [
   	  		    // �۲� ����
   	  		    ['fontname', ['fontname']],
   	  		    // ���� ũ�� ����
   	  		    ['fontsize', ['fontsize']],
   	  		    // ����, ����Ӳ�, ����,��� ��, ���������
   	  		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
   	  		    // ���ڻ�
   	  		    ['color', ['forecolor','color']],
   	  		    // ǥ�����
   	  		    ['table', ['table']],
   	  		    // �۸Ӹ� ��ȣ, ��ȣ�ű��, ��������
   	  		    ['para', ['ul', 'ol', 'paragraph']],
   	  		    // �ٰ���
   	  		    ['height', ['height']],
   	  		    // �׸�÷��, ��ũ�����, ������÷��
   	  		    ['insert',['picture','link','video']],
   	  		    // �ڵ庸��, Ȯ���ؼ�����, ����
   	  		    ['view', ['codeview','fullscreen', 'help']]
   	  		  ],
   	  		  // �߰��� �۲�
   	  		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','���� ���','�ü�','����ü','����','����ü','����ü'],
   	  		 // �߰��� ��Ʈ������
   	  		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
   	  		//*/
   	  		callbacks: {	//�̹��� ÷���ϴ� �κ�
   	               onImageUpload : function(files) {
   	                    uploadSummernoteImageFile(files[0],this);
   	                },
   	                onPaste: function (e) {
   						var clipboardData = e.originalEvent.clipboardData;
   						if (clipboardData && clipboardData.items && clipboardData.items.length) {
   							var item = clipboardData.items[0];
   							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
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
		url : "/product/uploadSummernoteImageFile",
		contentType : false,
		processData : false,
		success : function(data) {
			console.log('��ӳ�Ʈ');
			console.log(data.url);
           	//�׻� ���ε�� ������ url�� �־�� �Ѵ�.
			$(editor).summernote('insertImage', data.url);
		}
	});
}
     
</script>


</body>
</html>
