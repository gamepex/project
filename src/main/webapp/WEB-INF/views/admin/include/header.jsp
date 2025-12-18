<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLAYSTATION</title>
    <link rel="shortcut icon" href="/resources/img/common/favicon_apex.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/adm_common.css">
    <script src="/resources/js/jquery_1.12.4.min.js"></script>
    <script src="/resources/js/common.js"></script>
    <script src="/resources/ckeditor/ckeditor.js"></script>
</head>

<body>
    <header>
        <nav>
            <a href="/admin"  class="logo" ><h1>g<span class="hg-blue"><span class="hg-blue">:</span></span>p<span class="hg-ygrn">ex</span></h1> </a>
            <a href="#" id="trigger">
                <span></span>
                <span></span>
                <span></span>
            </a>
            
            <ul id="main-menu">
            <c:if test="${staff.staff_id eq 'admin' or staff.staff_id eq 'hong'}">
                 <li>
                    <a href="#">직원 관리</a>
                    <div class="sub-menu">
	                    <ul class="sub-menu-wrap">
                            <li><a href="/admin/staff/list">직원 목록</a></li> 
                            <li><a href="/admin/staff/unapproved_list">미승인 직원</a></li> 
	                    </ul>   
                    </div>
               	 </li>
               </c:if>
                  <li>
                    <a href="#">콘솔 게임기 관리</a>
                    <div class="sub-menu">
	                    <ul class="sub-menu-wrap">
                            <li><a href="/admin/console/register">콘솔 게임기 등록</a></li> 
                            <li><a href="/admin/console/list">대여가능 목록</a></li>
                            <li><a href="/admin/console/unable_list">입고 대기 목록</a></li> 
	                    </ul>   
                    </div>
                </li>
                 <li>
                    <a href="#">게임 타이틀 관리</a>
                    <div class="sub-menu">
	                    <ul class="sub-menu-wrap">
                            <li><a href="/admin/game_title/register">게임 타이틀 등록</a></li> 
                            <li><a href="/admin/game_title/list">게임 타이틀 목록</a></li> 
                            <li><a href="/admin/game_title/unable_list">입고 대기 목록</a></li> 
	                    </ul>   
                    </div>
                </li>
                <li>
                 <li>
                    <a href="#">대여 목록</a>
                    <div class="sub-menu">
	                    <ul class="sub-menu-wrap">
                            <li><a href="/admin/rental/list">콘솔 게임기</a></li> 
                            <li><a href="/admin/console/register">게임 타이틀</a></li> 
	                    </ul>   
                    </div>
                </li>
                <li>
                    <a href="#">커뮤니티</a>
                    <div class="sub-menu">
                    	<div class ="sub-info-wrap"></div>
	                       	<ul class="sub-menu-info">
	                              <li><a href="#">공지사항</a></li>
	                              <li><a href="#">FAQ</a></li>
	                              <li><a href="#">문의 게시판</a></li>
	                         </ul> 
	                         <ul class="sub-menu-info">
	                              <li><a href="#">매장 안내</a></li>
	                              <li><a href="#">희망 게임기 요청</a></li>
	                              <li><a href="#">희망 게임 요청</a></li>
	                        </ul>
                   </div>    
                </li>
            </ul>
            <c:if test="${staff == null }">
            <ul class="top-menu">
             	<li><a href="/admin/staff/register"><i class="bi bi-person-circle"></i></a></li>
                <li><a href="/admin" ><i class="bi bi-person-plus-fill"></i></a></li>
            </ul>
            </c:if>
            
            <c:if test="${staff != null }">
            <ul class="top-menu">
                <li><a href="/admin/staff/logout"><i class="bi bi-person-dash-fill"></i></a></li>
                <li><a href="/admin/staff/mypage"><i class="bi bi-person-lines-fill"></i></a></li>
            </ul>
            </c:if>
        </nav>
    </header>