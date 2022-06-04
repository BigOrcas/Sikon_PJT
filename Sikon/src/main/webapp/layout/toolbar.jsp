<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- ToolBar Start /////////////////////////////////////-->
<header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="#">��Ź�ǿµ�</a></h1>
    </div>
    <!-- ################################################################################################ -->
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="#">RECIPE</a></li>
        <li><a class="drop" href="#">STORE</a>
          <ul>
            <li><a href="#">Level 2</a></li>
            <li><a href="#">Level 2</a></li>
            <li><a href="#">Level 2</a></li>
            <li><a href="#">Level 2</a></li>
            <li><a href="#">Level 2</a></li>
          </ul>
        </li>
        <li><a class="drop" href="#">COOKCLASS</a>
          <ul>
            <li><a href="#">Level 2</a></li>
            <li><a class="drop" href="#">Level 2 + Drop</a>
              <ul>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
                <li><a href="#">Level 3</a></li>
              </ul>
            </li>
            <li><a href="#">Level 2</a></li>
          </ul>
        </li>
        <li><a href="#">Link Text</a></li>
        <li><a href="#">Link Text</a></li>
      </ul>
    </nav>
    <!-- ################################################################################################ -->
  </header>
		<!-- ToolBar End /////////////////////////////////////-->
 	
   	
   	
   	<script type="text/javascript">
	
		//============= logout Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains(' LOGOUT')").on("click" , function() {
				$(self.location).attr("href","/user/logout");
				//self.location = "/user/logout"
			}); 
		 });
		
		//============= ȸ��������ȸ Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		 	$("a:contains('ȸ��������ȸ')").on("click" , function() {
				//$(self.location).attr("href","/user/logout");
				self.location = "/user/listUser"
			}); 
		 });
		
		//=============  ����������ȸȸ Event  ó�� =============	
	 	$( "a:contains('����������ȸ')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
		
	 	$( "a:contains(' MyPage')" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
		});
	 	
	 	//=============  ��ٱ��� Event  ó�� =============	
	 	$( "a:contains(' Cart')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/wishList/getWishlist");
		});
	 	
	 	//=============  �ǸŻ�ǰ��� Event  ó�� =============	
	 	$( "a:contains('��ǰ���')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/addProductView.jsp");
			//$(self.location).attr("href","/store/summernoteTest2.jsp");
		});
	 	
	 	//=============  �ǸŻ�ǰ���� Event  ó�� =============	
	 	$( "a:contains('��ǰ����')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=manage");
		});
	 	
	 	//=============  �ǸŸ���Ʈ��ȸ Event  ó�� =============	
	 	$( "a:contains('�ǸŸ���Ʈ��ȸ')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listSales?menu=manage");
		});
	 	
	 	//=============  �� ǰ �� �� Event  ó�� =============	
	 	$( "a:contains('��ǰ�˻�')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/product/listProduct?menu=search");
		});
	 	
	 	
	 	//=============  ����� Event  ó�� =============	
	 	$( "a:contains('�����')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/store/listStore?menu=search");
		});
	 	
	 	//=============  �����̷���ȸ Event  ó�� =============	
	 	$( "a:contains('�����̷���ȸ')" ).on("click" , function() {
	 		
			$(self.location).attr("href","/purchase/listPurchase");
		});
	 	
		
	 	//=============  �ֱ� �� ��ǰ Event  ó�� =============	
	 	$( "a:contains('�ֱ� �� ��ǰ')" ).on("click" , function() {
	 		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=400, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
	</script>  