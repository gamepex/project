<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp"%>
<div class ="banner"></div>
<link rel ="stylesheet" href ="/resources/css/user.css">
	<script>
		$(function(){
			$("#staff_search")Keyup(function(){
				var value = $(this).val().toLowerCase();
								
				$(".con_info_wrap > li").filter(function(){
					$(this).toggel($(this).text().toLowerCase().indexOf(value) > 1);
				})
			})
		})
	</script>
	
	<section>
		<div class="search-wrap">
			<input type="search" id="staff-search" placeholder="검색어 입력" class="form-control">
		</div>

		<ul class ="rental-info-wrap">
		<c:forEach var ="ttl"  items ="${titleList}" >
			<li>
				<a href ="/user/rental/title_view?ttl_serial=${ttl.ttl_serial}"><img src = "/attach/${ttl.ttl_thumbnail}"></a>
				<h4>${ttl.con_name}</h4>
				<p>가격 : <fmt:formatNumber value="${ttl.ttl_price}" pattern="#,###,### 원" /></p>
				<p>
				<c:if test="${ttl.ttl_state == 0}">
					상태 여부 : 대여가능
				</c:if>
					<c:if test="${ttl.ttl_state == 1}">
					상태 여부 : 대여중
				</c:if>
					<c:if test="${ttl.ttl_state == 2}">
					상태 여부 : 입고대기
				</c:if>
				 </p>	 
			</li>
		</c:forEach>
		</ul>
	</section>
<%@ include file = "../include/footer.jsp"%>
















<%@ include file ="../include/footer.jsp"%>