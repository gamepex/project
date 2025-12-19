<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

	<div class="banner">
		<h2><span class="txt-blue">I</span>tem <span class="txt-ygrn">R</span>ental <span class="txt-blue">C</span>ompleted</h2>
	</div>

	<link rel="stylesheet" href="/resources/css/rental.css">
	
	<section>
		<div>
			<label>주문 번호: </label><p>${rt_rt_no}</p>
		</div>
	</section>
	
	
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>