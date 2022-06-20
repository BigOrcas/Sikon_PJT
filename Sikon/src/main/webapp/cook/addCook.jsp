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

<style>
div.container {
	padding-top: 150px;
	
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
	<script type="text/javascript">
	
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

					$(editor).summernote('insertImage', data.url);
				}
			});
		}
	 

	 $( document ).ready(function() {
			$( "#register" ).on("click" , function() {

									
				var pushData = $("input[name='cookTitle']").val();
				console.log(pushData);
				commentInsert(pushData);
				

			});
		});	



	function fncAddCook() {

		
		var cookName = $("input[name='cookName']").val();
		var cookBrief = $("input[name='cookBrief']").val();
		var aplstarTime = $("input[name='aplstarTime']").val();
		var aplendTime = $("input[name='aplendTime']").val();
		var startTime = $("input[name='startTime']").val();
		var endTime = $("input[name='endTime']").val();
		var cookRegdate = $("input[name='cookRegdate']").val();
		
		var cookStock = $("input[name='cookStock']").val();
	
	
		
		

		if (cookName == null || cookName.length < 1) {
			alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
		if (cookBrief == null || cookBrief.length < 1) {
			alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
			return;
		}
	
	
		if (cookStock == null || cookStock.length < 1) {
			alert("���� �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
		
		

		$("form").attr("method", "POST").attr("enctype","multipart/form-data").attr("action", "/cook/addCook").submit();	
		
	}
	

	
	
	 $(function() {
			
			 $( "button:contains('���')" ).on("click" , function() {
				 alert( $("button.btn-b").text());
				 fncAddCook();
			});
		});	

	function resetData() {
		
		document.detailForm.reset();
		$(function() {
			 $( "a[href='#' ]" ).on("click" , function() {
				 $("form")[0].reset();
				});
		});	
		
		
	}


</script>
<style>

.pltitle{
	text-align: center;
	color: #937062;
	padding-top: 35px;
}


/*# sourceMappingURL=style.css.map */
    </style>
</head>

<body>

<div>
	<jsp:include page="/layout/toolbar.jsp" />
	</div>



	<div class="container">
	

  <h3 class="pltitle">| ��ŷŬ���� ��� |</h3>
   <br><br>
		
	
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookName" name="cookName" placeholder="��ŷŬ������">
		      
		    </div>
		  
		  </div>
		  
		  <div class="form-group">
		    <label for="cookBrief" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookBrief" name="cookBrief"placeholder="��ŷŬ������������">
		    </div>
		  </div>		  
		  
		    <div class="form-group">
		    <label for="cookTheme" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����׸�</label>
		    <div class="col-sm-4">
     <select class="form-control" name="cookTheme" id="cookTheme">
				  <option value="KO" selected="selected">�ѽ�</option>
				  <option value="JA">�Ͻ�</option>
				  <option value="AM">���</option>
				  <option value="CH">�߽�</option>
				  <option value="DE">����</option>
				    				  
			  </select>
		      
		    </div>
		  
		  </div>
		  

		  
		  <div class="form-group">
			    <label for="cookStock" class="col-sm-offset-1 col-sm-3 control-label">�����ο������ο�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="cookStock" name="cookStock" placeholder="�����ο����">
			    </div>
			  </div>
			  
		  <div class="form-group">
			    <label for="cookRecruit" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ���������ο�</label>
			    <div class="col-sm-4">
			      <input type="text" class="form-control" id="cookRecruit" name="cookRecruit" placeholder="��ŷŬ���������ο�">
			    </div>
			  </div>
		  
		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">�����Ⱓ</label>
		    <div class="col-sm-2">
		      <input type="DATE" class="form-control" id="aplstarTime"  name="aplstarTime" placeholder="�������۱Ⱓ">
		    </div>
		    
		     <div class="col-sm-2">
		      <input type="DATE" class="form-control" id="aplendTime"  name="aplendTime" placeholder="��������Ⱓ">
		    </div>
		  </div>
		  

		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">�����ð�</label>
		    <div class="col-sm-2">
		      <input type="TIME" class="form-control" id="startTime"  name="startTime" placeholder="�������۽ð�">
		    </div>
		    
		      <div class="col-sm-2">
		      <input type="TIME" class="form-control" id="endTime"  name="endTime" placeholder="��������ð�">
		    </div>
		  </div>
		  

		  

		  
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookPrice" name="cookPrice" placeholder="��ŷŬ��������">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����̹���</label>
		    <div class="col-sm-4">
		     <input multiple="multiple" type="file" id="uploadfile" name="uploadfile"  >
		    
		    </div>
		  </div>
		  

		    <div class="form-group">
		    <label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������̵�</label>
		    <div class="col-sm-4">
     <select class="form-control" name="cookDifficuty" id="cookDifficuty">
				  <option value="1" selected="selected">�ʱ�</option>
				  <option value="2">�߱�</option>
				  <option value="3">���</option>

				    				  
			  </select>

		    </div>
		  </div>
		  
		    <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="cookLocation" name="cookLocation" placeholder="��ŷŬ�������">
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
		    <label for="uploadfile2" class="col-sm-offset-1 col-sm-3 control-label">1�п���</label>
		    <div class="col-sm-4">
		     <input multiple="multiple" type="file" id="uploadfile2" name="uploadfile2"  >
		    
		    </div>
		  </div>
		  
		   <input type="hidden" id="userId"  value="${user.userId }" />
    <div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">��ŷ����г���</label>
		    <div class="col-sm-4">
			${user.userNickname}
		    </div>
		  </div>


    <div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">��ŷ������̵�</label>
		    <div class="col-sm-4">
			${user.userId}
		    </div>
		  </div>	    

	    
	    <div class="form-group">
	    
 		 <textarea class="summernote" id ="summernote" name="cookContent"></textarea>    
		</div>
		  

		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		    
			
			  	<button type="button" class="btn-b">���</button>
	  		
		    </div>
		  </div>
		</form>
	
		
 	</div>

	
</body>

</html>