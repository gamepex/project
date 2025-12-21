<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<div class="banner">
	<h2><span>고객</span> 문의</h2>
</div>

<section>
    <textarea id="editor"></textarea>
</section>

<script src="/resources/js/tinymce/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: '#editor',
        license_key: 'gpl',
        language: 'ko_KR'
    });
</script>


<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>