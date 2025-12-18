<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp"%>

<link rel ="stylesheet" href ="/resources/css/user.css">

	<section>
		<div class ="console-view-wrap">
			<img src ="/attach/${con.con_thumbnail}">
			<ul class ="con-info-wrap">
			 	<li>
					<h4>${con.con_name}</h4>
					<p class ="platform">플랫폼 : ${con.con_platform}</p>
					<p class="price">상품 금액 : <fmt:formatNumber value="${con.con_price}" pattern="#,###,### 원" /></p>
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
				<li>	
					<c:if test="${con.con_state == 0 }">
					<a href = "/user/rental/register?con_serial=${con.con_serial}" class ="btn btn-success view-btn">대여하기</a>
					</c:if>
					<c:if test="${con.con_state == 1}">
					<a href = "/user/rental/register?con_serial=${con.con_serial}">대여중</a>
					</c:if>
					<c:if test="${con.con_state == 2 }">
					<a href = "/user/rental/register?con_serial=${con.con_serial}" class ="btn btn-danger">대여 불가</a>
					</c:if>
				</li>
			</ul>
		</div>
		<div class ="console-container">
			<h3>제품 정보</h3>
			<div class ="console-content">${con.con_content}</div>
			<h3>상품평 작성</h3>
		</div>
	</section>










<%@ include file ="../include/footer.jsp"%>