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
		<c:forEach var ="con"  items ="${consoleList}" >
			<li>
				<a href ="/user/rental/con_view?con_serial=${con.con_serial}"><img src = "/attach/${con.con_thumbnail}"></a>
				<h4>${con.con_name}</h4>
				<p>가격 : <fmt:formatNumber value="${con.con_price}" pattern="#,###,### 원" /></p>
				<p>
				<c:if test="${con.con_state == 0}">
					상태 여부 : 대여가능
				</c:if>
					<c:if test="${con.con_state == 1}">
					상태 여부 : 대여중
				</c:if>
					<c:if test="${con.con_state == 2}">
					상태 여부 : 입고대기
				</c:if>
				 </p>	 
			</li>
		</c:forEach>
		</ul>
	</section>
<%@ include file = "../include/footer.jsp"%>
















<%@ include file ="../include/footer.jsp"%>