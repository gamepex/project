<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span class="txt-blue">I</span>tem <span class="txt-ygrn">R</span>ental <span class="txt-blue">C</span>ompleted</h2>
	</div>

	<link rel="stylesheet" href="/resources/css/rental.css">
	
	<section>
		<c:set var="rdto" value="${rentalDTO}" scope="session" /> <!-- 변수명 변수값 범위 request:지정한 범위 session:세션 내내 application:애플리케이션 전체-->
		<c:if test="${rt_no != null}">
			<!-- 만약 사용자가 콘솔&게임기를 같이 대여했다고 한다면, 지금 로직은 콘솔 하나, 타이틀 하나 렌탈 테이블에 저장돼서 실질 구매는 한번인데, 렌탈테이블 데이터는 2개 쌓이는 거 아닌가? 내가 여지껏 생각해왔던 로직은, 한번에 여러개 구매시, 대여 번호가 다 동일하고 그 안에 또 세부적으로 데이터가 저장되는 걸 생각했는데?-->
		<c:choose>	
		<div class="rt-info-reg">
			<ul>
				<h3>주문완료</h3>
				<h4>주문해주셔서 감사합니다!</h4>
				<li><p>주문 일시: ${rdto.rt_regdate}</p></li>
				<li><p>주문 번호: ${rdto.rt_no}</p></li>
				<li><p>주문 상태: ${rdto.rt_state}</p></li>
				<li><p>주문 상태: ${rdto.rt_days}</p></li>
				<li><p>주문 상태: ${rdto.rt_amount}</p></li>
				<li><p>: ${rdto.rt_startdate}</p></li>
				<li><p>: ${rdto.rt_enddate}</p></li>
			</ul>	
			<c:if test="${rdto.con_serial != null and !rdto.con_serial.isEmpty()}">
			<c:forEach var="rdto" items="${rentalDTO}">
			<ul>
				<li><img src="/attach/${rdto.con_thumbnail}"></li>
				<li>
					<h5>${rdto.con_name}</h4>
					<p>가격 : <fmt:formatNumber value="${rdto.con_price}" pattern="#,###,###"/>원</p>
					<p>수량 : ${rdto.rt_quantities}</p>
				</li>
			</ul>
			</c:forEach>
			</c:if>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
			
			
		</div>
		<div class="btn-wrap">
			
			<c:when test="${rvo.con_serial != null}">
				<a href="/user/rental/con_list" class="btn btn-danger">계속 쇼핑하기</a>
			</c:when>
			<c:otherwise>
				<a href="/user/rental/title_list" class="btn btn-danger">계속 쇼핑하기</a>
			</c:otherwise>
			<a href="/user/member/mypage?mb_id=${rt_mb_id}" class="btn btn-primary">마이페이지</a>
		</div>
		</c:choose>
		</c:if>
	</section>
	
	
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>