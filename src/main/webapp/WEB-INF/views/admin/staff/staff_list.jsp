<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<div class="adm-bnr">
	<h2><span>Staff</span> LIST</h2>
</div>
    
<section>
	<div class="search-wrap">
		<input type="search" id="staff-search" placeholder="검색어 입력" class="form-control">
	</div>
	
	<ul class="staff-info-wrap">
	<c:forEach var="svo" items="${staffList}">
		<li>
			<h4>${svo.staff_name } 님</h4>
			<p>아이디 : ${svo.staff_id }</p>
			<p>
			<c:if test="${svo.staff_gender eq 'm' }">
				성 별 : 남자
			</c:if>
			<c:if test="${svo.staff_gender eq 'f' }">
				성 별 : 여자
			</c:if>
			</p>
			<p>부 서 : ${svo.staff_part }</p>
			<p>직 급 : ${svo.staff_position }</p>
			<p>메 일 : ${svo.staff_mail }</p>
			<p>전 화 : ${svo.staff_phone }</p>
			<p>
			<c:if test="${svo.staff_approval != 0 }">
				승인여부 : 승인
			</c:if>
			<c:if test="${svo.staff_approval == 0 }">
				승인여부 : 미승인
			</c:if>
			</p>
			<p>등록일 : <fmt:formatDate value="${svo.staff_regdate }" pattern="yyyy년 MM월 dd일" /></p>
			<p>수정일 : <fmt:formatDate value="${svo.staff_moddate }" pattern="yyyy년 MM월 dd일" /></p>
			<c:if test="${staff.staff_id eq 'admin' }">
			<div class="staff-group-btn">
				<a href="/admin/staff/modify?staff_id=${svo.staff_id }" class="btn btn-success btn-lg">수 정</a>
				<a href="/admin/staff/delete?staff_id=${svo.staff_id }" class="btn btn-danger btn-lg">삭 제</a>
			</div>
			</c:if>
		</li>
	</c:forEach>
	</ul>
	
</section>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>