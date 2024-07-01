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
		#ig {
         padding-bottom: 0px;
      }

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

      #modal-abv{
		position:absolute;
	top:480px;
	left:30px;
      }

      #name {
         width: 250px;
         line-height: 2.0;
         height: calc(0.3em * 5);
         overflow: hidden;
         display: -webkit-box;
         -webkit-line-clamp: 7;
         -webkit-box-orient: vertical;
      }
      #ename {
         width: 250px;
         line-height: 2.0;
         height: calc(0.3em * 5);
         overflow: hidden;
         display: -webkit-box;
         -webkit-line-clamp: 7;
         -webkit-box-orient: vertical;
      }
      .description {
         width: 250px;
         line-height: 2.0;
         height: calc(1.0em * 10);
         overflow: hidden;
         display: -webkit-box;
         -webkit-line-clamp: 7;
         -webkit-box-orient: vertical;
      }

      .more-link {
         text-align: right;
      }

      .info-container {
         display: flex;
         justify-content: space-between;
         align-items: center;
      }

      section {
         display: flex;
         justify-content: center;
         align-items: center;
         gap: 20px;
      }

      .select-wrapper {
         margin-top: -10px;
         display: inline-block;
         margin-right: 20px;
         position: relative;
         text-align: center;
      }

      .select {
         display: block;
         width: 150px;
         padding: 12px 10px;
         border: 1px solid #3dbf78;
         background-color: #161616;
         color: #3dbf78;
         cursor: pointer;
         outline: none;
         font-size: 17px;
      }

      .options {
         display: none;
         position: absolute;
         background-color: #161616;
         list-style-type: none;
         padding: 0;
         margin: 0;
         width: 150px;
         top: 100%;
         left: 0;
         z-index: 1;
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
         cursor: pointer;
      }

      .option:hover {
         background-color: #3dbf78;
         color: #161616;
      }

      .select:focus+.options {
         display: block;
      }

      .select::after {
         content: '';
         position: absolute;
         top: 50%;
         right: 15px;
         width: 0;
         height: 0;
         border-top: 6px solid #3dbf78;
         border-left: 4px solid transparent;
         border-right: 4px solid transparent;
         transform: translateY(-50%);
      }

      #cBtn {
         margin-top: 11px;
      }

      #cocktail-abv {
         color: #3dbf78;
         
      }

      h2 {
         text-align: center;
      }

      .modal_popup .modal-div-left {
         float: left;
         text-align: left;
         width: 300px;
         padding-right: 20px;
         margin-top: 75px;
      }

      .modal-div-left img {
         width: 37%;
	/* 이미지를 부모 요소인 modal-div-left의 너비에 맞춰 꽉 차게 설정 */
	height: 450px;
	/* 이미지의 높이 자동으로 조정 */
	border-radius: 30px;
	/* 원하는 경우 이미지에 둥근 모서리 추가 */
	position:absolute;
	top:30px;
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
         border: 1px solid gray;
      }

      .modal_btn:hover {
         background-color: #3dbf78;
         color: #fff;
      }

      .modal {
         display: none;
         position: fixed;
         overflow: hidden;
         background: rgba(0, 0, 0, 0.5);
      }

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
         display: none;
         width: 10px;
      }

      .modal_popup::-webkit-scrollbar-thumb {
         height: 50%;
         background: #848484;
         border-radius: 10px;
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
         top: 10px;
         right: 10px;
         color: #fff;
         padding: 10px;
         border-radius: 5px;
         text-decoration: none;
         font-weight: bold;
         cursor: pointer;
      }

      #abvContainer {
         display: flex;
         align-items: center;
      }

      #abvContainer span {
         margin-right: 10px;
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
         position:absolute;
         top:475px;
         left:131px;
      }

      #modal-comment-form {
         display: flex;
         align-items: center;
         margin-top: 25px;
      }

      #modal-comment-form button[type="submit"] {
         padding: 10px 20px;
         background-color: #3dbf78;
         color: white;
         border: none;
         cursor: pointer;
         border-radius: 5px;
         font-size: 14px;
         transition: background-color 0.3s;
         white-space: nowrap;
      }

      #modal-comment-form button[type="submit"]:hover {
         background-color: #1b9e56;
      }

      #modal-comments-list {
         margin-top: 20px;
         padding: 0;
         list-style-type: none;
         max-height: 200px;
         overflow-y: auto;
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
      }

      #modal-comments-list li p {
         margin: 0;
         font-size: 14px;
      }

      .textbox {
         width: 385px;
         height: 100px;
         padding: 10px;
         border: 2px solid #ccc;
         border-radius: 5px;
         font-size: 13px;
         box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
         resize: none;
      }

      .textbox:disabled,
      .textbox[readonly] {
         background-color: #828282;
         border-color: #ddd;
         color: #000;
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

      /* 댓글 */
      #div-line-menu {
         border-bottom: 2px solid #3dbf78;
         margin-top: 20px;
         padding-top: 17px;
         width: 717px; /* 수정된부분 */
      }

      #form-profile-img {
         width: 40px;
         height: 40px;
         border-radius: 50%;
         object-fit: cover;
         /* 비율 유지하면서 이미지 잘라내기 */
         margin-right: 10px;
         flex-shrink: 0;
         max-width: 100px;
         /* 이미지의 최대 너비 설정 */
         margin-right: 10px;
      }

      #modal-comment-form {
         display: flex;
         align-items: center;
         margin-top: 25px;
      }

      #modal-comment-form button[type="button"] {
         padding: 10px 20px;
         background-color: #3dbf78;
         color: white;
         border: none;
         cursor: pointer;
         border-radius: 5px;
         font-size: 14px;
         transition: background-color 0.3s;
         white-space: nowrap;
      }

      #modal-comment-form button[type="button"]:hover {
         background-color: #1b9e56;
      }

      #modal-comment-form button[type="button"]:focus {
         border: none;
         outline: none;
      }

      #comment-form-container {
         display: flex;
         position: relative;
         align-items: flex-start;
         padding-left: 3px;
         /* align-items: center; */
         gap: 10px;
         /* 요소들 사이의 간격 설정 */
      }

      #comment-text-container {
         flex: 1;
         /* 남은 공간을 모두 차지하도록 설정 */
      }

      .comment-btn.edit {
         color: #1b9e56;
      }

      .comment-btn.delete {
         color: #ff0000;
         margin-left: 3px;
      }

      #modal-comments-list li:last-child {
         margin-bottom: 0;
      }

      #modal-comments-list li p {
         margin: 0;
         font-size: 14px;
      }

      #modal-comment-text {
         flex: 1;
         resize: vertical;

         width: 526px;
         box-sizing: border-box;
         padding: 10px;
         border: 1px solid #3E3E41;
         border-radius: 5px;
         background: #3E3E41;
         resize: none;
         font-size: 14px;
         color: #F0F0F2;
         max-height: 150px;
         box-sizing: border-box;
         height: 47px;
         overflow-y: scroll;
         word-wrap: break-word;
      }

      #modal-comment-text::-webkit-scrollbar {
         width: 10px;
      }

      #modal-comment-text::-webkit-scrollbar-thumb {
         height: 50%;
         background: #848484;
         border-radius: 10px;
      }

      #modal-comments-text::-webkit-scrollbar-track {
         background: #84848447;
      }
      #modal-comment-text:focus {
         outline: none;
         border-color: #3dbf78;
      }
      
      /*  */
      #comment-div { 
         /* position: absolute;
         margin-top: 55px; */
         max-height: 400px;
         /* 적절한 높이 설정 */
         overflow-y: auto;
         /* 수직 스크롤 추가 */
         padding: 10px;
         /* background-color: #3E3E41; */
         border-radius: 5px;
         width: 700px;
         padding-left: 3px;
         margin-top: 15px;
      }

      #comment-div::-webkit-scrollbar {
         width: 10px;
         display: none;
      }

      #comment-div::-webkit-scrollbar-thumb {
         height: 50%;
         background: #848484;
         border-radius: 10px;
      }

      #comment-div::-webkit-scrollbar-track {
         background: #84848447;
      }

      .comment-div-gap {
         margin-bottom: -45px;
      }

      #img-user-info {
         display: flex;
         align-items: center;
         margin-bottom: 10px;
         position: relative;
         z-index: 1;
         margin-top: 0px;
      }

      .comments-profile-img {
         width: 40px;
         /* 사용자 프로필 이미지의 너비 */
         height: 40px;
         /* 사용자 프로필 이미지의 높이 */
         border-radius: 50%;
         /* 원형 모양으로 프로필 이미지 만들기 */
         object-fit: cover;
         /* 이미지를 잘라서 표시 */
         margin-right: 10px;
         /* 프로필 이미지와 사용자 정보 사이의 여백 설정 */
         margin-top: 20px;
         margin-bottom: 6px;
      }

      #cock-user {
         margin-top: 5px;
      }

      #comments-ul {
         /* display: block; */
         padding: 0;
         list-style-type: none;
         position: relative;
         top: -22px;
         margin-left: 43px;
         word-wrap: break-word;
      }

      #feedmodal-comments-list {
         /* max-height: 200px; */
         overflow-y: auto;
         padding: 0;
         list-style-type: none;
      }

      #feedmodal-comments-list .comments-body {
         background-color: #3E3E41;
         color: #F0F0F2;
         border-radius: 15px;
         padding: 10px;
         margin-bottom: 10px;
         display: block;
         height: 97px;
      }

      #feedmodal-comments-list .comments-body:last-child {
         margin-bottom: 0;
         overflow-y: scroll;
      }


      #feedmodal-comments-list .comments-body:last-child::-webkit-scrollbar {
         width: 10px;
         display: none;
      }

      #feedmodal-comments-list .comments-body:last-child::-webkit-scrollbar-thumb {
         height: 50%;
         background: #848484;
         border-radius: 10px;
      }

      #feedmodal-comments-list .comments-body:last-child::-webkit-scrollbar-track {
         background: #84848447;
      }

      #feedmodal-comments-list li {
         background-color: #3E3E41;
         color: #F0F0F2;
         border-radius: 15px;
         padding: 10px;
         margin-bottom: 10px;
         opacity: 1;
      }

      #feedmodal-comments-list li:last-child {
         margin-bottom: 0;
      }


      #feedmodal-comments-list li p {
         margin: 0;
         font-size: 14px;
         padding-bottom: 10px;
      }

      .comments-body{
         /* display: block; */
         position: relative;
         overflow-y: auto;
         width: auto;
         max-width: 100%;
      }

      #feedmodal-comments-list .comments-body {
         background-color: #3E3E41;
         color: #F0F0F2;
         border-radius: 15px;
         padding: 10px;
         margin-bottom: 10px;
         display: block;
         height: 97px;
      }

      .comments-text {
         margin-bottom: 15px;
         /* 텍스트 아래 여백 설정 */
         color: #F0F0F2;
         word-wrap: break-word;
         white-space: normal;
         position: absolute;
         word-wrap: break-word;
         overflow-wrap: break-word;
         white-space: normal;
      }

      .text-muted{
         position: absolute;
         bottom: 0px;
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
      
      /*바뀐 전체 버튼*/
      .cocktail-all{
         display: block;
         width: 150px;
         padding: 12px 10px;
         border: 1px solid #3dbf78;
         background-color: #161616;
         color: #3dbf78;
         cursor: pointer;
         outline: none;
         font-size: 17px;
      }
      .cocktail-all:hover{
         background: #3dbf78;
         border: 1px solid black;
         color: black;
      }
      .cocktail-all:focus{
         outline: none;
      }
	.cocktail-all{
         display: block;
         width: 150px;
         padding: 12px 10px;
         border: 1px solid #3dbf78;
         background-color: #161616;
         color: #3dbf78;
         cursor: pointer;
         outline: none;
         font-size: 17px;
      }
      .cocktail-all:hover{
         background: #3dbf78;
         border: 1px solid black;
         color: black;
      }
      .cocktail-all:focus{
         outline: none;
      }
      #like-dislike-span{
      	position: fixed;
    	margin-top: 350px;
    	margin-left: 150px;
      }
      .hImg {
	margin-left: 158px;
	width: 28px;
	height: 28px;
	background: none !important;
	border: none;
	position: absolute;
	top: 475px;
	left: 131px;
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
               <li class="nav-item"><a href="welcome.jsp" class="nav-link">Home</a></li>
               <li class="nav-item active"><a href="menu.jsp" class="nav-link">Menu</a></li>
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

	<section class="ftco-section" id="ig">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-5">
				<div class="col-md-7 heading-section text-center">
					<h2 class="mb-4">Menu</h2>
					<p class="flip"><span class="deg1"></span><span class="deg2"></span><span class="deg3"></span></p>
					<p class="mt-5">여러분은 어떤 칵테일을 선호하시나요?<br>
						당신의 취향에 맞는 다양한 칵테일들을 둘러보세요!</p>
				</div>
			</div>
		</div>
	</section>

	<section>
	<div class="select-wrapper">
         <button type="button" class="cocktail-all">전체</button>
      </div>
		<div class="select-wrapper">
			<div tabindex="0" class="select">칵테일 종류</div>
			<ul class="options">
				<li class="option"><a >럼</a></li>
				<li class="option">진</li>
				<li class="option">데킬라</li>
				<li class="option">보드카</li>
				<li class="option">브랜디</li>
				<li class="option">위스키</li>
				<li class="option">기타</li>
			</ul>
		</div>

		<div class="select-wrapper">
			<div tabindex="0" class="select">알코올 도수</div>
			<ul class="options">
				<li class="option">낮음 (0-10%)</li>
				<li class="option">중간 (10-20%)</li>
				<li class="option">높음 (20% 이상)</li>
			</ul>
		</div>
	</section>

	<!-- 칵테일 리스트 -->
	<section class="ftco-section">
		<div class="container">
			<div class="row d-flex" id="cocktail-list">
			</div>
		</div>
	</section>

	<!-- 모달 -->
	<div class="modal" style="display:none;">
		<div class="modal_popup">
			<p id="modal-content"></p>
			<p class="btn-close-modal"><a href="javascript:void(0)" class="ml-2 btn btn-white btn-outline-white"
					id="closeModal" onclick="closeModal()">X</a>
			</p>
		</div>
	</div>

	

	<script>
		/* let scrollPosition = 0;

		// 모달 창
		const modal = document.querySelector('.modal');
		const modalContent = document.getElementById('modal-content');
		const modalClose = document.querySelector('.btn-close-modal');

		let currentCocktailIndex = -1; // 현재 열린 칵테일 인덱스

		function openModal(cocktailIndex) {
			scrollPosition = window.pageYOffset;
			currentCocktailIndex = cocktailIndex;

			const cocktail = cocktailss[cocktailIndex];
			const comments = JSON.parse(localStorage.getItem(`comments-${cocktail.name}`)) || [];

			modalContent.innerHTML = `
        <div class="modal-div-left" id="mc">
            <img src="${cocktail.image}" alt="${cocktail.name}" id="mdImg">
            <span id="modal-abv">ABV: ${cocktail.ABV}<button class="like-btn"><img class="hImg" src="images/빈하트.png"></button></span>
			
        </div>
        <div class="modal-div-right">
            <h3 class="heading mt-2 text-left">${cocktail.name}<br>${cocktail.ename}</h3>
            <p class="heading mt-2 text-right">${cocktail.description}</p>
			<p class="heading mt-2 text-right">재료정보<span id="iToC"> ▼</span></p>
			<textarea class="textbox" readonly>${cocktail.description}</textarea>
			<p class="heading mt-2 text-right">레시피<span id="iToC"> ▼</span></p>
			<textarea class="textbox" readonly>레시피라랄랄라라ㅏ라라라랄라ㅏㄹ라ㅏ랄</textarea>
        </div>
        <div class="modal-div-center">
            <form id="modal-comment-form">
                <ul id="modal-comments-list">
                    ${comments.map((comment, index) => `
                        <li data-index="${index}">
                            <span class="comment-text">${comment}</span>
                            <input type="text" class="edit-input" style="display:none;" value="${comment}">
                            <button type="button" class="comment-btn edit">수정</button>
                            <button type="button" class="comment-btn save" style="display:none;">저장</button>
                            <button type="button" class="comment-btn delete">삭제</button>
                        </li>
                    `).join('')}
                </ul>
                <textarea id="modal-comment-text" placeholder="댓글을 작성해주세요..." style="resize: none;" required></textarea>
                <button type="submit">댓글 작성</button>
            </form>
        </div>
    `;
			modal.style.display = 'block';

			// 댓글 수정
			document.querySelectorAll('.comment-btn.edit').forEach(btn => {
				btn.addEventListener('click', function () {
					const li = this.closest('li');
					li.querySelector('.comment-text').style.display = 'none';
					li.querySelector('.edit-input').style.display = 'inline-block';
					li.querySelector('.edit').style.display = 'none';
					li.querySelector('.save').style.display = 'inline-block';
				});
			});

			// 댓글 저장
			document.querySelectorAll('.comment-btn.save').forEach(btn => {
				btn.addEventListener('click', function () {
					const li = this.closest('li');
					const commentIndex = li.dataset.index;
					const newComment = li.querySelector('.edit-input').value;

					comments[commentIndex] = newComment;
					localStorage.setItem(`comments-${cocktail.name}`, JSON.stringify(comments));

					li.querySelector('.comment-text').textContent = newComment;
					li.querySelector('.comment-text').style.display = 'inline-block';
					li.querySelector('.edit-input').style.display = 'none';
					li.querySelector('.edit').style.display = 'inline-block';
					li.querySelector('.save').style.display = 'none';
				});
			});

			// 댓글 삭제
			document.querySelectorAll('.comment-btn.delete').forEach(btn => {
				btn.addEventListener('click', function () {
					const li = this.closest('li');
					const commentIndex = li.dataset.index;
					comments.splice(commentIndex, 1);
					localStorage.setItem(`comments-${cocktail.name}`, JSON.stringify(comments));
					li.remove();
				});
			});



			const likeBtn = modalContent.querySelector('button.like-btn');
			const heartImg = likeBtn.querySelector('.hImg');

			// 초기 상태 변수 설정
			let heartState = 'empty'; // 'empty' 빈 하트, 'filled' 빨간 하트

			// 클릭 이벤트 리스너 설정
			likeBtn.addEventListener('click', function () {
				// 현재 이미지 경로 가져오기
				console.log(heartState)
				// 상태 변수를 기반으로 이미지 변경
				if (heartState === 'empty') {
					heartImg.src = 'images/빨간하트.png';
					heartState = 'filled';
				} else {
					heartImg.src = 'images/빈하트.png';
					heartState = 'empty';
				}
			});


		} */

	/* 	function closeModal() {
			modal.style.display = 'none';
			window.scrollTo(0, scrollPosition);
		} */

		window.onclick = function (event) {
			if (event.target === modal) {
				closeModal();
			}
		};
/* 
		document.addEventListener('submit', function (event) {
			if (event.target.id === 'modal-comment-form') {
				event.preventDefault();
				const cocktailName = document.querySelector('.modal-div-right h3').textContent.split(' ')[0];
				const commentContent = document.getElementById('modal-comment-text').value.trim();

				if (commentContent === '') return;

				let comments = JSON.parse(localStorage.getItem(`comments-${cocktailName}`)) || [];

				comments.push(commentContent);
				localStorage.setItem(`comments-${cocktailName}`, JSON.stringify(comments));

				const commentList = document.getElementById('modal-comments-list');
				const newCommentIndex = comments.length - 1;
				const newCommentItem = document.createElement('li');
				newCommentItem.dataset.index = newCommentIndex;
				newCommentItem.innerHTML = `
            <span class="comment-text">${commentContent}</span>
            <input type="text" class="edit-input" style="display:none;" value="${commentContent}">
            <button type="button" class="comment-btn edit">수정</button>
            <button type="button" class="comment-btn save" style="display:none;">저장</button>
            <button type="button" class="comment-btn delete">삭제</button>
        `;
				commentList.appendChild(newCommentItem);

				// 새 댓글의 수정, 저장 및 삭제 버튼 이벤트 추가
				newCommentItem.querySelector('.comment-btn.edit').addEventListener('click', function () {
					newCommentItem.querySelector('.comment-text').style.display = 'none';
					newCommentItem.querySelector('.edit-input').style.display = 'inline-block';
					newCommentItem.querySelector('.edit').style.display = 'none';
					newCommentItem.querySelector('.save').style.display = 'inline-block';
				});

				newCommentItem.querySelector('.comment-btn.save').addEventListener('click', function () {
					const newComment = newCommentItem.querySelector('.edit-input').value;

					comments[newCommentIndex] = newComment;
					localStorage.setItem(`comments-${cocktailName}`, JSON.stringify(comments));

					newCommentItem.querySelector('.comment-text').textContent = newComment;
					newCommentItem.querySelector('.comment-text').style.display = 'inline-block';
					newCommentItem.querySelector('.edit-input').style.display = 'none';
					newCommentItem.querySelector('.edit').style.display = 'inline-block';
					newCommentItem.querySelector('.save').style.display = 'none';
				});

				newCommentItem.querySelector('.comment-btn.delete').addEventListener('click', function () {
					comments.splice(newCommentIndex, 1);
					localStorage.setItem(`comments-${cocktailName}`, JSON.stringify(comments));
					newCommentItem.remove();
				});

				document.getElementById('modal-comment-text').value = '';
			}
		}); */
 
	</script>

	<script>
		// 찜

	</script>

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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false">
	</script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script src="js/menu.js"></script>
	<script src="js/search.js"></script>

</body>

</html>