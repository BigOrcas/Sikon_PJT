<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
 <!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Open+Sans:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Tiro+Devanagari+Sanskrit:ital@1&display=swap" rel="stylesheet">
<style>
#get{
	font-size: 14px;
	text-decoration: underline;
}

.container {
	padding-top: 100px;
} 
</style>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
<style>
body{
		font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
}
.listsale{
	padding-top : 170px;
	padding-bottom: 200px;
}
.subtitle th{
	text-align:center;
}

.subtitle{
	border-bottom: 1px solid #937062;
	border-top: 2px solid #937062;
}

 div.row{
		font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
}
 
table {
		font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
}    
th{
	height: 50px;
	font-size: 15px
}
td{
	height: 50px;
	border-bottom:  1px solid #D7D7D7;
}
.status{
	font-weight: bold;
}
.cancel{
	color: #898989;
}
h3{
		font-family: "Noto Sans KR", Helvetica, "Helvetica Neue", Arial, "sans-serif";
	color: #5a443b;
}
.pltitle{
	padding-top: 35PX;
	text-align: center;
}
</style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	
	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage)
		
		$("form").attr("method" , "POST").attr("action" , "/apply/listSale").submit();
		
	}
	
	$(function() {	
		
	

		
		
		$( "td.divy" ).on("click" , function() {
			console.log('�������̽�');
			var message1 = $(this).attr("value1");
			console.log(message1);
			var message2 = $(this).attr("value2");
			console.log(message2);
			
			self.location ="/apply/updateApplyStatus?menu=search&applyNo="+message1+"&applyStatus="+message2;
		});
		
		
		
		$( "td.arrival" ).on("click" , function() {
			console.log('�����Ϸ��Ͻ�');
			var message1 = $(this).attr("value1");
			console.log(message1);
			var message2 = $(this).attr("value2");
			console.log(message2);
			
			self.location ="/apply/updateApplyStatus?menu=search&applyNo="+message1+"&applyStatus="+message2;
		});
		

		$("td.apply").on("click", function() {

			var applyNo = $(this).attr("value");

			self.location = "/apply/getApply?applyNo=" + applyNo;
		});	
		
		
		
		
	});	
	
	  $(document).ready(function(){ 
			 var totalprice = 0;

			 var list = [];
			
		   		<c:forEach var="apply" items="${list}" >
		   		totalprice += (Number(${apply.classCook.cookPrice})*Number(${apply.cookStatus}));
		   		</c:forEach>
		
			 console.log(totalprice);
			
			 $("#totalprice").val(totalprice); 
		});	
/*
 
	    $(document).ready(function(){ 
	  		getGraph();
	  		
	  	});
		  
		   function getGraph(){
		       	  let timeList = [];
		    	  let posList = [];

		   
		    	  $.ajax({
		    		  url : "/apply/json/saleCount",
		    		  type:"get",
		    		  data:{ total : "${apply.total}", check_date : "${apply.checkDate}"},
		    		  dataType:"json",
		    		  success:function(data){
		    			   console.log(data[0].cook_price);
		    			  // �׷����� ��Ÿ�� �ڷ� ����Ʈ�� ���
		    			  for (let i = 0; i<data.length;i++){    				  
								timeList.push(data[i].check_date);    				  
								posList.push(data[i].total);    				  
		    			  }
		    			  console.log(timeList);
		    			   console.log(posList);  	
						  // �׷���
		    			  new Chart(document.getElementById("line-chart"), {
		    		    	  type: 'line',
		    		    	  data: {
		    		    	    labels: timeList, // X�� 
		    		    	    datasets: [{ 
		    		    	        data: posList, // ��
		    		    	        label: "${apply.checkDate}",
		    		    	        borderColor: "#3e95cd",
		    		    	        fill: false
		    		    	      }
		    		    	    ]
		    		    	  },
		    		    	  options: {
		    		    	    title: {
		    		    	      display: true,
		    		    	      text: '����'
		    		    	    }
		    		    	  }
		    		    	}); //�׷���
		    		  },
		    		  error:function(){
		    			  alert("����!");
		    		  }  
			     		  
		    	  }) // ajax	  
		      } // getGraph
 	  */
			 
</script>	
	


	</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container listsale">
	
	<div class="wrapper row3">
		  <section class="hoc container clear"> 
		    <div class="center btmspace-50">
		    <br/>
		   <h3 class="pltitle"  style="color:#333;font-family: 'Tiro Devanagari Sanskrit', serif;">| SALES LIST |</h3>
		      <p align="right">��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������</p>
		    </div>
		    		  
		    
		  
		    
	
    </section>
  	</div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	   <div class="row">
	    

		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
		
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				   	<input type="hidden" name="cookStatus" value="${apply.cookStatus}"/>	
				  
				</form>
	    	</div>
	    	
		</div>
		
      <!--  table Start /////////////////////////////////////-->
       <table style="width: 100%">
      
        <thead>
          <tr class="subtitle">
             <th align="center">No</th>
            <th align="center">��û��¥</th>
            <th align="center">��ŷŬ������</th>
            <th align="center">������Ȳ</th>           
            <th align="center">����ȸ��</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="apply" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center" id="get" class="apply" value="${apply.applyNo}">${ i }</td>		
			    <td align="center" value="${apply.checkDate}" name="checkDate" id="checkDate">${apply.checkDate}</td>
			  <td align="center" class="get" value1="${apply.classCook.cookNo }" value2="${param.menu}" >${apply.classCook.cookName }<input type="hidden" value="${apply.applyNo}">
			 	 </td>

			  
			  <c:choose>
					<c:when test="${apply.applyStatus.equals('000') }">
						<td align="center" > ��û��� </td>
					</c:when>
					<c:when test="${apply.applyStatus.equals('100') }">
						<td align="center" class="divy" value1="${apply.applyNo }" value2="${apply.applyStatus}">�������Ͻ� �����ּ���</td>			
					</c:when>
					<c:when test="${apply.applyStatus.equals('200') }">
						<td align="center" style="color:#2990e9" class="arrival status"  value1="${apply.applyNo }" value2="${apply.applyStatus}">�� �� ��</td>
						
					</c:when>
							<c:when test="${apply.applyStatus.equals('300') }">
								
								<td align="center" class="status"> �����Ϸ�</td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>				
			
				</c:choose>
			
			  	<td align="center" class="user" value="${apply.applier.userId}">${apply.applier.userId}</td>
				

				</tr>
          </c:forEach>

	      	       
        </tbody>
        
  	      <div class="sale" align="right">
  	      
	        �� ���� : <input type="text" id="totalprice" value="" name ="totalprice"style="border:none;width:100px;text-align:right;" min="0" readonly/> ��
	      </div>	    
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 </div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>