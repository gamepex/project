<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/staff.css">
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="adm-bnr">
    <h2><span>Staff</span> MODIFY</h2>
</div>

<c:if test="${not empty resultMsg}">
  <p class="alert alert-${alertType} text-center">
    ${resultMsg}
  </p>
</c:if>

<section>
	<form name="modi_frm" action="/admin/staff/modify" method="post">
		<ul class="staff-modi-frm">
			<li><p>아이디 : ${svo.staff_id}</p></li>
			<li><input type="hidden" name="staff_id" value="${svo.staff_id}"></li>
			<li>
				<p class="d-inline-block">이름 : </p>
				<input type="text" id="staff_name" name="staff_name" value="${svo.staff_name}">
			</li>
			<li>
				<p class="d-inline-block">사번 : </p>
				<input type="number" name="staff_no" value="${svo.staff_no}">
			</li>
			<li>
				<input type="radio" id="male" name="staff_gender" value="m" ${svo.staff_gender eq 'm' ? 'checked="checked"' : ''}>
				<label for="male" class="btn btn-secondary btn-blank">남성</label>
				<input type="radio" id="female" name="staff_gender" value="f" ${svo.staff_gender eq 'f' ? 'checked="checked"' : ''}>
				<label for="female" class="btn btn-secondary btn-blank">여성</label>
			</li>
			<li>
	            <label for="staff_birth">생년월일 : </label>
	            <input type="date" id="staff_birth" name="staff_birth" value="${svo.staff_birth}">
	       	</li>
	       	<li>
				<p class="d-inline-block">부서 : </p>
				<select name="staff_part" class="form-select d-inline-block w-auto">
					<c:forEach var="part" items="${fn:split('인사,총무,영업,개발,운영', ',')}">
						<option value="${part}" ${part eq svo.staff_part ? 'selected' : ''}>${part}</option>
					</c:forEach>
				</select>
			</li>
	       	<li>
				<p class="d-inline-block">직급 : </p>
				<select name="staff_position" class="form-select d-inline-block w-auto">
					<c:forEach var="pos" items="${fn:split('사원,주임,대리,과장,차장,부장', ',')}">
						<option value="${pos}" ${pos eq svo.staff_position ? 'selected' : ''}>${pos}</option>
					</c:forEach>
				</select>
			</li>
			<li>
				<p class="d-inline-block">전화 : </p>
				<input type="tel" id="staff_phone" name="staff_phone" value="${svo.staff_phone}">
			</li>
	        <li>
	        	<p class="d-inline-block">메일 : </p>
	        	<input type="email" id="staff_mail" name="staff_mail" value="${svo.staff_mail}">
	        </li>
	        <li>
				<p class="d-inline-block">상태 : </p>
				<select name="staff_state" class="form-select d-inline-block w-auto">
					<option value="0" ${svo.staff_state == 0 ? 'selected' : ''}>미승인</option>
					<option value="1" ${svo.staff_state == 1 ? 'selected' : ''}>재직</option>
					<option value="2" ${svo.staff_state == 2 ? 'selected' : ''}>휴직</option>
					<option value="3" ${svo.staff_state == 3 ? 'selected' : ''}>퇴사</option>
				</select>
			</li>
		</ul>
		<div class="d-flex justify-content-center">
			<a href="/admin/staff/staff_list" class="btn btn-secondary btn-lg">취소</a>
			<button type="submit" class="btn btn-primary btn-lg">저장</button>
		</div>
	</form>
</section>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>



                