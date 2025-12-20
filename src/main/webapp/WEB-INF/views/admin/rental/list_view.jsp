<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<link rel="stylesheet" href="/resources/css/staff.css">

	<div class="banner">
		<h2><span>Rental</span> DETAILS</h2>
	</div>
	
	<style>
		ul li {display:flex; justify-content:space-between;}
		.rtdt-info-wrap li {display:block; margin-left:0; padding-left:0;}
	</style>
	
	<section>
	<c:forEach var="rtdto" items="${rentalList}" end="0">
		<div>
			<ul class="rtdt-info-wrap">
				<li>
					<p>주문 번호: ${rtdto.rt_no}</p>
					<p>주문일: ${rtdto.rt_regdate}</p>
					<p>총 금액: ${rtdto.rt_amount}</p>
					<p>대여 시작일: ${rtdto.rt_startdate}</p>
					<p>대여 종료일: ${rtdto.rt_enddate}</p>
					<p>대여 반납일: ${rtdto.rt_rtndate}</p>
				</li>
			</ul>
		</div>
		<div class="rt-state-wrap">
			<p id="current-state">
				<c:if test="${rtdto.rt_state == 0}">결제 확인 필요</c:if>
				<c:if test="${rtdto.rt_state == 1}">결제 확인</c:if>
				<c:if test="${rtdto.rt_state == 2}">대여 취소</c:if>
				<c:if test="${rtdto.rt_state == 3}">출고 완료(배송 중)</c:if>
				<c:if test="${rtdto.rt_state == 4}">배송 완료(대여 중)</c:if>
				<c:if test="${rtdto.rt_state == 5}">반납 요청 작업 중</c:if>
				<c:if test="${rtdto.rt_state == 6}">반납 완료</c:if>
			</p>
			<form id="rt-state-from" action="/admin/rental/rtstate" method="post">
				<input type="hidden"  name="rt_no" value="${rtdto.rt_no}">
				<select class="rt_state" name="rt_state" size="1">
					<option value="0" selected>pending</option>
					<option value="1">confirmed</option>
					<option value="2">cancelled</option>
					<option value="3">out_for_delivery</option>
					<option value="4">rented</option>
					<option value="5">return_requested</option>
					<option value="6">returned</option>
				</select>
				<button type="button" class="btn btn-success btn-rtst-modify">수 정</button>
			</form>
		</div>
	</c:forEach>
	<script>
		$(function(){
			$('.btn-rtst-modify').on('click', function() {
				const form = $(this).closest('form');
				const selectElement = form.find('.rt_state');
				const selectedText = selectElement.find('option:selected').text();
				const msg = " ' "+ selectedText + " ' 상태로 변경하시겠습니까?";
				
				if(confirm(msg)) {
					form.submit();
					alert("상태 변경 요청을 보냈습니다.");
				} else {
					console.log("상태 변경 취소");
				}
			});
		});
	</script>
			
	<c:forEach var="rddto" items="${rentalDetailList}">		
		<c:choose>
			<c:when test="${rddto.con_serial != null}" >
				<img alt="콘솔 썸네일" src="/attach/${rddto.con_thumbnail}">
				<ul>
					<li>
						<h5>${rddto.con_name}</h5>
						<p>개당 가격: ${rddto.rd_price}</p>
						<p>수량: ${rddto.rd_quantity}</p>
						<div class="rt-btn-wrap">
							<button type="button" onclick="writeReview()">대여 후기 작성하기</button>
							<button type="button">재대여하기</button>
						</div>
					</li>
				</ul>
				
			</c:when>
			<c:otherwise>
				<img alt="타이틀 썸네일" src="/attach/${rddto.ttl_thumbnail}">
					<ul>
						<li>
							<h5>${rddto.ttl_name}</h5>
							<p>개당 가격: ${rddto.rd_price}</p>
							<p>수량: ${rddto.rd_quantity}</p>
							<div class="rt-btn-wrap">
								<button type="button">대여 후기 작성하기</button>
								<button type="button">재대여하기</button>
							</div>
						</li>
					</ul>
			</c:otherwise>
		</c:choose>
	</c:forEach>	
	
	<c:forEach var="rtdto" items="${rentalList}" end="0">
		<div>
			<h5>결제 수단</h5>
			<ul>
				<li>${rtdto.rt_payment}</li>
				<li><fmt:formatNumber value="${rtdto.rt_amount}" pattern="#,###,### 원"/></li>
			</ul>
		</div>
		<div>
			<h5>주문자 정보</h5>
			<ul>
				<li>아이디 : ${rtdto.mb_id}</li>
				<li>이름 : ${rtdto.mb_name}</li>
				<li>닉네임 : ${rtdto.mb_nickname}</li>
				<li>전화번호 : ${rtdto.mb_phone}</li>
				<li>주소 : ${rtdto.mb_zipcode} | ${rtdto.mb_addr}</li>
			</ul>
		</div>
		
		<div>
			<h5>배송 정보</h5>
			<ul>
				<li>송장 번호: ${rtdto.rt_invoice}</li>
				<li>수령인: ${rtdto.rt_name}</li>
				<li>번호: ${rtdto.rt_tel}</li>
				<li>주소 : ${rtdto.rt_zipcode} | ${rtdto.rt_addr}</li>
				<li>배송 요청 사항 : ${rtdto.rt_req}</li>
			</ul>
		</div>
	</c:forEach>

	</section>



<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>