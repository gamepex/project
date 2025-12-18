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
			<li><input id="mb-id" type ="text" name ="mb_id" placeholder ="아이디 입력" autofocus class ="form-control"></li>
			<li><p id ="id-check-msg"></p></li>
			<li><input type ="password" name ="mb_pw" placeholder ="비밀번호 입력"  class ="form-control"></li>
			<li><p id ="pw-check-msg"></p></li>
			<li><input type="password" name="mb_repw" placeholder="비밀번호 확인" class="form-control"></li>
			<li><p id ="repw-check-msg"></p></li>
			<li><input type ="text" name ="mb_name" placeholder ="이름 입력"  class ="form-control"></li>
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
				<input type ="text" name ="mb_zipcode"  readonly class ="form-contorl">
				<button type ="button" onclick ="getZipcode()" class="btn btn-primary" >우편번호 찾기</button>
			</li>
			<li>
				<button id= "reg-btn" type ="button" onclick ="checkData()"class="btn btn-primary" disabled ="disabled">회원가입</button>
				<a href ="/user/member/login" class="btn btn-primary"  >로그인</a>
			</li>
		</ul>
	</form>
</section>

<script>
function getZipcode(){
	window.open('/user/member/get_zipcode','Get Zipcode', 'width=350', 'height=450','scrollbars =yes');
}
function checkData() {
	
	if(document.reg_frm.mb_id.value=="") { 
		alert("아이디 입력폼에 아이디를 입력하세요.");
		document.reg_frm.mb_id.focus(); 
		return; 
	}
	
	if(document.reg_frm.mb_pw.value=="") { 
		alert("비밀번호 입력폼에 비밀번호를 입력하세요.");
		document.reg_frm.mb_pw.focus(); 
		return;
	}
	
	if(document.reg_frm.mb_repw.value=="") {
		alert("비밀번호 확인 입력폼에 비밀번호를 입력하세요.");
		document.reg_frm.mb_repw.focus(); 
		return;
	}
	
	if(document.reg_frm.mb_pw.value != document.reg_frm.mb_repw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.reg_frm.mb_repw.value="";
		document.reg_frm.mb_repw.focus();
		return;
	}
	
	if(document.reg_frm.mb_name.value=="") {
		alert("이름 입력폼에 이름을 입력해 주세요.");
		document.reg_frm.mb_name.focus(); 
		return;
	}
	
	if(document.reg_frm.mb_mail.value=="") {
		alert("메일 입력폼에 이메일을 입력해 주세요.");
		document.reg_frm.mb_mail.focus(); 
		return;
	}
	
    var str=document.reg_frm.mb_mail.value; 
    var atPos = str.indexOf('@'); 
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(','); 
    var eMailSize = str.length; 

    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('이메일 형식이 잘못되었습니다.\n다시 입력해 주세요!');
	      document.reg_frm.mb_mail.focus();
		  return;
    }
    
	if(document.reg_frm.mb_phone.value=="") { 
		alert("전화번호 입력폼에 전화번호를 입력하세요.");
		document.reg_frm.mb_phone.focus(); 
		return;
	}
	
	document.reg_frm.submit(); 
	
}
</script>













<%@ include file="../include/footer.jsp"%>






