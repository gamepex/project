<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span>Item Rental </span>REGISTER</h2>
	</div>

	<link rel="stylesheet" href="/resources/css/rental.css">
	
	<section>
		<form name="rt_reg_frm" action="/user/rental/register" method="post">
			<input type="hidden" name="con_serial" value="${c.con_serial}">
			<input type="hidden" name="ttl_serial" value="${t.ttl_serial}">
			<input type="hidden" name="mb_id" value="${m.mb_id}">
			<input type="hidden" name="rt_quantities" value="${rt_quantities}">
			
			<c:if test="${c.con_serial != null }">
			<c:forEach var="c" items="${c}">
			<ul class="rt_show-item">
				<li>
					<img src="/attach/${c.con_thumbnail}">
				</li>
				<li>
					<h4>${c.con_name}</h4>
					<p>제조사 : ${c.con_platform}</p>
					<p>가격 : ${c.con_price}</p>
					<label>수량 : </label><input type="number" name="rt_quantities" >
				</li>
			</ul>
			</c:forEach>
			</c:if>
			
			<c:if test="${t.ttl_serial != null }">
			<c:forEach var="t" items="${t}">
				<ul class="rt_show-item">
					<li>
					<img src="/attach/${t.ttl_thumbnail}">
					</li>
					<li>
						<h4>${t.ttl_name}</h4>
						<p>제조사 : ${t.ttl_platform}</p>
						<p>가격 : ${t.ttl_price}</p>
						<label>수량 : </label><input type="number" name="rt_quantities" >
					</li>
				</ul>
			</c:forEach>
			</c:if>
			
			<ul class="rt-info-deli">
				<li><label>주문자명 : </label><input type="text" id="mb_name" value="${m.mb_name}"readonly></li>
				<li><label>주문자 번호 : </label><input type="text" id="mb_phone" value="${m.mb_phone}"readonly></li>
				<li><label>우편번호 : </label><input type="text" id="mb_zipcode" value="${m.mb_zipcode}"readonly></li>
				<li><label>주소 : </label><input type="text" id="mb_addr" value="${m.mb_addr}"readonly></li>
				<li><label>상세주소 : </label><input type="text" id="mb_addrdet" value="${m.mb_addrdet}"readonly></li>
				<li>
					<button type="button" onclick="insertMbInfo" class="">주문자 정보와 동일</button>
				</li>
				<li><label>받는 분 성함 : </label><input type="text" name="rt_name" placeholder="받는 분 성함" required class="form-control"></li>
				<li><label>받는 분 번호 : </label><input type="tel" name="rt_tel" placeholder="받는 분 번호" required class="form-control"></li>
				<li>
					<input type="text" id="postcode" name="rt_zipcode"placeholder="우편번호">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" name="rt_addr"placeholder="주소">
					<input type="text" id="detailAddress" name="rt_addrdet"placeholder="상세주소">
				</li>
				<li><label>배송 요청 메세지 : </label><input type="text" name="rt_req" class="form-control"></li>
			</ul>
			
			<ul class="rt-frm-wrap">
					<li><input type="text" name="rt_days"  placeholder="대여일수"class="form-control"></li>
					<li><label>배송비 : </label><input type="number" name="rt_shipfee" value="3000" readonly class="form-control"></li>
					<li><label>결제총액 : </label><input type="number" name="rt_amount" value="30000" readonly class="form-control"></li>
					<li>
						<label>결제수단 : </label>
						<input id="c" type="radio" name="rt_payment" value="0" checked><label for="c" class="more-btn">카드</label>
						<input id="b" type="radio" name="rt_payment" value="1"><label for="b" class="more-btn">현금</label>
						<input id="t" type="radio" name="rt_payment" value="2"><label for="t" class="more-btn">계좌이체 (무통장입금)</label>
						<input id="e" type="radio" name="rt_payment" value="3"><label for="e" class="more-btn">그 외</label>
					</li>
					
					<li><label>대여 시작일 : </label><input type="date" name="rt_startdate" required class="form-control"></li>
					<li><label>대여 종료일 : </label><input type="date" name="rt_enddate"  required class="form-control"></li>
					<li>
						<button type="submit"  class="more-btn">대여 하기</button>
					</li>
			</ul>
		</form>
	</section>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	
	            var addr = '';
	
	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else { 
	                addr = data.jibunAddress;
	            }
	            
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
	}
</script>

	
	<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>