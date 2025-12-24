<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib uri= "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLAYSTATION</title>
    <link rel="shortcut icon" href="/resources/img/common/favicon_apex.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <script src="/resources/js/jquery_1.12.4.min.js"></script>
    <script src="/resources/js/common.js"></script>
</head>

<body>
    <header>
        <nav>
            <a href="/user" id="title-bn" class="logo" ><h1>g<span class="hg-blue"><span class="hg-blue">:</span></span>p<span class="hg-ygrn">ex</span></h1> </a>
            <a href="#" id="trigger">
                <span></span>
                <span></span>
                <span></span>
            </a>
            
            <ul id="main-menu">
                <li>
                    <a href="#">콘솔 게임기</a>
                    <div class="sub-menu">
                        <div class="sub-menu-wrap">
                            <div class="sub-menu-title">
                                <div class="sub-menu-ps-bg"></div>
                                <h6>console</h6>
                            </div>
                            <div class="sub-menu-info-wrap">
                                <ul class="sub-menu-info">
                                        <li><a href="/user/device/playstation">playstation</a></li>                                        
                                        <li><a href="/user/device/xbox">xbox</a></li>
                                        <li><a href="/user/device/nintendo">nintendo</a></li>
                                </ul> 
                                <ul class="sub-menu-info">
                                        <li><a href="/user/device/virtual">virtual</a></li>
                                        <li><a href="/user/device/steam">steamdeck</a></li>
                                </ul> 
                            </div>    
                        </div>
                    </div>
                </li>
                <li>
                    <a href="/user/rental/con_list">콘솔 게임기 대여</a>
                </li>
                <li>
                    <a href="/user/rental/title_list">게임 대여</a>
                </li>
                <li>
                    <a href="#">커뮤니티</a>
                    <div class="sub-menu">
                        <div class="sub-menu-wrap">
                            <div class="sub-menu-title">
                                <div class="sub-menu-vr-bg"></div>
                                <h6>community</h6>
                            </div>
                            <div class="sub-menu-info-wrap">
                                    <ul class="sub-menu-info">
                                    <li><a href="#">공지사항</a></li>
                                        <li><a href="#">FAQ</a></li>
                                        <li><a href="/user/inquiry/list">문의 게시판</a></li>
                                    </ul> 
                                    <ul class="sub-menu-info">
                                        <li><a href="#">매장 안내</a></li>
                                        <li><a href="#">희망 게임기 요청</a></li>
                                        <li><a href="#">희망 게임 요청</a></li>
                                    </ul> 
                            </div>    
                        </div>
                    </div>
                </li>
            </ul>
            <ul class="top-menu">
            	<li><a style="font-size: 20px; margin-top: 8px;" href="/admin">admin</a></li>
                <li><a href="/user/member/login"><i class="bi bi-person-plus-fill"></i></a></li>
                <li><a href="/user/member/mypage"><i class="bi bi-person-dash-fill"></i></a></li>
            </ul>
        </nav>
    </header>