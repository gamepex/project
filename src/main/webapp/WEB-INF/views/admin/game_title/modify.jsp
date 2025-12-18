<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>


	<div class = "banner">
		<h2><span class ="txt-blue"> Game </span><span class="txt-ygrn">Title</span>Modify </h2>
	</div>
	
	<link rel ="stylesheet" href ="/resources/css/console.css">
	
	<section>
		<form action ="/admin/game_title/modify" method ="post" enctype ="multipart/form-data">
		<input type ="hidden"  name = "ttl_serial"  value ="${modify.ttl_serial}">
		<input type = "hidden" name = "ttl_thumbnail" value = "${modify.ttl_thumbnail}">
		<input type = "hidden" name = "staff_id" value = "${staff.staff_id }">
		
		<ul class = "con-reg-wrap">
			<li><input type ="text" name ="ttl_name" value = "${modify.ttl_name}" class ="form-control" autofocus required></li>
			<li><input type ="number" name ="ttl_price" value = "${modify.ttl_price}"class ="form-control" required></li>
			<li><input type ="number" name ="ttl_stock" value = "${modify.ttl_stock}"class ="form-control" required></li>
			<li>
				<input id="ps" type="radio" name="ttl_platform" value="playstation" <c:if test="${modify.ttl_platform eq 'playstation'}"> checked </c:if>>
	   			<label for="ps" class="btn btn-secondary btn-blank">playstation</label>
	   			<input id="xb" type="radio" name="ttl_platform" value="xbox" <c:if test="${modify.ttl_platform eq 'xbox'}"> checked </c:if>>
	   			<label for="xb" class="btn btn-secondary btn-blank">xbox</label>
	   			<input id="vr" type="radio" name="ttl_platform" value="virtual" <c:if test="${modify.ttl_platform eq 'virtual'}"> checked </c:if>>
	   			<label for="vr" class="btn btn-secondary btn-blank">virtual</label>
	   			<input id="ns" type="radio" name="ttl_platform" value="nintendo" <c:if test="${modify.ttl_platform eq 'nintendo'}"> checked </c:if>>
	   			<label for="ns" class="btn btn-secondary btn-blank">nintendo</label>
	   			<input id="st" type="radio" name="ttl_platform" value="steam" <c:if test="${modify.ttl_platform eq 'steam'}"> checked </c:if>>
	   			<label for="st" class="btn btn-secondary btn-blank">steam</label>
			</li>
			 <li>
    			<label>게임 장르</label>
    			<input id="ac" type="radio" name="ttl_genre" value="액션"  <c:if test="${modify.ttl_genre eq '액션'}"> checked </c:if>>
    			<label for="ac"  class="btn btn-secondary" >액션</label>
    			<input id="ad" type="radio" name="ttl_genre" value="어드벤처" <c:if test="${modify.ttl_genre eq '어드벤처'}"> checked </c:if>>
    			<label for="ad" class="btn btn-secondary" >어드벤처</label>
    			<input id="rp" type="radio" name="ttl_genre" value="롤플레잉" <c:if test="${modify.ttl_genre eq '롤플레잉'}"> checked </c:if>>
    			<label for="rp" class="btn btn-secondary" >롤플레잉</label>
    			<input id="si" type="radio" name="ttl_genre" value="시뮬레이션" <c:if test="${modify.ttl_genre eq '시뮬레이션'}"> checked </c:if>>
    			<label for="si" class="btn btn-secondary" >시뮬레이션</label>
    			<input id="sh" type="radio" name="ttl_genre" value="슈팅" <c:if test="${modify.ttl_genre eq '슈팅'}"> checked </c:if>>
    			<label for="sh" class="btn btn-secondary" >슈팅</label>
    		</li>
			<li>
				<label>게임 표지</label>
				<input type = "file" name = "file" >
			</li>
			<li>
				<label>게임 상세 설명</label>
				<textarea id ="content" name ="ttl_content" class ="form-control" >${modify.ttl_content }</textarea>
				<script>
					var ckeditor_config ={
						width:'100%',
						height: '500px',
						resize_enable: false,
						enterMode: CKEDITOR.ENTER_BR,
						shiftEnterMode: CKEDITOR.ENTER_p,
						filebrowserUploadUrl:"/common/ckUpload"
						CKEDITOR.replace("contents",ckeditor_config)	;
					}
				</script>
			</li>
			<li>
				<button type="submit" class="btn btn-dark btn-lg">게임 수정</button>
				<a href="/admin/game_title/list" class="btn btn-primary btn-lg">게임 목록</a>
	   		</li>
		</ul>
		</form>
	</section>
<%@ include file = "../include/footer.jsp"%>















