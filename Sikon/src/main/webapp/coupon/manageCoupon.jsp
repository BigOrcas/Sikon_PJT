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
	
	<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.js"></script>
	<script src="resources/js/plugin/datepicker/bootstrap-datepicker.ko.min.js"></script>
	
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
		body{
			padding-top : 50px;
			font-family: 'Nanum Myeongjo', serif;
		}
			
		h1.text-center {
			font-family: 'Nanum Myeongjo', serif;
		}
	
		div.form-group{
			font-family: 'Nanum Myeongjo', serif;
		}
      		
		.tabTitle li {
		  list-style: none;
		  float: left;
		  width: 100px;
		  padding: 10px 15px;
		  cursor: pointer;
		  text-align: center;
		  border: 1px solid #bebebe;
		}
		
		.tabTitle li.on {
		  background-color: #FAEBD7;
		  font-weight: bold;
		}
		
		.tabContent {
		  clear: both;
		  border: 1px solid #dedede;
		}
		
		.tabContent div {
		  display: none;
		  text-align: center;
		}
		
		.tabContent div.on {
		  display: block;
		}
		
		.buttonDiv{
        	display:flex;
        	flex-direction: row-reverse;        	
        }
        
        .buttonDiv button{
        	margin-right:10px;
        }
        
        #controlWidth {
        	margin-left:-40px;
        }
        
        .table{
        	margin-top:65px;
        }

    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/coupon/manageCoupon").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetList(1);
			});
		 });

		
		$(document).ready(function() {
			
			$('.tabTitle li a').on('click', function(e) {
		        e.preventDefault();
		    
		        var $tablink = $(".tabTitle li").click(function() {
				    var idx = $(this).index();
				    $(".tabTitle li").removeClass("on");
				    $(".tabTitle li").eq(idx).addClass("on");
				    $(".tabContent > div").hide();
				    $(".tabContent > div").eq(idx).show();
				  })

		        //�Ķ���� Ȯ��
		        urlParam =  location.search.substr(location.search.indexOf("?") + 1);
		        if(urlParam != ''){
		            urlParam = '?' + urlParam;
		        }

		        //�Ķ���� ����
		        getNewUrl('tabName', urlParam); //(���桤�߰��� �Ķ���� �̸�, ���� �Ķ����)
		        function getNewUrl(paramName, oldUrl) {
		            var newUrl;
		            var urlChk = new RegExp('[?&]'+paramName+'\\s*=');
		            var urlChk2 = new RegExp('(?:([?&])'+paramName+'\\s*=[^?&]*)')
		            
		            
		            if (urlChk.test(oldUrl)) { //�ش� �Ķ���Ͱ� ���� ��
		                newUrl = oldUrl.replace(urlChk2, "$1"+paramName+"=" + activeTab.substr(1));
		            } else if (/\?/.test(oldUrl)) { //�ش� �Ķ���Ͱ� ���� �ٸ� �Ķ���Ͱ� ���� ��
		                newUrl = oldUrl + "&"+paramName+"=" + activeTab.substr(1);
		            } else { //�Ķ���Ͱ� ���� ��
		                newUrl = oldUrl + "?"+paramName+"=" + activeTab.substr(1);
		            }

		            history.pushState(null, null, newUrl);
		        }
		    });

		    //�Ķ���� �� �˻�
		    function getParameter(name) {
		        name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		        var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		            results = regex.exec(location.search);
		        return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		    }

		    var getParam = getParameter('tabName'); //������ �� �Ķ����
		    var loadChk = getParameter('loadChk'); //ù �ε� ���� üũ
		    
		    if(getParam != ''){ //�Ķ���� ���� ������ �Ķ���� �� �������� �Ǹ޴� ����
		        $('.tabTitle li a[href="#'+getParam+'"]').parent().addClass('on'); 
		        $('.tabTitle li a[href="#'+getParam+'"]').trigger('click');

		        if(loadChk == 'on'){ //ó�� �ε�Ǿ����� ��ũ�� �̵�
		            //�� ��ġ�� �̵�
		            var tabTop = $('.tabTitle').offset().top;
		            $(window).scrollTop(tabTop - 100);

		            //�Ķ���� Ȯ��
		            var urlParam =  location.search.substr(location.search.indexOf("?") + 1);
		            if(urlParam != ''){
		                urlParam = '?' + urlParam;
		            }
		            
		            //loadChk �Ķ���� �� ����
		            loadChange('loadChk', urlParam);
		            function loadChange(paramName, oldUrl) {
		                var newUrl;
		                var urlChk = new RegExp('[?&]'+paramName+'\\s*=');
		                var urlChk2 = new RegExp('(?:([?&])'+paramName+'\\s*=[^?&]*)')
		                newUrl = oldUrl.replace(urlChk2, "$1"+paramName+"=off");
		                history.pushState(null, null, newUrl);
		            }
		        }
		    }else{ //�Ķ���� ���� ������ active Ŭ���� �������� �Ǹ޴� ����
		        var activeChk = 0;
		        $('.tabTitle li').each(function(i) { 
		            if ($(this).hasClass('on')){
		                $(this).addClass('on'); 
		                $(this).find('a').trigger('click');
		                activeChk ++
		            }
		        });

		        //active ���� ������ �� ù �Ǹ޴� ����
		        if(activeChk == 0){
		            $('.tabTitle li:first-child a').trigger('click');
		        }
		    }

		    //�ڷΰ��� �Ǹ޴� ����
		    window.onpopstate = function(event) {
		        //�ʱ�ȭ
		        $('.tabTitle li').removeClass('on');
		        $('.tabTitle').hide(); 
		        var getParam2 = getParameter('tabName'); //������ �� �Ķ����
		        
		        //�Ǹ޴� ����
		        if(getParam2 != ''){
		            $('.tabTitle li a[href="#'+getParam2+'"]').parent().addClass('on');
		            $('#'+getParam2).show()
		        }else{
		            $('.tabTitle li:first-child').addClass('on');
		            $('.tabTitle:first-of-type').show();
		        }
		    };
		  
		});
			
			
		 $(function() {
				
			$("#addCoupon").on("click" , function() {
						
				self.location = "/coupon/addCoupon.jsp";
			});
		});
		 
		 $(function() {
				
				$("#issueCoupon").on("click" , function() {
							
					self.location = "/coupon/issueCouponView";
				});
			});
		 		 
		 $(function() {
				
				$("button.delete").on("click" , function() {
					
					var checkCount = $("input[name='deleteCheck']:checked").length;
				    var array = new Array();
					$("input[name='deleteCheck']:checked").each(function() {
						array.push($(this).attr('id'));
				    });
					
					//Debug..
					if(checkCount != 0) {
						alert("������ �����Ͻðڽ��ϱ�?")
						self.location = "/coupon/deleteCoupon?checkCount="+checkCount+"&checkList="+array;
					} else {
						alert("���õ� ������ �����ϴ�.")						
					}
				});
			});
	
		 
		 $(function() {
				
				$("button.retrieve").on("click" , function() {
					var checkCount = $("input[name='retrieveCheck']:checked").length;
				    var array = new Array();
					$("input[name='retrieveCheck']:checked").each(function() {
						array.push($(this).attr('id'));
				    });
					
					//Debug..
					if(checkCount != 0) {
						alert("������ ȸ���Ͻðڽ��ϱ�?")
						self.location = "/coupon/updateIssueStatus?checkCount="+checkCount+"&checkList="+array;
					} else {
						alert("���õ� ������ �����ϴ�.")						
					}
				});
			});
			
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	<div class="container">
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="page-header text-info">
		<h3 style="color:#bc8f8f">��������</h3>
	</div>
	
	<form class="form-inline" name="detailForm">
	
	<div class="tab">
	
    <ul class="tabTitle" id="myTab">
      <li class="on" id="controlWidth"><a href="#addTab" style="color:gray">����</a></li>
      <li><a href="#issueTab" style="color:gray">�߱�</a></li>
    </ul>
    
    <div class="tabContent">
    
      <div class="on" id="addTab">
      	    
	    <input type="hidden" id="issueStatus" name="issueStatus" value="��밡��"/>
	    
		 <p class="text-primary" align="left" style="color:gray">
		 <br>
		 &nbsp;&nbsp; ��ü  ${couponPage.totalCount} �Ǽ�, ���� ${couponPage.currentPage}  ������
		 </p>
		
		<button type="button" class="btn btn-primary delete" style="float: right;  margin-right: 10px;" >��&nbsp;��</button>
		<button type="button" class="btn btn-primary" id="addCoupon" style="float: right; margin-right: 10px;">�� &nbsp;��</button>
				
      <table class="table table-hover table-striped">
		
        <thead>
          <tr>
           	<th align="center"></th>
            <th align="center">������ȣ</th>
            <th align="left" >�����̸�</th>
            <th align="left">������</th>
            <th align="left">���αݾ�</th>
          </tr>  
        </thead>
       
		<tbody>
			
		  <c:if test="${!empty couponList}">
		  <c:set var="i" value="0" />
		  <c:forEach var="coupon" items="${couponList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="left"><input type="checkbox" name="deleteCheck" id="${coupon.couponNo}"></td>
			  <td align="left">${coupon.couponNo}</td> 
			  <td align="left">${coupon.couponName}</td>
			  <td align="left">${coupon.discountRate}</td>
			  <td align="left">${coupon.discountValue}</td>
			</tr>
          </c:forEach>
          </c:if>
               
        </tbody>
      
      </table>
      
      <c:if test="${empty couponList}">
      	<h3>������ ������ �����ϴ�.</h3>
      	<br>
      </c:if>
      
       </div>

      <div id="issueTab">
                
		<p class="text-primary" align="left" style="color:gray">
		<br>
		&nbsp;&nbsp; ��ü  ${issuePage.totalCount} �Ǽ�, ���� ${issuePage.currentPage}  ������
		</p>
		
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		
		<button type="button" class="btn btn-primary retrieve" style="float: right; margin-right: 10px;">ȸ &nbsp;��</button>
		<button type="button" class="btn btn-primary" id="issueCoupon" style="float: right;  margin-right: 10px;" >�� &nbsp;��</button>
	
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center"></th>
            <th align="center">�߱޹�ȣ</th>
            <th align="left" >�߱�����</th>
            <th align="left">�������� ȸ��</th>
            <th align="left">�߱޳�¥</th>
            <th align="left">���ᳯ¥</th>
            <th align="left">�������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:if test="${!empty issueList}">
		  <c:set var="i" value="0" />
		  <c:forEach var="coupon" items="${issueList}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <c:if test = "${coupon.issueStatus != 'ȸ��'}">
			  <td align="left"><input type="checkbox" name="retrieveCheck" id="${coupon.issueNo}"></td>
			  </c:if>
			  <c:if test = "${coupon.issueStatus == 'ȸ��'}">
			  <td align="left"></td>
			  </c:if>
			  <td align="left">${coupon.issueNo}</td>
			  <td align="left">${coupon.couponName}</td>
			  <td align="left">${coupon.couponUser.userId}</td> 
			  <td align="left">${coupon.startDate}</td>
			  <td align="left">${coupon.endDate}</td>
			  <td align="left">${coupon.issueStatus}</td>
			</tr>
          </c:forEach>
          </c:if> 
       		
        </tbody>
      
      </table>
      
      <c:if test="${empty issueList}">
      	<h3>�߱޵� ������ �����ϴ�.</h3>
      	<br>
      </c:if> 
      
 </div>
	
      </div>
      
    </div>
    
  </div>
	
	<jsp:include page="../common/pageNavigator_coupon.jsp"/>
	
	</form>
	
</body>

</html>