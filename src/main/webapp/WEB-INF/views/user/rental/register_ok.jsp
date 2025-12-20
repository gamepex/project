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
		<c:choose>	
		<div class="rt-info-reg">
			<ul>
				<li><p>주문 일시: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
				<li><p>주문 번호: ${rt_no}</p></li>
			</ul>
			
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