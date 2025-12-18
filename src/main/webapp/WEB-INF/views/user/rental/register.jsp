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
			<input type="hidden" name="mb_id" value="${m.mb_id}">
			<ul class="rt-frm-wrap">
					<li><input type="hidden" name="detailList[i].rd_type" value="${c.con_platform}"></li>
					<li><input type="hidden" name="detailList[i].rd_serial" value="${c.con_serial}"></li>
					<li><input type="hidden" name="detailList[i].rd_quantity" value="1"></li>
					<li><input type="number" name="rt_days"  placeholder="대여일수"class="form-control"></li>
					<li><label>배송비 : </label><input type="number" name="rt_shipfee" value="3000" readonly class="form-control"></li>
					<li><label>결제총액 : </label><input type="number" name="rt_amount" value="30000" readonly class="form-control"></li>
					<li><label>주문일시 : </label><input type="date"  name="rt_regdate" value="2025-12-18" readonly class="form-control"></li>
					<li>
						<label>결제수단 : </label>
						<input id="c" type
						="radio" name="rt_payment" value="0"><label for="c" class="more-btn">카드</label>
						<input id="b" type="radio" name="rt_payment" value="1"><label for="b" class="more-btn">현금</label>
						<input id="t" type="radio" name="rt_payment" value="2"><label for="t" class="more-btn">계좌이체 (무통장입금)</label>
						<input id="e" type="radio" name="rt_payment" value="3"><label for="e" class="more-btn">그 외</label>
					</li>
					<li><label>지울 것 주문현황 : </label><input type="number" name="rt_state"  readonly class="form-control"></li>
					<li><label>지울 것 송장번호 : </label><input type="text" name="rt_invoice"  readonly class="form-control"></li>
					<li><label>받는 분 성함 : </label><input type="text" name="rt_name" placeholder="받는 분 성함" required class="form-control"></li>
					<li><label>받는 분 번호 : </label><input type="tel" name="rt_tel" placeholder="받는 분 번호" required class="form-control"></li>
					<li>
						<input type="text" name="rt_zipcode" readonly required class="form-control">
						<button type="button" onclick="getZipcode()">우편번호 찾기</button>
					</li>
					<li><input type="text" name="rt_addr" placeholder="상세주소 입력"required class="form-control"></li>
					<li><label>배송 요청 메세지 : </label><input type="text" name="rt_req" class="form-control"></li>
					<li><label>대여 시작일 : </label><input type="date" name="rt_startdate" required class="form-control"></li>
					<li><label>대여 종료일 : </label><input type="date" name="rt_enddate"  required class="form-control"></li>
					<li>
						<a href="#" class="more-btn">장바구니</a>
						<button type="button" onclick="startRental()" class="more-btn">대여 하기</button>
					</li>
			</ul>
		</form>
	</section>
	
	<script> 
		function getZipcode(){
			window.open('/user/rental/get_zipcode','Get Zipcode','width=350', 'height=450','scrollbar=yes' )
		}
		
		function startRental() {
			if (!checkData()) return;
			 processOrder();
		}
		
		function checkData(){
			const form = document.rt_reg_frm;
			if(form.rt_days.value==""){
				alert("대여일수를 입력하세요.");
				form.rt_days.focus();
				return false;
			}
			const paymentChecked = form.querySelector('input[name="rt_payment"]:checked');
			if(!paymentChecked){
				alert("결제 수단을 선택하세요.");
				return false;
			}
			if(form.rt_name.value==""){
				alert("받는 분 성함을 입력하세요.");
				form.rt_name.focus();
				return false;
			}
			if(form.rt_tel.value==""){
				alert("받는 분 전화번호를 입력하세요.");
				form.rt_tel.focus();
				return false;
			}
			if(form.rt_addr.value==""){
				alert("받으실 상세 주소를 입력하세요.");
				form.rt_addr.focus();
				return false;
			}
			if(form.rt_startdate.value==""){
				alert("대여 시작일을 선택하세요.");
				form.rt_startdate.focus();
				return false; 
			}
			if(form.rt_enddate.value==""){
				alert("대여 종료일을 선택하세요.");
				form.rt_enddate.focus();
				return false;
			}
			return true;
		}
		
		function processOrder(){
			const form = document.rt_reg_frm;
			const rentalInfo = {
				mb_id:form.mb_id.value
				, rt_days:form.rt_days.value
				, rt_shipfee:form.rt_shipfee.value
				, rt_amount:form.rt_amount.value
				, rt_regdate:form.rt_regdate.value
				, rt_payment:form.querySelector('input[name="rt_payment"]:checked')?.value || ""
				, rt_state:form.rt_state.value || 0
				, rt_invoice:form.rt_invoice.value || ""
				, rt_name:form.rt_name.value
				, rt_tel:form.rt_tel.value
				, rt_zipcode:form.rt_zipcode.value
				, rt_addr:form.rt_addr.value
				, rt_req:form.rt_req.value
				, rt_startdate:form.rt_startdate.value
				, rt_enddate:form.rt_enddate.value
			};
			
			const detailList = [];
			const types = document.querySelectorAll('input[name^="detailList"][name$=".rd_type"]');
			const serial = document.querySelectorAll('input[name^="detailList"][name$=".rd_serial"]');
			const quantities = document.querySelectorAll('input[name^="detailList"][name$=".rd_quantity"]');
			
			for(let i=0; i<types.length; i++){
				detailList.push({
					rd_type:types[i].value
					,rd_serial:serial[i].value
					,rd_quantity:quantities[i].value
				});
			}
			const rentalRequest = {
				rentalInfo: rentalInfo
				, detailList: detailList
			}
			sendOrder(rentalRequest);
		}
		
		function sendOrder(data){
			fetch('/user/rental/register', {
				method: 'POST'
				, headers: {
					'content-type': 'application/json'
					} , body: JSON.stringify(data)
			})
			.then(response=>{
				if(!response.ok) throw new Error('네트워크 응답 없음');
				return response.text();
			})
			.then(msg => {
				if(msg === 'success') {
					alert("대여 신청이 완료되었습니다.");
					location.href = "/user/rental/register_ok";	
			} else if (msg === 'login-required'){
				alert("로그인이 필요합니다.");
				location.href = "/user/member/login";
			}
				else {
				alert("신청 중 오류가 발생했습니다.");
			}})
			.catch(error=> {
				console.error('Error: ',error);
				alert("통신 오류가 발생했습니다. 다시 시도해주세요.");
			});
		}
	</script>


	
	<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>