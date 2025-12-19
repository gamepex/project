<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file ="../include/header.jsp"%>
<div class ="banner"></div>
<script>
	$(function(){
		$('#mb-id').keyup(function(){
			if($('#mb-id').val().trim().length === 0)){
				$('#id-check-msg').text('아이디를 입력하세요')
				$('#mb-id').val();
				$('#mb-id').focus();	
			}else{
				var id = {mb_id:$('mb-id').val()}
				$.ajax(
					{
						url: '/user/member/idcheck',
						type:'post',
						data: id,
						success:function(data){
							if(data ==='success'){
								$('#id-check-msg').text('중복된 아이디 입니다.');
								$('#mb-id').val('');
								$('#mb-id').focus();
								$('#reg-btn').attr('disable','disabled');
							}else{
								$('#id-check-msg').text('사용 가능한 아이디 입니다.');
								$('#id-check-msg').addClass('click')
								if($('#id-check-msg').hasClass('click') && $('#nick-check-msg').hasClass('click')){
									$(#'reg-btn').removeAtter('disabled');
								}
							}
						}
					}		
				)
			}	
		});
	});
	$(function(){
		$('#mb-nick').keyup(function(){
			if($('#mb-nickname').val().trim().length === 0)){
				$('#nick-check-msg').text('아이디를 입력하세요')
				$('#mb-nickname').val();
				$('#mb-nickname').focus();
			}else{
				var id = {mb_nickname:$('mb-nickname')}
				$.ajax(
					{
						url: '/user/member/nickcheck',
						type:'post',
						data: id,
						success:function(data){
							if(data ==='success'){
								$('#nick-check-msg').text('중복된 아이디 입니다.');
								$('#mb-nickname').val('');
								$('#mb-nickname').focus();
								$('#reg-btn').attr('disable','disabled');
							}else{
								$('#nick-check-msg').text('사용 가능한 아이디 입니다.');
								$('#nick-check-msg').addClass('click')
								if($('#id-check-msg').hasClass('click') && $('#nick-check-msg').hasClass('click')){
									$(#'reg-btn').removeAtter('disabled');
								}
							}
						}
					}		
				)
			}	
		});
	});
</script>
<section>
	<form name="reg_frm"  action ="/user/member/register" method ="post">
		<ul class ="reg-info-wrap">
			<li><input id="mb-id" type ="text" name ="mb_id" placeholder ="아이디 입력" autofocus required class="form-control"></li>
			<li><p id ="id-check-msg"></p></li>
			<li><input type ="password" name ="mb_pw" placeholder ="비밀번호 입력" required class ="form-control"></li>
			<li><p id ="pw-check-msg"></p></li>
			<li><input type="password" name="mb_repw" placeholder="비밀번호 확인" required class="form-control"></li>
			<li><p id ="repw-check-msg"></p></li>
			<li><input type ="text" name ="mb_name" placeholder ="이름 입력" required class ="form-control"></li>
			<li><input id ="mb-nickname" type ="text" name ="mb_nickname" placeholder ="닉네임 입력" class ="form-control"></li>
			<li><p id ="nick-check-msg"></p></li>
			<li>
				<input id = "m" type ="radio" name ="mb_gender" >
				<label for ="m" class="btn btn-primary" >남성</label>
				<input id = "w" type ="radio" name ="mb_gender" >
				<label for ="w" class="btn btn-primary" >여성</label>
			</li>
			<li><p>생년월일 :</p><input type ="date" name ="mb_birth"  class ="form-control"></li>
			<li><input type ="tel" name ="mb_phone" placeholder ="전화번호 입력"  class ="form-control"></li>
			<li>
				<input type="text" id="postcode" name="mb_zipcode"placeholder="우편번호">
				<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" id="address" name="mb_addr"placeholder="주소">
				<input type="text" id="detailAddress" name="mb_addrdet"placeholder="상세주소">
			</li>
			<li>
				<button id= "reg-btn" type ="button" onclick ="checkData()"class="btn btn-primary" disabled ="disabled">회원가입</button>
				<a href ="/user/member/login" class="btn btn-primary"  >로그인</a>
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
<%@ include file="../include/footer.jsp"%>