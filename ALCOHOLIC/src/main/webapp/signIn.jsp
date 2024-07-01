<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
    
    $(document).ready(function() {
       
        var idCheckPass = false;
         var nicknameCheckPass = false;
         var passwdCheckPass = false;
         
         // 가입버튼 활성화
         function updateSignInButton() {
             if (idCheckPass && nicknameCheckPass && passwdCheckPass) {
                 $('#signInButton').prop('disabled', false); 
             } else {
                 $('#signInButton').prop('disabled', true);
             }
         }
         
         // 패스원드 중복 확인
         function passwdcheck(){
            if($('#User_Password').val() === $('#User_Passwordcheck').val() ){
                $('#passwdCheckMessage').text('패스워드가 일치합니다!.');
                passwdCheckPass = true;
            }else{
                $('#passwdCheckMessage').text('패스워드가 일치하지 않습니다!.');
                passwdCheckPass = false;
            }
            updateSignInButton();
           
         }
         $('#User_Password, #User_Passwordcheck').on('keyup', passwdcheck);
       
       // 아이디 중복 체크
        $('#IdCheckButton').click(function(event){
              event.preventDefault();
              var Id = $('#User_Id').val();
              
              $.ajax({
                 type : 'Post',
                 url : 'CheckidService', // id 중복체크 서블릿
                 data : { user_id : Id },
                 
                 success : function(result){
                    if(result > 0){
                       console.log(result);
                       $('#idMessage').text('이미 사용중인 Id 입니다.');
                       idCheckPass = false;
                    }else{
                       $('#idMessage').text('사용 가능한 Id 입니다.');
                       idCheckPass = true;
                    }
                    
                    updateSignInButton();
                 }
              });
              
              
           });
     
    
          // 닉네임 중복 체크
       $('#NickCheckButton').click(function(event){
             event.preventDefault();
             var Nick = $('#Nickname').val();
             
             $.ajax({
                type : 'Post',
                url : 'ChecknickService', // 닉네임 중복체크 서블릿
                data : { user_nick : Nick },
                
                success : function(result){
                   if(result > 0){
                      console.log(result);
                      $('#nicknameMessage').text('이미 사용중인 닉네임 입니다.');
                      nicknameCheckPass = false;
                   }else{
                      $('#nicknameMessage').text('사용 가능한 닉네임 입니다.');
                      nicknameCheckPass = true;
                   }
                   
                   updateSignInButton();
                }
             });
             
             
          });
       
       $("#cancleButton").on("click", function (e) {
           e.preventDefault(); // 양식 제출 방지
           window.location.href = 'login.jsp'; // 리다이렉트 회원가입 폼
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
                <p class="mb-5">Welcome! please let me know your information.😃</p>
                <form id="contactForm" onsubmit="return login_form()" action = "JoinService" method ="post">
                    <!-- ID, PASSWORD 입력 -->
                    <div class="row input-group-newsletter">
                        <div class="container">
                            <div class="row">
                                <div class="col-12 position-relative">
                                    <input class="form-control pr-5" id="Nickname" name="user_nick" type="text" placeholder="Nickname" aria-label="Nickname" />
                                    <button id="NickCheckButton" class="btn btn-secondary btn-sm inside-button">CHECK</button>
                                </div>
                            </div>
                        <div id="nicknameMessage" class="mt-2"></div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-12 position-relative mt-2">
                                    <input class="form-control pr-5" id="User_Id" name ="user_id" type="text" placeholder="User_Id" aria-label="User_Id" />
                                    <button id="IdCheckButton" class="btn btn-secondary btn-sm inside-button">CHECK</button>
                                </div>
                            </div>
                        </div>
                            <div id="idMessage" class="mt-2"></div>
                            
                        <div class="col-12 mt-2">
                            <input class="form-control" id="User_Password" name = "user_pw" type="password" placeholder="User_Password" aria-label="Password" />
                        </div>
                        <div class="col-12 mt-2">
                            <input class="form-control" id="User_Passwordcheck" name = "pwcheck" type="password" placeholder="User_Passwordcheck" aria-label="Password" />
                        </div>
                        <div id="passwdCheckMessage" class="mt-2"></div>
                        
                        
                        
                        <div class="col-12 mt-2">
                            <input class="form-control" id="PhoneNumber" name ="user_phone" type="text" placeholder="Phonenumber" aria-label="PhoneNumber" />
                        </div>
                        <div class="col-12 mt-3">
                             <button class="btn btn-primary w-100" id="signInButton" type="submit" disabled>SIGN IN</button>
                        </div>
                        <div class="col-12 mt-2">
                            <button class="btn btn-secondary w-100" id="cancleButton" type="button">CANCEL</button>
                        </div>
                    </div>
                    <!--밑에는 로그인 성공시/ 실패시 적어야함!-->
                    <div id="message" class="mt-3"></div>
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