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
			/* height: 310px; */
		}

		#writing {
			/* float: right; */
			position: relative;
			padding-bottom: 10px;
			text-align: right;
			padding-top: 0px;
		}

		#cocktail-section {
			padding-top: 0px;
			margin-top: 0px;
		}

		#feed-content {
			padding-top: 20px;
		}

		.text-center {
			float: left;
		}

		/* 글작성 모달창 디자인 */
		#openModalWrite {
			position: absolute;
			top: 10px;
			right: 10px;
			color: #fff;
			border-radius: 5px;
			text-decoration: none;
			cursor: pointer;
			display: inline-block;
			background-color: #3dbf78;
			color: white;
			border: none;
			padding: 10px 20px;
			cursor: pointer;
			border-radius: 5px;
			font-size: 14px;
			transition: background-color 0.3s;
			margin: 25px 4px 20px 10px;
			display: block;
		}

		#openModalWrite:hover {
			background-color: #1b9e56;
		}

		#openModalWrite:focus {
			border: none;
			outline: none;
		}

		#closeModal {
			margin-right: 20px;
		}

		#closeModalModify {
			margin-right: 20px;
		}

		/* Feed */
		.block-20 {
			border-radius: 20%;
			position: relative;
			overflow: hidden;
		}

		.heading mt-2 text-center {
			margin: 0px;
		}

		.side-info {
			width: 250px;
			overflow: hidden;
			font-size: 15px;
			margin-bottom: 5px;
		}

		.blog-entry .text .heading {
			margin-bottom: 5px;
		}

		.blog-entry .text {
			margin-bottom: 5px;
			padding-top: 0px !important;
		}

		/* 더보기 hover */
		.block-20:hover {
			opacity: 0.8;
			/* hover 시 투명도 조절 */
		}

		.block-20 .overlay {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			color: white;
			padding: 10px;
			box-sizing: border-box;
			opacity: 0;
			transition: opacity 0.3s ease;
			text-align: center;
			width: 100%;
		}

		.block-20:hover .overlay {
			opacity: 1;
		}

		.overlay-text {
			font-size: 27px;
			text-decoration: underline;
			text-underline-position: under;
			text-underline-offset: 0.1px;
		}

		/* Feed 메인 줄간격 */
		#title,
		#date {
			width: 250px;
			line-height: 2.0;
			height: calc(0.3em * 5);
			overflow: hidden;
			display: -webkit-box;
			-webkit-line-clamp: 7;
			-webkit-box-orient: vertical;
			text-align: left !important;
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

		.icon-chat {
			margin-left: 7px;
		}

		/* 모달창 */
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
			padding-top: 20px;
			background: #121618;
			border-radius: 20px;
			width: 800px;
			border: 2px solid white;
			max-height: 610px;
			overflow-y: scroll;
		}

		.modal_popup::-webkit-scrollbar {
			width: 10px;
			display: none;
		}

		.modal_popup::-webkit-scrollbar-thumb {
			height: 50%;
			background: #848484;
			border-radius: 10px;
		}

		.modal_popup::-webkit-scrollbar-track {
			background: #84848447;
		}

		.modal_popup .modal-div-left {
			float: left;
			text-align: left;
			width: 290px;
			padding-right: 20px;
			margin-top: 23px;
		}

		.modal-div-left img {
			width: 100%;
			height: 317px;
			border-radius: 30px;
		}

		#btn1 {
			margin-top: 10px;
			margin-left: 0px !important;
			background: #3dbf78;
			border-color: #3dbf78;
			color: #000;
		}

		#btn1:hover {
			background: transparent;
			border: 1px solid #3dbf78;
			color: #3dbf78;
		}

		.modal_popup .modal-div-right {
			float: right;
			width: 410px;
			text-align: left;
			margin-top: 23px;
			border: 2px solid #3dbf78;
			padding-left: 11px;
			border-radius: 30px;
			background: #292828;
			height: 348px;
			margin-bottom: 15px;
		}

		.modal-div-top {
			padding: 0px;
			padding-bottom: 90px;
			height: 85px;
			border-bottom: 1px solid #3dbf78;
			margin-bottom: 5px;
			margin-top: 30px;
		}


		.modal-div-top .modal-div-top-left {
			float: left;
		}

		.modal-div-top .modal-div-top-right {
			float: right;
		}

		.modal_popup .modal-div-right .text-right {
			text-align: left !important;
			margin-bottom: 7px;
			padding-left: 10px;
			padding-top: 10px;
		}

		.modal-div-center {
			clear: both;
			width: 725px;
		}

		.modal-center-title {
			clear: both;
			width: 725px;
			padding-top: 25px;
		}

		#explain {
			width: 706px !important;
		}

		#modal-modify {
			display: flex;
			margin-top: 4px;
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

		/* #comment-btn edit:focus{
			border: none;
			outline: none;
		}

		#comment-btn delete:focus{
			border: none;
			outline: none;
		} */

		.comment-btn.clicked {
			border: none;
			outline: none;
		}

		/* 수정모달창 */
		.modal_modify_btn {
			display: none;
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-color: rgba(0, 0, 0, 0.5);
			/* 반투명 배경 */
			z-index: 9999;
		}

		.modal-top-title {
			padding-bottom: 65px;
			margin-bottom: 10px;
			height: 67px;
			border-bottom: 1px solid #3dbf78;
			margin-bottom: 5px;
			margin-top: 30px;
		}

		.modal-top-title .modal-top-title-left {
			float: left;
		}

		.modal-top-title .modal-top-title-right {
			float: right;
		}

		.modal_popup_modify .modal-div-left {
			float: left;
			text-align: left;
			width: 290px;
			padding-right: 20px;
			margin-top: 23px;
		}

		.modal-div-left img {
			width: 100%;
			height: 317px;
			border-radius: 30px;
		}

		.modal_popup_modify .modal-div-right {
			float: right;
			width: 410px;
			text-align: left;
			margin-top: 23px;
			border: 2px solid #3dbf78;
			padding-top: 10px;
			padding-left: 11px;
			border-radius: 30px;
			background: #292828;
			height: 348px;
			margin-bottom: 15px;
		}

		.modal-div-top {
			padding: 0px;
			padding-bottom: 90px;
			height: 85px;
			border-bottom: 1px solid #3dbf78;
			margin-bottom: 5px;
			margin-top: 30px;
		}

		.modal_popup_modify {
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			padding: 40px;
			padding-top: 20px;
			background: #121618;
			border-radius: 20px;
			width: 800px;
			border: 2px solid white;
			max-height: 610px;
			overflow-y: scroll;
		}

		.modal_modify_btn .modal_popup_modify .close_btn {
			display: block;
			padding: 10px 20px;
			background-color: #3dbf78;
			border: none;
			border-radius: 5px;
			color: #fff;
			cursor: pointer;
			transition: box-shadow 0.2s;
		}

		#title-modify {
			margin-top: 20px;
			margin-left: 10px;
			margin-top: 9px;
			margin-bottom: 5px;
		}

		/* 사용자 프로필 */
		.profile-img {
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

		#comment-div-feed{
			max-height: 400px;
			border-radius: 5px;
			width: 700px;
			margin-top: 15px;
			overflow-y: auto;
			scrollbar-width: thin; /* Firefox에 적용되는 속성 */
    		scrollbar-color: transparent; /* Firefox에 적용되는 속성 */
		}

		#comment-div-feed::-webkit-scrollbar {
			width: 0px;
			display: none;
		}

		#comment-div-feed::-webkit-scrollbar-thumb {
			height: 50%;
			/* background: #848484; */
			background: transparent;
			border-radius: 10px;
		}

		#comment-div-feed::-webkit-scrollbar-track {
			/* background: #84848447; */
			background: transparent;
		}

		.comment-div-gap-feed {
			margin-bottom: -45px;
		}



		#img-user-info {
			display: flex;
			align-items: center;
			margin-bottom: 10px;
			position: relative;
			z-index: 1;
			margin-top: 0px;
			padding-left: 10px;
		}

		/* 수정 버튼 */
		#openModalModify {
			display: inline-block;
			background-color: #3dbf78;
			color: black;
			padding: 7px 10px;
			margin-top: 46px;
			font-size: 14px;
			transition: background-color 0.3s;
			border-color: #3dbf78;
			color: black;
			cursor: pointer;
			height: 32px;
		}

		#openModalModify:hover {
			background-color: transparent;
			color: #3dbf78;
			border: 1px solid #3dbf78;

		}

		/* 삭제 버튼 */
		#openModalDelete {
			display: inline-block;
			background-color: #3dbf78;
			color: black;
			padding: 7px 10px;
			margin-top: 46px;
			margin-left: 6px;
			font-size: 14px;
			transition: background-color 0.3s;
			border-color: #3dbf78;
			color: black;
			cursor: pointer;
			height: 32px;
		}

		#openModalDelete:hover {
			background-color: transparent;
			color: #3dbf78;
			border: 1px solid #3dbf78;
		}

		#div-line {
			border-bottom: 1px solid #3dbf78;
			margin-top: 15px;
			width: 705px;
		}

		/* 댓글 */
		#modal-comment-form {
			display: flex;
			align-items: center;
			margin-top: 25px;
			padding-left: 10px;
		}

		#feed-comments-list {
			/* max-height: 200px; */
			overflow-y: auto;
			padding: 0;
			list-style-type: none;
		}

		.comments-body {
			/* display: block; */
			position: relative;
			overflow-y: auto;
			width: auto;
			max-width: 100%;
		}

		.text-muted {
			position: absolute;
			bottom: 0px;
		}

		/* .small-t{
			position: absolute;
		} */

		#feed-comments-list .comments-body {
			background-color: #3E3E41;
			color: #F0F0F2;
			border-radius: 15px;
			padding: 10px;
			margin-bottom: 10px;
			display: block;
			height: 97px;

		}

		#feed-comments-list .comments-body:last-child {
			margin-bottom: 0;
			overflow-y: auto;
		}


		#feed-comments-list .comments-body:last-child::-webkit-scrollbar {
			width: 0px;
			display: none;
		}

		#feed-comments-list .comments-body:last-child::-webkit-scrollbar-thumb {
			height: 50%;
			background: #848484;
			border-radius: 10px;
		}

		#feed-comments-list .comments-body:last-child::-webkit-scrollbar-track {
			background: #84848447;
		}

		#feed-comments-list li {
			background-color: #3E3E41;
			color: #F0F0F2;
			border-radius: 15px;
			padding: 10px;
			margin-bottom: 10px;
			opacity: 1;
		}

		#feed-comments-list li:last-child {
			margin-bottom: 0;
		}


		#feed-comments-list li p {
			margin: 0;
			font-size: 14px;
			padding-bottom: 10px;
		}

		#modal-comment-text {
			flex: 1;
			resize: vertical;
			width: 523px;
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
			overflow-y: auto;
			/* word-wrap: break-word; */
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


		#modal-comment-form button[type="button"] {
			padding: 11px 18px;
			background-color: #3dbf78;
			color: white;
			border: none;
			cursor: pointer;
			border-radius: 5px;
			font-size: 14px;
			transition: background-color 0.3s;
			white-space: nowrap;
			width: 93px;
		}

		#modal-comment-form button[type="button"]:hover {
			background-color: #1b9e56;
		}

		#modal-comments-list {
			margin-top: 20px;
			padding: 0;
			list-style-type: none;
			max-height: 200px;
			overflow-y: auto;
			width: 705px;
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

		#modal-comment-form button[type="submit"]:focus {
			border: none;
			outline: none;
		}

		#comment-form-container {
			display: flex;
			position: relative;
			align-items: flex-start;
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

		/* 수정모달 텍스트박스 */
		.textbox-modify {
			width: 387px;
			height: 100px;
			padding: 10px;
			background: #292828;
			border: 2px solid gray;
			color: white;
			border-radius: 5px;
			font-size: 13px;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
			resize: none;
		}

		.textbox-modify:focus {
			background: #f9f9f9;
			color: black;
		}

		.textbox-title {
			width: 705px;
			height: 47px;
			padding: 10px;
			background: #292828;
			border: 2px solid gray;
			color: white;
			border-radius: 5px;
			font-size: 13px;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
			resize: none;
		}

		.textbox-title:focus {
			background: #f9f9f9;
			color: black;
		}

		#material-info {
			color: white;
		}

		#material-img {
			width: 31px;
			height: 28px;
		}

		#recipe-info {
			color: white;
		}

		#material-modify {
			color: white;
			margin-bottom: 3px;
		}

		#recipe-modify {
			color: white;
			margin-bottom: 3px;
		}

		#modify-feed-content {
			color: white;
		}

		.textbox:disabled,
		.textbox[readonly] {
			background-color: #c5c5c5;
			border-color: #121618;
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



		#modal-date {
			margin-top: 10px;
			text-align: left;
			position: absolute;
		}

		/* 찜 */
		button {
			background: none;
			border: none;
		}

		button.like-btn:focus {
			border: none;
			outline: none;
		}

		.like-btn {
			width: 100px;
			height: 50px;
		}

		.like-btn img {
			margin-top: 5px;
			margin-left: 232px;
			margin-bottom: 40px;
			width: 28px;
			height: 28px;
			background: none !important;
			border: none;
		}

		/* 텍스트박스 */
		.textbox {
			width: 387px;
			height: 100px;
			padding: 10px;
			border: 2px solid #ccc;
			border-radius: 5px;
			font-size: 13px;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
			resize: none;
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

		#btn-save {
			/* margin: 0 10px; */
			margin-right: 1px;
			padding: 5px 10px;
			border: none;
			background-color: #3dbf78;
			color: black;
			border: 1px solid #3dbf78;
			cursor: pointer;
			font-size: 14px;
		}

		#btn-save:hover {
			background-color: transparent;
			border: 1px solid #3dbf78;
			color: #3dbf78;
		}

		#btn-cancel {
			/* margin: 0 10px; */
			margin-left: 10px;
			padding: 5px 10px;
			border: none;
			background-color: #3dbf78;
			color: black;
			border: 1px solid #3dbf78;
			cursor: pointer;
			font-size: 14px;
		}

		#btn-cancel:hover {
			background-color: transparent;
			border: 1px solid #3dbf78;
			color: #3dbf78;
		}

		#btn-cancel-modify {
			/* margin: 0 10px; */
			margin-left: 10px;
			padding: 5px 10px;
			border: none;
			background-color: #3dbf78;
			color: black;
			border: 1px solid #3dbf78;
			cursor: pointer;
			font-size: 14px;
		}

		#btn-cancel-modify:hover {
			background-color: transparent;
			border: 1px solid #3dbf78;
			color: #3dbf78;
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

		/* 글작성 */
		#btn-write {
			margin-bottom: 10px;
			margin-right: 5px;
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

		thead th,
		tbody td {
			border: 1px solid #ffffff;
		}

		#icon-search {
			font-size: 17px;
			width: 30px;
			height: 20px;
		}

		/* Modal Content Styling */
		.modal-content {
			background-color: #333;
			color: white;
			top: 110px;
		}

		.modal_content::-webkit-scrollbar {
			width: 8px;
			height: 8px;
		}

		.modal_content::-webkit-scrollbar-thumb {
			background-color: rgba(0, 0, 0, 0.5);
			border-radius: 4px;
		}

		* {
			scrollbar-color: rgba(0, 0, 0, 0.5) rgba(0, 0, 0, 0.1);
			scrollbar-width: thin;
		}

		.modal-header,
		.modal-body {
			border: none;
		}

		.modal-footer {
			border: none;
			/* 모달 내부의 테두리 제거 */
		}

		.modal-footer-modify {
			border: none;
			float: right;
		}

		#modifyImage {
			padding-top: 10px;
		}

		.modal-header .close {
			color: white;
			/* 닫기 버튼 색상 흰색 */
		}
		
		.modal-header .close:focus {
			border: none;
			outline: none;
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
       #like-dislike-span{
			margin-left: 50px;
		} 

	</style>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container">
		   <h2 id="login-logo"></h2>
		   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav"
			  aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			  <span class="oi oi-menu"></span> Welcome
		   </button>
		   <div class="collapse navbar-collapse" id="ftco-nav">
			  <ul class="navbar-nav ml-auto">
				 <li class="nav-item"><a href="welcome.jsp" class="nav-link">Home</a></li>
				 <li class="nav-item"><a href="menu.jsp" class="nav-link">Menu</a></li>
				 <li class="nav-item"><a href="ingredient.jsp" class="nav-link">Ingredient</a></li>
				 <li class="nav-item active"><a href="feed.jsp" class="nav-link">Feed</a></li>
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

	<section class="ftco-section" id="ig">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-5">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<h2 class="mb-4">FEED</h2>
					<p class="flip"><span class="deg1"></span><span class="deg2"></span><span class="deg3"></span></p>
					<p class="mt-5">다양한 사람들의 독창적인 레시피들을 한곳에서 보실 수 있어요.<br>
						둘러보시면서 취향에 맞는 칵테일들도 따라서 만들어보세요!</p>
				</div>
			</div>
		</div>
	</section>


	<!-- 칵테일 리스트 -->
	<section class="ftco-section" id="cocktail-section">
		<div class="container">
			<!-- 글작성 모달버튼 -->
			<section class="ftco-section" id="writing">
				<a href="javascript:void(0)">
					<button type="button" class="btn btn-primary" id="btn-write">피드 작성</button>
				</a>
			</section>
			<div class="row d-flex" id="cocktail-list"></div>
		</div>
	</section>

	<!-- 모달창 -->
	<div class="modal" style="display:none;">
		<div class="modal_popup">
			<p id="modal-content"></p>
		</div>
	</div>

	<!-- 수정모달창 -->
	<div class="modal_modify_btn" style="display:none;">
		<div class="modal_popup_modify">
			<p id="modal_content_modify"></p>
			<div class="modal-footer-modify">
				<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancel-modify">취소</button>
				<button type="button" class="btn btn-primary" id="btn-save-modify">저장</button>
			</div>
		</div>
	</div>

	<!-- 피드작성 모달 -->
	<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="writeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="writeModalLabel">📖피드 작성</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Form fields for writing a new post -->
					<form action="FeedUpload" method="post" enctype="multipart/form-data" id = "feedup">
						<div class="form-group">
							<label for="postImage">📂이미지 업로드</label>
							<input type="file" class="form-control-file" id="postImage" name = "feed_img">
						</div>
						<div class="form-group">
							<label for="postTitle">📝피드 제목</label>
							<input type="text" class="form-control" id="postTitle" name = "feed_title">
						</div>
						<div class="form-group">
							<label for="postTitle">📝재료 정보</label>
							<input type="text" class="form-control" id="postTitle" name = "feed_ing">
						</div>
						<div class="form-group">
							<label for="postTitle">📝레시피</label>
							<input type="text" class="form-control" id="postTitle" name = "feed_rsp">
						</div>
						<div class="form-group">
							<label for="postDescription">📝피드 설명</label>
							<textarea class="form-control" id="postDescription" rows="3" name = "feed_text"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" id="btn-cancel">취소</button>
					<button type="submit" class="btn btn-primary" form="feedup">저장</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		// 수정모달창 취소 버튼 클릭 시 모달 닫기
		document.addEventListener('DOMContentLoaded', function() {
			document.getElementById('btn-cancel-modify').addEventListener('click', function() {
				const modal = document.querySelector('.modal_modify_btn');
				modal.style.display = 'none';
			});
		});
	</script>

	<script>
		// 칵테일 피드 리스트
		/* const cocktails = [
			{
				date: "Jun 01 ,2024",
				user: "김수민",
				image: "images/image_1.jpg",
				title: "끝까지 가보자!!",
				description: "오래간만에 친구들과 술파티~~ 얘들아 오늘 우리 밤새도록 달려보자!!!"
			},
			{
				date: "Oct 23, 2023",
				user: "강다연",
				image: "images/image_2.jpg",
				title: "분위기 있는 곳에서 한잔~~~~~~~~",
				description: "여기 칵테일바 분위기가 좋다고 추천받아서 가봤는데 진짜 최고였다ㅎㅎ"
			},
			{
				date: "Aug 10, 2023",
				user: "이초원",
				image: "images/image_3.jpg",
				title: "여러 칵테일을 맛보다",
				description: "아니!!! 칵테일바 갔는데 종류가 엄청 다양했다 간김에 여러 칵테일들을 맛보고 싶어서 이것저것 마셔봤는데 와.....증말 고를 수가 없을 정도로 다 최고였음!! 다들 한번 가봐요~~"
			},
			{
				date: "Nov 30, 2022",
				user: "오준하",
				image: "images/image_4.avif",
				title: "나만의 감성으로 칵테일 만들어 봄",
				description: "요즘 홈술이 뜨고 있다길래 나도 한 번 만들어보고 싶어서 인터넷에 검색해서 칵테일 레시피들을 검색해 보고 그중 맘에 드는 칵테일을 발견해서 바로 마트에 가 재료들을 샀다. 집에 돌아와서 레시피대로 만들어보았는데 내가 먹어도 진짜 최고의 맛이었다!! 거기다 나만의 감성 한 스푼ㅎㅎㅎㅎ 담에는 조원들한테도 만들어줘야징~"
			},
			{
				date: "Sept 10, 2018",
				user: "자두",
				image: "images/셜리 템플.webp",
				title: "셜리 템플",
				description: "오래간만에 친구들과 술파티~~ 얘들아 우리 끝까지 가보자!!!"
			},
			{
				date: "Sept 10, 2018",
				user: "자두",
				image: "images/사이드카.jpg",
				title: "사이드카",
				description: "오래간만에 친구들과 술파티~~ 얘들아 우리 끝까지 가보자!!!"
			},
			{
				date: "Sept 10, 2018",
				user: "키위",
				image: "images/B-52.jpg",
				title: "B-25",
				description: "오래간만에 친구들과 술파티~~ 얘들아 우리 끝까지 가보자!!!"
			},
			{
				date: "Sept 10, 2018",
				user: "복숭아",
				image: "images/모히또.jpg",
				title: "모히또",
				description: "오래간만에 친구들과 술파티~~ 얘들아 우리 끝까지 가보자!!!"
			},
		];
		const container = document.getElementById('cocktail-list');

		cocktails.forEach((cocktail, index) => {
			const col = document.createElement('div');
			col.className = 'col-md-3 d-flex ftco-animate';
			col.innerHTML = `
                  <div class="blog-entry align-self-stretch">
                    <a href="javascript:void(0)" class="block-20" onclick="openModal(${index})" style="background-image: url('${cocktail.image}');">
						<div class="overlay">
							<p class="overlay-text">더보기</p>
						</div>
					</a>
					<div class="text py-4 d-block">
						<p class="side-info" id="date">${cocktail.date} <span class="icon-chat"></span> 3</p>
						<h3 class="heading mt-2 text-center" id="title">${cocktail.title}</h3>
						<p id="description">${cocktail.description}</p>
                    </div>
                </div>
            `;
			container.appendChild(col);
		});
 */
	</script>

	<!-- 세부정보 모달창 -->
	<script>
		/* let scrollPosition = 0;

		const modal = document.querySelector('.modal');
		const modalContent = document.getElementById('modal-content');

		let currentCocktailIndex = -1;

		function openModal(cocktailIndex) {
			scrollPosition = window.pageYOffset;
			currentCocktailIndex = cocktailIndex;

			
			const cocktail = cocktails[cocktailIndex];
			const comments = cocktail.comments || [];

			modalContent.innerHTML = `
		<div class="modal-div-top">
			<p class="btn-close-modal"><a href="javascript:void(0)" class="ml-2 btn btn-white btn-outline-white"
					id="closeModal" onclick="closeModal()">X</a>
			</p>
		   <div class="modal-div-top-left">
			  <img src="images/모히또.jpg" alt="프로필 이미지" class="profile-img">
			  <span>${cocktail.user}님</span>
			  <h3 class="heading mt-2 text-left">${cocktail.title}</h3>
		   </div>
		   <div class="modal-div-top-right">
			  <form id="modal-modify">
				 <a href="javascript:void(0)" class="btn btn-primary" id="openModalModify" onclick="openModalModify()">수정</a>
				 <a href="javascript:void(0)" class="btn btn-primary" id="openModalDelete" onclick="openModalDelete()">삭제</a>

			  </form>
		   </div>
			</div>
	   <div class="modal-div-left" id="mc">
		   <img src="${cocktail.image}" alt="${cocktail.name}" id="mdImg">
		   <span id="modal-date">${cocktail.date}<span class="icon-chat"></span> 3</span>
		   <button class="like-btn"><img class="hImg" src="images/빈하트.png"></button>
	   </div>
	   <div class="modal-div-right">
		   <p class="heading mt-2 text-right" id="material-info"><img src="images/cocktail_null.png" id="material-img"> 재료정보</p>
		   <textarea class="textbox" readonly>재료설명 들어갈 자리</textarea>
		   <p class="heading mt-2 text-right" id="recipe-info"><img src="images/abcd.png" id="material-img"> 레시피</p>
		   <textarea class="textbox" readonly>레시피설명 들어갈 자리</textarea>
	   </div>
	   <div class="modal-div-center">
		   <textarea class="textbox" id="explain" readonly>${cocktail.description}</textarea>
		   <div id="div-line"></div>
		<form id="modal-comment-form">
		   <div id="comment-form-container">
			  <img src="images/모히또.jpg" alt="프로필 이미지" id="form-profile-img">
			  <textarea id="modal-comment-text" placeholder="댓글을 작성해주세요..." required></textarea>
			  <button type="submit">댓글 작성</button>
				   </div>
			  </form>

	 <div id="comment-div-feed">
		<div class="comment-div-gap-feed">
		   <p id="img-user-info">
			  <img src="images/모히또.jpg" alt="프로필 이미지" class="comments-profile-img">
			  <span id="cock-user">${cocktail.user}</span>
		   </p>
		   <div id="comments-ul">
			  <ul id="feed-comments-list">
					<li class="comments-body">
					   <p class="comments-text">우와 꼭 먹어봐야겠어요!!!!!!</p>
					   <small class="text-muted">2024.06.21
						  <button type="button" class="comment-btn edit">수정</button>
						  <button type="button" class="comment-btn save" style="display:none;">저장</button>
						  <button type="button" class="comment-btn delete">삭제</button>
					   </small>
					   </li>
			  </ul>
		   </div>
		</div>

		<div class="comment-div-gap-feed">
		   <p id="img-user-info">
			  <img src="images/모히또.jpg" alt="프로필 이미지" class="comments-profile-img">
			  <span id="cock-user">${cocktail.user}</span>
		   </p>
		   <div id="comments-ul">
			  <ul id="feed-comments-list">
					<li class="comments-body">
					   <p class="comments-text">우와 꼭 먹어봐야겠어요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
					  	 <small class="text-muted">2024.06.21
							 <button type="button" class="comment-btn edit">수정</button>
							 <button type="button" class="comment-btn save" style="display:none;">저장</button>
							 <button type="button" class="comment-btn delete">삭제</button>
						  </small>
					</li>
			  </ul>
		   </div>
		</div>
		
		<div class="comment-div-gap-feed">
		   <p id="img-user-info">
			  <img src="images/모히또.jpg" alt="프로필 이미지" class="comments-profile-img">
			  <span id="cock-user">${cocktail.user}</span>
		   </p>
		   <div id="comments-ul">
			  <ul id="feed-comments-list">
					<li class="comments-body">
					   <p class="comments-text">우와 꼭 먹어봐야겠어요우와 꼭 먹어봐야겠어요  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</p>
						  <small class="text-muted">2024.06.21
							 <button type="button" class="comment-btn edit">수정</button>
							 <button type="button" class="comment-btn save" style="display:none;">저장</button>
							 <button type="button" class="comment-btn delete">삭제</button>
						  </small>
					</li>
			  </ul>
		   </div>
		</div>



	 </div>  
  </div>
   `;
			modal.style.display = 'block';

			// 찜
			const likeBtn = modalContent.querySelector('button.like-btn');
			const heartImg = likeBtn.querySelector('.hImg');

			let heartState = 'empty';

			likeBtn.addEventListener('click', function () {
				if (heartState === 'empty') {
					heartImg.src = 'images/빨간하트.png';
					heartState = 'filled';
				} else {
					heartImg.src = 'images/빈하트.png';
					heartState = 'empty';
				}
			});
		} */

		// 모달 닫기 기능
	/* 	function closeModal() {
			modal.style.display = 'none';
			window.scrollTo(0, scrollPosition);
		}

		// 모달 외부 눌러도 닫기 기능
		window.onclick = function (event) {
			if (event.target === modal) {
				closeModal();
			}
		}; */
	</script>

	<!-- 글작성 모달창 -->
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

	<!-- 수정 모달창 -->
	<script>
		/* function openModalModify() {
			const modalModify = document.querySelector('.modal_modify_btn');
			const modalContentModify = document.getElementById("modal_content_modify");

			modalContentModify.innerHTML = `
        <h5 class="modal-title" id="writeModalLabel">📖피드수정
            <p class="btn-close-modal"><a href="javascript:void(0)" class="ml-2 btn btn-white btn-outline-white"
                id="closeModalModify" onclick="closeModalModify()">X</a>
        </p>
        </h5>
        <div class="modal-top-title">
            <textarea class="textbox-title" rows="1">수정할 피드 제목</textarea>
        </div>
            
        <div class="modal-div-left" id="mc">
            <img src="images/image_4.avif" id="mdImg" alt="업로드된 이미지">
            <input type="file" id="fileInput" accept="image/*" style="display: none;">
            <a href="#" class="ml-2 btn btn-white btn-outline-white" id="btn1">이미지 수정</a>
        </div>
        <div class="modal-div-right">
            <p class="heading mt-2 text-left" id="material-modify"><img src="images/칵테일이미지재료.png" id="material-img"> 재료정보</p>
            <textarea class="textbox-modify">수정할 재료정보</textarea>

            <p class="heading mt-2 text-left" id="recipe-modify"><img src="images/칵테일이미지레시피.png" id="material-img"> 레시피</p>
            <textarea class="textbox-modify">수정할 레시피</textarea>
        </div>

        <div class="modal-div-center">
            <div class="modal-center-title">
                <label for="postDescription" id="modify-feed-content">📝피드 내용</label>
                <textarea class="textbox-modify" id="explain" rows="3">수정할 내용들</textarea>
            </div>
        </div>
		<!--
        <div class="modal-footer-modify">
			<button type="button" class="btn btn-primary" id="btn-cancel-modify">취소</button>
		  	<button type="button" class="btn btn-primary" id="btn-save-modify">저장</button>
        </div>
		-->
    `;

			// 모달 창을 보이도록 설정
			modalModify.style.display = "block";

			const btn1 = modalContentModify.querySelector("#btn1");
			const fileInput = modalContentModify.querySelector("#fileInput");
			const imgElement = modalContentModify.querySelector("#mdImg");

			btn1.addEventListener("click", function (event) {
				event.preventDefault();
				fileInput.click();
			});

			fileInput.addEventListener("change", function (event) {
				const file = event.target.files[0];
				if (file) {
					const reader = new FileReader();
					reader.onload = function (e) {
						imgElement.src = e.target.result;
					};
					reader.readAsDataURL(file);
				}
			});

		}

		// 수정 닫기
		function closeModalModify() {
			const modalModify = document.querySelector('.modal_modify_btn');
			if (modalModify) {
				modalModify.style.display = 'none';
				openModal(currentCocktailIndex);
			}
		}

		// HTML 요소에서 함수 호출 (이미지 수정 버튼)
		document.querySelector("#btn1").addEventListener("click", function (event) {
			event.preventDefault();
			openModalModify();
		});

		// 취소
		document.getElementById('btn-cancel-modify').addEventListener('click', function(event) {
			console.log("취소")
			$('#btn-cancel-modify').modal('hide'); 
		});

		// 저장
		document.getElementById('btn-save-modify').addEventListener('click', function () {
			closeModal();
		});


		// 모달 외부 클릭 시 닫기 기능
		window.onclick = function (event) {
			if (event.target === modalModify) {
				closeModalModify();
			}
		}; */
	</script>

	<!-- 글삭제 버튼 -->
	<script>
		/* function openModalDelete() {
			const modal = document.querySelector('.modal');
			const modalContentDelete = document.getElementById("modal-content");
		} */
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script src="js/feed.js"></script>
	<script src="js/search.js"></script>

</body>

</html>