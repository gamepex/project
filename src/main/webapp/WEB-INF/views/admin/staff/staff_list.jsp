<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/staff.css">

<div class="adm-bnr">
    <h2><span>Staff</span> LIST</h2>
</div>

<section>
    <div class="search-wrap">
        <input type="search" id="staff_search" placeholder="검색어 입력" class="form-control">
    </div>

    <ul class="staff-info-wrap">
        <c:forEach var="svo" items="${staffList}">
            <li>
                <h4>${svo.staff_name} 님</h4>
                <p>사번 : ${svo.staff_no}</p>
                <p>아이디 : ${svo.staff_id}</p>
                <p>성별 : ${svo.staff_gender == 'm' ? '남성' : '여성'}</p>
                <p>생년월일 : ${svo.staff_birth}</p>
                <p>부서 : ${svo.staff_part}</p>
                <p>직급 : ${svo.staff_position}</p>
                <p>메일 : ${svo.staff_mail}</p>
                <p>전화 : ${svo.staff_phone}</p>
                <div class="d-flex justify-content-center">
	                <p class="staff-state">상태 : ${svo.staff_state == 0 ? '미승인' : (svo.staff_state == 1 ? '재직' : (svo.staff_state == 2 ? '휴직' : '퇴사'))}</p>
	                <c:if test="${sessionScope.staff.staff_id eq 'admin' and svo.staff_state == 0}">
	                	<button type="button" class="btn btn-primary btn-lg approve" data-staff-id="${svo.staff_id}">승인</button>
	                </c:if>
                </div>
                <p>등록일 : ${svo.staff_regdate}</p>
                <p>수정일 : ${svo.staff_moddate}</p>

                <c:if test="${sessionScope.staff.staff_id eq 'admin'}">
                    <div class="staff-group-btn">
                        <a href="/admin/staff/modify?staff_id=${svo.staff_id}" class="btn btn-success btn-lg">수정</a>
                        <a href="/admin/staff/delete?staff_id=${svo.staff_id}" class="btn btn-danger btn-lg">삭제</a>
                    </div>
                </c:if>
            </li>
        </c:forEach>
    </ul>
</section>

<script>
	document.addEventListener('click', async e => {
		
		//클릭된 승인 버튼 찾기 
		const btn = e.target.closest('.approve');
		if (!btn) return;
		
		const staff_id = btn.dataset.staffId;
		
		const res = await fetch('/admin/staff/approval/' + staff_id, {
		  method: 'POST'
		});
		
		const result = await res.text();
		if (result !== 'ok') return;
		
		const staff_state = btn.closest('li').querySelector('.staff-state');
		staff_state.textContent = '상태 : 재직';
		btn.remove();
	});
</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>