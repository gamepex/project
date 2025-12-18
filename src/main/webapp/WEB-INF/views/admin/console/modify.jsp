<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>


	<div class = "banner">
		<h2><span>Console</span>Modify</h2>
	</div>
	
	<link rel ="stylesheet" href ="/resources/css/console.css">
	<script>
	$(function(){
		$('#con-state').keyup(function(){
			 var num = Number($('#con-state').val().trim());
			if(num > 3){
				$('#con-state-msg').text('0 : 대여가능 1 : 대여중 2 : 입고대기');
				$('#con-state').val('');
				$('#con-state').focus();
			}else{
				
			}
		});
	});
	</script>
	<section>
		<form action ="/admin/console/modify" method ="post" enctype ="multipart/form-data">
		<input type ="hidden"  name = "con_serial"  value ="${modify.con_serial}">
		<input type = "hidden" name = "con_thumbnail" value = "${modify.con_thumbnail}">
		<input type = "hidden" name = "staff_id" value = "${staff.staff_id }">
		
		<ul class = "con-reg-wrap">
			<li><input type ="text" name ="con_name" value = "${modify.con_name}" placeholder ="이름 입력" class ="form-control" autofocus required></li>
			<li><input type ="number" name ="con_price" value = "${modify.con_price}"placeholder ="가격 입력" class ="form-control" required></li>
			<li><input type ="number" name ="con_stock" value = "${modify.con_stock}" placeholder ="수량 입력" class ="form-control" required></li>
			<li><p id="con-state-msg"></p><li>
			<li>
				<input id="ps" type="radio" name="con_platform" value="playstation" <c:if test="${modify.con_platform eq 'playstation'}"> checked </c:if>>
	   			<label for="ps" class="btn btn-secondary btn-blank">playstation</label>
	   			<input id="xb" type="radio" name="con_platform" value="xbox" <c:if test="${modify.con_platform eq 'xbox'}"> checked </c:if>>
	   			<label for="xb" class="btn btn-secondary btn-blank">xbox</label>
	   			<input id="vr" type="radio" name="con_platform" value="virtual" <c:if test="${modify.con_platform eq 'virtual'}"> checked </c:if>>
	   			<label for="vr" class="btn btn-secondary btn-blank">virtual</label>
	   			<input id="ns" type="radio" name="con_platform" value="nintendo" <c:if test="${modify.con_platform eq 'nintendo'}"> checked </c:if>>
	   			<label for="ns" class="btn btn-secondary btn-blank">nintendo</label>
	   			<input id="st" type="radio" name="con_platform" value="steam" <c:if test="${modify.con_platform eq 'steam'}"> checked </c:if>>
	   			<label for="st" class="btn btn-secondary btn-blank">steam</label>
			</li>
			<li>
				<label>도서 표지</label>
				<input type = "file" name = "file" >
			</li>
			<li>
				<label></label>
				<textarea id ="contents" name ="con_content" class ="form-control" >${modify.con_content }</textarea>
				<script>
					var ckeditor_config ={
						width:'100%',
						height: '500px',
						resize_enable: false,
						enterMode: CKEDITOR.ENTER_BR,
						shiftEnterMode: CKEDITOR.ENTER_p,
						filebrowserUploadUrl:"/common/ckUpload"	
					};
					CKEDITOR.replace("contents",ckeditor_config);
				</script>
			</li>	
			<li>
				<button type="submit" class="btn btn-dark btn-lg">콘솔 수정</button>
				<a href="/admin/console/list" class="btn btn-primary btn-lg">콘솔 목록</a>
	   		</li>
		</ul>
		</form>
	</section>
<%@ include file = "../include/footer.jsp"%>















