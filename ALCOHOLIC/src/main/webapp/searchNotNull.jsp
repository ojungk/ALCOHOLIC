<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.smhrd.model.cocDTO"%>
<%@ page import="com.smhrd.model.ingredientDTO"%>



<!DOCTYPE html>
<html lang="en">

<head>
<title>ALCOHOLIC</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nothing+You+Could+Do"
	rel="stylesheet">

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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
.ftco-section {
	height: 200px;
	margin-top: 200px;
}

.section {
	margin-top: 60px;
	background-color: none;
	padding: 50px 20px;
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-left: 220px;
	width: 1450px;
	height: auto;
	margin-bottom: 150px;
	border-radius: 3%;
}

.profile-base {
	width: 1410px;
	height: auto;
	/* border: 8px solid rgb(230, 230, 230); */
	position: relative;
	margin-bottom: 20px;
}

.user-upload {
	background-color: none;
	width: 95%;
	height: auto;
	padding: 20px;
	margin-bottom: 20px;
}

.user-upload h3 {
	color: white;
	margin-left: 20px;
	margin-bottom: 20px;
	font-size: 24px;
}

.like-ct {
	background-color: none;
	width: 95%;
	height: auto;
	padding: 20px;
}

.like-ct h3 {
	color: white;
	margin-left: 20px;
	margin-bottom: 20px;
	font-size: 24px;
}

.profile-image {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	overflow: hidden;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-left: 465px;
	border: 8px double whitesmoke;
}

.profile-image img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

@media ( max-width : 768px) {
	.profile-image {
		width: 100px;
		height: 100px;
	}
}

.profile-info {
	top: 35px;
	color: white;
	margin-top: 15px;
	text-align: center;
	position: absolute;
	margin-top: 18px;
	margin-bottom: 90px;
	margin-left: 645px;
}

.profile-info h3 {
	color: #919191;
	font-size: 18px;
	text-align: left;
	margin-top: 10px;
	margin-left: 20px;
}

.profile-btn {
	transition: box-shadow 0.2s;
	margin-left: 540px;
	margin-bottom: 40px;
}

#btn1 {
	margin-left: 550px;
	font-size: 18px;
	width: 140px;
	height: 40px;
}

#btn2 {
	margin-left: 20px;
	font-size: 18px;
	width: 140px;
	height: 40px;
}

/* 모달 배경을 어둡게 하고 글자를 흰색으로 설정 */
.modal-content {
	top: 160px;
	background-color: #333;
	/* 어두운 배경색 */
	color: white;
	/* 글자색 흰색 */
}

.modal-header, .modal-body, .modal-footer {
	border: none;
	/* 모달 내부의 테두리 제거 */
}

.modal-header .close {
	color: white;
	/* 닫기 버튼 색상 흰색 */
}

.modal-title {
	color: white;
	/* 제목 글자색 흰색 */
}

.form-control {
	background-color: #555;
	/* 입력 필드 배경색 어둡게 */
	color: white;
	/* 입력 필드 글자색 흰색 */
	border: 1px solid #777;
	/* 입력 필드 테두리 색상 */
}

.form-control:focus {
	background-color: #666;
	/* 포커스된 입력 필드 배경색 */
	color: white;
	/* 포커스된 입력 필드 글자색 */
	border-color: #888;
	/* 포커스된 입력 필드 테두리 색상 */
}

.btn-secondary, .btn-primary {
	background-color: #3dbf78;
	/* 버튼 배경색 */
	border-color: #3dbf78;
	/* 버튼 테두리색 */
	color: black;
	/* 버튼 글자색 흰색 */
}

.btn-secondary:hover, .btn-primary:hover {
	background-color: #333;
	/* 버튼 호버시 배경색 */
	border-color: #3dbf78;
	/* 버튼 호버시 테두리색 */
	color: #3dbf78;
	/* 버튼 호버시 글자색 */
}

/* 칵테일 리스트 menu css 여기 아래부터 그대로 가져옴!*/
.blog-entry {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
}

.text {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	flex-grow: 1;
}

.description {
	width: 250px;
	/* 원하는 너비로 설정 */
	line-height: 2.0;
	/* 줄 높이 설정 */
	height: calc(1.0em * 10);
	/* 줄 높이 * 줄 수 */
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	/* 5줄로 제한 */
	-webkit-box-orient: vertical;
}

.more-link {
	text-align: right;
}

.info-container {
	width: 200px;
	height: 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

/* ----칵테일 리스트---- */

/* 셀렉트 박스 스타일 */
section {
	display: flex;
	justify-content: center;
	/* 박스들을 수평으로 가운데 정렬 */
	align-items: center;
	/* 박스들을 수직으로 가운데 정렬 */
	gap: 20px;
	/* 박스들 사이의 간격 조절 */
}

.select-wrapper {
	margin-top: -10px;
	display: inline-block;
	/* 인라인 블록 요소로 표시하여 수평으로 배열 */
	margin-right: 20px;
	/* 선택 상자 간격을 위한 우측 여백 설정 */
	position: relative;
	text-align: center;
	/* margin-top: 20px; */
	justify-content: center;
	align-items: center;
}

#name {
	width: 230px;
	line-height: 2.0;
	height: calc(0.3em * 5);
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 7;
	-webkit-box-orient: vertical;
}

#ename {
	width: 230px;
	line-height: 2.0;
	height: calc(0.3em * 5);
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 7;
	-webkit-box-orient: vertical;
}

.select {
	display: block;
	/* 블록 요소로 설정하여 너비를 100%로 만듦 */
	width: 150px;
	/* 선택 상자의 너비 설정 */
	padding: 12px 10px;
	/* 내부 패딩 설정 */
	border: 1px solid #3dbf78;
	/* 테두리 스타일 설정 */
	/* border-radius: 5px; */
	/* 테두리의 모서리를 둥글게 만듦 */
	background-color: #161616;
	/* 배경색 설정 */
	color: #3dbf78;
	/* 텍스트 색상 설정 */
	cursor: pointer;
	/* 커서 스타일을 포인터로 설정하여 클릭 가능하다는 표시 */
	outline: none;
	/* 포커스시 테두리 제거 */
}

.options {
	display: none;
	/* 초기에는 옵션을 숨김 */
	position: absolute;
	/* 절대 위치로 설정하여 상위 요소에 영향을 받지 않음 */
	background-color: #161616;
	/* 배경색 설정 */
	list-style-type: none;
	/* 목록 스타일 제거 */
	padding: 0;
	/* 내부 패딩 제거 */
	margin: 0;
	/* 외부 여백 제거 */
	border: 1px solid transparent;
	/* border: 1px solid #3dbf78; */
	width: 150px;
	/* 선택 상자와 같은 너비로 설정 */
	top: 100%;
	/* 선택 상자의 아래에 옵션을 배치 */
	left: 0;
	/* 선택 상자의 왼쪽에 옵션을 배치 */
	z-index: 1;
	left: 0;
	/* 추가: 옵션들을 왼쪽에 정렬 */
}

.price {
	color: #3dbf78;
	padding-left: 5px;
}

.heading mt-2 text-center {
	margin: 0px;
}

.menu-h3 {
	font-size: 18px;
}

.option {
	width: 100%;
	padding: 10px;
	/* 내부 패딩 설정 */
	cursor: pointer;
	/* 커서 스타일을 포인터로 설정하여 클릭 가능하다는 표시 */
}

.option:hover {
	background-color: #3dbf78;
	/* 호버 시 배경색 변경 */
	color: #161616;
	/* 호버 시 텍스트 색상 변경 */
}

.select:focus+.options {
	display: block;
	/* 선택 상자에 포커스되면 옵션을 보여줌 */
}

.select::after {
	content: '';
	position: absolute;
	top: 50%;
	right: 15px;
	/* 원하는 위치 */
	width: 0;
	height: 0;
	border-top: 6px solid #3dbf78;
	/* 색상은 원하는 색으로 변경 가능 */
	border-left: 4px solid transparent;
	border-right: 4px solid transparent;
	transform: translateY(-50%);
}

#cBtn {
	margin-top: 11px;
	/* margin-right: 11px; */
}

#cocktail-abv {
	color: #3dbf78;
}

/*모달 스타일 */
h2 {
	text-align: center;
}

.modal_popup .modal-div-left {
	float: left;
	text-align: left;
	/* display: table-caption; */
	width: 300px;
	/* 이미지의 최대 너비 */
	padding-right: 20px;
	/* 이미지와 다른 내용 간의 간격 설정 */
	margin-top: 75px;
}

.modal-div-left img {
	width: 100%;
	/* 이미지를 부모 요소인 modal-div-left의 너비에 맞춰 꽉 차게 설정 */
	height: 300px;
	/* 이미지의 높이 자동으로 조정 */
	border-radius: 30px;
	/* 원하는 경우 이미지에 둥근 모서리 추가 */
}

.modal_popup .modal-div-right {
	float: right;
	width: 385px;
	text-align: left;
}

.modal_popup .modal-div-right .text-right {
	text-align: left !important;
}

.modal-div-center {
	clear: both;
	width: 725px;
}

.modal_btn {
	display: block;
	height: 39px;
	width: 87px;
	margin: 40px 0px;
	padding: 6px 20px;
	background-color: #121618;
	border: none;
	color: #fff;
	cursor: pointer;
	/* transition: box-shadow 0.2s; */
	border: 1px solid gray;
}

.modal_btn:hover {
	background-color: #3dbf78;
	color: #fff;
}

/*모달 팝업 영역 스타일링*/
.modal {
	display: none;
	position: fixed;
	overflow: hidden;
	background: rgba(0, 0, 0, 0.5);
}

/*팝업*/
.modal .modal_popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 40px;
	background: #121618;
	border-radius: 20px;
	width: 800px;
	border: 2px solid white;
	max-height: 610px;
	overflow-y: scroll;
}

.modal_popup::-webkit-scrollbar {
	width: 10px;
}

.modal_popup::-webkit-scrollbar-thumb {
	height: 50%;
	background: #848484;
	border-radius: 10px
}

.modal_popup::-webkit-scrollbar-track {
	background: #84848447;
}

.modal .modal_popup .close_btn {
	display: block;
	padding: 10px 20px;
	background-color: #3dbf78;
	border: none;
	border-radius: 5px;
	color: #fff;
	cursor: pointer;
	transition: box-shadow 0.2s;
}

.btn-close-modal {
	position: absolute;
	/* 절대 위치 */
	top: 10px;
	/* 원하는 상단 여백 */
	right: 10px;
	/* 원하는 오른쪽 여백 */
	color: #fff;
	padding: 10px;
	border-radius: 5px;
	text-decoration: none;
	font-weight: bold;
	cursor: pointer;
}

/* 찜 */
#abvContainer {
	display: flex;
	align-items: center;
}

#abvContainer span {
	margin-right: 10px;
	/* ABV 정보와 버튼 사이 여백 설정 */
}

button {
	background: none;
	border: none;
}

button.like-btn:focus {
	border: none;
	outline: none;
}

.like-btn {
	margin-top: 20px;
}

.like-btn img {
	margin-left: 158px;
	width: 28px;
	height: 28px;
	background: none !important;
	border: none;
}

/* 댓글 창 스타일 */
#modal-comment-form {
	margin-top: 20px;
	/* opacity: 0.6; */
	/* background: #f8f9fa; */
	/* height: 400px; */
	padding: 20px 0px 0px 0px;
	/* display: flex; */
}

#modal-comment-text {
	width: 100%;
	padding: 10px;
	border: 1px solid #3E3E41;
	border-radius: 5px;
	background: #3E3E41;
	resize: vertical;
	/* 높이 조절 가능 */
	min-height: 80px;
	/* 최소 높이 */
	font-size: 14px;
	color: white;
}

#modal-comment-text:focus {
	outline: none;
	border-color: #3dbf78;
	/* 포커스 시 테두리 색상 변경 */
}

#modal-comment-form button[type="submit"] {
	display: inline-block;
	background-color: #3dbf78;
	color: white;
	border: none;
	padding: 10px 20px;
	margin-top: 15px;
	cursor: pointer;
	border-radius: 5px;
	font-size: 14px;
	transition: background-color 0.3s;
	/* justify-content: center; */
	margin: auto;
	display: block;
}

#modal-comment-form button[type="submit"]:hover {
	background-color: #1b9e56;
	/* 호버 시 배경색 변경 */
}

#modal-comments-list {
	margin-top: 20px;
	padding: 0;
	list-style-type: none;
	max-height: 200px;
	/* 원하는 최대 높이 설정 */
	overflow-y: auto;
	/* 스크롤 추가 */
	width: 724px;
}

#modal-comments-list::-webkit-scrollbar {
	width: 10px;
}

#modal-comments-list::-webkit-scrollbar-thumb {
	height: 50%;
	background: #848484;
	border-radius: 10px;
}

#modal-comments-list::-webkit-scrollbar-track {
	background: #84848447;
}

#modal-comments-list li {
	background-color: #3E3E41;
	color: #F0F0F2;
	/* 댓글 아이템 배경색 */
	border-radius: 15px;
	padding: 10px;
	margin-bottom: 10px;
	opacity: 1;
}

.comment-btn {
	background-color: transparent;
	border: none;
	cursor: pointer;
	font-size: 12px;
	margin-left: 10px;
	color: #1b9e56;
}

.comment-btn.edit {
	color: #1b9e56;
}

.comment-btn.delete {
	color: #ff0000;
}

#modal-comments-list li:last-child {
	margin-bottom: 0;
	/* 마지막 댓글 아이템의 하단 마진 제거 */
}

/* 댓글 아이템 텍스트 스타일 */
#modal-comments-list li p {
	margin: 0;
	font-size: 14px;
}

.textbox {
	width: 400px;
	/* 너비 설정 */
	height: 100px;
	/* 높이 설정 */
	padding: 10px;
	/* 안쪽 여백 */
	border: 2px solid #ccc;
	/* 테두리 색상 및 두께 */
	border-radius: 5px;
	/* 모서리 둥글게 */
	font-size: 13px;
	/* 글꼴 크기 */
	box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
	/* 그림자 효과 */
	resize: none;
	/* 크기 조절 비활성화 */
}

/* 비활성 상태 스타일 */
.textbox:disabled, .textbox[readonly] {
	background-color: #828282;
	/* 비활성 시 배경 색상 */
	border-color: #ddd;
	/* 비활성 시 테두리 색상 */
	color: #000;
	/* 비활성 시 글자 색상 */
}

.textbox::-webkit-scrollbar {
	width: 10px;
}

.textbox::-webkit-scrollbar-thumb {
	height: 50%;
	background: #848484;
	border-radius: 10px;
}

.textbox::-webkit-scrollbar-track {
	background: #84848447;
}

.block-20 {
	border-radius: 20%;
}

/*여기부터 다시 mypage*/
#more_btn {
	margin-left: 96px;
}

#upload {
	margin-top: 50px;
	margin-left: 130px;
}

#upload_title {
	margin: 0px;
}

#feed-img {
	width: 300px;
}

/*메뉴바에 검색기능 추가*/
.search_text {
	margin-right: 60px;
	margin-bottom: 2px;
}

.search_text .form-control2 {
	color: #000;
}

.btn-search {
	background-color: #3dbf78;
	border: 1px solid #3dbf78;
	color: #000;
	cursor: pointer;
}

.btn-search:hover {
	background-color: #000;
	color: #3dbf78;
}

#md_ig {
	margin-right: 30px;
}

#if2 {
	margin-left: 80px;
}

.cType {
	color: #3dbf78;
}
</style>

</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
        <div class="container">
            <h2 id="login-logo"></h2>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> FEED
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a href="welcome.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="menu.jsp" class="nav-link">Menu</a></li>
                    <li class="nav-item"><a href="ingredient.jsp" class="nav-link">Ingredient</a></li>
                    <li class="nav-item "><a href="feed.jsp" class="nav-link">Feed</a></li>
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

    <section class="section">
        <div class="container">
            <div class="row justify-content-center mb-3 pb-5">
                <div class="col-md-7 heading-section ftco-animate text-center">
                    <h2 class="mb-4">검색결과를 찾았습니다.😃</h2>
                    <p class="flip">
                        <span class="deg1"></span><span class="deg2"></span><span class="deg3"></span>
                    </p>
                    <p class="mt-5">찾으시는 결과가 맞는지 확인해보세요!</p>
                </div>
            </div>
        </div>

        <div class="user-upload">
            <h3>🔍칵테일</h3>
            <div class="container">
                <div class="row d-flex" id="cocktail-list">
                    <%
                    List<cocDTO> cocktailResults = (List<cocDTO>) session.getAttribute("cocktailResults");
                    if (cocktailResults != null && !cocktailResults.isEmpty()) {
                        for (cocDTO cocktail : cocktailResults) {
                    %>
                    <div class="col-md-3 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="javascript:void(0)" class="block-20"
                                onclick="openCocktailModal(<%=cocktail.getCt_idx()%>)"
                                style="background-image: url('images/cocktail/<%=cocktail.getCt_kor_name()%>.png');"></a>
                            <div class="text py-4 d-block">
                                <h3 class="heading mt-2 text-center"><%=cocktail.getCt_kor_name()%></h3>
                                <h3 class="heading mt-2 text-center"><%=cocktail.getCt_eng_name()%></h3>
                                <div class="info-container">
                                    <p class="btn-open-modal" id="more_btn">
                                        <a href="javascript:void(0)"
                                            class="ml-2 btn btn-white btn-outline-white"
                                            onclick="openCocktailModal('<%=cocktail.getCt_idx()%>')">더보기</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    } else {
                    %>
                    <div class="col-md-12 text-center">
                        <p>검색된 칵테일이 없습니다.</p>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>

        <div class="like-ct">
            <h3>🔍재료</h3>
            <div class="container">
                <div class="row d-flex" id="ingredient-list">
                    <%
                    List<ingredientDTO> ingredientResults = (List<ingredientDTO>) session.getAttribute("ingredientResults");
                    if (ingredientResults != null && !ingredientResults.isEmpty()) {
                        for (ingredientDTO ingredient : ingredientResults) {
                    %>
                    <div class="col-md-3 d-flex ftco-animate">
                        <div class="blog-entry align-self-stretch">
                            <a href="javascript:void(0)" class="block-20"
                                onclick="openIngredientModal('<%=ingredient.getIngre_idx()%>')"
                                style="background-image: url('<%=ingredient.getIngre_img()%>');"></a>
                            <div class="text py-4 d-block" id="md_ig">
                                <h3 class="heading mt-2 text-center"><%=ingredient.getIngre_name()%></h3>
                                <h3 class="heading mt-2 text-center"><%=ingredient.getIngre_e_name()%></h3>
                                <div class="info-container" id="if2">
                                    <p class="btn-open-modal">
                                        <a href="javascript:void(0)"
                                            class="ml-2 btn btn-white btn-outline-white"
                                            onclick="openIngredientModal('<%=ingredient.getIngre_idx()%>')">더보기</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    } else {
                    %>
                    <div class="col-md-12 text-center">
                        <p>검색된 재료가 없습니다.</p>
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>

        <!-- Cocktail Modal -->
        <div class="modal cocktail-modal" style="display: none;">
            <div class="modal_popup">
                <p id="cocktail-modal-content"></p>
                <p class="btn-close-modal">
                    <a href="javascript:void(0)"
                        class="ml-2 btn btn-white btn-outline-white"
                        id="closeCocktailModal" onclick="closeCocktailModal()">X</a>
                </p>
            </div>
        </div>

        <!-- Ingredient Modal -->
        <div class="modal ingredient-modal" style="display: none;">
            <div class="modal_popup">
                <p id="ingredient-modal-content"></p>
                <p class="btn-close-modal">
                    <a href="javascript:void(0)"
                        class="ml-2 btn btn-white btn-outline-white"
                        id="closeIngredientModal" onclick="closeIngredientModal()">X</a>
                </p>
            </div>
        </div>
    </section>

   


    <script>
        // 칵테일 모달 열기 함수
        function openCocktailModal(ct_idx) {
            fetch('/ALCOHOLIC/GetCocktailDetails?ct_idx=' + ct_idx)
                .then(response => response.json())
                .then(data => {
                    let cocktail = data.cocktails[0]; // cocktails 배열의 첫 번째 요소 가져오기
                    if (data) {
                        document.getElementById('cocktail-modal-content').innerHTML = `
                        	<div class="modal-div-left" id="mc">
                        	<img src="images/cocktail/${cocktail.ct_kor_name}.png" alt="${cocktail.ct_kor_name}" id="mdImg">
                        	<span id="modal-abv">ABV: $${cocktail.ct_percent}<button class="like-btn"><img class="hImg" src="images/빈하트.png"></button></span>
                            </div>
                            <div class="modal-div-right">
                            <h3 class="heading mt-2 text-left">${cocktail.ct_kor_name}<br>${cocktail.ct_eng_name}</h3>
                            <p class="heading mt-2 text-right">${cocktail.ct_info}</p>
                            <p class="heading mt-2 text-right">재료정보<span id="iToC"> ▼</span></p>
                            <textarea class="textbox" readonly>${cocktail.ct_ingredient}</textarea>
                            <p class="heading mt-2 text-right">레시피<span id="iToC"> ▼</span></p>
                            <textarea class="textbox" readonly>${cocktail.ct_recipe}</textarea>
                            </div>
                        `;
                        document.querySelector('.cocktail-modal').style.display = 'block'; // 모달 창 표시
                    } else {
                        console.error('No cocktail found with ct_idx:', ct_idx);
                    }
                })
                .catch(error => console.error('Error fetching cocktail details:', error));
        }

        
       
    

                     
                     
                      
                    
                  

       
        // 재료 모달 열기 함수
        function openIngredientModal(ingre_idx) {
            fetch('/ALCOHOLIC/GetIngredientDetails?ingre_idx=' + ingre_idx)
                .then(response => response.json())
                .then(data => {
                	let ingre = data.ingres[0]; // cocktails 배열의 첫 번째 요소 가져오기
                	console.log(ingre);
                    if (data) {
                    	let name = ingre.ingre_name;
                    	  $.ajax({
                              type: 'POST',
                              url: 'loadingrsp',
                              data: { name: name },
                              success: function(load) {
                                  console.log("AJAX 로드성공:", load);
                                  
                                  document.getElementById('ingredient-modal-content').innerHTML = `
                                	  <div class="modal-div-left">
                                 	 <img src= "${ingre.ingre_img}" alt="${ingre.ingre_name}" id="mdImg">
                                 	 </div>
                                 	 <div class="modal-div-right">
                                      <h3 class="heading mt-2 text-left">${ingre.ingre_name}<br><span id="modal-abv">${ingre.ingre_e_name}</span></h3>
                                      <p id="modal-abv">Type: <span class="cType">${ingre.ingre_type}</span></p>
                                      <textarea class="textbox" readonly>${ingre.ingre_info}</textarea>
                                      <p class="heading mt-2 text-right">해당 재료로 만들 수 있는 칵테일<span id="iToC">▼</span></p>
                          <textarea class="textbox" readonly>${generateCocktailList(load)}</textarea>
                        </div>
                      `;

                                  document.querySelector('.ingredient-modal').style.display = 'block';
                                  
                        
                                
                                  }
                            
                          });
                       /*  document.getElementById('ingredient-modal-content').innerHTML = `
                        	 <div class="modal-div-left">
                        	 <img src= "${ingre.ingre_img}" alt="${ingre.ingre_name}" id="mdImg">
                        	 </div>
                        	 <div class="modal-div-right">
                             <h3 class="heading mt-2 text-left">${ingre.ingre_name}<br><span id="modal-abv">${ingre.ingre_e_name}</span></h3>
                             <p id="modal-abv">Type: <span class="cType">${ingre.ingre_type}</span></p>
                             <textarea class="textbox" readonly>${ingre.ingre_info}</textarea>
                             <p class="heading mt-2 text-right">해당 재료로 만들 수 있는 칵테일<span id="iToC">▼</span></p>
                             <textarea class="textbox" readonly></textarea>
                             </div>
                        `;
                        document.querySelector('.ingredient-modal').style.display = 'block'; */
                    } else {
                        console.error('No ingredient found with ingre_idx:', ingre_idx);
                    }
                })
                .catch(error => console.error('Error fetching ingredient details:', error));
        }
        
        
        function generateCocktailList(load) {
    		
    		var a = load.map((item, index) => `${JSON.stringify(item)}`).join('\n')
    		a=a.replace(/"/g, '');
    		a=a.replace(/{/g, '');
    		a=a.replace(/}/g, '');
    		a=a.replace(/name/g, '');
    		a=a.replace(/:/g, '');
    		return a;
        
    		
    }

        // 모달 창 닫기 함수
        function closeCocktailModal() {
            document.querySelector('.cocktail-modal').style.display = 'none'; // 모달 창 숨기기
        }

        function closeIngredientModal() {
            document.querySelector('.ingredient-modal').style.display = 'none'; // 모달 창 숨기기
        }
    </script>

    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen">
        <svg class="circular" width="48px" height="48px">
            <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
            <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
        </svg>
    </div>

    <script src="js/search.js"></script>
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
    <script src="js/scrollax.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/search.js"></script>
</body>
</html>