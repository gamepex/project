<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp"%>

<link rel ="stylesheet" href ="/resources/css/user.css">

	<section>
		<div class ="title-view-wrap">
			<img src ="/attach/${ttl.ttl_thumbnail}">
			<ul class ="ttl-info-wrap">
			 	<li>
					<h4>${ttl.ttl_name}</h4>
					<p class ="platform">플랫폼 : ${ttl.ttl_platform}</p>
					<p >가격 : <fmt:formatNumber value="${ttl.ttl_price}" pattern="#,###,### 원" /></p>
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
				<li>
					<c:if test="${ttl.ttl_state == 0 }">
					<a href = "/user/rental/ttl_rental?ttl_serial=${ttl.ttl_serial}" class = "btn btn-success view-btn">대여하기</a>
					</c:if>
					<c:if test="${ttl.ttl_state == 1}">
					<a href = "/user/rental/ttl_rental?ttl_serial=${ttl.ttl_serial}">대여중</a>
					</c:if>
					<c:if test="${ttl.ttl_state == 2 }">
					<a href = "/user/rental/ttl_rental?ttl_serial=${ttl.ttl_serial}" class = "btn btn-danger">대여 불가</a>
					</c:if>
				</li>
			</ul>
		</div>
		<div class ="title-container">
			<h3>제품 정보</h3>
			<div class ="title-content">${ttl.ttl_content}</div>
			<h3>상품평 작성</h3>
		</div>
	</section>










<%@ include file ="../include/footer.jsp"%>