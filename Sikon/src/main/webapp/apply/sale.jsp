<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
     
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
			   $(document).ready(function(){ 
		    		getGraph();
		    	});
		      
		      function getGraph(){
		       	  let timeList = [];
		    	  let posList = [];
		    	  
		    	  $.ajax({
		    		  url:"/apply/json/sale", 
		    		  type:"get",
		    		  data:{applier_id:"${applier.userId}", PAYMENT_OPTION:"1"},
		    		  dataType:"json",
		    		  success:function(data){
		    			  // console.log(data[0].pos_count);
		    			  // �׷����� ��Ÿ�� �ڷ� ����Ʈ�� ���
		    			  for (let i = 0; i<data.length;i++){    				  
								timeList.push(data[i].check_date);    				  
								posList.push(data[i].cook_status);    				  
		    			  }
		    			  // console.log(timeList);
		    			  // console.log(posList);  	
						  // �׷���
		    			  new Chart(document.getElementById("line-chart"), {
		    		    	  type: 'line',
		    		    	  data: {
		    		    	    labels: timeList, // X�� 
		    		    	    datasets: [{ 
		    		    	        data: posList, // ��
		    		    	        label: "�źϸ�",
		    		    	        borderColor: "#3e95cd",
		    		    	        fill: false
		    		    	      }
		    		    	    ]
		    		    	  },
		    		    	  options: {
		    		    	    title: {
		    		    	      display: true,
		    		    	      text: '�ְ� �źϸ�'
		    		    	    }
		    		    	  }
		    		    	}); //�׷���
		    		  },
		    		  error:function(){
		    			  alert("����");
		    		  }  
			     		  
		    	  }) // ajax	  
		      } // getGraph
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
	
	
	

</body>
</html>