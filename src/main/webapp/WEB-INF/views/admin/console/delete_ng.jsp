<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>
<%-- include 지시자로 JSP에서 공통으로 사용하는 소스코드를 포함시킨다. --%>

    <div class="banner">
    	<h2><span>Console Delete</span> RESULT</h2>
    </div>
    
    <link rel="stylesheet" href="/resources/css/console.css">
    
    <section>
    	<h3>콘솔 삭제 실패</h3>
    	
    	<div class="msg-wrap">
    		<p class="alert alert-danger">※삭제에 실패했습니다.</p>
    		<a href="/admin/console/list" class="btn btn-primary">콘솔 목록</a>
    	</div>
    </section>

<%@ include file="../include/footer.jsp" %>