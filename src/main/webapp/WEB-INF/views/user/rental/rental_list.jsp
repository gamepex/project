<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span class="txt-blue">R</span>ental <span class="txt-ygrn">L</span>IST</h2>
	</div>
	<link rel="stylesheet" href="/resources/css/rental.css">
	<script>
		$(function() {
			$('#search-wrap').keyup(function(){
				var value = $(this).val().toLowerCase();
				
				$('.rt-info-wrap > li').filter(function(){
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				});
			});
		});
	</script>
	
	<section>
		<div class="it-search-wrap">
			<input type="search" id="search-wrap" placeholder="검색어 입력" class="form-control"> 		
		</div>
		
		<div class="it-info-wrap">
		<c:forEach var="rtdto" items="${itemList}"></c:forEach>
			<ul>
				<li>
					<p>주문 번호: ${rtdto.rt_no}</p>
					<p>주문일: ${rtdto.rt_regdate}</p>
					<p>대여 시작일: ${rtdto.rt_startdate}</p>
					<p>대여 종료일: ${rtdto.rt_enddate}</p>
					<p>대여 반납일: ${rtdto.rt_rtndate}</p>
				</li>
			</ul>
			<ul>
				<li>
					<p class="show-rt-state">
					<c:if test="${rt_state == '0'}">대여 요청 확인 중</c:if>
					<c:if test="${rt_state == '1'}">배송 준비 중</c:if>
					<c:if test="${rt_state == '2'}">대여 취소</c:if>
					<c:if test="${rt_state == '3'}">배송 중</c:if>
					<c:if test="${rt_state == '4'}">배송 완료(대여 중)</c:if>
					<c:if test="${rt_state == '5'}">반납 요청</c:if>
					<c:if test="${rt_state == '6'}">반납 완료</c:if>
					</p>
				</li>
				<!--<c:forEach var="rtdto" items="${itemDetail}"></c:forEach>-->
					<li>
						<c:if test="${rtdto.rd_type eq 'console' and rtdto.con_serial}" >
							<img alt="" src="/attach/${rtdto.con_thumbnail}"></c:if>
						<c:if test="${rtdto.rd_type eq 'title' and rtdto.ttl_no}" >
							<img alt="" src="/attach/${rtdto.ttl_thumbnail}"></c:if>
					</li>
					<li>
						<h3>${rtdto.con_name}</h3>
						<p id="rd_price">개당 가격: ${rtdto.rd_price}</p>
						<p id="rd_quantity">수량: ${rtdto.rd_quantity}</p>
						<p class="it-total-amount"><fmt:formatNumber value="${#it-total-amount}" pattern="#,###,###" /></p>
					</li>
			<!--{itemDetail} foreach 닫을 자리  -->
			</ul>
			<!--{itemList} foreach 닫을 자리  -->
		</div>
	</section>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>