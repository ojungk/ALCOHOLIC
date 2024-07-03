# Cocktail lover(ALCOHOLIC)들을 위한 놀이터
#### SNS 기반 칵테일 소개,추천 서비스

## 📢 프로젝트 소개
칵테일을 입문자들,좋아하는 사람들을 위한 칵테일 소개 , 레시피 공유 추천 서비스

## ⛳프로젝트 목표

칵테일 이란? 술과 여러 종류의 음료, 첨가물 등을 섞어 만든 혼합주를 일컫는다.
사람들은 칵테일 하면 마냥 고급 위스키와 진,럼,보드카 정도를 이용해서 만든
칵테일을 떠올립니다. 
하지만 우리 주변에도 흔히 칵테일을 접할 수 있습니다.
소맥,하이볼 등 개인의 취향에 맞게 만드는 술이 칵테일 입니다.
칵테일! 쉽게 접근해보세요.
- **칵테일 입문자들을 위한 접근성 향상**
- **사용자가 서로의 레시피와 경험을 공유함으로써 더 나은 칵테일 문화를 형성**



## 🎈주요 서비스 기능
***메인 기능***
#### **1. 칵테일 정보 제공**
<img src = "https://github.com/ojungk/ALCOHOLIC/assets/166587746/9dfdbbe7-f6d8-49bb-8bbf-904818ded04d" width="600" height="450"/><br>


- 칵테일 별 댓글 기능. (여러 사용자의 격관적인 평가 가능) <br>

#### **2. 칵테일 조건별 검색** , **재료 조건별 검색**
![image](https://github.com/rwd04272/firstrepo/assets/166587746/7f1751e1-37ae-4253-a2ec-5d17ffd64c5a)
![image](https://github.com/rwd04272/firstrepo/assets/166587746/124d335f-319b-445d-a54d-ec30907a77f9) <br>
<img src = "https://github.com/ojungk/ALCOHOLIC/assets/166587746/a306807f-089f-4660-abc7-564e0ccd8f45"  width="400" height="250"/><br>
(보드카 , 10%~20%)의 이미지<br>
<img src ="https://github.com/ojungk/ALCOHOLIC/assets/166587746/5bfa778f-e41e-4fd7-ad0f-e1f6f2810d0a" width="400" height="250"/><br>
(진 , 20% ) 의 이미지<br>



- 술의 종류,도수별 검색 기능.
<br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/effb878f-9822-4ce1-adbe-5520a482eaa3" width="600" height="350"/><br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/1fe912d1-ed2f-4696-8516-69805f7965e3" width="600" height="350"/><br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/1fe912d1-ed2f-4696-8516-69805f7965e3" width="600" height="350"/><br>

- 재료 또한 낮은도수,높은도수 구분검색 가능



#### **3. 칵테일 등록(찜)**
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/1a3af4a6-2f0b-4b26-9d90-167a556bb2d4" width="600" height="350"/><><br>
- 찜 누른 칵테일 리스트 확인 가능
- 다른 사용자가 올린 칵테일도 좋아요 가능
- 마이페이지 북마크에 등록 <br>
 **사용자별 접근성 향상(사용자의 취향에 맞는 칵테일 등록)**

#### **4. 칵테일 추천!

<img src ="https://github.com/ojungk/ALCOHOLIC/assets/166587746/721c6519-dac1-48e6-bd8a-8526c0929bfa" width="600" height="350"/><br>
<img src ="https://github.com/ojungk/ALCOHOLIC/assets/166587746/179f2912-22fd-4490-baa4-fe4f69beadef" width="600" height="350"/><br>
- 사용자가 찜 누른 칵테일의 베이스 술의 종류 , 도수의 정보를 기준으로 사용자마다 다른 칵테일을 추천
- 추천한 칵테일 찜,댓글 작성(조회) 가능!



**부가 기능**
**1) 커뮤니티 (레시피 공유,후기)**
- 사용자 자신이 만든 레시피를 등록
- 댓글을 작성해서 후기 공유 및 피드백

**2) 마이페이지**
- 마이페이지에서 자신이 올린 게시글을 확인
- 닉네임 변경,프로필 이미지 수정

**3) 댓글 긍정/부정 비율**
- 사용자의 댓글의 긍정,부정을 이모티콘 으로 확인 가능.
  ![image](https://github.com/ojungk/ALCOHOLIC/assets/166587746/ec0ed7ef-aa6a-4a7f-8d1b-f375e0929eb9)

- 사용자 칵테일 선호도 파악 가능

## 📖 주요 기능 구성페이지

#### 로그인 -> <a href = "https://github.com/ojungk/ALCOHOLIC/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%EC%84%B1-%ED%8E%98%EC%9D%B4%EC%A7%80">상세 페이지 - Wiki</a>
- DB검증
- 로그인 시 세션(session) 생성
#### 회원가입 -> <a href = "https://github.com/ojungk/ALCOHOLIC/wiki/%EC%A3%BC%EC%9A%94-%EA%B8%B0%EB%8A%A5-%EA%B5%AC%EC%84%B1-%ED%8E%98%EC%9D%B4%EC%A7%80">상세 페이지 - Wiki</a>
- ID 중복체크
- Nickname 중복체크
- 비밀번호 확인
#### 메뉴페이지(Menu) -> <a href = "#">상세 페이지 - Wiki</a>
- 칵테일 조회 / 찜
- 댓글 작성/수정/삭제
#### 재료페이지(Ingredient) -> <a href = "#">상세 페이지 - Wiki</a>
- 재료 조회
#### 게시판(Board) -> <a href = "#">상세 페이지 - Wiki</a>
- 게시글 작성/수정/삭제
- 게시글 조회
- 댓글 작성/수정/삭
#### 피드(Feed) -> <a href = "#">상세 페이지 - Wiki</a>
- 피드 작성/수정
- 댓글 작성/수정/삭제
#### 마이페이지(MyPage) -> <a href = "#">상세 페이지 - Wiki</a>
- 회원정보 변경
- 이미지 수정
#### 검색페이지 -> <a href = "#">상세 페이지 - Wiki</a>
- 칵테일 조회




## ⚙ 개발 환경
- `JDK (17.0.11) <br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/182e761b-bae5-4aea-97b6-8365e3f35953" width="400" height= "200"/><br>

- *visual studio code* <br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/1962a5da-b3f7-4e0e-87b4-aae8db649ec8" width="400" height= "200"/><br>

- **Database** : My SQL(8.0.27)<br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/08b7633d-51a6-4139-b778-7c001ae1a331" width="400" height="200"/><br>

- **ORM** : Mybatis <br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/e72a3c2d-285e-452f-b705-78e42bbf6317" width="400" height = "200"/><br>

- apache tomcat (9.0.89)<br>
<img src = "https://github.com/rwd04272/firstrepo/assets/166587746/f51366c7-337d-402f-9207-e25ce5fcdba1" width="400" height="200"/><br>

<br>


## ⏲ 개발 기간
* 24/06/17 ~ 24/07/01


## 😀 프로젝트 맴버 역할 분담

| 이름   | 담당 업무                   |
| ------ | --------------------------- |
| 👍오준하 | 팀장/Back-End 개발/긍부정 모델 학습 및 연동 |
| 김민석 | Back-End 개발/데이터 전처리 |
| 노한울 | Back-End 개발/데이터 분석,전처리 |
| 김수민 | Front-End 디자인 및 화면구현 |
| 전다혜 | Front-End 디자인 및 화면구현 |

- 팀장 : 오준하(back end) - 텍스트 긍부정 모델 생성 , DB 연결 , 재료페이지 , 메뉴페이지 , 마이페이지 , 게시판 , 피드 , 찜 - **기능 구현**
- 팀원 : 김민석(back end) - 회원가입 , 로그인 , DB 연결 , 데이터 전처리 , 이미지 수정 , 검색 , 간단추천페이지 - **기능 구현**
- 팀원 : 노한울(back end) -  데이터 수집 , 데이터 전처리 , DB연결 , 게시판(화면 구현) , 간단추천페이지 - **데이터 수집 및 분석**
- 팀원 : 김수민(front end,pm) - 로고 제작 , 로그인&회원가입, HOME, 재료, 게시판, 마이페이지, 검색, 간단추천 페이지, 시연영상 제작, 문서작업 **화면 구현**
- 팀원 : 전다혜(front end) - 메뉴, FEED, 댓글창, PPT, 소개서, 문서작업 및 전반전인 화면디자인 - **화면 구현**

  
