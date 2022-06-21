<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ŷŬ��������</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />







<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>




<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>


	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    
    
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<style>
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
	
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '-' + month  + '-' + day;

	if(dateString <= startDate && dateString+1 <= endDate && startDate <= endDate) {
		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/cook/addCook").submit();	
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
 		 <textarea class="summernote" id ="summernote" name="cookContent">${cook.cookContent}</textarea>    
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