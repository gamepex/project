<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file ="../include/header.jsp"%>
	
	<div class ="banner">
		<h2><span class ="txt-blue">Console</span> Register</h2>
	</div>
	
	<link rel ="stylesheet" href ="/resources/css/console.css">
	<script src="/resources/ckeditor/ckeditor.js"></script>
	
	<section>
		<form action ="/admin/console/register" method ="post" enctype ="multipart/form-data">
		<input type="hidden" name="staff_id" value="${staff.staff_id }">
			<ul class ="con-reg-wrap">
				<li><input type ="text"  name ="con_serial" placeholder ="일련번호" class="form-control" autofocus required></li>
				<li><input type ="text"  name ="con_name"  placeholder ="콘솔 이름"  class="form-control"  required></li>
				<li><input type ="number"  name ="con_price" placeholder ="콘솔 가격" class="form-control" required></li>
				<li><input  type ="number"  name ="con_stock" placeholder ="콘솔 수량" class="form-control" required></li>
	    		<li>
	    			<label>콘솔 플랫폼</label>
	    			<input id="ps" type="radio" name="con_platform" value="playstation" checked>
	    			<label for="ps"  class="btn btn-secondary" >playstation</label>
	    			<input id="xb" type="radio" name="con_platform" value="xbox">
	    			<label for="xb" class="btn btn-secondary" >xbox</label>
	    			<input id="vr" type="radio" name="con_platform" value="virtual">
	    			<label for="vr" class="btn btn-secondary" >virtual</label>
	    			<input id="ns" type="radio" name="con_platform" value="nintendo">
	    			<label for="ns" class="btn btn-secondary" >nintendo</label>
	    			<input id="st" type="radio" name="con_platform" value="steam">
	    			<label for="st" class="btn btn-secondary" >steam</label>
	    		</li>
	    		<li>
	    			<label>콘솔 표지 </label>
	    			<input type="file" name="file" class="form-control">
	    		</li>
				<li>
	    			<label>도서 상세 설명</label>
	    			<textarea id="contents" name="con_content" class="form-control"></textarea>
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
	    			<button id ="reg-btn" type="submit"  class="btn btn-lg btn-primary" >콘솔 등록</button>
	    			<a href="/admin/console/list" class="btn btn-lg btn-dark">콘솔 목록</a>
	    		</li>
			</ul>
		</form>
	</section>
	
<%@ include file ="../include/footer.jsp"%>

