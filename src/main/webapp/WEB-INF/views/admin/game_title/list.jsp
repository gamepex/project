<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%>

	<link rel = "stylesheet" href ="/resources/css/console.css">
	<div class ="banner">
		<h2><span class ="txt-blue"> Game </span><span class="txt-ygrn">Title</span> LIST </h2>
	</div>
	<script>
		$(function(){
			$("#staff_search").Keyup(function(){
				var value = $(this).val().toLowerCase();
								
				$(".ttl-info-wrap > li").filter(function(){
					$(this).toggel($(this).text().toLowerCase().indexOf(value) > 1);
				})
			})
		})
	</script>
	
	<section>
		<div class="search-wrap">
			<input type="search" id="staff-search" placeholder="검색어 입력" class="form-control">
		</div>

		<ul class = "con-info-wrap">
		<c:forEach var ="ttl"  items ="${gametitleList}" >
			<li>
				<h4>${ttl.ttl_name}</h4>
				<img src = "/attach/${ttl.ttl_thumbnail}">
				<p class ="platform">플랫폼 : ${ttl.ttl_platform}</p>
				<p>장르: ${ttl.ttl_genre}</p>
				<p>재고량: ${ttl.ttl_stock}</p>
				<p >가격 : <fmt:formatNumber value="${ttl.ttl_price}" pattern="#,###,### 원" /></p>
				<p>
				<c:if test="${ttl.ttl_state == 0}">
					상태 여부 : 대여가능
				</c:if>
				<c:if test="${ttl.ttl_state == 1}">
					상태 여부 : 대여중
				</c:if>
				 </p>
				 <p>d</p>
				 <p class ="moddate"></p>
				 
		 		<c:if test="${staff != null}">
				<div class = "btn-group">
					<a href="/admin/game_title/modify?ttl_serial=${ttl.ttl_serial}"  class ="btn btn-success btn-lg">수정</a>
					<a href="javascript:deleteGameTitle('${ttl.ttl_serial}' , '${ttl.ttl_name}')" class = "btn btn-danger btn-lg">삭제</a>
				</div>
			</c:if>
			</li>
		</c:forEach>
		</ul>
	</section>
	
	<script>
		function deleteGameTitle(ttl_serial,ttl_name) {
			var result = confirm(ttl_name + '삭제 하시겠습니까?');
			
			if(result){
				location.href="/admin/game_title/delete?ttl_serial="+ttl_serial;
			}
		}
	</script>
<%@ include file = "../include/footer.jsp"%>














