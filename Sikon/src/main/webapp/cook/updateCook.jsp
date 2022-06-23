<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ŷŬ��������</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />





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
div.container {
	padding-top: 200px;
	
}

.btn-w {
  cursor: pointer;
  background-color: #f7f7f7;
  border: 1px solid #937062;
  color: #937062;
  padding: 11px 0;
  width:100px;
  font-size: small;
}

.btn-b {
  cursor: pointer;
  background-color: #937062;
  border: none;
  color: #fff;
  padding: 12px 0;
  width:100px;
  font-size: small;
}
    </style>
    
 <style>

.pltitle{
	text-align: center;
	color: #937062;
	padding-top: 35px;
}


/*# sourceMappingURL=style.css.map */
    </style>   
	<script type="text/javascript">



function fncUpdateCook(){

	var startDate = $("input[name='aplstarTime']").val();
	var endDate = $("input[name='aplendTime']").val();
	var cookStock = $("input[name='cookStock']").val();
	var cookRecruit = $("input[name='cookRecruit']").val();


	if (cookStock != cookRecruit) {
		alert("��û�����ο��� �����ο��� ���ƾ��մϴ�");
		return;
	}
	

	

	if (cookName == null || cookName.length < 1) {
		alert("��ŷŬ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if (cookBrief == null || cookBrief.length < 1) {
		alert("��ŷŬ�������������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}


	if (cookStock == null || cookStock.length < 1) {
		alert("�����ο������ο��� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}	

	
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;

	if(dateString <= startDate && dateString+1 <= endDate && startDate <= endDate) {
		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/cook/updateCook").submit();	
	} else if(dateString > startDate) {
		alert("�������۱Ⱓ�� ���� ���ķ� �����ϼž� �մϴ�.")
	} else if(dateString+1 > endDate) {
		alert("��������Ⱓ�� ���� ���ķ� �����ϼž� �մϴ�.")
	} else if (startDate > endDate ) {
		alert("�������۱Ⱓ�� ��������Ⱓ ���ķ� �����ϼž� �մϴ�.")
	}		


	//$("form").attr("method" , "POST").attr("action" , "/cook/updatecook").submit();	
	$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/cook/updateCook").submit();
}



$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	$( ".btn-b" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('����')" ).html() );
		fncUpdateCook();
	});
});	

$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]").on("click" , function() {
		$("form")[0].reset();
	});
});	

$(document).ready(function() {
	
	var user = $('#user').val();
	console.log(user);
	
	
	 $('#summernote').summernote({
	        placeholder: '������ �Է����ּ���.',
	        tabsize: 2,
	        height: 500,
	        lang : 'ko-KR',
	        maximumImageFileSize : 20 * 1024 * 1024,
	  	  // �����Ϳ� Ŀ�� �̵� (inputâ�� autofocus��� �����Ͻø� �˴ϴ�.)


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
			url : "/cook/json/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
				console.log(data.url);
            	//�׻� ���ε�� ������ url�� �־�� �Ѵ�.
				$(editor).summernote('insertImage', data.url);
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
	
  <h3 class="pltitle">| ��ŷŬ���� ���� |</h3>
   <br><br>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		 <input type="hidden" name="cookNo" value="${cook.cookNo}"/>
		 <input type="hidden" name="menu"  value="${param.menu}">
		      
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookName" name="cookName" value="${cook.cookName}" placeholder="��ŷŬ������">
		      
		    </div>
		  
		  </div>
		  
		  <div class="form-group">
		    <label for="cookStock" class="col-sm-offset-1 col-sm-3 control-label">�����ο������ο�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookStock" name="cookStock" value="${cook.cookStock}" placeholder="�����ο������ο�">
		    </div>
		  </div>
		  
		    <div class="form-group">
			    <label for="cookRecruit" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ���������ο�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="cookRecruit" name="cookRecruit" value="${cook.cookRecruit}" placeholder="��ŷŬ���������ο�">
			    </div>
			  </div>
			  
		    <div class="form-group">
			    <label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������̵�</label>
			    <div class="col-sm-4">
			         <select class="form-control" name="cookDifficuty" id="cookDifficuty">
				  <option value="1" ${!empty cook.cookDifficuty && cook.cookDifficuty=="1" ? "selected" : ""}>�ʱ�</option>
				  <option value="2" ${!empty cook.cookDifficuty && cook.cookDifficuty=="2" ? "selected" : ""}>�߱�</option>
				  <option value="3" ${!empty cook.cookDifficuty && cook.cookDifficuty=="3" ? "selected" : ""}>���</option>

				    				  
			  </select>
			     
			    </div>
			  </div>			  
		  
		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������������</label>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="cookBrief"  name="cookBrief" value="${cook.cookBrief}" placeholder="��ŷŬ������������">
		    </div>
		      </div>
		  <div class="form-group">
		    <label for="aplstarTime" class="col-sm-offset-1 col-sm-3 control-label">�����Ⱓ</label>
		    <div class="col-sm-2">
		    
		      <input type="DATE" class="form-control" id="aplstarTime" name="aplstarTime" value="${cook.aplstarTime}" placeholder="�������۱Ⱓ">
		 
		  </div>		  

		    <div class="col-sm-2">
		      <input type="DATE" class="form-control" id="aplendTime" name="aplendTime" value="${cook.aplendTime}" placeholder="��������Ⱓ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="startTime" class="col-sm-offset-1 col-sm-3 control-label">�����ð�</label>
		    <div class="col-sm-2">
		      <input type="time" class="form-control" id="startTime" name="startTime"value="${cook.startTime}" placeholder="�������۽ð�">
		    </div>

		    <div class="col-sm-2">
		      <input type="time" class="form-control" id="endTime" name="endTime"value="${cook.endTime}" placeholder="��������ð�">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookPrice" name="cookPrice"value="${cook.cookPrice}" placeholder="��ŷŬ��������">
		    </div>
		  </div>	
		  <div class="form-group">
		    <label for="cookTheme" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����׸�</label>
		    <div class="col-sm-4">
     <select class="form-control" name="cookTheme" id="cookTheme" required>
     			 <option value="0"  ${!empty cook.cookTheme && cook.cookTheme=="" ? "selected" : ""}>ī�װ�</option>	
				  <option value="KO"  ${!empty cook.cookTheme && cook.cookTheme=="KO" ? "selected" : ""}>�ѽ�</option>
				  <option value="JA"  ${!empty cook.cookTheme && cook.cookTheme=="JA" ? "selected" : ""}>�Ͻ�</option>
				  <option value="AM"  ${!empty cook.cookTheme && cook.cookTheme=="AM" ? "selected" : ""}>���</option>
				  <option value="CH"  ${!empty cook.cookTheme && cook.cookTheme=="CH" ? "selected" : ""}>�߽�</option>
				  <option value="DE"  ${!empty cook.cookTheme && cook.cookTheme=="DE" ? "selected" : ""}>����</option>
				    				  
			  </select>		    

		    </div>
		  </div>	
		  <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������</label>
		    <div class="col-sm-4">
 <input type="text" class="form-control" id="cookLocation" name="cookLocation"value="${cook.cookLocation}" placeholder="��ŷŬ�������">
<input type="button" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bdc66313a731d6cd370ddce26735db6a&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };

    //������ �̸� ����
    var map = new daum.maps.Map(mapContainer, mapOption);
    //�ּ�-��ǥ ��ȯ ��ü�� ����
    var geocoder = new daum.maps.services.Geocoder();
    //��Ŀ�� �̸� ����
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // ���� �ּ� ����

                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById("cookLocation").value = addr;
                // �ּҷ� �� ������ �˻�
                geocoder.addressSearch(data.address, function(results, status) {
                    // ���������� �˻��� �Ϸ������
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //ù��° ����� ���� Ȱ��

                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // ������ �����ش�.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ���� �߽��� �����Ѵ�.
                        map.setCenter(coords);
                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
		     
		    </div>
		  </div>			  		  		  		  
		<div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����̹���</label>
		    <div class="col-sm-4">
		    
		    	<c:choose>
		    	<c:when test="${cook.cookFilename.contains('/')}">
						<c:choose>
						<c:when test="${cook.cookFilename.contains('mp4')}">
							<c:forEach var="name" items="${cook.cookFilename.split('/')}">
								<video width="400" height="300" controls autoplay src="/resources/images/uploadFiles/${name}" type="video/mp4"  value="${name}"></video>
							</c:forEach>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="name" items="${cook.cookFilename.split('/')}">
								<img src="/resources/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
								<input type="hidden" name="image" value="${name }"/>
							</c:forEach>
						</c:otherwise>
						</c:choose>
				</c:when>
				<c:otherwise>
					<img src="/resources/images/uploadFiles/${cook.cookFilename}" width="300" height="300" align="absmiddle" class="image" value="${prodThumbnail}"/>
				</c:otherwise>
		    	</c:choose>
		    	
		     <input multiple="multiple" type="file" id="uploadfile" name="uploadfile"  >
		    </div>
		  </div>

   <div class="form-group">
   
 
 		 <textarea class="summernote" id ="summernote" name="cookContent"  > ${cook.cookContent }  </textarea>    
		</div>		  
	
		  
				  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    
			
			  	<button type="button" class="btn-b">����</button>
	
		    </div>
		  </div>
		  

		</form>

		
 	</div>

	
</body>

</html>