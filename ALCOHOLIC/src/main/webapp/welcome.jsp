<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>ALCOHOLIC</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do" rel="stylesheet">

	<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">

	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">

	<link rel="stylesheet" href="css/aos.css">

	<link rel="stylesheet" href="css/ionicons.min.css">

	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">


	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/style.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

	<style>
		#b2 {
			width: 440px;
			/* 부모 요소의 너비에 100% */
			height: 330px;
			background-size: 30%;
			/* 이미지 사이즈 요소에 맞게 조정되도록 설정 */
			margin-left: 60px;
			margin-bottom: 50px;
		}

		#degree{
			color:white;
		}
	/*메뉴바에 검색기능 추가*/
      .search_text {
         margin-right: 60px;
         margin-bottom: 2px;
      }

      .search_text .form-control2 {
         color: #000;
      }

      .btn-search{
         background-color: #3dbf78;
         border:1px solid #3dbf78;
         color: #000;
         cursor: pointer;
      }

      .btn-search:hover{
         background-color: #000;
         color:#3dbf78;
      }
      .block-20{
         width:300px;
      }
      .click_img{
         position:absolute;
         top:310px;
         margin-left:900px;
      }
    
  </style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
      <div class="container">
         <h2 id="login-logo"></h2>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
            aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="oi oi-menu"></span> MENU
         </button>
         <div class="collapse navbar-collapse" id="ftco-nav">
            <ul class="navbar-nav ml-auto">
               <li class="nav-item active"><a href="welcome.jsp" class="nav-link">Home</a></li>
               <li class="nav-item "><a href="menu.jsp" class="nav-link">Menu</a></li>
               <li class="nav-item"><a href="ingredient.jsp" class="nav-link">Ingredient</a></li>
               <li class="nav-item"><a href="feed.jsp" class="nav-link">Feed</a></li>
               <li class="nav-item"><a href="board.jsp" class="nav-link">Board</a></li>
               <li class="nav-item"><a href="mypage.jsp" class="nav-link">Mypage</a></li>
               <li class="nav-item"><a href="LogoutService" class="nav-link">Logout</a></li>
            </ul>
         </div>
      </div>

      <div class="search_text">
         <input type="text" class="form-control2" id="searchQuery3" placeholder="검색어를 입력하세요">
         <button type="button" class="btn-search">
            <i class="fas fa-search" id="icon-search"></i>
         </button>
      </div>
   </nav>
	<!-- END nav -->

	<section class="home-slider owl-carousel img" style="background-image:url(images/back4.jpg);">
		<div class="slider-item">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text align-items-center" data-scrollax-parent="true">

					<div class="col-md-6 col-sm-12">
						<span class="subheading">다양한 칵테일을 만들어보세요!</span>
						<h1 class="mb-4">Singapore Sling</h1>
						<p class="mb-4 mb-md-5">One bartender made a cocktail that looked like fruit juice for women who
							could not drink in public.</p>
					</div>
					<div class="col-md-6">
						<img src="images/Singapore Sling.jpg" class="img-fluid" alt="">
					</div>

				</div>
			</div>
		</div>

		<div class="slider-item" style="background-image:url(images/back7.jpg);" id="back7">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text align-items-center" data-scrollax-parent="true">

					<div class="col-md-6 col-sm-12 order-md-last">
						<span class="subheading">당신의 칵테일을 공유하세요!</span>
						<h1 class="mb-4">Silver Bullet</h1>
						<p class="mb-4 mb-md-5">The ratio of gin to scotch whisky can vary widely, and it can also be
							made into a shooter.</p>
					</div>
					<div class="col-md-6">
						<img src="images/Silver_Bullet.jpg" class="img-fluid2" alt="" id=b2>
					</div>
				</div>
			</div>
		</div>

		<div class="slider-item" style="background-image: url(images/back5.jpg);">
			<div class="overlay"></div>
			<div class="container">
				<div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

					<div class="col-md-7 col-sm-12 text-center">
						<span class="subheading">칵테일에 관심있는 여러분을 환영합니다!</span>
						<h1 class="mb-4">YOU CAN DO EVERYTHING WITH ALCOHOLIC</h1>
						<p class="mb-4 mb-md-5">Make your own cocktail and share!</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-about d-md-flex">
		<div class="one-half img" style="background-image: url(images/originc.png);"></div>
		<div class="one-half">
			<div class="heading-section">
				<h2 class="mb-4">왜 사람들은 <span class="#"> 칵테일</span> 을 좋아할까요?</h2>
			</div>
			<div>
				<p>칵테일(cocktail)이란 여러종류의 술과 과즙, 시럽등을 섞어 만드는 일종의 혼합주 입니다. 맛, 향기, 색체의 삼박자를 고루 갖춘 술이라 '한잔의 예술'이라고도 불립니다. 입에
					대기 힘든 독주도 다른 알코올이나 과일즙, 탄산음료와 혼합했을 때 놀랍도록 부드러운 맛을 낼수도 있고 재료에 따라 셀수없이 다양한 맛을 즐길 수 있는 술이라 사람들에게 인기가
					많습니다.</p>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center">
					<h2 class="mb-4"><span class="#">유명한 </span>칵테일을 소개해드릴게요!</h2>
					<p>These cocktails are loved and sought after by many people. <br>How about these cocktails?</p>
				</div>
			</div>
		</div>
		<div class="container-wrap">
			<div class="row no-gutters d-flex">
				<div class="col-lg-4 d-flex">
					<div class="services-wrap d-flex">
						<a href="#" class="img" style="background-image: url(images/c1.jfif);"></a>
						<div class="text p-4">
							<h3>준 벅(June bug) </h3>
							<p> 6월의 푸르름을 표현한 칵테일. 향과 맛이 달콤하기로 유명한 리큐르인 말리부가 들어가서 달달한 맛을 낸다. </p>
							<p class="price"><span id="degree">ABV : </span><span>7%</span></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 d-flex">
					<div class="services-wrap d-flex">
						<a href="#" class="img" style="background-image: url(images/c2.png);"></a>
						<div class="text p-4">
							<h3>데킬라 선라이즈<br>(Tequila Sunrise)</h3>
							<p>일출을 닮았다고해서 붙여진 이름으로 그라데이션이 해 뜰 때의 붉은 하늘을 연상시킨다.</p>
							<p class="price"><span id="degree">ABV : </span><span>12%</span></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 d-flex">
					<div class="services-wrap d-flex">
						<a href="#" class="img" style="background-image: url(images/c3.jpg);"></a>
						<div class="text p-4">
							<h3>블루 하와이<br>(Blue Hawaii)</h3>
							<p>하와이 섬을 연상시키는 트로피컬 칵테일로 단맛에 비해 상쾌한 맛이 강하다.</p>
							<p class="price"><span id="degree">ABV : </span><span>11%</span></p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 d-flex">
					<div class="services-wrap d-flex">
						<a href="#" class="img order-lg-last" style="background-image: url(images/c4.jpg);"></a>
						<div class="text p-4">
							<h3>피나 콜라다<br>(Pina Colada)</h3>
							<p>스페인어로 채에 거른 파인애플이라는 뜻으로 인기있는 트로피컬 칵테일이다.</p>
							<p class="price"><span id="degree">ABV : </span><span>15%</span></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 d-flex">
					<div class="services-wrap d-flex">
						<a href="#" class="img order-lg-last" style="background-image: url(images/c5.jpg);"></a>
						<div class="text p-4">
							<h3>미도리 사워<br>(Midori Sour)</h3>
							<p>멜론리큐르 미도리를 사용해서 만드는 사워 칵테일이다.</p>
							<p class="price"><span id="degree">ABV : </span><span>14%</span></p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 d-flex">
					<div class="services-wrap d-flex">
						<a href="#" class="img order-lg-last" style="background-image: url(images/c6.jpg);"></a>
						<div class="text p-4">
							<h3>모히또(Mojito)</h3>
							<p>쿠바에서 창조된 인기 칵테일으로 소설가 헤밍웨이가 좋아한 칵테일로 유명하다. </p>
							<p class="price"><span id="degree">ABV : </span><span>19%</span></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-menu">
		<div class="container-fluid">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section text-center">
					<h2 class="mb-4"><span class="#">조건에 맞는 </span>칵테일을 알려드릴게요!</h2>
					<p>There are various cocktails for each flavor, ABV.<br>Enjoy a variety of cocktails!</p>
				</div>
			</div>
			<div class="row d-md-flex">
				<div class="col-lg-4 img f-menu-img mb-5 mb-md-0"
					style="background-image: url(images/bt1.jpg);" id="bt1">
				</div>
				<div class="col-lg-8 p-md-5">
					<div class="row">
						<div class="col-md-12 nav-link-wrap mb-5">
							<div class="nav nav-pills" id="v-pills-tab" role="tablist"
								aria-orientation="vertical">
								<a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1"
									role="tab" aria-controls="v-pills-1" aria-selected="true">SWEET</a>

								<a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab"
									aria-controls="v-pills-2" aria-selected="false">UNSWEETENED</a>

								<a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab"
									aria-controls="v-pills-3" aria-selected="false">HIGH ABV</a>

								<a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-4" role="tab"
									aria-controls="v-pills-3" aria-selected="false">LOW ABV</a>
							</div>
						</div>
						<div class="col-md-12 d-flex align-items-center">
							<div class="tab-content" id="v-pills-tabContent">
								<div class="tab-pane fade show active" id="v-pills-1" role="tabpanel"
									aria-labelledby="v-pills-1-tab">
									<div class="row">
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c7.jpg);"></a>
												<div class="text">
													<h3><a href="#">골든 메달리스트<br>(Gold Medalist)</a></h3>
													<p><span id="degree">FLAVOR : </span>SWEET<br>
														<span id="degree">특징 : </span>대표적인 무알콜 칵테일. 여러 생과일과 시럽이 들어가 달고
														상큼한 맛이 난다.
														<br><span id="degree">재료 : </span>딸기, 바나나, 그레나딘 시럽, <br>파인애플 주스,
														코코넛 크림, 얼음
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>0%</span></p>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c8.jpg);"></a>
												<div class="text">
													<h3><a href="#">깔루아 밀크<br>(kahlua milk)</a></h3>
													<p><span id="degree">FLAVOR : </span>SWEET<br>
														<span id="degree">특징 : </span>커피우유와 비슷한 맛에 <br>술이 어우러진 달달한
														칵테일이다.
														<br><span id="degree">재료 : </span>칼루아, 우유, 얼음<br><br>

													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>5%</span></p>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c10.jpg);"></a>
												<div class="text">
													<h3><a href="#">시브리즈<br>(Sea Breeze)</a></h3>
													<p><span id="degree">FLAVOR</span> : SWEET<br>
														<span id="degree">특징 : </span>자몽, 크렌베리 주스가 재료로 사용되어 새콤달콤한 맛을 즐길
														수 있는 칵테일.
														<br><span id="degree">재료 : </span>크렌베리 주스, 자몽 주스, 얼음, <br>마라스키노
														체리, 오렌지, 보드카
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>8%</span></p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="tab-pane fade" id="v-pills-2" role="tabpanel"
									aria-labelledby="v-pills-2-tab">
									<div class="row">
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c9.jpg);"></a>
												<div class="text">
													<h3><a href="#">러스티네일<br>(Rusty Nail)</a></h3>
													<p><span id="degree">FLAVOR</span> : UNSWEETENED<br>
														<span id="degree">특징 : </span>드람뷔의 화사한 꽃향과 달콤한 꿀맛 덕분에<br>도수가 높아도
														술술
														넘어간다.
														<br><span id="degree">재료 : </span>얼음, 레몬, 드람부이, 스카치 위스키
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>40%</span></p>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c11.jpg);"></a>
												<div class="text">
													<h3><a href="#">롱 아일랜드 아이스티<br>(Long Island Iced Tea)</a></h3>
													<p><span id="degree">FLAVOR</span> : UNSWEETENED<br>
														<span id="degree">특징 : </span>4가지 기주가 사용되며 아이스티와<br>색상이 비슷해서 이름
														붙여졌다. = 롱티
														<br><span id="degree">재료 : </span>콜라, 얼음, 레몬, 설탕 시럽,
														보드카,<br>쿠앵트로, 진, 데킬라 블랑코, 화이트 럼
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>29%</span></p>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c12.jpg);"></a>
												<div class="text">
													<h3><a href="#">블루 카미카제<br>(Blue Kamikaze)</a></h3>
													<p><span id="degree">FLAVOR</span> : UNSWEETENED<br>
														<span id="degree">특징 : </span>카미카제 칵테일의 샷 버전이며 롱 드링크로도 만들 수 있다.
														<br><span id="degree">재료 : </span>얼음, 라임, 블루 큐라소, 보드카
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>30%</span></p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="tab-pane fade" id="v-pills-3" role="tabpanel"
									aria-labelledby="v-pills-3-tab">
									<div class="row">
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c13.jpg);"></a>
												<div class="text">
													<h3><a href="#">사이드 카<br>(Sidecar)</a></h3>
													<p><span id="degree">FLAVOR</span> : SWEET<br>
														<span id="degree">특징 : </span>사이드카 오토바이에서 이름을 따온 칵테일<br>제1차 세계
														대전 중에 파리의 비스트로에서 만들어졌다고 합니다.
														<br><span id="degree">재료 : </span>얼음, 라임, 블루 큐라소, 보드카
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>40%</span></p>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c15.jpg);"></a>
												<div class="text">
													<h3><a href="#">B-52<br>(B-52)</a></h3>
													<p><span id="degree">FLAVOR</span> : SWEET<br>
														<span id="degree">특징 : </span>미국의 폭격기 B-52에서 이름을 따온<br>칵테일로 뚜렷한
														3개의 층이 특징이다. <br>정말 달지만 맛이 오래 남진 않는다.
														<br><span id="degree">재료 : </span>칼루아, 베일리스, 그랑 마니에르
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>26%</span></p>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c16.jpg);"></a>
												<div class="text">
													<h3><a href="#">애플 마티니<br>(Apple Martini)</a></h3>
													<p><span id="degree">FLAVOR</span> : SWEET<br>
														<span id="degree">특징 : </span>특유의 예쁜 초록색과 새콤달콤한<br>맛으로 미국에서 인기를
														끌었다.<br>보드카 대신 화이트럼을 사용하기도 한다.
														<br><span id="degree">재료 : </span>사과, 얼음, 사과 리큐르, 쿠앵트로, 보드카
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>35%</span></p>
												</div>
											</div>
										</div>
									</div>
								</div>

								<div class="tab-pane fade" id="v-pills-4" role="tabpanel"
									aria-labelledby="v-pills-4-tab">
									<div class="row">
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c17.jpg);"></a>
												<div class="text">
													<h3><a href="#">진토닉<br>(Gin Tonic)</a></h3>
													<p><span id="degree">FLAVOR</span> : UNSWEETENED<br>
														<span id="degree">특징 : </span>깔끔한 맛 이후 희미하게 다가오는 <br>감귤류의 쓴맛이
														매력적인 칵테일<br>재료를 손쉽게 구할 수 있어 대중적이다.
														<br><span id="degree">재료 : </span>얼음, 라임, 토닉워터, 진
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>13%</span></p>
												</div>
											</div>
										</div>
										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c18.jpg);"></a>
												<div class="text">
													<h3><a href="#">쿠바 리브레<br>(Cuba Libre)</a></h3>
													<p><span id="degree">FLAVOR</span> : SWEET<br>
														<span id="degree">특징 : </span>자유로운 쿠바라는 뜻으로 <br>쿠바 독립전쟁 당시 지원하던
														미군이 럼에 <br>콜라를 넣어 마신것에서 유래되었습니다.
														<br><span id="degree">재료 : </span>콜라, 얼음, 라임, 화이트 럼
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>12%</span></p>
												</div>
											</div>
										</div>

										<div class="col-md-4 text-center">
											<div class="menu-wrap">
												<a href="#" class="menu-img img mb-4"
													style="background-image: url(images/c19.jpg);"></a>
												<div class="text">
													<h3><a href="#">블루 라군<br>(Blue Lagoon)</a></h3>
													<p><span id="degree">FLAVOR</span> : SWEET<br>
														<span id="degree">특징 : </span>푸른 호수라는 뜻을 가지는 칵테일. 달달하면서 상큼한 맛이
														맴돈다고 한다.
														<br><span id="degree">재료 : </span>얼음, 레몬, 레몬에이드, 블루 큐라소, 보드카
													</p>
													</p>
													<p class="price"><span id="degree">ABV : </span><span>10%</span></p>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
      <div class="container">
         <div class="row justify-content-center mb-5 pb-3">
            <div class="col-md-7 heading-section text-center">
               <h2 class="mb-4">처음이시라구요?<br><span class="#">입문자분</span> 들을 위한 추천 목록도 준비했어요!</h2>
               <p>If you're worried about what to choose, Why don't you take a look?<br>I hope you find a cocktail
                  that suits your taste!</p>
            </div>
         </div>
      </div>
      <div style="margin-left: 260px;" class="#">
         <h3 style="margin-bottom: 40px;"><span style="color:#3dbf78;">✔</span>칵테일을 <span
               style="color:#3dbf78;">처음</span> 접하시는
            분들이라면?</h3>
         <h3 style=" margin-bottom: 40px;"><span style="color:orange;">✔</span>쎈 술은 싫어요! <span
               style="color:orange;">적당한
               도수</span>를 원하시는 분들이라면?</h3>
         <h3 style=" margin-bottom: 40px;"><span style="color:yellowgreen;">✔</span>도수는 상관없어요!
            <span style="color:yellowgreen;">맛있는</span> 칵테일을 원하시는 분들이라면?
         </h3>
         <h3 style=" margin-bottom: 40px;"><span style="color:skyblue;">✔</span>재료⬇<span style="color:skyblue;">
               간단하게 </span>만들 수 있는 칵테일을 원하신다면?</h3>
         <h3 style=" margin-bottom: 40px;"><span style="color:pink;">✔</span>봄, 여름에 즐기는 <span
               style="color:pink;">산뜻한</span> 칵테일을 원하신다면?</h3>
         <h3 style=" margin-bottom: 40px;"><span style="color:brown;">✔</span>가을, 겨울에 마시면 좋을 <span
               style="color:brown;">부드러운</span> 칵테일을 원하신다면?</h3>
         <a href="recommend.html"><img src="images/click.png" class="click_img" alt=""></a>
      </div>
   </section>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10"
				stroke="#F96D00" />
		</svg></div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/main.js"></script>
	<script src="js/search.js"></script>

</body>

</html>