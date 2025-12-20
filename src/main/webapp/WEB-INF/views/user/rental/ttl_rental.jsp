<%@ page language="java" ttltentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span class="txt-blue">T</span>itle <span class="txt-ygrn">R</span>ental <span class="txt-blue">R</span>EGISTER</h2>
	</div>
	<link rel="stylesheet" href="/resources/css/rental.css">
	<script>
		$(function(){
			$('#rt_quantities, #rt_days').on('input', function(){
				var price = Number($('#per_price').val());
				var qty = Number($('#rt_quantities').val());
				var days = Number($('#rt_days').val());
				var setAmount = price*qty*days;
				var shipfee = 0;
				
				if(setAmount > 0 && setAmount < 30000) {
					shipfee = 3000;
				} else {
					shipfee = 0;
				}
				$('#rt_shipfee').val(shipfee);
				$('#rt_amount').val(setAmount+shipfee);
			});
			
			$('#insertMbInfo').click(function(){
				var name = $('#mb_name').val();
				var phone = $('#mb_phone').val();
				var zipcode = $('#mb_zipcode').val();
				var addr = $('#mb_addr').val();
				var addrdet = $('#mb_addrdet').val();
				
				$('#rt_name').val(name);
				$('#rt_tel').val(phone);
				$('#postcode').val(zipcode);
				$('#address').val(addr);
				$('#detailAddress').val(addrdet);
				
				$('#rt_name, #rt_tel, #postcode, #address, #detailAddress').prop('readonly',true);
				$('#searchZip').prop('disabled',true);
				$('#modiInfo').prop('disabled',false);
				$('#rt_name, #rt_tel, #postcode, #address, #detailAddress').css('background-color', '#e9ecef');
			});
			
			$('#modiInfo').click(function(){
				$('#rt_name, #rt_tel, #postcode, #address, #detailAddress').prop('readonly',false);
				$('#rt_name, #rt_tel, #postcode, #address, #detailAddress').val('');
				$('#searchZip').prop('disabled',false);
				$(this).prop('disabled',true);
				$('#rt_name, #rt_tel, #postcode, #address, #detailAddress').css('background-color', '#fff');
				$('#rt_name').focus();
			});
			
			$('#rt_reg_frm').on('submit', function(){
				var amount = Number($('#rt_amount').val());
				if(!amount || amount === 0){
					alert("대여 정보(수량, 일수)를 정확히 입력해주세요.");
					return false;
				} return true;
			});
		});
	</script>

	<section>
		<form id="rt_reg_frm" name="rt_reg_frm" action="/user/rental/register" method="post">
			<input type="hidden" name="ttl_serial" value="${item.ttl_serial}">
			<input type="hidden" name="mb_id" value="${m.mb_id}">
		
			<ul class="rt_show_item">
				<li>
					<img src="/attach/${item.ttl_thumbnail}">
				</li>
				<li>
					<h4>${item.ttl_name}</h4>
					<p>제조사 : ${item.ttl_platform}</p>
					<p>가격 : <fmt:formatNumber value="${item.ttl_price}" pattern="#,###,###"/>원</p>
					<input type="hidden" id="per_price" value="${item.ttl_price}">
					<label>수량 : </label>
					<input id="rt_quantities" type="number" name="rt_quantities" value="1" min="1" class="form-control">
				</li>
			</ul>
			<ul class="rt-info-deli">
				<li><label>주문자명 : </label><input type="text" id="mb_name" value="${m.mb_name}"readonly class="form-control"></li>
				<li><label>주문자 번호 : </label><input type="text" id="mb_phone" value="${m.mb_phone}"readonly class="form-control"></li>
				<li><label>우편번호 : </label><input type="text" id="mb_zipcode" value="${m.mb_zipcode}"readonly class="form-control"></li>
				<li><label>주소 : </label><input type="text" id="mb_addr" value="${m.mb_addr}"readonly class="form-control"></li>
				<li><label>상세주소 : </label><input type="text" id="mb_addrdet" value="${m.mb_addrdet}"readonly class="form-control"></li>
				<li>
					<button id="insertMbInfo" type="button" class="">주문자 정보와 동일</button>
					<button id="modiInfo" type="button" class="" disabled>정보 수정</button>					
				</li>
				<li><label>받는 분 성함 : </label><input id="rt_name" type="text" name="rt_name" placeholder="받는 분 성함" required class="form-control"></li>
				<li><label>받는 분 번호 : </label><input id="rt_tel" type="tel" name="rt_tel" placeholder="받는 분 번호" required class="form-control"></li>
				<li>
					<input type="text" id="postcode" name="rt_zipcode" placeholder="우편번호" class="form-control">
					<input id="searchZip" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="address" name="rt_addr" placeholder="주소" class="form-control">
					<input type="text" id="detailAddress" name="rt_addrdet" placeholder="상세주소" class="form-control">
				</li>
				<li><label>배송 요청 메세지 : </label><input type="text" name="rt_req" class="form-control"></li>
			</ul>
			<ul class="rt-info-rent">
				<li><input id="rt_days" type="number" name="rt_days" placeholder="대여일수" min="3" required class="form-control"></li>
				<li><label>배송비 : </label><input id="rt_shipfee" type="number" name="rt_shipfee" readonly class="form-control"></li>
				<li><label>결제총액 : </label><input id="rt_amount" type="number" name="rt_amount" readonly class="form-control"></li>
				<li>
					<label>결제수단 : </label>
					<input id="c" type="radio" name="rt_payment" value="0" checked><label for="c" class="more-btn">카드</label>
					<input id="b" type="radio" name="rt_payment" value="1"><label for="b" class="more-btn">현금</label>
					<input id="t" type="radio" name="rt_payment" value="2"><label for="t" class="more-btn">계좌이체 (무통장입금)</label>
					<input id="e" type="radio" name="rt_payment" value="3"><label for="e" class="more-btn">그 외</label>
				</li>
				<li><label>대여 시작일 : </label><input id="rt_startdate" type="date" name="rt_startdate" required class="form-control"></li>
				<li><label>대여 종료일 : </label><input id="rt_enddate" type="date" readonly placeholder="시작일 선택 시 자동 계산" class="form-control"></li>
				<li>
					<button type="submit" class="more-btn">대여 하기</button>
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