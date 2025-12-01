<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

     <link rel="stylesheet" href="/resources/css/playstation.css">
    <div class="banner bn-ps-bg">
        <div class="b-box1 bbox30"></div>
        <div class="b-box2 bbox30"></div>
        <div class="b-box3 bbox30"></div>
        <div class="b-box4 bbox30"></div>
        <div class="main-title">
            <h2><span class="hg-blue">E</span>XCLU <span class="hg-ygrn">BLOCK</span> <span class="hg-blue">B</span>USTER</h2>
            <p>PS5만의 <span class="hg-blue">빠져들수</span> 밖에 없는 <span class="hg-ygrn">독보적</span>인 재미</p>
        </div>
        <video src="/resources/video/ps/ps-banner-video .mp4" autoplay loop muted preload></video>
    </div>
    <section>
        <div class="sub-title">
            <h3><span class="hg-blue">d</span>uel <span class="hg-ygrn">s</span>ense <span class="hg-blue">C</span>ONTROLLER</h3>
            <p>두개의 센서로 게임 플레이에 따른 색다른 조작감</p>
        </div>
		
        <div class="ps-duel-tabs-wrap">
            <input id="tab1" type="radio" name="tabs-btn" checked>
            <label for="tab1" class="tab1">적응형 트리거</label>
            <input id="tab2" type="radio" name="tabs-btn">
            <label for="tab2" class="tab2">햅틱 피드백</label>
            <input id="tab3" type="radio" name="tabs-btn">
            <label for="tab3" class="tab3">3D 오디오</label>
            <div class="ps-duel-tab-contents">
                <video src="/resources/video/ps/Adaptive.mp4" class="ps-duel-video1" muted autoplay playsinline loop></video>
                <div class="ps-duel-text1">
                    <h4>적응형 트리거</h4>
                    <p>버튼의 저항감을 조절하여 게임 내 다양한 액션에 따른 현실감을 높여줍니다 활을 당길 때 팽팽함이나 자동차 운전 시 엑셀 페달을 밟는 느낌 등 을 실제로 조작하는 것처럼 느낄 수 있습니다.</p>
                    <a href="" class="more-btn">MORE</a>
                </div>              
                <video src="/resources/video/ps/Haptic.mp4" class="ps-duel-video2" muted autoplay playsinline loop></video> 
                <div class="ps-duel-text2">
                    <h4>햅틱 피드백</h4>
                    <p>게임 속 다양한 상황에서 컨트롤러 진동을 통해 게임 속 상황을 더욱 현실감 있게 전달하는 기술입니다.  게임의 소리나 상황에 맞춰 다양한 질감의 미세한 진동을 구현해 촉각적인 피드백을 제공합니다.</p>
                    <a href="" class="more-btn">MORE</a>
                </div>
                <video src="/resources/video/ps/3dAudio.mp4" class="ps-duel-video3" muted autoplay playsinline loop></video>
                <div class="ps-duel-text3">
                    <h4>3D 오디오</h4>
                    <p> 내장 스피커 및 내장 마이크를 통해 3D 오디오 기술을 구현합니다. 360도 방향으로 생생하게 구현하여  적의 발소리나 총소리 등 방향성 있는 사운드를 정확하게 파악하며 몰입감을 높이는 기술입니다. </p>
                    <a href="" class="more-btn">MORE</a>
                </div>
            </div>
        </div>

        <div class="ps-console-wrap">
            <div class="ps-console-track">
                <div class="ps-console-bg console-bg-1">
                    <div class ="console-dark"></div>
                        <a href = "#" >access</a>
                </div>
                <div class="ps-console-bg console-bg-2">
                    <div class ="console-dark-bg"></div>
                        <a href = "#" >controller</a>
                </div>
                <div class="ps-console-bg console-bg-3">
                    <div class ="console-dark-bg"> </div>
                        <a href = "#" >headset</a>
                </div>
                <div class="ps-console-bg console-bg-4">
                    <div class ="console-dark-bg"> </div>
                        <a href = "#" >portal</a>
                </div>
            </div>
                        <div class="ps-console-track">
                <div class="ps-console-bg console-bg-1">
                    <div class ="console-dark-bg">   </div>
                        <a href = "#" >access</a>
                </div>
                <div class="ps-console-bg console-bg-2">
                    <div class ="console-dark-bg"></div>
                        <a href = "#" >controller</a>
                </div>
                <div class="ps-console-bg console-bg-3">
                    <div class ="console-dark-bg"></div>
                        <a href = "#" >headset</a>
                </div>
                <div class="ps-console-bg console-bg-4">
                    <div class ="console-dark-bg"></div>
                        <a href = "#" >portal</a>
                </div>
            </div>
        </div>

        <div class="sub-title">
            <h3><span class="hg-blue">E</span>XCLUSIVE <span class="hg-ygrn">G</span>AMES</h3>
            <p>몰입감 넘치는 스토리와 액션 게임들을 만나보세요</p>
        </div>

        <div class="ps-exclu-contents">
            <div class="ps-exclu-img-wrap">
                <div class="ps-exclu-img-1"></div>
                <div class="ps-exclu-img-1-2"></div>
            </div>
            <div class="ps-exclu-text-wrap">
                <h4>PS5의 독점작</h4>
                <p>독점작 게임들은 뛰어난 그래픽 풍부한 스토리텔링 등 단순 액션이 아닌 영화처럼 몰입감있는서사를 느낄수 있습니다. </p>
            </div>
            <div class="ps-exclu-img-2"></div>
            <div class="ps-exclu-img-3"></div>
            <p>캐릭터의 감정변화  인간관계  철학적인 주제 등 깊이있는 이야기로 다양한 게임들을 만나보세요</p>
        </div>

        <ul class="ps-slide">
            <li>
                <div class="ps-slide-bg"></div>
                <div class="ps-slide-info">
                    <h4>granturismo</h4>
                    <p>플레이어가 라이선스를 취득하고 차량을 수집, 튜닝하며 레이스에서 경쟁하는 과정을 통해 스스로 성장해 나가는 것이 핵심... </p>
                    <a href="#" class="more-btn">MORE</a>
                </div>
            </li>
            <li>
                <div class="ps-slide-bg"></div>
                <div class="ps-slide-info">
                    <h4>returnal</h4>
                    <p>우주비행사 셀린이 외계 행성 아트로포스에 불시착한 후, 죽으면 처음부터 시작하는 무한 루프에 갇혀, 자신의 과거...</p>
                    <a href="#" class="more-btn">MORE</a>
                </div>       
            </li>
            <li>
                <div class="ps-slide-bg"></div>
                <div class="ps-slide-info">
                    <h4>spiderman</h4>
                    <p>피터 파커와 마일즈 모랄레스, 두 스파이더맨이 힘을 합쳐 뉴욕을 지키는 이야기입니다. 전작 이후 피터는 연인...</p>
                    <a href="#" class="more-btn">MORE</a>
                </div>    
            </li>
            <li>
                <div class="ps-slide-bg"></div>
                <div class="ps-slide-info">
                    <h4>rift apart</h4>
                    <p>라쳇과 클랭크가 차원 이동 장치를 사용하여 다른 차원의 세계로 이동하고, 그 과정에서 '리벳'이라는 여성 캐릭터를 만나...</p>
                    <a href="#" class="more-btn">MORE</a>
                </div>
            </li>
            <li>
                <div class="ps-slide-bg"></div>
                <div class="ps-slide-info">
                    <h4>days gone</h4>
                    <p>전 세계적인 전염병 발발로 인해 거의 모든 사람이 감염되어 프리커라 불리는 괴물들로 변화해버린지 2년이 지난 세상에서...</p>
                    <a href="#" class="more-btn">MORE</a>
                </div>    
            </li>
        </ul>
            
        <div class="sub-title">
            <h3><span class="hg-blue">V</span>ARIOUS <span class="hg-ygrn">E</span>FFECTS</h3>
            <p>다양한 이펙트로 더욱  현실감있게 플레이</p>
        </div>
        <div class="ps-effect-dark-bg"></div>
        <div class="ps-effect-contents">
            <article>
                <div class="ps-effect-shadow">
                    <div class="ps-effect-info">
                        <h4>업스케일링</h4>
                        <p>업스케일링 효과는 AI 인공지능으로 이미지의 픽셀을 분석하고, 기존 이미지에 없던 디테....</p>
                        <a href="#" class="more-btn">MORE</a>
                    </div>
                </div>    
            </article>
            <article>
                <div class="ps-effect-shadow">
                    <div class="ps-effect-info">
                        <h4>향상된 성능</h4>
                        <p>GPU 성능이 크게 향상되고 60fps 또는최대 120fps를제공합니다.CPU는 기존과....</p>
                        <a href="#" class="more-btn">MORE</a>
                    </div>
                </div>    
            </article>
            <article>
                <div class="ps-effect-shadow">
                    <div class="ps-effect-info">
                        <h4>레이 트레이싱</h4>
                        <p> 빛의 물리적인 움직임을 모방하여 현실적인 그래픽을 구현하는기술입니다. 빛이 물체....</p>
                        <a href="#" class="more-btn">MORE</a>
                    </div>
                </div>
            </article>
        </div>
    </section>
<%@ include file="../include/footer.jsp" %>
