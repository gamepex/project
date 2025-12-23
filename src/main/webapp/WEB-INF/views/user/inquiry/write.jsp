<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/inquiry.css">

<div class="user-banner">
	<h2><span>고객</span> 문의</h2>
</div>

<main>
    <form action="/user/inquiry/write" method="post">
        <div class="title-wrap">
            <input type="text" name="title" placeholder="제목을 입력해 주세요.">
            <div class="author">작성자: ${mb_name}</div>
        </div>
        <div class="editor-wrap">
            <textarea id="editor" class="t-editor"></textarea>
            <%@ include file="/WEB-INF/views/util/uploadcare.jsp" %>
            <input type="hidden" name="imageUrl" id="imageUrl">
        </div>
        <button type="submit">등록하기</button>
    </form>
</main>

<script src="/resources/js/tinymce/tinymce.min.js"></script>
<script>
    tinymce.init({
        selector: '#editor',
        license_key: 'gpl',
        language: 'ko_KR',
        width: '100%',
        height: 600
    });
</script>


<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>