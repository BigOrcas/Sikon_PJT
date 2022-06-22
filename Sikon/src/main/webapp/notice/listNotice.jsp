<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
    <!-- jQuery UI toolTip ��� CSS-->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
	
	body {
    	padding-top : 50px;
    }
    
    .container {
    	font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial,
		"sans-serif";
    }
       
    table {
     	margin-top:20px;
    }
       	
	h1.text-center {
		font-family: 'Nanum Myeongjo', serif;
	}
	
	div.form-group {
		font-family: 'Nanum Myeongjo', serif;
	}  

	.btn-b {
		cursor: pointer;
	    background-color: #937062;
	    border: none;
	    color: #fff;
	    padding: 12px 0;
	    width:6%;
	    height: 34px;
	    justify-content: center;
        display: flex;
        align-items: center;
	    font-size: 17px;
	    border-radius: 5px;
	    border: 1px solid #d7d7d7
	}
	
	.soo {
		padding-top : 170px;
	}
</style>
    
    
<script type="text/javascript">
	
	//�˻� & ������
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
	  	$("form").attr("method" , "POST").attr("action", "/notice/listNotice?menu=${menu}").submit();
	}

	 $(function() {
		$( "button.btn.btn-default" ).on("click" , function() {
			fncGetList(1); 
		});
	 });
	 
	 //�������� ���ȭ�� �̵�
	$(function() {
		$("#addNotice").on("click" , function() {			
			self.location = "/notice/addNotice.jsp";
		});
	});
	 
	//üũ�ڽ� ��ü����
	$(document).ready(function() {	
		
		$("#checkall").click(function(){	
			if($("#checkall").prop("checked")){
				$("input[name=noticeCheck]").prop("checked",true);
			} else {		
				$("input[name=noticeCheck]").prop("checked",false);
			}		
		})
			 
		$("input[name=noticeCheck]").click(function(){
			if($("#checkall").prop("checked")){			
				$("#checkall").prop("checked",false);
			}	
		})
	 });	
	
	 //�������� ����		
	$(function() {
		$("button.delete").on("click" , function() {
			
			var checkCount = $("input[name='noticeCheck']:checked").length;
		    var array = new Array();
				
		    $("input[name='noticeCheck']:checked").each(function() {
				array.push($(this).attr('id'));
		    });
			
			if(checkCount != 0) {
				alert("�Խù��� �����Ͻðڽ��ϱ�?")
				self.location = "/notice/deleteNotice?checkCount="+checkCount+"&checkList="+array;
			} else {
				alert("���õ� �Խù��� �����ϴ�.")	
			}
		});
	});

	//�������� ����ȭ�� �̵� 
	$(function() {
	
		$("td[name='manageNoticeTitle']").on("click", function() {
			self.location = "/notice/updateNotice?noticeNo="+$(this).find("[name='noticeNo']").val();
		});
	});	
	
	//�������� ��ȭ�� �̵�
	$(function() {
		$("td[name='searchNoticeTitle']").on("click", function() {
			self.location = "/notice/getNotice?noticeNo="+$(this).find("[name='noticeNo']").val();
		});

	});	

</script>

</head>

<body>
	

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container soo">
	
		<div class="page-header text-info">
			<c:if test = "${menu == 'manage'}">
				<h3 style="color:#937062; font-family: 'Gowun Batang', serif; font-weight:bold;">�������װ���</h3>
			</c:if>
			<c:if test = "${menu == 'search'}">
				<h3 style="color:#937062; font-family: 'Gowun Batang', serif; font-weight:bold;">�������׸��</h3>
			</c:if>
	    </div>
	    
	    <div class="row">
	    	<form class="form-inline" name="detailForm">
		    	<p class="text-primary" style="color:gray">
		    		&nbsp;&nbsp;��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
			<c:if test = "${menu == 'manage'}">
				<button type="button" class="btn-b delete" value="${notice.noticeNo}" style="float: right; margin-right: 10px;">��&nbsp;��</button>
				<button type="button" class="btn-b" id="addNotice" style="float: right;  margin-right: 10px;" >��&nbsp;��</button>
			</c:if>	
		</div>
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
    	<table class="table table-hover table-striped" >
      
		<thead>
			<tr>
	          	<c:if test = "${menu == 'manage'}">
	          	<th align="center" style="text-align:center;"><input type="checkbox" id="checkall" /></th>
	          	</c:if>
	            <th align="center"  style="text-align:center">������ȣ</th>
	            <th align="left"  style="text-align:center">��������</th>
	            <th align="left" style="text-align:center">�����ð�</th>
			</tr>
		</thead>
       
		<tbody>
		
		<c:forEach var="notice" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr class="ct_list_pop">
			<c:if test = "${menu == 'manage'}">
				<td align="left"><input type="checkbox" name="noticeCheck" id="${notice.noticeNo}"/></td>
			
				<td align="left"> ${notice.noticeNo}</td>
	
				<td align="left" name="manageNoticeTitle" id="manageNoticeTitle" style="cursor: pointer;">
				${notice.noticeTitle}
				<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
				</td>
				
				<td align="left"> ${notice.noticeDate} </td>
			</c:if>
			<c:if test = "${menu == 'search'}">
				<td align="left"> ${notice.noticeNo}</td>
				<td align="left" name="searchNoticeTitle" id="searchNoticeTitle" style="cursor: pointer;">${notice.noticeTitle}
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}"></td>
				<td align="left"> ${notice.noticeDate} </td>
			</c:if>
		</tr>
		</c:forEach>
        
        </tbody>
      </table>
	  
	  </form>
	</div>

	<jsp:include page="../common/pageNavigator_new.jsp"/>->
	
</body>

</html>