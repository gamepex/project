<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
 <link rel="stylesheet" href="/resources/css/steam.css">

    <div class="banner st-bn-bg">
        <div class="b-box1 bbox30"></div>
        <div class="b-box2 bbox30"></div>
        <div class="b-box3 bbox30"></div>
        <div class="b-box4 bbox30"></div>
        <video src="/resources/video/sd/st-bn-dt-video.mp4" autoplay loop muted preload></video>
        <div class="main-title">
            <h2><span class="hg-blue">s</span>team <span class="hg-ygrn">deck</span> <span class="hg-blue">e</span>verywhere</h2>
            <p>언제 <span class="hg-blue">어디서나</span> 열리는 <span class="hg-ygrn">스팀</span>의 세계</p>
        </div>
    </div>
    
    <section>
        <div class="sub-title">
            <h3><span class="hg-blue">a</span>dvan<span class="hg-ygrn">t</span>age</h3>
            <p>스팀덱 만의 장점</p>
        </div>
        <div class="st-adv-container">
            <div class="st-adv-wrap">
                <div class="st-adv-bg adv-bg1">
                    <h4>아날로그 스틱</h4>
                    <a href="#" class="more-btn st-adv-btn">more</a>
                </div>
                <div class="st-adv-contents">
                    <div class="st-adv-bar"></div>
                    <p>Steam Deck은 실제 크기의 엄지스틱, 버튼, 트리거가 손이 닿는 위치에 배치되어 장시간 게임을 플레이하는 데 최적화되어 있습니다.</p>
                </div>
            </div>
            <div class="st-adv-wrap">
                <div class="st-adv-contents adv-under-contents">
                    <div class="st-adv-bar"></div>
                    <p>Steam Deck에 로그인하면, PC를 사용할 때처럼 전체 Steam 라이브러리가 표시되며 즐겨찾기가 PC에서 설정한 그대로 표시됩니다.</p>
                </div>
                <div class="st-adv-bg adv-bg2">
                    <h4>스팀 라이브러리</h4>
                    <a href="#" class="more-btn st-adv-btn">more</a>
                </div>
                <div class="st-adv-contents adv-under-contents2">
                    <div class="st-adv-bar"></div>
                    <p>Steam Deck에 로그인하면, PC를 사용할 때처럼 전체 Steam 라이브러리가 표시되며 즐겨찾기가 PC에서 설정한 그대로 표시됩니다.</p>
                </div>
            </div>
            <div class="st-adv-wrap">
                <div class="st-adv-bg adv-bg3">
                    <h4>콘솔 환경을 그대로</h4>
                    <a href="#" class="more-btn st-adv-btn">more</a>
                </div>
                <div class="st-adv-contents">
                    <div class="st-adv-bar"></div>
                    <p>SteamOS에서 경험할 수 있는 콘솔 환경은 컨트롤과 Steam Deck에 맞춰 개발되어 게이밍을 쉽게 즐길 수 있는 기회를 제공합니다.</p>
                </div>
            </div>
        </div>


        <div class="sub-title">
            <h3><span class="hg-blue">p</span>opular <span class="hg-ygrn">g</span>ames</h3>
            <p>스팀덱의 인기게임 top3</p>
        </div>
        <div class="st-pg-wrap">
            <input id="tab1" type="radio" name="tabs-btn" checked>
            <label for="tab1" class="tab1">holloew knight</label>
            <input id="tab2" type="radio" name="tabs-btn">
            <label for="tab2" class="tab2">palworld</label>
            <input id="tab3" type="radio" name="tabs-btn">
            <label for="tab3" class="tab3">hogwarts legacy</label>
            <a href="#" class="more-btn">buy</a>

            <div class="st-pg-contents">
                <div class="st-pg-vd1">
                    <video src="/resources/video/sd/st-pg-video1.mp4" loop controls preload muted></video>
                </div>
                <div class="st-pg-vd2">
                    <video src="/resources/video/sd/st-pg-video2.mp4" loop controls preload muted></video>
                </div>
                <div class="st-pg-vd3">
                    <video src="/resources/video/sd/st-pg-video3.mp4" loop controls preload muted></video>
                </div>
            </div>
        </div>

        
        <div class="sub-title">
            <h3><span class="hg-blue">d</span>ocking <span class="hg-ygrn">s</span>tation</h3>
            <p>확장성을 끌어올리는 도킹 스테이션</p>
        </div>
        <div class="st-ds-wrap">
            <div class="st-ds-contents">
                <h4>높아진 활용도 다양한 플레이</h4>
                <p>도킹 스테이션은 Steam Deck이 가진 높은 확장성을 한 차원 더 끌어올립니다. Deck을 도킹하여 TV와 연결하고...</p>
                <div class="st-ds-btn-wrap">
                    <a href="#" class="more-btn st-ds-btn">spec</a>
                    <a href="#" class="more-btn st-ds-btn">buy</a>
                </div>
            </div>
            <div class="st-ds-bg"></div>
        </div>
    </section>
   <%@ include file="../include/footer.jsp" %>