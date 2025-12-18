<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/header.jsp"%>
	
	<div class ="banner">
		<h2><span class ="txt-blue"> Game </span><span class="txt-ygrn">Title</span> Register</h2>
	</div>
	
	<link rel ="stylesheet" href ="/resources/css/console.css">
	
	<section>
		<form action ="/admin/game_title/register" method ="post" enctype ="multipart/form-data">
		<input type="hidden" name="staff_id" value="${staff.staff_id }">
		
			<ul class ="con-reg-wrap">
				<li><input type ="text"  name ="ttl_serial" placeholder ="일련번호" class="form-control" autofocus required></li>
				<li><input type ="text"  name ="ttl_name"  placeholder ="게임 이름"  class="form-control"  required></li>
				<li><input type ="number"  name ="ttl_price" placeholder ="게임 가격" class="form-control" required></li>
				<li><input type ="number"  name ="ttl_stock" placeholder ="게임 수량" class="form-control" required></li>
	    		<li>
	    			<label>게임 플랫폼</label>
	    			<input id="ps" type="radio" name="ttl_platform" value="playstation" checked>
	    			<label for="ps"  class="btn btn-secondary" >playstation</label>
	    			<input id="xb" type="radio" name="ttl_platform" value="xbox">
	    			<label for="xb" class="btn btn-secondary" >xbox</label>
	    			<input id="vr" type="radio" name="ttl_platform" value="virtual">
	    			<label for="vr" class="btn btn-secondary" >virtual</label>
	    			<input id="ns" type="radio" name="ttl_platform" value="nintendo">
	    			<label for="ns" class="btn btn-secondary" >nintendo</label>
	    			<input id="st" type="radio" name="ttl_platform" value="steam">
	    			<label for="st" class="btn btn-secondary" >steam</label>
	    		</li>
   				 <li>
	    			<label>게임 장르</label>
	    			<input id="ac" type="radio" name="ttl_genre" value="액션" checked>
	    			<label for="ac"  class="btn btn-secondary" >액션</label>
	    			<input id="ad" type="radio" name="ttl_genre" value="어드벤처">
	    			<label for="ad" class="btn btn-secondary" >어드벤처</label>
	    			<input id="rp" type="radio" name="ttl_genre" value="롤플레잉">
	    			<label for="rp" class="btn btn-secondary" >롤플레잉</label>
	    			<input id="si" type="radio" name="ttl_genre" value="시뮬레이션">
	    			<label for="si" class="btn btn-secondary" >시뮬레이션</label>
	    			<input id="sh" type="radio" name="ttl_genre" value="슈팅">
	    			<label for="sh" class="btn btn-secondary" >슈팅</label>
	    		</li>
	    		<li>
	    			<label>게임 표지 </label>
	    			<input type="file" name="file" class="form-control">
	    		</li>
				<li>
	    			<label>게임 상세 설명</label>
	    			<textarea id="contents" name="ttl_content" class="form-control"></textarea>
					<script>
						var ckeditor_config = {
							width: '100%',
							height: '500px',
							resize_enable: false,
							enterMode: CKEDITOR.ENTER_BR, 
							shiftEnterMode: CKEDITOR.ENTER_P,
							filebrowserUploadUrl: "/common/ckUpload"
						};
				
						CKEDITOR.replace("contents", ckeditor_config);
					</script>
	    		</li>
	    		<li>
	    			<button type="submit" class="btn btn-lg btn-primary" disabled ="disabled">콘솔 등록</button>
	    			<a href="/admin/game_title/list" class="btn btn-lg btn-dark">콘솔 목록</a>
	    		</li>
			</ul>
		</form>
	</section>
	
<%@ include file ="../include/footer.jsp"%>

