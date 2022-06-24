<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
	<!-- Bootstrap Dropdown Hover CSS -->
    <link href="/resources/css/animate.min.css" rel="stylesheet">
    <link href="/resources/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/resources/javascript/bootstrap-dropdownhover.min.js"></script>
   
    <!-- jQuery UI toolTip ��� CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">
	
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

body {
	padding-top: 50px;
}

.container {
	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
	padding-top: 170px;
}

table {
	margin-top: 45px;
}

.add {
	cursor: pointer;
	background-color: #937062;
	border: none;
	color: #fff;
	padding: 5px 0;
	width: 90px;
}

.add:hover {
	background-color: #937062d4;
}

.delete {
	cursor: pointer;
	background-color: #f7f7f7;
	border: 1px solid #937062;
	color: #937062;
	padding: 4px 0;
	width: 90px;
}

.delete:hover {
	background-color: #e7e2e2;
}

.pltitle {
	padding-top: 35PX;
	text-align: center;
}

.row{
    margin-left: -350px;
    margin-right:0
}
/* ��Ʈ��� search */
.search{
font-family:FontAwesome;
border: none;
background-color: #f7f7f7;
}
</style>
    
    
<script type="text/javascript">



//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
function fncGetList(currentPage) {
	$("#currentPage").val(currentPage);
	
	//alert($("#orderCondition").val());
	$("form").attr("method" , "POST").attr("action" , "/recipe/manageRecipe").submit();
}

	
 $(function() {
	 
	 $(".search").on("click", function() {
			fncGetList(1);

		});
	 
	 
	 $(document).on('click', '.delete', function(){
	 var checkCount = $("input[name='ckBookmark']:checked").length;

	    var array = new Array();
	    
		$("input[name='ckBookmark']:checked").each(function() {
			array.push(Number($(this).attr('id')));
	    });
		
		if(checkCount != 0) {
			alert(checkCount+"���� �����Ǹ� �����Ͻðڽ��ϱ�?")
		}
		console.log(array);
		console.log(checkCount);
		self.location = "/recipe/deleteRecipe?menu=manage&recipeList="+array;

	});
});
 
	$(document).on('click', '.getRecipe', function(){
		console.log($(this).attr("value"));
		self.location ="/recipe/getRecipe?recipeNo="+$(this).attr("value")
		});
	
	$(document).on('click', '.getUser', function(){
		console.log($(this).attr("value"));
		self.location ="/user/getUser?userId="+$(this).attr("value")
		});
	
	$(document).on('click', '.updateRecipe', function(){
		console.log($(this).attr("value"));
		self.location ="/recipe/updateRecipe?recipeNo="+$(this).attr("value")
		});
	
	$(document).on('click', '.add', function(){
		self.location ="/recipe/addRecipe.jsp";
		});
 
	

</script>

</head>

<body>
	

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container listsale">
	
			<br>
		<h3 class="pltitle"  style="color:#333;font-family: 'Tiro Devanagari Sanskrit', serif;">| RECIPE LIST |</h3>
	    
	    <div>
	    
	   <form class="form-inline" name="detailForm">
	    <div class="row" style="padding-top: 60px;">
				<button type="button" class="delete" value="${recipe.recipeNo}" style="float: right; margin-right: 10px;">��&nbsp;��</button>
				<button type="button" class="add" id="addNotice" style="float: right;  margin-right: 10px;" >��&nbsp;��</button>
		</div>
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<br/>
		<p style="float: left;padding-top: 30px;color: #424242">&emsp;��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������</p>
    	
    	
    	 <table style="width: 100%;">
        <tr>
        	<td style="text-align: right;">
             <div class="row height">
              <div class="col-md-6">
					<div class="form-group">
					 
						<select class="form-control" name="searchCondition" id="searchCondition">
						<option value="3"
								${!empty search.searchCondition && search.searchCondition==3 ? "selected" : ""}>�����ǹ�ȣ</option>
							<option value="1"
								${!empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>�����Ǹ�</option>
							<option value="2"
								${!empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>�ۼ��ڸ�</option>
						</select>

					</div>

                  <input type="text" class="form-control form-input" id="searchKeyword" name="searchKeyword" placeholder="�˻�� �Է��ϼ���." value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >&nbsp;
                  <input type="submit" class="search"  value="&#xf002">
                </div>
					</div>
            
            
          </td>
          
	     	</tr>
	     </table>
    	
    	<table class="table table-hover table-striped" >
      
		<thead>
			<tr>
	          	<th align="center" style="text-align:center;font-size: 14px;"><input type="checkbox" ></th>
	            <th align="center"  style="text-align:center;font-size: 14px;">�����ǹ�ȣ</th>
	            <th align="left"  style="text-align:center;font-size: 14px;">�����Ǹ�</th>
	            <th align="left"  style="text-align:center;font-size: 14px;">�ۼ���¥</th>
	            <th align="left" style="text-align:center;font-size: 14px;">�ۼ��ڴг���</th>
			</tr>
		</thead>
       
		<tbody>
		
		<c:forEach var="recipe" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
				<td align="left"><input type="checkbox" name="ckBookmark" id="${recipe.recipeNo}"/></td>
			
				<td align="left" class="updateRecipe" value="${recipe.recipeNo }"> ${recipe.recipeNo}</td>
	
				<td align="left" class="getRecipe" value="${recipe.recipeNo }" style="cursor:pointer;">${recipe.recipeName}</td>
				<td align="left"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${recipe.recipeRegDate}" /> </td>
				<td align="left" class="getUser" value="${user.userId }" style="color: #708090"> ${recipe.writer.userNickname} </td>
		</tr>
		</c:forEach>
        
        </tbody>
      </table>
	  
	  </form>
	</div>
	</div>

	<jsp:include page="../common/pageNavigator_new.jsp"/>->
	
</body>

</html>