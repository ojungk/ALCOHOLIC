<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href = "css/styles_login.css" rel = "stylesheet" type = "text/css">
   

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Coming Soon - Start Bootstrap Theme</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Tinos:ital,wght@0,400;0,700;1,400;1,700&amp;display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400;1,500;1,700&amp;display=swap" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 

     <script>
        function checkLoginFail() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('loginFailed')) {
                document.getElementById('failmessage').innerHTML = '<span class="text-danger">로그인 실패!. 아이디나 비밀번호를 확인해주세요.</span>';
            }
        }

        $(document).ready(function () {
            checkLoginFail();
            
            
            // 양식 제출 시 로그인 버튼 비활성화 , 여러번 제출 방지
            $("#contactForm").on("submit", function () {
                $("#loginButton").prop("disabled", true);
            });
            
            
            $("#SignInButton").on("click", function (e) {
                e.preventDefault(); // 양식 제출 방지
                window.location.href = 'signIn.jsp'; // 리다이렉트 회원가입 폼
            });
        });
    </script>
 

    
</head>


<body>
    <!-- 배경 mp4 영상 움직이기 -->
    <video class="bg-video" playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
        <source src="assets/mp4/bg1.mp4" type="video/mp4" />
    </video>

    <div class="masthead">
        <div class="masthead-content text-white">
            <div class="container-fluid px-4 px-lg-0">
                <h2 id="login-logo"></h2>
                <!-- 소개 문구 -->
                <p class="mb-5">We offer a lot of information about cocktails. We are so welcome all of you who loveeeee cocktails. Make your own cocktail and enjoy!</p>
                <form id="contactForm" onsubmit="return login_form()" action = "LoginService" method ="post" > 
                    <!-- ID, PASSWORD 입력 -->
                    <div class="row input-group-newsletter">
                        <div class="col-12" id = "id_1">
                            <input class="form-control" id="ID" name = "user_id" type="text" placeholder="Please enter your ID" aria-label="Please enter your ID" />
                        </div>
                        <div class="col-12 mt-2" id = "id_2">
                            <input class="form-control" id="Password" name = "user_pw" type="password" placeholder="Please enter your Password" aria-label="Please enter your Password" />
                        </div>
                        <div class="col-12 mt-3">
                          <button class="btn btn-primary w-100" id="loginButton" type="submit">LOGIN</button>
                        </div>
                        <div class="col-12 mt-2">
                  <button class="btn btn-secondary w-100" id="SignInButton">SIGN IN</button>
                  </div>
                    </div>
                    <!--밑에는 로그인 성공시/ 실패시 적어야함!-->
                    <div id="failmessage" class="mt-3"></div>
                </form>
            </div>
        </div>
    </div>
    <!-- Social Icons-->
    <div class="social-icons">
        <div class="d-flex flex-row flex-lg-column justify-content-center align-items-center h-100 mt-3 mt-lg-0">
            <a class="btn btn-dark m-3" href="https://smhrd.or.kr/">
                <img src="assets/img/SMlogo.png" alt="Logo" style="height: 24px;">
            </a>
            <a class="btn btn-dark m-3" href="https://www.instagram.com/smhrd0317/"><i class="fab fa-instagram"></i></a>
            <a class="btn btn-dark m-3" href="https://www.facebook.com/smhrd0317/"><i class="fab fa-facebook"></i></a>
        </div>
    </div>
    
 
</body>

</html>