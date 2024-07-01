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
      height: calc(1.2em * 10);
      /* 줄 높이 * 줄 수 */
      overflow: hidden;
      display: -webkit-box;
      -webkit-line-clamp: 5;
      /* 5줄로 제한 */
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


    /*modal*/

    h2 {
      text-align: center;
    }

    .heading {
      margin-bottom: 0.5em;
    }

    .cType {
      color: #3dbf78;
    }

    .iToC {
      color: white;
    }

    .modal_btn {
      display: block;
      padding: 10px 20px;
      background-color: #3dbf78;
      border: none;
      border-radius: 5px;
      color: #fff;
      cursor: pointer;
      transition: box-shadow 0.2s;
    }

    .modal_btn:hover {
      box-shadow: 3px 4px 11px 0px #00000040;
    }

    /*모달 팝업 영역 스타일링*/
    .modal {
      display: none;
      justify-content: center;
      align-items: center;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.4);
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
      width: 900px;
      height: 550px;
      border: 2px solid white;
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


    .modal_popup .modal-div-left {
      float: left;
      text-align: left;
      /* display: table-caption; */
      width: 400px;
      height: 300px;
      /* 이미지의 최대 너비 */
      padding-right: 55px;
      padding-top: 40px;
      /* 이미지와 다른 내용 간의 간격 설정 */
    }

    .modal_popup .modal-div-right .text-right {
      text-align: left !important;
    }

    .btn-close-modal {
      position: absolute;
      top: 20px;
      right: 20px;
      text-align: center;
      width: 40px;
      /* 버튼 너비 설정 */
      height: 28px;
      /* 버튼 높이 설정 */
      cursor: pointer;
      color: #3dbf78;
      border: 2px solid #3dbf78;
    }

    .btn-close-modal:hover {
      border: 2px solid #3dbf78;
      background-color: #3dbf78;
      color: #000;
    }


    /* 모달 내 이미지*/
    #mdImg {
      width: 370px;
      /* 원하는 너비로 조정 */
      height: 370px;
      display: block;
      margin: 0 auto 20px auto;
    }

    /*재료로 만들수있는 칵테일 textarea*/
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
      font-size: 14px;
      /* 글꼴 크기 */
      box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
      /* 그림자 효과 */
      resize: none;
      /* 크기 조절 비활성화 */
    }

    /* 비활성 상태 스타일 */
    .textbox:disabled,
    .textbox[readonly] {
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


    #degree {
      color: var(--white);
    }

    #ig {
      height: 310px;
    }

    .nav-link-wrap {
      display: flex;
      justify-content: center;
    }

    .nav-pills {
      display: flex;
      flex-direction: row;
    }

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
			color:#3dbf78;
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
               <li class="nav-item "><a href="menu.jsp" class="nav-link">Menu</a></li>
               <li class="nav-item active"><a href="ingredient.jsp" class="nav-link">Ingredient</a></li>
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

  <section class="ftco-section" id="ig">
    <div class="container">
      <div class="row justify-content-center mb-3 pb-5">
        <div class="col-md-7 heading-section text-center">
          <h2 class="mb-4">Ingredient</h2>
          <p class="flip"><span class="deg1"></span><span class="deg2"></span><span class="deg3"></span></p>
          <p class="mt-5">칵테일에는 정말 다양한 재료가 들어갑니다. 놀랍지 않나요?<br>
            칵테일에 들어가는 수많은 재료들을 확인해보세요!</p>
        </div>
      </div>
    </div>
  </section>

  <section class="ftco-menu">
    <div class="row">
      <div class="col-md-12 nav-link-wrap mb-3">
        <div class="nav nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
          <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab"
            aria-controls="v-pills-1" aria-selected="true" data-filter="ALL">ALL</a>
          <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab"
            aria-controls="v-pills-2" aria-selected="false" data-filter="HIGH ABV">HIGH ABV</a>
          <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab"
            aria-controls="v-pills-3" aria-selected="false" data-filter="LOW ABV">LOW ABV</a>
          <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab"
            aria-controls="v-pills-4" aria-selected="false" data-filter="DRINK">DRINK</a>
          <a class="nav-link" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab"
            aria-controls="v-pills-5" aria-selected="false" data-filter="FRUIT">FRUIT</a>
          <a class="nav-link" id="v-pills-6-tab" data-toggle="pill" href="#v-pills-6" role="tab"
            aria-controls="v-pills-6" aria-selected="false" data-filter="ETC">ETC</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Modal 이미지, 더보기 클릭하면 창띄워지도록~~ -->

  <div class="modal" style="display:none;">
    <div class="modal_popup">
      <p id="modal-content"></p>
    </div>
  </div>


  <section class="ftco-section">
    <div class="container">
      <div class="row d-flex" id="cocktail-list">

        <!-- JavaScript will dynamically populate this section -->
      </div>
    </div>
  </section>

  <script>
    const modal = document.querySelector('.modal');
    const modalContent = document.getElementById('modal-content');
    const modalClose = document.querySelector('.btn-close-modal');

    function openModal(cocktailIndex) {
      const cocktail = cocktails[cocktailIndex];

      modalContent.innerHTML = `
                              <span class="btn-close-modal" onclick="closeModal()">X</span>
                              <div class="modal-div-left">
                                 <img src="${cocktail.image}" alt="${cocktail.name}" id="mdImg">
                              </div>
                              <div class="modal-div-right">
                                 <h3 class="heading mt-2 text-left">${cocktail.name}<br><span id="modal-abv">${cocktail.ename}</span></h3>
                                  <p id="modal-abv">Type: <span class="cType">${cocktail.type}</span></p>
                                  <textarea class="textbox" readonly>${cocktail.description}</textarea>
                                   <p class="heading mt-2 text-right">해당 재료로 만들 수 있는 칵테일<span id="iToC">▼</span></p>
                                   <textarea class="textbox" readonly>칵테일 이름들 여기에 적으면 됨! -수민-</textarea>
                              </div>
                              `;

      modal.style.display = 'block'; // Display the modal
    } 

    function closeModal() {
      modal.style.display = 'none'; // Hide the modal
    }

    window.onclick = function (event) {
      if (event.target === modal) {
        closeModal(); // Close modal if clicked outside the modal content
      }
    };
 
  </script>

  <script >
  
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
  <script src="js/main.js"></script>
  <!-- <script src="js/jquery-3.2.1.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
  <script src="js/Test1.js"></script>
  <script src="js/search.js"></script>
</body>

</html>