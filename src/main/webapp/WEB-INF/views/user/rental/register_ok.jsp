<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span class="txt-blue">I</span>tem <span class="txt-ygrn">R</span>ental <span class="txt-blue">C</span>ompleted</h2>
	</div>

	<link rel="stylesheet" href="/resources/css/user.css">
	<section>
		<c:set var="rdto" value="${latestRt}" scope="request" /> <!-- 변수명 변수값 범위 request:지정한 범위 session:세션 내내 application:애플리케이션 전체-->
		<c:if test="${rdto != null and rdto.rt_no != null}">
		<div class="rt-info-reg">
			<ul class="rtok-info-rent">
				<li>
					<h4>주문이 완료되었습니다.</h4>
					<p>
						<fmt:parseDate value="${rdto.rt_regdate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDateTime" type="both"/>
						<fmt:formatDate value="${parseDateTime}" pattern="yyyy-MM-dd HH:mm"/> 주문하신 상품의<br>주문번호는 ${rdto.rt_no} 입니다.
					</p>
					<div class="btn-wrap">
					<c:choose>
						<c:when test="${not empty rdto.con_serial}">
							<a href="/user/rental/con_list" class="btn btn-danger">계속 쇼핑하기</a>
						</c:when>
						<c:otherwise>
							<a href="/user/rental/title_list" class="btn btn-danger">계속 쇼핑하기</a>
						</c:otherwise>
					</c:choose>
						<a href="/user/member/mypage?mb_id=${rdto.mb_id}" class="btn btn-primary">마이페이지</a>
					</div>
				</li>
			</ul>
			
			<div class="rtok-item-wrap">
				<c:choose>
					<c:when test="${not empty rdto.con_serial}">
					<img src="/attach/${rdto.con_thumbnail}">
					<ul class="rtok-info-item">
						<li>
							<h4>${rdto.con_name}</h4>
							<p>제조사 : ${rdto.con_platform}</p>
							<p>가격 : <fmt:formatNumber value="${rdto.con_price}" pattern="#,###,###"/>원</p>
							<p>수량 : ${rdto.rt_quantities}개</p>
							<p>대여일수: ${rdto.rt_days}일</p>
							<p>대여 시작일: ${rdto.rt_startdate}</p>
							<p>대여 종료일: ${rdto.rt_enddate}</p>
						</li>
					</ul>
					</c:when>
					<c:otherwise>
					<img src="/attach/${rdto.ttl_thumbnail}">
					<ul class="rtok-info-item">
						<li>
							<h4>${rdto.ttl_name}</h4>
							<p>제조사 : ${rdto.ttl_genre}</p>
							<p>가격 : <fmt:formatNumber value="${rdto.ttl_price}" pattern="#,###,###"/>원</p>
							<p>수량 : ${rdto.rt_quantities}개</p>
							<p>대여일수: ${rdto.rt_days}일</p>
							<p>대여 시작일: ${rdto.rt_startdate}</p>
							<p>대여 종료일: ${rdto.rt_enddate}</p>
						</li>
					</ul>
					</c:otherwise>
				</c:choose>
			</div>
		
			<ul class="rtok-info-deli">
				<li><h5>배송정보</h5></li>
				<li><p>받는 분 : ${rdto.rt_name} / ${rdto.rt_tel}</p></li>
				<li><p>배송지 : ${rdto.rt_zipcode} ${rdto.rt_addr} ${rdto.rt_addrdet}</p></li>
				<li><p>배송요청사항 : ${rdto.rt_req}</p></li>
			</ul>
			<ul class="rtok-info-pay">
				<li><h5>결제정보</h5></li>
				<li><h6>결제금액 : <fmt:formatNumber value="${rdto.rt_amount}" pattern="#,###,###"/>원</h6></li>
				<li><p>결제수단 : 
					<c:choose>
					<c:when test="${rdto.rt_payment == 0}">카드</c:when>
					<c:when test="${rdto.rt_payment == 1}">계좌이체</c:when>
					<c:when test="${rdto.rt_payment == 2}">무통장입금</c:when>
					<c:otherwise>기타</c:otherwise>
					</c:choose>
					</p>
				</li>
			</ul>	
		</div>
		</c:if>
	</section>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>