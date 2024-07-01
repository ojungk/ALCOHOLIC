<%@page import="java.io.Console"%>
<%@page import="com.smhrd.model.userDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
userDTO user = (userDTO) session.getAttribute("UserInfo");
%>
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
#btn-write {
	margin-bottom: 10px;
	border-radius: 3px;
}

.search-form {
	margin-top: 20px;
}

.search-form .form-group {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.search-form .form-control {
	flex: 1;
}

#search {
	width: 300px;
	margin-left: 720px;
	margin-bottom: 30px;
}

.search-form .btn {
	display: flex;
	align-items: center;
	justify-content: center;
	border-radius: 3px;
}

thead th, tbody td {
	border: 1px solid #ffffff;
}

#icon-search {
	font-size: 17px;
	width: 30px;
	height: 20px;
}

/* Modal Content Styling */
.modal-content {
	top: 200px;
	background-color: #333;
	/* 어두운 배경색 */
	color: white;
	/* 글자색 흰색 */
}

.modal_content::-webkit-scrollbar {
	width: 8px;
	/* 스크롤바 너비 */
	height: 8px;
}

.modal_content::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, 0.5);
	/* 스크롤바 색상 */
	border-radius: 4px;
	/* 스크롤바 모서리 반경 */
}

* {
	scrollbar-color: rgba(0, 0, 0, 0.5) rgba(0, 0, 0, 0.1);
	scrollbar-width: thin;
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

/* Form Input Styling */
.form-control {
	border-radius: 5px;
	border: 1px solid #333;
	padding: 12px;
	font-size: 16px;
}

/* Modal Footer Styling */
#searchQuery {
	margin-bottom: 20px;
	padding-top: 30px;
}

/* Pagination */
.pagination {
	display: flex;
	justify-content: center;
	margin-top: 70px;
}

.pagination button {
	margin: 0 10px;
	padding: 5px 10px;
	border: none;
	background-color: rgb(22, 22, 22);
	color: white;
	border: 1px solid white;
	border-radius: 3px;
	cursor: pointer;
}

.pagination button:hover {
	background-color: #3dbf78;
	/* 버튼 호버시 배경색 */
	border-color: #3dbf78;
	/* 버튼 호버시 테두리색 */
	color: black;
	/* 버튼 호버시 글자색 */
}

#currentPage {
	margin-top: 5px;
}

#btn-cancel {
	width: 52px;
	height: 33.5px;
	background-color: #3dbf78;
	/* 버튼 호버시 배경색 */
	border-color: #3dbf78;
	/* 버튼 호버시 테두리색 */
	color: black;
	/* 버튼 호버시 글자색 */
	cursor: pointer;
}

#btn-cancel:hover {
	background-color: #333;
	/* 버튼 호버시 배경색 */
	border-color: #3dbf78;
	/* 버튼 호버시 테두리색 */
	color: #3dbf78;
	/* 버튼 호버시 글자색 */
}

.modal {
	display: none;
	justify-content: center;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal_body {
	position: absolute;
	top: 50%;
	margin-left: 25%;
	width: 1000px;
	height: 850px;
	padding: 40px;
	text-align: center;
	background-color: #333;
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateY(-50%);
	border: 2px solid white;
}

.form-group-left img {
	width: 380px;
	height: 400px;
	object-fit: cover;
	border-radius: 2%;
}

.form-group2 {
	position: absolute;
	margin-left: 400px;
	width: 500px;
	height: 240px;
}

#text-content {
	margin-left: 10px;
}

.textbox {
	top: 150px;
	width: 500px;
	/* 너비 설정 */
	height: 240px;
	/* 높이 설정 */
	padding: 10px;
	/* 안쪽 여백 */
	border: 2px solid #ccc;
	/* 테두리 색상 및 두께 */
	border-radius: 5px;
	/* 모서리 둥글게 */
	font-size: 14px;
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

/*댓글기능*/
#div-line-menu {
	border-bottom: 2px solid #3dbf78;
	margin-top: 200px;
	padding-top: 17px;
	width: 500px;
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
	background-color: #333;
	border: 1px solid white;
	color: white;
	cursor: pointer;
	border-radius: 5px;
	font-size: 14px;
}

#modal-comment-form button[type="button"]:hover {
	background-color: #3dbf78;
	color: black;
	border: none;
	border-radius: 5px;
}

#comment-form-container {
	top: 540px;
	left: 52px;
	display: flex;
	position: absolute;
	align-items: flex-start;
	/* align-items: center; */
	gap: 10px;
	/* 요소들 사이의 간격 설정 */
}

#comment-text-container {
	flex: 1;
	/* 남은 공간을 모두 차지하도록 설정 */
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
	width: 740px;
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

#comment-div {
	/* position: absolute;
			margin-top: 55px; */
	max-height: 230px;
	/* 적절한 높이 설정 */
	overflow-y: auto;
	/* 수직 스크롤 추가 */
	padding: 10px;
	/* background-color: #3E3E41; */
	border-radius: 5px;
	width: 900px;
	padding-left: 11px;
	margin-top: 295px;
	margin-bottom: 20px;
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
	overflow-y: auto;
}

#feedmodal-comments-list .comments-body:last-child::-webkit-scrollbar {
	width: 10px;
	display: none;
}

#feedmodal-comments-list .comments-body:last-child::-webkit-scrollbar-thumb
	{
	height: 50%;
	background: #848484;
	border-radius: 10px;
}

#feedmodal-comments-list .comments-body:last-child::-webkit-scrollbar-track
	{
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

.comments-body {
	/* display: block; */
	position: relative;
	overflow-y: auto;
	width: auto;
	max-width: 100%;
	/* margin-left: 50px; */
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

.text-muted {
	position: absolute;
	top: 62px;
	left: 10px;
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

#user-comment {
	position: left;
	top: 55px;
}

#commentsSection {
	margin-top: 20px;
}

#commentsList {
	margin-bottom: 10px;
}

#commentInput {
	width: calc(100% - 120px);
	padding: 10px;
	margin-right: 10px;
}

#addCommentButton {
	padding: 10px 20px;
}

#comment-div-feed {
	position: absolute;
	margin-left: 15px;
	top: 600px;
	width: 900px;
	height: 200px;
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

#btn-mdf {
	background-color: #333;
	border: 1px solid white;
	color: white;
	border-radius: 2%;
	margin-right: 5px;
	position: absolute;
	top: 48px;
	left: 794px;
	width: 50px;
	height: 38px;
	cursor: pointer;
}

#save-button {
	background-color: #333;
	border: 1px solid white;
	color: white;
	border-radius: 2%;
	margin-right: 5px;
	position: absolute;
	top: 48px;
	left: 794px;
	width: 50px;
	height: 38px;
	cursor: pointer;
}

#btn-delete {
	background-color: #333;
	border: 1px solid white;
	color: white;
	border-radius: 2%;
	margin-right: 5px;
	position: absolute;
	top: 48px;
	left: 856px;
	width: 50px;
	height: 38px;
	cursor: pointer;
}

#cancel-button {
	background-color: #333;
	border: 1px solid white;
	color: white;
	border-radius: 2%;
	margin-right: 5px;
	position: absolute;
	top: 48px;
	left: 856px;
	width: 50px;
	height: 38px;
	cursor: pointer;
}

#btn-mdf:hover {
	background-color: #3dbf78;
	border: none;
	color: black;
	text-align: center;
	padding-top: 3px;
}

#save-button:hover {
	background-color: #3dbf78;
	border: none;
	color: black;
	text-align: center;
	padding-top: 3px;
}

#btn-delete:hover {
	background-color: #3dbf78;
	border: none;
	color: black;
	text-align: center;
	padding-top: 3px;
}

#cancel-button:hover {
	background-color: #3dbf78;
	border: none;
	color: black;
	text-align: center;
	padding-top: 3px;
}

.table {
	width: 100%;
	border-collapse: collapse;
	color:gray;
}

.table th, .table td {
	border: 1px solid #000;
	padding: 8px;
	text-align: left;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

#boardContent{
	border-left: 2px solid white;
	border-right: 2px solid white;
	border-bottom: 2px solid white;
}

#boardContent:hover{
	color:#green;
}

#g1{
	border-left: 2px solid white;
	border-right: 2px solid white;
}
#explain2 {
   position: absolute;
   top: -16px;
   left: -405px;
   width: 890px;
   height: 675px;
}
.table td {
	max-width: 150px; /* Adjust the maximum width as needed */
}
/* #like-dislike-span{
	color: #bfbfbf;
    position: fixed;
    margin-top: 35px;
} */
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<h2 id="login-logo"></h2>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> MENU
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="welcome.jsp" class="nav-link">Home</a></li>
					<li class="nav-item "><a href="menu.jsp" class="nav-link">Menu</a></li>
					<li class="nav-item"><a href="ingredient.jsp" class="nav-link">Ingredient</a></li>
					<li class="nav-item"><a href="feed.jsp" class="nav-link">Feed</a></li>
					<li class="nav-item active"><a href="board.jsp"
						class="nav-link">Board</a></li>
					<li class="nav-item"><a href="mypage.jsp" class="nav-link">Mypage</a></li>
					<li class="nav-item"><a href="LogoutService" class="nav-link">Logout</a></li>
				</ul>
			</div>
		</div>

		<div class="search_text">
			<form action="">
				<input type="text" class="form-control2" id="searchQuery3"
					placeholder="검색어를 입력하세요">
				<button type="button" class="btn-search">
					<i class="fas fa-search" id="icon-search"></i>
				</button>
			</form>
		</div>
	</nav>
	<!-- END nav -->

	<section class="ftco-section" id="ig">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-5">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<h2 class="mb-4">Board</h2>
					<p class="flip">
						<span class="deg1"></span><span class="deg2"></span><span
							class="deg3"></span>
					</p>
					<p class="mt-5">
						소통 및 정보공유를 위한 ALCOHOLIC 게시판입니다.<br>자유로운 소통을 지향하지만 사용자들간에 네티켓을
						꼭 지켜주세요!
					</p>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="d-flex justify-content-between align-items-center mt-3">
				<div class="search-form">
					<div class="form-group d-flex" id="search">
						<input type="text" class="form-control" id="searchQueryBoard"
							placeholder="검색어를 입력하세요">
						<button type="button" class="btn btn-primary ml-2"
							onclick="searchBoard()">
							<i class="fas fa-search" id="icon-search"></i>
						</button>
					</div>
				</div>

				<div class="group">
					<a href="javascript:void(0)">
						<button type="button" class="btn btn-primary" id="btn-write">글
							작성</button>
					</a>
				</div>
			</div>

			<table class="table">
				<thead class="table-dark">
					<tr>
						<th class="border" style="width: 6%">글 번호</th>
						<th class="border" style="width: 15%">제목</th>
						<th class="border" style="width: 30%">내용</th>
						<th class="border" style="width: 10%">작성자</th>
						<th class="border" style="width: 10%">등록일</th>
						<th class="border" style="width: 6%">조회수</th>
					</tr>
				</thead>
				<tbody id="g1">
					<tr>
						<td>공지</td>
						<td>[공지]수민아 술좀 그만마셔</td>
						<td>[공지]수민아 술좀 그만마셔</td>
						<td>얼마나</td>
						<td>마시는게야</td>
						<td>18</td>
					</tr>
				</tbody>
				<tbody id="boardContent">
				</tbody>
			</table>

			<div class="pagination">
				<a href="javascript:void(0)">
					<button onclick="prevPage()" id="prevBtn" class="disabled">Previous</button>
					<span id="currentPage" class="mx-2"></span>
					<button onclick="nextPage()" id="nextBtn">Next</button>
				</a>
			</div>

			<!-- 오픈모달 오픈모달 게시글열기 -->
			<div class="modal" tabindex="-1" aria-hidden="true"
				style="display: none;">
				<div class="modal_body"></div>




			</div>

			<!-- Modal -->
			<div class="modal fade" id="writeModal" tabindex="-1" role="dialog"
				aria-labelledby="writeModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="writeModalLabel">📖글쓰기</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<!-- Form fields for writing a new post -->
							<form action="PostUpload" method="post"
								enctype="multipart/form-data" id="postup">
								<div class="form-group">
									<label for="postImage">📂이미지 업로드</label> <input type="file"
										class="form-control-file" id="postImage" name="post_img">
								</div>
								<div class="form-group">
									<label for="postTitle">📝게시물 제목</label> <input type="text"
										class="form-control" id="postTitle" name="post_title">
								</div>
								<div class="form-group">
									<label for="postDescription">📝게시물 설명</label>
									<textarea class="form-control" id="postDescription" rows="3"
										name="post_dp"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="btn-cancel">취소</button>
							<button type="submit" class="btn btn-primary" form="postup">저장</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>



	<script>
    const rowsPerPage = 10; // 페이지당 표시할 행 수
    let currentPage = 1; // 초기 페이지 설정

    function displayPage(page) {
      const rows = document.querySelectorAll('#boardContent tr');
      const totalRows = rows.length;
      const totalPages = Math.ceil(totalRows / rowsPerPage);

      document.getElementById('prevBtn').classList.toggle('disabled', page === 1);
      document.getElementById('nextBtn').classList.toggle('disabled', page === totalPages);

      rows.forEach((row, index) => {
        row.style.display = (index >= (page -1) * rowsPerPage && index < page * rowsPerPage) ? '' : 'none';
      });

      currentPage = page;

      // 현재 페이지 수 업데이트
      document.getElementById('currentPage').textContent = `Page ${currentPage} of ${totalPages}`;
    }

    function prevPage() {
      if (currentPage > 1) {
        displayPage(currentPage - 1);
      }
    }

    function nextPage() {
      const rows = document.querySelectorAll('#boardContent tr');
      const totalRows = rows.length;
      const totalPages = Math.ceil(totalRows / rowsPerPage);
      if (currentPage < totalPages) {
        displayPage(currentPage + 1);
      }
    }

    // 테이블 초기화하여 첫 페이지 표시
    displayPage(1);
  </script>

	<script>
    function showWriteModal() {
      $('#writeModal').modal('show');
    }

    function submitPost() {
      $('#writeModal').modal('hide');
    }

    document.getElementById('btn-write').addEventListener('click', function () {
      showWriteModal();
    });

    document.querySelector('#writeModal .modal-footer .btn-primary').addEventListener('click', function () {
      submitPost();
    });

    document.querySelector('#writeModal .modal-footer .btn-secondary').addEventListener('click', function () {
      $('#writeModal').modal('hide');
    });
  </script>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
      <circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
      <circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
    </svg>
	</div>

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
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script src="js/post.js"></script>
	<script src="js/search.js"></script>
	<script src="js/searchBoard.js"></script>


</body>

</html>