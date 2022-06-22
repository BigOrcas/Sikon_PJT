<%@ page contentType="text/html; charset=euc-kr"%>

<html lang="ko">
<head>
<meta charset="EUC-KR">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--  ///////////////////////// SummerNote ////////////////////////// -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">


<style>

html {
  line-height: 1;
  font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
  
  
}

ol, ul {
  list-style: none;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
}

caption, th, td {
  text-align: left;
  font-weight: normal;
  vertical-align: middle;
}

q, blockquote {
  quotes: none;
}
q:before, q:after, blockquote:before, blockquote:after {
  content: "";
  content: none;
}



a img {
  border: none;
}

article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary {
  display: block;
}

/* Colors */
/* ---------------------------------------- */
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
  font-weight: 400;
}

a {
  text-decoration: none;
}


.info-text {
  text-align: left;
  width: 100%;
}

.form-group {
  margin-bottom: 20px;
}

h2.heading {
  font-size: 18px;
  text-transform: uppercase;
  font-weight: 300;
  text-align: left;
  color: #937062;
  border-bottom: 1px solid #937062;
  padding-bottom: 3px;
  margin-bottom: 20px;
}

.controls {
  text-align: left;
  position: relative;
}
.controls input[type=text],
.controls input[type=email],
.controls input[type=number],
.controls input[type=date],
.controls input[type=tel],
.controls textarea,
.controls button,
.controls select {
  padding: 12px;
  font-size: 14px;
  border: 1px solid #c6c6c6;
  width: 100%;
  margin-bottom: 18px;
  color: #888;
  font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
  font-size: 16px;
  font-weight: 300;
  -webkit-border-radius: 2px;
  -moz-border-radius: 2px;
  -ms-border-radius: 2px;
  -o-border-radius: 2px;
  border-radius: 2px;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}
.controls input[type=text]:focus, .controls input[type=text]:hover,
.controls input[type=email]:focus,
.controls input[type=email]:hover,
.controls input[type=number]:focus,
.controls input[type=number]:hover,
.controls input[type=date]:focus,
.controls input[type=date]:hover,
.controls input[type=tel]:focus,
.controls input[type=tel]:hover,
.controls textarea:focus,
.controls textarea:hover,
.controls button:focus,
.controls button:hover,
.controls select:focus,
.controls select:hover {
  outline: none;
  border-color: #937062;
}

.controls .fa-sort {
  position: absolute;
  right: 10px;
  top: 17px;
  color: #999;
}
.controls select {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  cursor: pointer;
}

.controls textarea {
  resize: none;
  height: 200px;
}

input:-webkit-autofill {
   -webkit-box-shadow: 0 0 0 1000px #fff inset;
}

.submit {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  padding: 12px 0;
}
.submit:hover {
  background-color: #937062d4;
}

.cancel {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  padding: 11px 0;
}
.cancel:hover {
  background-color: #e7e2e2;
}
.clear:after {
  content: "";
  display: table;
  clear: both;
}

.grid {
  background: #f7f7f7;
}
.grid:after {
  /* Or @extend clearfix */
  content: "";
  display: table;
  clear: both;
}

.grid [class*=col-]:last-of-type {
  padding-right: 0;
}

.col-2-3 {
  width: 66.66%;
}

.col-1-3 {
  width: 33.33%;
}

.col-1-2 {
  width: 50%;
}

.size {
  width: 25%;
}

[class*=col-] {
  float: left;
  padding-right: 10px;
}

@media (max-width: 760px) {
  .col-1-4-sm,
.col-1-3,
.col-2-3 {
    width: 100%;
  }

  [class*=col-] {
    padding-right: 0px;
  }
}
.col-1-8 {
  width: 12.5%;
}

.formall{
	padding:220px;
}
.pltitle{

	text-align: center;
	color: #333;
	padding-top: 30px;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
}
/* ---------------------------------------- */
.summernote{
	margin-left: -63px;
	
}
</style>

	<script>
	
		$(function() {
			
			//======= ��ǰ��� ==================================
				
			$(".submit").on("click", function() {
				alert('���');
				$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/product/addProduct").submit();
			})
			
			
			//======= ������ ==================================
			
			$(".cancel").on("click", function() {
					history.go(-1);
			})
				
				
		})
	
	</script>

</head>

<body>

	<!-- tool bar start -->
	<div>
		<jsp:include page="/layout/toolbar.jsp" />
	</div>
	<!-- tool bar end -->

	<div class="container">
	
		<div class="formall">
		
			<!--  �Է��� -->
			<form action="">
			  
			  
				<h3 class="pltitle" style="color:#333;font-family: 'Tiro Devanagari Sanskrit', serif;">| R E G I S T R A T I O N |</h3><br><br>
				
				
				<!-- ��ǰ �⺻���� �Է� -->			  
				<div class="form-group prodinfo">
				
					<h2 class="heading">��ǰ�⺻����</h2>
			    
					<div class="controls">
						<input type="text" id="prodName" class="floatLabel" name="prodName" placeholder="��ǰ��">
					</div>
					
			    	<div class="controls">
			      		<input type="text" id="prodDetail" class="floatLabel" name="prodDetail" placeholder="��ǰ������">
			    	</div>
			    	
					<div class="controls">
					     <input type="number" id="prodStock" class="floatLabel" name="prodStock" placeholder="��ǰ���">
				    </div>
			    
			    
			    
					<div class="grid">
					
					    <div class="col-1-3 col-1-3-sm">
					      <div class="controls">
					        <i class="fa fa-sort"></i>
					        <select class="floatLabel" name="prodTheme" id="prodTheme">
					          <option value="TW" selected="selected">�ı��</option>
							  <option value="CW">��������</option>
							  <option value="MK">��ŰƮ</option>
					        </select>
					      </div>      
					    </div>
					    
					    <div class="col-1-3 col-1-3-sm">
					    <div class="controls">
					      <i class="fa fa-sort"></i>
					      <select class="floatLabel" name="prodStatus" id="prodStatus">
					        <option value="Y" selected>�Ǹ���</option>
					        <option value="N">�Ǹ�����</option>
					      </select>
					     </div>     
					    </div>
					
					    <div class="col-1-3 col-1-3-sm">
					    <div class="controls">
					      <i class="fa fa-sort"></i>
					      <select class="floatLabel" name="couponApply" id="couponApply">
					        <option value="Y" selected>�������밡��</option>
					        <option value="N">��������Ұ�</option>
					      </select>
					     </div>     
					    </div>
					    
					</div>
			    
			    
			    
					<div class="grid">
					
				        <div class="col-1-3">
				          <div class="controls">
				           <input type="number" id="prodPrice" class="floatLabel" name="prodPrice" min="0" placeholder="��ǰ����">
				          </div>          
				        </div>
				        
				        <div class="col-1-3">
				          <div class="controls">
				            <input type="number" id="prodDisRate" class="floatLabel" name="prodDisRate" min="0"  step="0.1" placeholder="������">
				          </div>          
				        </div>
				        
				        <div class="col-1-3">
				          <div class="controls">
				           <input type="number" id="prodDisPrice" class="floatLabel" name="prodDisPrice" min="0" placeholder="��ǰ���ΰ�">
				          </div>          
				        </div>
				        
					</div>
			   
					<br>
			   
					<h2 class="heading">��ǰ�����</h2>
					<div class="controls">
					     <input type="file" id="fileName" name="uploadfiles[]" multiple="multiple" >
				    </div>
			   
				   <br><br>
			   
				</div>
			  
			  
			  
			  
				<!--  ��ǰ �󼼳��� �� ��Ϲ�ư -->
				<div class="form-group">
					
					<h2 class="heading">��ǰ�󼼳���</h2>
					
					<div class="row">
				    	<div class="form-group summernote">
							<textarea id="summernote" class="form-control col-sm-5" name="prodContent" style="text-align: left;"></textarea>
						</div>
					</div>
					<div class="row text-center">
					<button type="submit" value="Submit" class="size submit">����ϱ�</button> &nbsp;
					<button type="button" class="size cancel">�� ��</button>
				     </div>
				</div> 
				
				
			  
			</form>
		
		</div>
	</div><!-- end container -->

	<script>
	
	//======== ��ӳ�Ʈ ==================================================================================
	
	   $(document).ready(function() {
	
	   	 $('#summernote').summernote({
	   	        placeholder: '������ �Է����ּ���.',
	   	     	tabsize : 2,
	   	     	height : 300, 
	   	    	width: 860, 
				minHeight : null, 
				maxHeight : null,
				focus : true, 
	   	  		callbacks: {	
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
			url : "/product/json/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(JSONData, status) {
				console.log('��ӳ�Ʈ');
				console.log(JSONData.url);
				$(editor).summernote('insertImage', JSONData.url);
			}
		});
	}
	     
	 
	//======== ��ӳ�Ʈ End ==================================================================================
	   
	</script>
	
</body>
</html>
