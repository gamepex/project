<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span>Rental</span> LIST</h2>
	</div>

	<link rel="stylesheet" href="/resources/css/rental.css">
	
	<script>
		$(function(){
			$('#search-wrap').keyup(function(){
				var value = $(this).val().toLowerCase();
				
				$('.adm-rt-info-wrap > li').fliter(function(){
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				});
			});
		});
		
	</script>
	<style>
		ul {display:flex; justify-content:space-between;}

	</style>
	
	
	<section>
		<div class="search-wrap">
			<input type="search" id="search-wrap" placeholder="검색어 입력" class="form-control"> 
		</div>
	
		<ul class="adm-rt-title">
			<li>대여 번호</li>
			<li>회원 ID</li>
			<li>전화번호</li>
			<li>주소</li>
			<li>대여 품목<li>
			<li>대여 금액</li>
			<li>대여 시작일</li>
			<li>대여 종료일</li>
			<li>반납일</li>
			<li>대여 현황</li> 
			<li></li>
		</ul>
		
		<div class="adm-rt-info-wrap">
			<c:forEach var="rtdto" items="${rentalList}">
			<ul>
				<li>${rtdto.rt_no}</li>
				<li>${rtdto.mb_id}</li>
				<li>${rtdto.mb_phone}</li>
				<li>${rtdto.rt_addr}</li>
				<li> 
				<c:choose>
				<c:when test="${rtdto.rd_type != 'title' and rtdto.con_serial != null}" >${rtdto.con_name}</c:when>
				<c:otherwise>${rtdto.ttl_name}</c:otherwise>
				</c:choose>	
				</li>
				<li>${rtdto.rt_amount}</li>
				<li>${rtdto.rt_startdate}</li>
				<li>${rtdto.rt_enddate}</li>
				<li>${rtdto.rt_rtndate}</li>
				<li>
					<p>
						<c:if test="${rtdto.rt_state == 0}">결제 확인 필요</c:if>
						<c:if test="${rtdto.rt_state == 1}">결제 확인</c:if>
						<c:if test="${rtdto.rt_state == 2}">대여 취소</c:if>
						<c:if test="${rtdto.rt_state == 3}">출고 완료(배송 중)</c:if>
						<c:if test="${rtdto.rt_state == 4}">배송 완료(대여 중)</c:if>
						<c:if test="${rtdto.rt_state == 5}">반납 요청 작업 중</c:if>
						<c:if test="${rtdto.rt_state == 6}">반납 완료</c:if>
					</p>
				</li>
				<li><a href="/admin/rental/detail?rt_no=${rtdto.rt_no}">상세 보기</a></li>
			</ul>
			</c:forEach>
		</div>

	</section>
	


<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>