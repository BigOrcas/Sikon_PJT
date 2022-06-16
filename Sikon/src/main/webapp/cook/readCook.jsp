<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ǰ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">


<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">



<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 30px;
        }
    </style>
	<script type="text/javascript">

//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
$(function() {
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
	 $( "button:contains('Ȯ��')" ).on("click" , function() {
		 
		 
		 self.location = "/cook/listCook.jsp?menu=search"
	});
	
	 $( "button:contains('�߰����')" ).on("click" , function() {

		 self.location = "/cook/addCook.jsp"
		 
		});
});

</script>
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-default text-center">��ŷŬ���� ���Ȯ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		 <input type="hidden" name="cookNo" value="${cook.cookNo}"/>
		 <input type="hidden" name="menu"  value="${param.menu}">
		      
		  <div class="form-group">
		    <label for="cookName" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������</label>
		    <div class="col-sm-4">
		    ${cook.cookName}
		      
		    </div>
		  
		  </div>
		  
		   <div class="form-group">
		    <label for="cookStock" class="col-sm-offset-1 col-sm-3 control-label">�����ο����</label>
		    <div class="col-sm-4">
		      ${cook.cookStock}"
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="cookRecruit" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ���������ο�</label>
		    <div class="col-sm-4">
		      ${cook.cookRecruit}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookBrief" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ������������</label>
		    <div class="col-sm-4">
		     ${cook.cookBrief}
		    </div>
		  </div>
		  

		  <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">�����Ⱓ</label>
		    <div class="col-sm-2">
		   ${cook.aplstarTime}
		    </div>
		    
		     <div class="col-sm-2">
		    ${cook.aplendTime}
		    </div>
		  </div>
		  		  
		    <div class="form-group">
		    <label for="text" class="col-sm-offset-1 col-sm-3 control-label">�����ð�</label>
		    <div class="col-sm-2">
		      ${cook.startTime}
		    </div>
		    
		      <div class="col-sm-2">
		      ${cook.endTime}
		    </div>
		  </div>
		  
		  

		  
		  
		  
		  <div class="form-group">
		    <label for="cookPrice" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ��������</label>
		    <div class="col-sm-4">
		    ${cook.cookPrice}
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadfile" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����̹���</label>
		    <div class="col-sm-4">
		   
		    	
		<c:choose>	    
		
		<c:when test="${cook.cookFilename.contains('/')}">
		
			<td class="ct_write01">
		
				<c:choose>
				<c:when test="${cook.cookFilename.contains('mp4')}">
					<c:forEach var="name" items="${cook.cookFilename.split('/')}">
						<video width="400" height="300" controls autoplay src="/resources/images/uploadFiles/${name}" type="video/mp4"></video>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach var="name" items="${cook.cookFilename.split('/')}">
						<img src="/resources/images/uploadFiles/${name}" width="300" height="300" align="absmiddle"/>
					</c:forEach>
				</c:otherwise>
				</c:choose>		
		
			</td>
		
		</c:when>
		
		<c:otherwise>
			<img src="/resources/images/uploadFiles/${cook.cookFilename}" width="300" height="300" align="absmiddle"/>
		</c:otherwise>
		</c:choose>
		
	

		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="cookTheme" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�����׸�</label>
		    <div class="col-sm-4">
			<c:if test = "${cook.cookTheme =='KO'}">
			�ѽ� 
			</c:if>
			<c:if test = "${cook.cookTheme == 'JA'}">
			�Ͻ�
			</c:if>
			<c:if test = "${cook.cookTheme == 'AM'}">
			���
			</c:if>
			<c:if test = "${cook.cookTheme == 'CH'}">
			�߽�
			</c:if>
			<c:if test = "${cook.cookTheme == 'DE'}">
			����
			</c:if>						
		    </div>
		  
		  </div>
		  <div class="form-group">
		    <label for="cookDifficuty" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������̵�</label>
		    <div class="col-sm-4">
		    <c:if test = "${cook.cookDifficuty =='1'}">
			�ʱ�
			</c:if>
			<c:if test = "${cook.cookDifficuty == '2'}">
			�߱�
			</c:if>
			<c:if test = "${cook.cookDifficuty == '3'}">
			���
			</c:if>


					
		    </div>
		  
		  </div>		  
		  
		    <div class="form-group">
		    <label for="cookLocation" class="col-sm-offset-1 col-sm-3 control-label">��ŷŬ�������</label>
		    <div class="col-sm-4">
		      ${cook.cookLocation}
		      
		    </div>
    
<br/><br/>
<br/><br/>
 	<div class="form-group">
		<div class="col-xs-10 col-md-10 text-center">
			<div><strong>${cook.cookContent}</strong></div>
		</div>
	   </div>	  
		  		  
		  </div>
		  
	<div class="row">
	  		<div class="col-md-12 text-center ">
	  	
	  		
	  			<button type="button" class="btn btn-default">Ȯ��</button>
	  		
			
			
		
		<button type="button" class="btn btn-default">�߰����</button>
				
				
				
	  		</div>
		</div>
		
	
		</form>
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>