<%@ page contentType="text/html; charset=euc-kr"%>

<html lang="ko">
<head>
<meta charset="EUC-KR">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!--  ///////////////////////// SummerNote ////////////////////////// -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">


<style>
html {
	line-height: 1;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
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

article, aside, details, figcaption, figure, footer, header, hgroup,
	main, menu, nav, section, summary {
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
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
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

.controls input[type=text], .controls input[type=email], .controls input[type=number],
	.controls input[type=date], .controls input[type=tel], .controls textarea,
	.controls button, .controls select {
	padding: 12px;
	font-size: 14px;
	border: 1px solid #c6c6c6;
	width: 100%;
	margin-bottom: 18px;
	color: #888;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
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
	.controls input[type=email]:focus, .controls input[type=email]:hover,
	.controls input[type=number]:focus, .controls input[type=number]:hover,
	.controls input[type=date]:focus, .controls input[type=date]:hover,
	.controls input[type=tel]:focus, .controls input[type=tel]:hover,
	.controls textarea:focus, .controls textarea:hover, .controls button:focus,
	.controls button:hover, .controls select:focus, .controls select:hover
	{
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

@media ( max-width : 760px) {
	.col-1-4-sm, .col-1-3, .col-2-3 {
		width: 100%;
	}
	[class*=col-] {
		padding-right: 0px;
	}
}

.col-1-8 {
	width: 12.5%;
}

.formall {
	padding: 220px;
}

.pltitle {
	text-align: center;
	color: #333;
	padding-top: 30px;
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
}

div.container {
	padding-top: 150px;
}

.btn-w {
	cursor: pointer;
	background-color: #f7f7f7;
	border: 1px solid #937062;
	color: #937062;
	padding: 11px 0;
	width: 100px;
	font-size: small;
}

.btn-b {
	cursor: pointer;
	background-color: #937062;
	border: none;
	color: #fff;
	padding: 12px 0;
	width: 100px;
	font-size: small;
}
</style>
<script type="text/javascript">
	
    $(document).ready(function() {
    	
    	var user = $('#user').val();
    	
    	
    	
    	 $('#summernote').summernote({
    	        placeholder: '?????? ????????????.',
    	        tabsize: 2,
    	        height: 500,
    	        lang : 'ko-KR',
    	        maximumImageFileSize : 20 * 1024 * 1024,
    	  	  // ???????? ???? ???? (input???? autofocus???? ?????????? ??????.)
    	  
    	  	  ///*
    	  	  toolbar: [
    	  		    // ???? ????
    	  		    ['fontname', ['fontname']],
    	  		    // ???? ???? ????
    	  		    ['fontsize', ['fontsize']],
    	  		    // ????, ????????, ????,???? ??, ??????????
    	  		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
    	  		    // ??????
    	  		    ['color', ['forecolor','color']],
    	  		    // ????????
    	  		    ['table', ['table']],
    	  		    // ?????? ????, ??????????, ????????
    	  		    ['para', ['ul', 'ol', 'paragraph']],
    	  		    // ??????
    	  		    ['height', ['height']],
    	  		    // ????????, ??????????, ??????????
    	  		    ['insert',['picture','link','video']],
    	  		    // ????????, ????????????, ??????
    	  		    ['view', ['codeview','fullscreen', 'help']]
    	  		  ],
    	  		  // ?????? ????
    	  		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','???? ????','????','??????','????','??????','??????'],
    	  		 // ?????? ??????????
    	  		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
    	  		//*/
    	  		callbacks: {	//?????? ???????? ????
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
		var startDate = $("input[name='aplstarTime']").val();
		var endDate = $("input[name='aplendTime']").val();
		var startTime = $("input[name='startTime']").val();
		var endTime = $("input[name='endTime']").val();
		var cookRegdate = $("input[name='cookRegdate']").val();
		var aplstarTime = $("input[name='aplstarTime']").val();
		var aplstarTime = $("input[name='aplendTime']").val();

		
		
		
		var cookStock = $("input[name='cookStock']").val();
		var cookRecruit = $("input[name='cookRecruit']").val();
	
		if (cookStock != cookRecruit) {
			alert("?????????????? ?????????? ????????????");
			return;
		}


		if (cookName == null || cookName.length < 1) {
			alert("?????????????? ?????? ?????????? ??????.");
			return;
		}
		if (cookBrief == null || cookBrief.length < 1) {
			alert("???????????????????? ?????? ?????????? ??????.");
			return;
		}
	
	
		if (cookStock == null || cookStock.length < 1) {
			alert("?????????????????? ?????? ?????????? ??????.");
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
			alert("?????????????? ???? ?????? ?????????? ??????.")
		} else if(dateString+1 > endDate) {
			alert("?????????????? ???? ?????? ?????????? ??????.")
		} else if (startDate > endDate ) {
			alert("?????????????? ???????????? ?????? ?????????? ??????.")
		}		
	}
	

	
	
	 $(function() {
			
			 $( "button:contains('????')" ).on("click" , function() {
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
.pltitle {
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


		<h3 class="pltitle">| ?????????? ???? |</h3>
		<br>
		<br>


		<form class="form-horizontal" enctype="multipart/form-data">

			<div class="form-group">
				<label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="cookName" name="cookName" placeholder="????????????">

				</div>

			</div>

			<div class="form-group">
				<label for="cookBrief" class="col-sm-offset-1 col-sm-3 control-label">??????????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="cookBrief" name="cookBrief" placeholder="??????????????????">
				</div>
			</div>

			<div class="form-group">
				<label for="cookTheme" class="col-sm-offset-1 col-sm-3 control-label">??????????????</label>
				<div class="col-sm-4">
					<select class="form-control" name="cookTheme" id="cookTheme">
						<option value="KO" selected="selected">????</option>
						<option value="JA">????</option>
						<option value="AM">????</option>
						<option value="CH">????</option>
						<option value="DE">????</option>

					</select>

				</div>

			</div>



			<div class="form-group">
				<label for="cookStock" class="col-sm-offset-1 col-sm-3 control-label">????????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="cookStock" name="cookStock" placeholder="????????????">
				</div>
			</div>

			<div class="form-group">
				<label for="cookRecruit" class="col-sm-offset-1 col-sm-3 control-label">??????????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="cookRecruit" name="cookRecruit" placeholder="??????????????????">
				</div>
			</div>

			<div class="form-group">
				<label for="text" class="col-sm-offset-1 col-sm-3 control-label">????????</label>
				<div class="col-sm-2">
					<input type="DATE" class="form-control" id="aplstarTime" name="aplstarTime" placeholder="????????????">
				</div>

				<div class="col-sm-2">
					<input type="DATE" class="form-control" id="aplendTime" name="aplendTime" placeholder="????????????">
				</div>
			</div>



			<div class="form-group">
				<label for="text" class="col-sm-offset-1 col-sm-3 control-label">????????</label>
				<div class="col-sm-2">
					<input type="TIME" class="form-control" id="startTime" name="startTime" placeholder="????????????">
				</div>

				<div class="col-sm-2">
					<input type="TIME" class="form-control" id="endTime" name="endTime" placeholder="????????????">
				</div>
			</div>





			<div class="form-group">
				<label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">??????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="cookPrice" name="cookPrice" placeholder="??????????????">
				</div>
			</div>

			<div class="form-group">
				<label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">????????????????</label>
				<div class="col-sm-4">
					<input multiple="multiple" type="file" id="uploadfile" name="uploadfile">

				</div>
			</div>


			<div class="form-group">
				<label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">????????????????</label>
				<div class="col-sm-4">
					<select class="form-control" name="cookDifficuty" id="cookDifficuty">
						<option value="1" selected="selected">????</option>
						<option value="2">????</option>
						<option value="3">????</option>


					</select>

				</div>
			</div>

			<div class="form-group">
				<label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">??????????????</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="cookLocation" name="cookLocation" placeholder="??????????????"> <input type="button" onclick="sample5_execDaumPostcode()" value="???? ????"><br>
					<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>

					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
					<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bdc66313a731d6cd370ddce26735db6a&libraries=services"></script>
					<script>
    var mapContainer = document.getElementById('map'), // ?????? ?????? div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // ?????? ????????
            level: 5 // ?????? ???? ????
        };

    //?????? ???? ????
    var map = new daum.maps.Map(mapContainer, mapOption);
    //????-???? ???? ?????? ????
    var geocoder = new daum.maps.services.Geocoder();
    //?????? ???? ????
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // ???? ???? ????

                // ???? ?????? ???? ?????? ??????.
                document.getElementById("cookLocation").value = addr;
                // ?????? ???? ?????? ????
                geocoder.addressSearch(data.address, function(results, status) {
                    // ?????????? ?????? ??????????
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //?????? ?????? ???? ????

                        // ???? ?????? ???? ?????? ??????
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // ?????? ????????.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // ???? ?????? ????????.
                        map.setCenter(coords);
                        // ?????? ?????????? ???? ?????? ??????.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>

				</div>
			</div>



			<input type="hidden" id="userId" value="${user.userId }" />
			<div class="form-group">
				<label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">??????????????</label>
				<div class="col-sm-4">${user.userNickname}</div>
			</div>


			<div class="form-group">
				<label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">??????????????</label>
				<div class="col-sm-4">${user.userId}</div>
			</div>


			<div class="form-group">

				<textarea class="summernote" id="summernote" name="cookContent"></textarea>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">


					<button type="button" class="btn-b">????</button>

				</div>
			</div>
		</form>


	</div>


</body>

</html>