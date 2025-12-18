<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp"%>

	<link rel = "stylesheet" href ="/resources/css/console.css">
	<div class ="banner">
		<h2>Console Unable LIST</h2>
	</div>
	<script>
		$(function(){
			$("#staff_search").Keyup(function(){
				var value = $(this).val().toLowerCase();
				$(".con-info-wrap > li").filter(function(){
					$(this).toggel($(this).text().toLowerCase().indexOf(value) > 1);
				})
			})
		})
	</script>
	
	<section>
		<div class="search-wrap">
			<input type="search" id="staff-search" placeholder="검색어 입력" class="form-control">
		</div>

		<ul class ="con-info-wrap">
		<c:forEach var ="con"  items ="${consoleList}" >
			<li>
				<h4>${con.con_name}</h4>
				<img src = "/attach/${con.con_thumbnail}">
				<p class ="platform">플랫폼 : ${con.con_platform}</p>
				<p>재고량: ${con.con_stock}</p>
				<p>가격 : <fmt:formatNumber value="${con.con_price}" pattern="#,###,### 원" /></p>
				<p>
				<c:if test="${con.con_state == 2}">
					상태 여부 : 입고대기
				</c:if>
				 </p>
				 <p>등록일 : <fmt:formatDate value="${con.con_regdate }" pattern = "yyyy년 MM월 dd일"/></p>
				 <p class ="moddate">수정일 : <fmt:formatDate value="${con.con_moddate }" pattern = "yyyy년MM월 dd일"/></p>
				 
	 			<c:if test="${staff.staff_part eq '관리부' or staff.staff_id eq 'admin'}">
				<div class = "btn-group">
					<a href="/admin/console/modify?con_serial=${con.con_serial}"  class ="btn btn-success btn-lg">수정</a>
					<a href="javascript:deleteConsole('${con.con_serial}' , '${con.con_name}')" class = "btn btn-danger btn-lg">삭제</a>
				</div>
				</c:if>
			</li>
		</c:forEach>
		</ul>
	</section>
	
	<script>
		function deleteConsole(con_serial,con_name) {
			var result = confirm(con_name + '을 삭제 하시겠습니까?');
			
			if(result){
				location.href="/admin/console/delete?con_serial="+con_serial;
			}
		}
	</script>
<%@ include file = "../include/footer.jsp"%>














