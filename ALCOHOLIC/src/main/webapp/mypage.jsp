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
.ftco-section {
	height: 100px;
	margin-top: 80px;
}

.section {
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
	border-top: 4px solid #3dbf78;
	border-bottom: 4px solid white;
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
	border-top: 4px solid #3dbf78;
	border-bottom: 4px solid white;
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

#description {
	width: 250px;
	line-height: 2.0;
	height: calc(0.5em * 8);
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 7;
	-webkit-box-orient: vertical;
	text-align: left !important;
}

.more-link {
	text-align: right;
}

.info-container {
	width: 400px;
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
	margin-left: 10px;
}

#ename {
	width: 230px;
	line-height: 2.0;
	height: calc(0.3em * 5);
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 7;
	-webkit-box-orient: vertical;
	margin-left: 10px;
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
	width: 37%;
	/* 이미지를 부모 요소인 modal-div-left의 너비에 맞춰 꽉 차게 설정 */
	height: 450px;
	/* 이미지의 높이 자동으로 조정 */
	border-radius: 30px;
	/* 원하는 경우 이미지에 둥근 모서리 추가 */
	position: absolute;
	top: 30px;
}

#modal-abv {
	position: absolute;
	top: 480px;
	left: 30px;
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
	position: absolute;
	top: 480px;
}

/* 댓글 창 스타일 */
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

.text-muted {
	position: absolute;
	bottom: 0px;
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
	position: relative;
	overflow: hidden;
}

#more_btn {
	margin-left: 89px;
}

#upload {
	margin-top: 50px;
	margin-left: 130px;
}

#upload_title {
	margin: 0px;
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
/*사용자 맞춤 추천 칵테일*/
.recommend-ct {
	background-color: none;
	width: 95%;
	height: auto;
	padding: 20px;
	margin-bottom: 20px;
	border-top: 4px solid #3dbf78;
	border-bottom: 4px solid white;
}

#recommend-info {
	text-align: center;
	border: 8px double whitesmoke;
	padding-top: 30px;
	padding-bottom: 30px;
	color: #b4b2b2;
	margin-bottom: 70px;
}

#colorGreen {
	color: #3dbf78;
}

#colorPink {
	color: pink;
}

#more_btn2 {
	margin-left: 90px;
}

.hImg {
	margin-left: 158px;
	width: 28px;
	height: 28px;
	background: none !important;
	border: none;
	position: absolute;
	top: 430px;
	left: 131px;
}

#like-dislike-span {
	position: fixed;
	margin-top: 350px;
	margin-left: 150px;
}



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
					<li class="nav-item"><a href="board.jsp" class="nav-link">Board</a></li>
					<li class="nav-item active"><a href="mypage.jsp"
						class="nav-link">Mypage</a></li>
					<li class="nav-item"><a href="LogoutService" class="nav-link">Logout</a></li>
				</ul>
			</div>
		</div>

		<div class="search_text">
			<input type="text" class="form-control2" id="searchQuery3"
				placeholder="검색어를 입력하세요">
			<button type="button" class="btn-search">
				<i class="fas fa-search" id="icon-search"></i>
			</button>
		</div>
	</nav>
	<!-- END nav -->


	<section class="section">
		<div class="profile-base">
			<div class="profile-image">
				<img id="profileImg" src="images/<%=user.getUser_img()%>"
					alt="Profile Image">
			</div>

			<div class="profile-info">
				<h1 id="userNickName">
					💗<%=user.getUser_nick()%>
					님💗
				</h1>
				<h3 id="Uploaded">📃 Uploaded Post : 3</h3>
				<h3 id="bookmark">💚 Bookmark : 8</h3>
			</div>
			<div class="profile-btn">
				<form action="cangeimg">
					<input type="file" id="fileInput" accept="image/*"
						style="display: none;" name="imgg"> <a href="#"
						class="ml-2 btn btn-white btn-outline-white" id="btn1"
						type="submit">이미지 수정</a> <a href="#"
						class="ml-2 btn btn-white btn-outline-white" id="btn2"
						data-toggle="modal" data-target="#editUserModal">회원정보 수정</a>
				</form>
			</div>
		</div>
		<div class="user-upload">
			<h3>☑ Uploaded Post</h3>
			<div class="container" id="upload">
				<div class="row d-flex" id="myupload">
					<!-- <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="#" class="block-20" style="background-image: url('images/image_1.jpg');">
              </a>
              <div class="text py-4 d-block">
                <div class="meta">
                  <div><a href="#">Oct 8, 2023</a></div>
                  <div><a href="#">김수민</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2" id="upload_title"><a href="#">다혜야 생일축하해~~!!</a></h3>
                <p>오늘은 큐티 뽀짝 상큼 다혜의 생일!!<br>좋은 술과 좋은 친구들ㅜㅜ 넘재밌었다~~!!!🎉</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="#" class="block-20" style="background-image: url('images/image_2.jpg');">
              </a>
              <div class="text py-4 d-block">
                <div class="meta">
                  <div><a href="#">Dec 2, 2023</a></div>
                  <div><a href="#">전다혜</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 2</a></div>
                </div>
                <h3 class="heading mt-2" id="upload_title"><a href="#">72년생 횐님들과 좋은하루^^....</a></h3>
                <p>우리으... 우정... 영원...히...!! ^^....!!</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
            <div class="blog-entry align-self-stretch">
              <a href="#" class="block-20" style="background-image: url('images/image_3.jpg');">
              </a>
              <div class="text py-4 d-block">
                <div class="meta">
                  <div><a href="#">Sept 7, 2018</a></div>
                  <div><a href="#">오준하</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 5</a></div>
                </div>
                <h3 class="heading mt-2" id="upload_title"><a href="#">찬유 군대잘갔다와 ㅜㅜㅠ</a></h3>
                <p>없어도 상관없는 우리친구 찬유ㅜㅜ<br>군대에서 꼭 어디하나 없어져서오자! ㅜㅜ</p>
              </div>
            </div>
          </div> -->
				</div>
			</div>
		</div>
		<div class="like-ct">
			<h3>☑ Bookmark</h3>
			<div class="container">
				<div class="row d-flex" id="cocktail-list"></div>
			</div>
		</div>

		<div class="modal" style="display: none;">
			<div class="modal_popup">
				<p id="modal-content"></p>
				<p class="btn-close-modal">
					<a href="javascript:void(0)"
						class="ml-2 btn btn-white btn-outline-white" id="closeModal"
						onclick="closeModal()">X</a>
				</p>
			</div>
		</div>
		<!-- 사용자 맞춤 추천 칵테일 부분 -->
		<div class="recommend-ct">
			<h3
				style="text-align: center; margin-top: 20px; margin-bottom: 30px;">✨Recommendation
				For You✨</h3>
			<h5 id="recommend-info">
				'<span id="colorPink"><%=user.getUser_nick()%></span>'님은 '<span
					id="colorGreen"><%=session.getAttribute("acoltype")%></span>' BASE의
				'<span id="colorGreen"><%=session.getAttribute("acol_value")%></span>'
				도수 칵테일을 주로 찜하셨어요!<br> 비슷한 종류의 칵테일을 추천해드릴게요!👍
			</h5>
			<div class="container">
				<div class="row d-flex" id="cocktail-list2">
					<!-- 이곳에 넣으면 된다!!!!!! -->
				</div>
			</div>
		</div>

		<!-- Recommend Modal -->
		<div class="modal recommend-modal" style="display: none;">
			<div class="modal_popup">
				<p id="recommend-modal-content"></p>
				<p class="btn-close-modal">
					<a href="javascript:void(0)"
						class="ml-2 btn btn-white btn-outline-white"
						id="closeRecommendModal" onclick="closeCocktailModal()">X</a>
				</p>
			</div>
		</div>
	</section>

	<script>
  
//이미지 실시간 업데이트 함수 
//이미지 업데이트 후, 이미지의 src에 새로운 timestamp를 추가하여 강제로 캐시를 무효화.
function updateProfileImage(fileName) {
    const timestamp = new Date().getTime(); // 현재 날짜와 시간을 나타내는 새 개체 - timestamp
    //  "?" + timestamp : 현재 타임스탬프를 쿼리 매개변수로 URL에 추가
    document.getElementById("profileImg").src = "images/" + fileName + "?" + timestamp; 
  
}


  
  document.getElementById("btn1").addEventListener("click", function (event) {
 event.preventDefault();
 console.log("이미지 수정 버튼 클릭");
 document.getElementById("fileInput").click();
});

  
  // 파일 변경 시,기능 실행
document.getElementById("fileInput").addEventListener("change", function (event) {
     // event.target: 이벤트를 발생시킨 요소
     // .files[0]: 선택한 파일 목록 중 첫 번째 파일
      const file = event.target.files[0];
      if (file) {
         // FormData() : form의 현재 key/value 들로 채워짐
          const formData = new FormData();
          formData.append("imgg", file);
          console.log("선택한 파일 이름 : ", file.name);
        
          //  fetch() : 첫번째 인자로 URL, 두번째 인자로 옵션 객체를 받고 Promise 타입의 객체를 리턴
          fetch('updateFileService', {
              method: 'POST',
              body: formData
          })
          .then(response => response.text()) // 응답을 text 형식으로 변환 , json 변환시 서버쪽 응답도 json으로
          .then(data => {
              console.log("서버 응답 : ", data); 
              alert(data); // 업로드 완료 메시지를 경고창으로 표시
              
              
              // 업로드 완료 후 프로필 이미지 업데이트
              updateProfileImage(file.name);
            
          })
          .catch(error => console.error('Error:', error));
      }
  });

  </script>

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

      const cocktail = cocktails[cocktailIndex];
      const comments = JSON.parse(localStorage.getItem(`comments-${cocktail.name}`)) || [];

      modalContent.innerHTML = `
        <div class="modal-div-left" id="mc">
            <img src="${cocktail.image}" alt="${cocktail.name}" id="mdImg">
            <span id="modal-abv">ABV: ${cocktail.ABV}</span>
			<button class="like-btn"><img class="hImg" src="images/빈하트.png"></button>
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


    }
*/
    /* function closeModal() {
      modal.style.display = 'none';
      window.scrollTo(0, scrollPosition);
    } */

    window.onclick = function (event) {
      if (event.target === modal) {
        closeModal();
      }
    };
 
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
    });

  </script>

	<script>
    // 찜

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

	<!-- 회원정보 수정 모달 -->
	<div class="modal fade" id="editUserModal" tabindex="-1" role="dialog"
		aria-labelledby="editUserModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="editUserModalLabel">📝 회원정보 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="userUpdate">
						<div class="form-group">
							<label for="userNick">1️⃣ 닉네임</label> <input type="text"
								class="form-control" id="userNick" name="userNick"
								value="<%=user.getUser_nick()%>">
						</div>
						<div class="form-group">
							<label for="userPw">2️⃣ 비밀번호</label> <input type="password"
								class="form-control" id="userPw" name="userpw1">
						</div>
						<div class="form-group">
							<label for="userPwConfirm">3️⃣ 비밀번호 확인</label> <input
								type="password" class="form-control" id="userPwConfirm"
								name="userpw2">
						</div>
						<div class="form-group">
							<label for="userDate">4️⃣ 가입 날짜</label> <input type="text"
								class="form-control" id="userDate" value="2024-06-19" readonly>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">저장</button>
				</div>
				</form>
			</div>
		</div>
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
	<script src="js/scrollax.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/mypage.js"></script>
	<script src="js/search.js"></script>

	<script>
   /*  const user = [{
      user_idx: "0",
      user_id: "sumin",
      user_pw: "1234",
      user_nick: "집갈래요",
      user_date: "2024-06-19",
      user_type: "normal"
    }]; */

    /*user_idx 따라서 profile-info의 닉네임이 바뀌도록함*/
   /*   document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("userNickName").textContent = `💗${user[0].user_nick} 님💗`;
    });
 */
    document.getElementById("btn1").addEventListener("click", function (event) {
      event.preventDefault();
      document.getElementById("fileInput").click();
    });

   /*  document.getElementById("fileInput").addEventListener("change", function (event) {
      const file = event.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
          document.getElementById("profileImg").src = e.target.result;
        };
        reader.readAsDataURL(file);
      }
    }); */

    // 모달이 열릴 때 현재 닉네임을 입력 필드에 설정
   /* $('#editUserModal').on('show.bs.modal', function () {
      document.getElementById('userNick').value = user[0].user_nick;
    });

    document.querySelector('.modal-footer .btn-primary').addEventListener('click', function () {
      const newNick = document.getElementById('userNick').value;
      user[0].user_nick = newNick;
      document.getElementById('userNickName').textContent = `💗${newNick} 님💗`;
      $('#editUserModal').modal('hide');
    }); */
  </script>
</body>

</html>