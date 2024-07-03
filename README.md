# Cocktail lover(ALCOHOLIC)들을 위한 놀이터
#### SNS 기반 칵테일 소개,추천 서비스

## 📢 프로젝트 소개
칵테일을 입문자들,좋아하는 사람들을 위한 칵테일 소개 , 레시피 공유 추천 서비스

## ⛳프로젝트 목표


- **칵테일 입문자들을 위한 접근성 향상**
- **사용자가 서로의 레시피와 경험을 공유함으로써 더 나은 칵테일 문화를 형성**



## 🎈주요 서비스 기능
### 1. 조건별 칵테일 & 재료 검색
### 2. MENU, FEED 즐겨찾기
### 3. MENU, FEED, BOARD 댓글기능 , 댓글 긍부정 모델
### 4. 독창적인 나만의 레시피 업로드
### 5. 커뮤니티
#### **1. 조건별 칵테일 & 재료 검색**
![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/bd7b1cd6-0253-460c-b2cd-2060398c85b1)



- 베이스가되는 술과 선택한 술의 도수에 따라 그에맞는 칵테일을 검색할 수 있습니다.
- 재료의 종류에따라 그에맞는 재료를 검색할 수 있습니다.<br>


#### **2. MENU, FEED 즐겨찾기**
![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/469850f2-b8c5-4592-bc5a-4f45a4339078)




- MENU와 FEED에서 마음에드는 칵테일을 즐겨찾기등록하여 MY PAGE에서 한눈에 확인할수있습니다.
<br>
![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/c8a793dc-1c4c-4ae4-a206-630f662b61ee)



- 즐겨찾기에 등록한 칵테일정보로 사용자에게 칵테일을 추천해줍니다.



#### **3. MENU, FEED, BOARD 댓글기능 , 댓글 긍부정 모델)**
![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/c0277ab0-3450-466c-a671-8d1bf9cdc550)
<br>
- MENU, FEED, BOARD에는 각각 댓글을 등록할 수 있습니다.
  ![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/db38e0fb-f690-4605-874e-005905cebd28)

- 등록된 모든 댓글은 긍부정 모델을 통해 긍정적인댓글과 부정적인 댓글로 나뉩니다.
- 댓글의 긍정,부정수치를 한눈에 확인할 수 있습니다. 
- ![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/996ad7be-09ae-4a31-a924-10ce9c4554c5)
- 긍부정 모델로는 교차검증시 평균 정답율이 가장 높은 LogisticRegression모델을 사용하였습니다.<br>
 
#### **4. 독창적인 나만의 레시피 업로드

![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/ee6b6e14-647c-4943-aab1-6feaa676e93f)

<br>
- 사용자들이 자신만의 독특한 레시피를 올릴 수 있는 공간입니다.
![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/d60151a1-da10-4ae7-b5cd-e8ba78db94fc)

<br>
- 댓글과 긍부정모델을 통하여 객관적인 평가를 볼수있습니다.

#### **5. 커뮤니티

![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/3edf0c95-067f-4ac9-a6f3-ac9d238aedb5)
![image](https://github.com/ojungk/ALCOHOLIC/assets/127484145/d6133e92-77b3-4531-92c6-b7182f80f584)

- 꼭 칵테일에 관한 글이아니더라도 자유롭게 게시글을쓰며 커뮤니케이션을 할 수 있습니다.









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


## 💡 서비스 흐름도
- 로그인/회원가입

<img src = "https://github.com/ojungk/ALCOHOLIC/assets/166770562/3a7480d2-2314-4c8a-981b-c1dabece67a6" width="700" height="600"/><br>

- 메인 홈페이지
![image](https://github.com/ojungk/ALCOHOLIC/assets/166770562/1bdb60d2-b35e-4b97-b7d1-8e494780af6e)



## 😀 프로젝트 맴버 역할 분담

| 이름   | 담당 업무                   |
| ------ | --------------------------- |
| 👍오준하 | 팀장/Back-End 개발/긍부정 모델 학습 및 연동 |
| 김민석 | Back-End 개발/데이터 전처리 |
| 노한울 | Back-End 개발/데이터 분석,전처리 |
| 김수민 | Front-End 디자인 및 화면구현 |
| 전다혜 | Front-End 디자인 및 화면구현 |

- 팀장 : 오준하(Back-End) - 텍스트 긍부정 모델 생성 , DB 연결 , 재료페이지 , 메뉴페이지 , 마이페이지 , 게시판 , 피드 , 찜 - **기능 구현**
- 팀원 : 김민석(Back-End) - 회원가입 , 로그인 , DB 연결 , 데이터 전처리 , 이미지 수정 , 검색 , 간단추천페이지 - **기능 구현**
- 팀원 : 노한울(Back-End) -  데이터 수집 , 데이터 전처리 , DB연결 , 게시판(화면 구현) , 간단추천페이지 - **데이터 수집 및 분석**
- 팀원 : 김수민(Front-End,PM) - 홈페이지로고 제작, 로그인&회원가입, HOME, INGREDIENT, BOARD, MYPAGE, 검색(O, X), 간단추천페이지, 시연영상 제작, 문서작업 - **화면 구현**
- 팀원 : 전다혜(Front-End) - MENU, FEED, 댓글창, PPT 제작, 소개서 작성, 문서작업 및 전반적인 화면디자인 - **화면 구현**

  
