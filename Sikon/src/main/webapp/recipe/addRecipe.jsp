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
<!--  /////////////////////////summernote////////////////////////// -->

	
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css" media="all">
	


<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<!--  -->
<style>
.drop-zone {
  max-width: 200px;
  height: 200px;
  padding: 25px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  font-family: "Quicksand", sans-serif;
  font-weight: 500;
  font-size: 20px;
  cursor: pointer;
  color: #cccccc;
  border: 4px dashed #009578;
  border-radius: 10px;
  margin-bottom: 30px;
}

.drop-zone--over {
  border-style: solid;
}

.drop-zone__input {
  display: none !important;
}

.drop-zone__thumb {
  width: 100%;
  height: 100%;
  border-radius: 10px;
  overflow: hidden;
  background-color: #cccccc;
  background-size: cover;
  position: relative;
}

.drop-zone__thumb::after {
  content: attr(data-label);
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  padding: 5px 0;
  color: #ffffff;
  background: rgba(0, 0, 0, 0.75);
  font-size: 14px;
  text-align: center;
}

body{
background-color: #f7f7f7
}
</style>



</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	  <div class="main">

        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="/resources/images/6729a7d086c3cc13de8de7e6823182eb.jpg" alt="">
                    <div class="signup-img-content">
                        <h2>������ ��� </h2>
                        <p>����� �����Ǹ� �����ϼ���!</p>
                    </div>
                </div>
                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form">
                  

                        <div class="drop-zone">
                            <span class="drop-zone__prompt">�̹��� ���ε�</span>
                            <input type="file" name="myFile" class="drop-zone__input">
                          </div>


                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="first_name" class="required">�����Ǹ�</label>
                                    <input type="text" name="first_name" id="first_name" />
                                </div>
                                <div class="form-input">
                                    <label for="last_name" class="required">�����ǰ�������</label>
                                    <input type="text" name="last_name" id="last_name" />
                                </div>
                                <div class="form-input">
                                    <label for="company" >�����ǿ���</label>
                                    <input type="file" name="company" id="company" />
                                </div>
                               
                            </div>
                            <div class="form-group">
                                 <div class="form-radio">
                                    <div class="label-flex">
                                        <label for="payment">���̵�</label>
                                    </div>
                                    <div class="form-radio-group">            
                                        <div class="form-radio-item">
                                            <input type="radio" name="payment" id="cash" checked>
                                            <label for="cash">�ʱ�</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="payment" id="cheque">
                                            <label for="cheque">�߱�</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="payment" id="demand">
                                            <label for="demand">���</label>
                                            <span class="check"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-input">
                                    <label for="phone_number" class="required">�ҿ�ð�</label>
                                    <input type="text" name="phone_number" id="phone_number" />
                                </div>
                                 <div class="form-input">
                                    <label for="company" class="required">�׸�</label>
                                    <input type="text" name="company" id="company" />
                                </div>
                            </div>
                        </div>
                        <div class="donate-us">
                            <label>��������</label>
                                <textarea id="summernote" class="form-control" name="recipeOrder">
      
     </textarea>
						<script>
							$('#summernote').summernote({
								placeholder : '�����Ǹ� �Է��ϼ���',
								tabsize : 2,
								height : 300
							});
						</script>
                        </div>
                        <div class="form-submit">
                            <input type="submit" value="Submit" class="submit" id="submit" name="submit" />
                            <input type="submit" value="Reset" class="submit" id="reset" name="reset" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    
    <script src="/resources/vendor/nouislider/nouislider.min.js"></script>
    <script src="/resources/vendor/wnumb/wNumb.js"></script>
    <script src="/resources/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    <script src="/resources/vendor/jquery-validation/dist/additional-methods.min.js"></script>
        <script src="/resources/javascript/jquery.min.js"></script>
        
    
			

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

<script src="/resources/javascript/summernote-lite.js"></script>
<script src="/resources/javascript/lang/summernote-ko-KR.js"></script>


<script type="text/javascript">
	$(function() {
		//���⼭ �� ��ǰ/������/Ŭ���� ���� �ɾ���ߵ�
		$("button:contains('���')").on("click", function() {
			self.location = "/recipe/listRecipe"
		});
		$("button:contains('�����ǵ��')").on("click", function() {
			fncAddRecipe();
		});
		
		$("button:contains('����߰�')").on("click", function() {
			tableCreate();
		});
		$("button:contains('��ứ��')").on("click", function() {
			tableDelete();
		});
	});
	$("button:contains('�����ǵ��')").css("color", "red")
	function fncAddRecipe() {
		$("form").attr("method", "POST").attr("enctype", "multipart/form-data").attr("action", "/recipe/addRecipe").submit();
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

<script>
function tableCreate(){
	var tc = new Array();
	var html = '';
				
	var ingredientName = $("#ingredientName").val();
	var ingredientAmount = $("#ingredientAmount").val();
				
	html += '<tr>';
	html += '<td>'+'<input type="text" placeholder="����" id="ingredientName" name="ingredientName">'+'</td>';
	html += '<td>'+'<input type="text" placeholder="����" id="ingredientAmount" name="ingredientAmount">'+'</td>';
	html += '</tr>';
				
	
	$("#dynamicTable").append(html);
				
	console.log('���̷���'+$("#dynamicTable tr").find("td").length);
	}
	
function tableDelete(){
	$('#dynamicTable tbody tr:last').remove();
	}
	
</script>
<script>document.querySelectorAll(".drop-zone__input").forEach((inputElement) => {
    const dropZoneElement = inputElement.closest(".drop-zone");
  
    dropZoneElement.addEventListener("click", (e) => {
      inputElement.click();
    });
  
    inputElement.addEventListener("change", (e) => {
      if (inputElement.files.length) {
        updateThumbnail(dropZoneElement, inputElement.files[0]);
      }
    });
  
    dropZoneElement.addEventListener("dragover", (e) => {
      e.preventDefault();
      dropZoneElement.classList.add("drop-zone--over");
    });
  
    ["dragleave", "dragend"].forEach((type) => {
      dropZoneElement.addEventListener(type, (e) => {
        dropZoneElement.classList.remove("drop-zone--over");
      });
    });
  
    dropZoneElement.addEventListener("drop", (e) => {
      e.preventDefault();
  
      if (e.dataTransfer.files.length) {
        inputElement.files = e.dataTransfer.files;
        updateThumbnail(dropZoneElement, e.dataTransfer.files[0]);
      }
  
      dropZoneElement.classList.remove("drop-zone--over");
    });
  });
  
  /**
   * Updates the thumbnail on a drop zone element.
   *
   * @param {HTMLElement} dropZoneElement
   * @param {File} file
   */
  function updateThumbnail(dropZoneElement, file) {
    let thumbnailElement = dropZoneElement.querySelector(".drop-zone__thumb");
  
    // First time - remove the prompt
    if (dropZoneElement.querySelector(".drop-zone__prompt")) {
      dropZoneElement.querySelector(".drop-zone__prompt").remove();
    }
  
    // First time - there is no thumbnail element, so lets create it
    if (!thumbnailElement) {
      thumbnailElement = document.createElement("div");
      thumbnailElement.classList.add("drop-zone__thumb");
      dropZoneElement.appendChild(thumbnailElement);
    }
  
    thumbnailElement.dataset.label = file.name;
  
    // Show thumbnail for image files
    if (file.type.startsWith("image/")) {
      const reader = new FileReader();
  
      reader.readAsDataURL(file);
      reader.onload = () => {
        thumbnailElement.style.backgroundImage = `url(${'${reader.result}'})`;
       
      };
    } else {
      thumbnailElement.style.backgroundImage = null;
    }
  }
  
</script>
</html>