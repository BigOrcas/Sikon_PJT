<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>

<!DOCTYPE html>

<html lang="ko">

<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<style>
.leftBarNav {
    width: 170px;
    float: left;
    margin: 14px 40px 0px 200px;
  /*   font-family: Musinsa, "Apple SD Gothic Neo", "Noto Sans KR", sans-serif; */
    font-size: 14px;
    padding: 60px 10px 10px 30px;
    height: 630px;
    padding-top:130px;
}
  .leftBarNav::-webkit-scrollbar {
    width: 3px;
  }
  .leftBarNav::-webkit-scrollbar-thumb {
    background-color: #2f3542;
  }
  .leftBarNav::-webkit-scrollbar-track {
    background-color: lightgrey;
  }

.leftBarNav > h2 {
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    clip: rect(0px, 0px, 0px, 0px);
}
.leftBarNav > span {
    font-size: 16px;
    line-height: 20px;
    color: rgb(20, 170, 255);
}

.leftBarNav.on ul {
	
}

.leftBarMenu {
    display: flex;
    flex-direction: column;
    padding-bottom: 15px;
}

.leftBarMenu > h3 {
    padding: 13px 0px 2px;
    font-size: 20px;
    font-weight: normal;
    line-height: 40px;
}

.leftBarMenu > div {
	margin-top:10px;
}

.leftBarMenu >  div > leftBarListArray{
    display: flex;
    margin-top: 2px;
    font-size: 16px;
    line-height: 40px;
    color: rgb(110, 110, 110) !important;
}

.leftBarMenu > div > ul {
	padding-left:10px; 
}

.leftBarListArray div {
	display:flex;
	}
	
.leftBarListShow{
	cursor:pointer;
}	
	
.leftBarListShow ul {
	display:none;
}
	
.leftBarListShow.on ul{
	display: block;
}

.leftBarListShow.on i{
	transform:rotate(180deg);
}
	
</style>
<script type="text/javascript">
	$(function() {

		$("a:contains('����������')").on("click", function() {
			self.location = "/user/getUser?userId="+$(this).text().trim();
			
		});
		
		$("a:contains('���̷�����')").on("click", function() {
			self.location = "/recipe/listMyRecipe"
			
		});
		
		
		$("a:contains('������ŷŬ����')").on("click", function() {
			self.location = "/apply/listApply"
			
		});
		
		$("a:contains('�������ŷŬ����')").on("click", function() {
			self.location = "/cook/"
			
		});
		
		$("a:contains('���̸���')").on("click", function() {
			self.location = "/review/listMyReview"
			
		});
		
		$("a:contains('�ֹ������ȸ')").on("click", function() {
			self.location = "/purchase/listPurchase"
			
		});
		
		$("a:contains('å������ȸ')").on("click", function() {
			self.location = "/bookmark/listBookmark"
			
		});
		
		$("a:contains('���ã�¸���')").on("click", function() {
			self.location = "/cook/listMyMentor"
			
		});
		
		$("a:contains('����Ʈ��ȸ')").on("click", function() {
			self.location = "/user/listMyPoint"
			
		});
		
		$("a:contains('������ȸ')").on("click", function() {
			self.location = "/coupon/listMyCoupon"
			
		});
		
	});
	
</script>
<body>
<nav class="leftBarNav">
<h2>Mypage Navigation Menus</h2>
<span></span>
<div class="leftBarMenu">
	<h3>����������</h3>
	
<div class="leftBarListShow">
<div class="leftBarListArray">
		<span class="leftBarList"><a>����������</a></span>
	</div>
</div>
	
<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>���̷�����</a></span>
	</div>
</div>


<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>������ŷŬ����</a></span>
	</div>
</div>

<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>���̸���</a></span>
	</div>
</div>

<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>�ֹ������ȸ</a></span>
	</div>
</div>

<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>å������ȸ</a></span>
	</div>
</div>

<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>���ã�¸���</a></span>
	</div>
</div>

<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>����Ʈ��ȸ</a></span>
	</div>
</div>

<div class="leftBarListShow">
	<div class="leftBarListArray">
		<span class="leftBarList"><a>������ȸ</a></span>
	</div>
</div>


</div>

<div>

</div>
</nav>
</body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<script>
		$(function(){
			
			const leftBarNav = $('.leftBarList');
			const leftBarListArray = $('.leftBarListArray');
			const leftBarIcon = $('.leftBarListArray i');
			const leftBarListShow = $('.leftBarListShow');
			
			leftBarListArray.on("click",function(){
				$(this).parent().toggleClass('on');
			})
			
			
		})
	</script>