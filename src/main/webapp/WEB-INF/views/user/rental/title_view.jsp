<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../include/header.jsp"%>

<link rel ="stylesheet" href ="/resources/css/user.css">

	<section>
		<div class ="title-view-wrap">
			<img id="item-thumbnail" src ="/attach/${ttl.ttl_thumbnail}">
			<ul class ="ttl-info-wrap">
			 	<li>
					<h4 id="item-name">${ttl.ttl_name}</h4>
					<p  id="item-platform" class ="platform">플랫폼 : ${ttl.ttl_platform}</p>
					<p id="item-price">가격 : <fmt:formatNumber value="${ttl.ttl_price}" pattern="#,###,### 원" /></p>
					<p >수량 : <input id="item-quantity" type="number" min=1 value=1 class="form-control"></p>
				</li>
				<li>
					<c:if test="${ttl.ttl_state == 0 }">
					<a href = "/user/rental/ttl_rental?ttl_serial=${ttl.ttl_serial}" class = "btn btn-success view-btn">대여하기</a>
					</c:if>
					<c:if test="${ttl.ttl_state == 1}">
					<button type="button" class= "btn btn-danger" disabled>대여 불가</button>
					</c:if>
					<c:if test="${ttl.ttl_state == 2 }">
					<button type="button" class= "btn btn-secondary" disabled>입고 대기</button>
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
<script>
	function getData() {
		var con_serial = $('#con_serial').val() || '';
		var ttl_serial = $('#ttl_serial').val() || '';

		var price = Number($('item-price').val());
		var ct_quantity= parseInt($('item-quantity').val());
		var ct_days = parseInt($('item-days').val());
		var ct_amount = price*ct_quantity*ct_days;
		var shipfee = (ct_amount > 0 && ct_amount < 70000) ? 5000 : 0;

		let today = localDateTime.split('T')[0];
		var ct_startdate = $('#rt_startdate').val('min',today);
		var ct_enddate = $('#rt_enddate').val();
}
		

</script>
<%@ include file ="../include/footer.jsp"%>