<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span class="txt-blue">C</span>onsole <span class="txt-ygrn">R</span>ental <span class="txt-blue">R</span>EGISTER</h2>
	</div>

	<link rel="stylesheet" href="/resources/css/user.css">
	<style>
		*{margin:0; padding:0; box-sizing:border-box;}
		label {width:145px;}
		.rt_show_item li:nth-child(3) {display:flex;}
		.rt_show_item li:nth-child(3) label {width:50px;}
		#rt_quantities {width:50px;}
		.form-control-plaintext{color:white;}
		.rt-info-deli li, .rt-info-deli ~ ul > li{display:flex;}
		.rt-info-deli li label, .rt-info-deli ~ ul > li label {padding:auto; background:blue;}
		.rt-info-deli li input {background:green;}
		.rt-info-deli li:nth-child(6) {justify-content:space-between;}
		.rt-info-deli li:nth-child(6) div {display:flex; justify-content:space-between;}
		#postcode {width:250px;}

		.rt-info-rent li:first-child{display:inline;}
		.form-text { background:yellow;margin-left:130px; font-size:11px; color:darkred;text-align:center; line-height:99%; }
		
		.rt-info-rent li:last-child button {margin:0 auto;}
		#rtBtn{ position:relative; overflow:hidden; transition: all 0.3s;}
		#rtBtn::before, #rtBtn::after { display:inline-block; opacity:0; transition:all 0.3s ease-in 0.1s;}
		#rtBtn::before{ content:'['; margin-right:15px; transform:translateX(20px); }
		#rtBtn::after{ content:']'; margin-left:15px; transform:translateX(-20px); }
		#rtBtn.btn-active::before, #rtBtn.btn-active::after { opacity:1; color:#caca64; transform:translateX(0px) scale(1.5) ;}

	
	</style>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	$(function(){
		$('#rtBtn').mouseenter(function(){
			$(this).removeClass('btn-success').addClass('btn-active');
			});
	
		$('#rtBtn').mouseleave(function(){
			$(this).removeClass('btn-active').addClass('btn-success');
			});
	});
	
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
		
		
		$(function(){
			let today = new Date().toISOString().split('T')[0];
			$('#rt_startdate').attr('min', today);
			// ① new Date() 현재 시스템의 날짜와 시간 객체를 생성 (예: Mon Dec 22 2025 10:45:00 GMT+0900...)
			// ② .toISOString() 날짜 객체를 ISO 8601이라는 국제 표준 문자열 형식으로 변환.
			// 결과: "2025-12-22T01:45:00.000Z"
			// 특징: 항상 YYYY-MM-DD 형식을 포함하며, 날짜와 시간 사이에 'T'가 들어갑니다.
			// ③ .split('T')[0] 문자열을 'T' 문자를 기준으로 쪼개서 배열로 만듭니다.
			// split('T') 결과: ["2025-12-22", "01:45:00.000Z"]
			// [0] (첫 번째 요소): 앞부분인 "2025-12-22"만 가져옵니다.
			// 사용자가 과거 날짜를 선택하지 못하게 막으며, <input type="date">가 요구하는 YYYY-MM-DD 형식에 일치시킴
			
			$('#rt_quantities, #rt_days, #rt_startdate').off('input').on('input', function(){
				calculateTotal();
			});
			function calculateTotal() {
				const price = Number($('#per_price').val());
				const qty = Number($('#rt_quantities').val());
				const days = parseInt($('#rt_days').val());
				const startDateVal = $('#rt_startdate').val();
				
				const setAmount = price*qty*days;
				let shipfee = (setAmount > 0 && setAmount < 70000)?5000:0;
				$('#rt_shipfee').val(shipfee);
				$('#rt_amount').val(setAmount+shipfee);
				
				if (startDateVal && !isNaN(days) && days >= 3){
					const startDate = new Date(startDateVal);
					startDate.setDate(startDate.getDate()+days);
					
					const year = startDate.getFullYear();
					const month = String(startDate.getMonth()+1).padStart(2,'0');
					const day = String(startDate.getDate()).padStart(2,'0');
					
					// 변수를 문자열 안에 넣을 때는 일반 따옴표(')가 아닌 키보드 숫자 1 왼쪽에 있는 **백틱()**을 사용해야 함.
					$('#rt_enddate').val(year+"-"+month+"-"+day);
				} else {$('#rt_enddate').val('');}
			}

			$('#insertMbInfo').click(function(){
				$('#rt_name').val($('#mb_name').val());
				$('#rt_tel').val($('#mb_phone').val());
				$('#postcode').val($('#mb_zipcode').val());
				$('#address').val($('#mb_addr').val());
				$('#detailAddress').val($('#mb_addr_detail').val());
				
				$('#rt_name, #rt_tel, #postcode, #address, #detailAddress').prop('readonly',true).css('background-color', '#e9ecef');;
				$('#searchZip').prop('disabled',true);
				$('#modiInfo').prop('disabled',false);
			});
			
			$('#modiInfo').click(function(){
				$('#rt_name, #rt_tel, #postcode, #address, #detailAddress').prop('readonly',false).val('').css('background-color', '#fff');
				$('#searchZip').prop('disabled',false);
				$(this).prop('disabled',true);
				$('#rt_name').focus();
			});
			
			$('#rt_reg_frm').on('submit', function(){
				const amount = Number($('#rt_amount').val());
				const days = Number($('#rt_days').val());
				
				if (!days) { return false;
				} else if (days < 3){
					alert("최소 대여 기간은 3일입니다.");
					return false;
				}
				if(!amount || amount === 0){
					alert("대여 정보(수량, 일수)를 정확히 입력해주세요.");
					return false;
				} return true;
			});
		});
	</script>
	<section>
		<form id="rt_reg_frm"name="rt_reg_frm" action="/user/rental/register" method="post">
			<input type="hidden" name="con_serial" value="${item.con_serial}">
			<input type="hidden" name="mb_id" value="${m.mb_id}">

		<!-- <div class="rt-wrap"> -->
			<div class=rt_left_wrap>
				 <div class="rt-item-info-wrap">
					 <h5>대여 상품 정보</h5>
					 <ul class="rt_show_item">
						<li>
							<img src="/attach/${item.con_thumbnail}">
						</li>
						<li>
							<p>${item.con_name}</p>
							<p>제조사 : ${item.con_platform}</p>
							<h6>가격 : <fmt:formatNumber value="${item.con_price}" pattern="#,###,###"/>원</h6>
							<input type="hidden" id="per_price" value="${item.con_price}">
						</li>
						<li>
							<label>수량 : </label>
							<input id="rt_quantities" type="number" name="rt_quantities" value="1" min="1" class="form-control">
							<!-- 플러스 마이너스 버튼 만들기 // 장바구니에서 기능 만들면서 같이 추가-->
						</li>
					</ul>
				 </div>
				 <div class="rt-user-info-wrap">
					 <h5>주문/배송 정보</h5>
					 <ul class="rt-user-deli">
						<li>
							<h6>주문자</h6>
							<div>
								<input type="text" id="mb_name" value="${m.mb_name}"readonly class="form-control-plaintext">
								<input type="text" id="mb_phone" value="${m.mb_phone}"readonly class="form-control-plaintext">
							</div>
						</li>
						<li>
							<input type="text" id="mb_addr" value="${m.mb_addr}"readonly class="form-control-plaintext">
							<div>
								<input type="text" id="mb_addr_detail" value="${m.mb_addr_detail}"readonly class="form-control-plaintext">
								<input type="text" id="mb_zipcode" value="${m.mb_zipcode}"readonly class="form-control-plaintext">
							</div>
						</li>
					</ul>
					
					<ul class="rt-info-deli">
						<li>
							<h6>배송지 정보</h6>
							<!-- space-between -->
							<div>
								<button id="insertMbInfo"type="button" >주문자 정보와 동일</button>
								<button id="modiInfo"type="button" disabled>정보 수정</button>					
							</div>
						</li>
						<li>
							<input id="rt_name" type="text" name="rt_name" placeholder="받는 분 성함" required class="form-control">
							<input id="rt_tel" type="tel" name="rt_tel" placeholder="받는 분 번호" required class="form-control">
						</li>
						<li>
							<input type="text" id="postcode" name="rt_zipcode" placeholder="우편번호" readonly class="form-control">
							<input id="searchZip" type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
						</li>
						<li>
							<input type="text" id="address" name="rt_addr" placeholder="주소" readonly class="form-control">
						</li>
						<li>
							<input type="text" id="detailAddress" name="rt_addrdet" placeholder="상세주소" class="form-control">
						</li>
					</ul>
					
					<ul>
						<li><h6>배송 메모</h6></li>
						<li>
							<select name="rt_req" class="form-select form-select-sm">
								<option selected>배송메모를 선택해주세요.</option>
								<option value="배송 전에 미리 연락 바랍니다." >배송 전에 미리 연락 바랍니다.</option>
								<option value="부재 시 연락주세요." >부재 시 연락주세요.</option>
								<option value="부재 시 경비실에 맡겨 주세요.">부재 시 경비실에 맡겨 주세요.</option>
								<option value="부재 시 문 앞에 놓아주세요.">부재 시 문 앞에 놓아주세요.</option>
								<option value="null">없음</option>
							</select>
						</li>
					</ul>
				 </div>
			 </div>
			 
			 <div class=rt_right_wrap>
				<div class="rt-rent-info-wrap">
					<h5>대여 정보</h5>
					<ul class="rt-info-rent">
						<li>
							<label>대여 기간(일): <br><span id="letusermin" class="form-text">* 대여 기간은 최소 3일입니다.</span></label>
							<input id="rt_days" type="number" name="rt_days" placeholder="대여일수" min="3" required class="form-control"  aria-describedby="letusermin">
						</li>
						<li><label>대여 시작일 : </label><input id="rt_startdate" type="date" name="rt_startdate" required class="form-control"></li>
						<li><label>대여 종료일 : </label><input id="rt_enddate" type="date" readonly placeholder="시작일 선택 시 자동 계산" class="form-control"></li>
					</ul>
				</div>
				<div class="rt-pay-info-wrap">
					<h5>최종 결제금액</h5>
					<ul>
						<li><label>배송비 : </label><input id="rt_shipfee" type="number" name="rt_shipfee" readonly class="form-control"></li>
						<li><label>총 결제금액 : </label><input id="rt_amount" type="number" name="rt_amount" readonly class="form-control"></li>
					</ul>
				</div>
				<div class="rt-payment-wrap">
					<h5>결제 방법</h5>
					<ul>
						<li>
							<input id="c" type="radio" name="rt_payment" value="0" checked><label for="c"> 신용카드</label>
							<input id="b" type="radio" name="rt_payment" value="1"><label for="b"> 계좌이체</label>
						</li>
						<li>
							<input id="t" type="radio" name="rt_payment" value="2"><label for="t"> 무통장입금</label>
							<input id="e" type="radio" name="rt_payment" value="3"><label for="e"> 그 외</label>
						</li>
					</ul>
				</div>
				<div>
					<!-- <ul>
						<li>
							<input id="checkDefault" type="checkbox" value="" class="form-check-input">
							<label class="form-check-label" for="checkDefault"> 전체 동의 </label>
						</li>
						<li>
							<input id="checkChecked" type="checkbox" value="" class="form-check-input">
							<label class="form-check-label" for="checkChecked"> 구매조건 확인 및 결제 진행에 동의</label>
						</li>
					</ul> -->
					<button id="rtBtn" type="submit" class="btn btn-success">대여 하기</button>
				</div>
			</div>
		<!-- </div> -->
		</form>
	</section>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>