let good = 0;
let bad = 0;

$(document).ready(function() {
	let userId = '';
	let userImg = '';
	let gettitle = '';
	let getat = '';
	let getview = '';
	let getuimg = '';
	let getuid = '';
	let getcont = '';
	let uid = '';

	let posts = []; // posts 배열 선언
	let currentCocktailIndex = -1; // 모달 내부에서 사용할 현재 인덱스 변수
	let poto = '';

	
	// 초기 게시물 로드
	$.ajax({
		type: 'POST',
		url: 'LoadPost',
		success: function(result) {
			console.log("AJAX 성공:", result);
			updatepost(result);

		},
		error: function(xhr, status, error) {
			console.error("게시물 로드 오류:", error);
		}
	});
	



	// 게시물 업데이트 함수
	function updatepost(result) {
		console.log("배열 업데이트 작동");
		posts = []; // 기존 배열 비우기
		result.forEach(post => {
			posts.push({
				index: parseInt(post.index),
				title: post.title,
				content: post.content,
				img: post.img,
				at: post.at,
				id: post.id,
				views: parseInt(post.views)
			});
		});
		console.log("담기 성공!", posts);
		renderpost(posts);
	}

	// 게시물 렌더링 함수
	function renderpost(posts) {
		const container = document.getElementById('boardContent');
		let innerHTML = ''; // 누적할 변수를 선언합니다.
		const cont = document.getElementById('g1');
		const announcementHTML = `
			<tr>
				<td>공지</td>
				<td><a href="#" onclick="openAnnouncement()">💚칵테일 기초지식 알아보기!💚</a></td>
				<td><a href="#" onclick="openAnnouncement()">💕 칵테일의 정의</a></td>
				<td>관리자</td>
				<td>2024-06-28</td>
				<td>-</td>
			</tr>
		`;

		posts.forEach((post) => {
			let trimmedDate = post.at.slice(0, -9);
			innerHTML += `
                <tr>
                    <td>${post.index}</td>
                    <td><a href="#" onclick="openModal(${post.index})">${post.title}</a></td>
                    <td><a href="#" onclick="openModal(${post.index})">${post.content}</a></td>
                    <td>${post.id}</td>
                    <td>${trimmedDate}</td>
                    <td>${post.views}</td>
                </tr>
            `;
		});

		container.innerHTML = innerHTML;
		cont.innerHTML = announcementHTML;
		document.getElementById('nextBtn').click();
		document.getElementById('prevBtn').click();
	}

	let scrollPosition = 0;
	const modal = document.querySelector('.modal');
	const modalContent = document.querySelector('.modal_body');
	const modalClose = document.querySelector('.btn-close-modal');

	// 모달 열기 함수
	window.openModal = function(postIndex) {
		scrollPosition = window.pageYOffset;
		currentCocktailIndex = postIndex; // 현재 인덱스 업데이트

		// 초기화
		let buttonsHtml2 = ''; // 변수를 초기화하고 빈 문자열로 설정

		// 게시물 정보를 가져오는 AJAX 요청
		$.ajax({
			type: 'POST',
			url: 'GetPost',
			data: { idx: postIndex },
			success: function(q) {
				gettitle = q[0].gettitle;
				getat = q[0].getat;
				getview = q[0].getview;
				getuimg = q[0].getimg;
				getuid = q[0].getuid;
				getcont = q[0].getcont;
				uid = q[0].uid;

				// 이미지 가져오는 AJAX 요청
				$.ajax({
					type: 'POST',
					url: 'getimg',
					data: { are: poto },
					success: function(ig) {
						userId = ig[0].getid;
						userImg = ig[0].getimg;

						// userId가 설정된 이후에 다음 코드들이 실행되어야 합니다.
						console.log("유저아디" + userId + "유아디" + uid);

						// userId와 uid 비교 후 버튼 HTML 설정
						if (userId === getuid) {
							buttonsHtml2 = `
                                <button id="btn-mdf" onclick="editPost(${currentCocktailIndex})">수정</button>
                                <button id="btn-delete" onclick="confirmDelete(${currentCocktailIndex})">삭제</button>
                                <button id="save-button" style="display:none;">저장</button>
								<button id="cancel-button" style="display:none;">취소</button>
                            `;
						}

						// 모달 내용 업데이트
						modalContent.innerHTML = `
                            <div class="modal-header">
      							
                                <h5 class="modal-title">📝${gettitle}</h5>
                                ${buttonsHtml2}
                                <button type="button" class="close btn-close-modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body" style="text-align: right;">
                                <form id="edit-post-form">
                                    <div>
                                        <div class="form-group-left" style="float: left;">
                                            <img src="${getuimg}" alt="" id="post-image">
                                            <input type="file" id="image-upload" style="display: none;">
                                        </div>
                                        <div class="form-group-right">
                                            <div class="form-group">
                                                <span>작성자 : </span>
                                                <span>${getuid}</span>
                                            </div>
                                            <div class="form-group">
                                                <span>${getat}</span>
                                            </div>
                                            <div class="form-group">
                                                <span>조회수 : </span>
                                                <span>${getview}</span>
                                                
                                            </div>
                                            <span id="like-dislike-span">😊:${good}  😢:${bad}</span>
                                        </div>
                                    </div>
                                    <div class="form-group2" style="text-align:left;">
                                        <textarea class="textbox" id="explain" readonly>${getcont}</textarea>
                                    </div>
                                    <button type="button" id="edit-save-btn" style="display:none;">저장</button>
                                    <button type="button" id="edit-cancel-btn" style="display:none;">취소</button>
                                </form>
                            </div>
                            <form id="modal-comment-form">
                                <div id="comment-form-container">
                                    <img src="images/${userImg}" alt="프로필 이미지" id="form-profile-img">
                                    <textarea id="modal-comment-text" placeholder="댓글을 작성해주세요..." required name="comment_text"></textarea>
                                    <input type="hidden" name="postIndex" value="${postIndex}">
                                    <button type="button" id="comment-btn2" onclick="submitComment()">댓글 작성</button>
                                </div>
                            </form>
                            <div id="comment-div"></div>
                        `;

						// 댓글 로드 AJAX 요청
						loadComments(postIndex);

						// 모달 열기
						modal.style.display = 'block';
					},
					error: function(xhr, status, error) {
						console.error("이미지 가져오기 오류:", error);
					}
				});
			},
			error: function(xhr, status, error) {
				console.error("게시물 정보 가져오기 오류:", error);
			}
		});
	};
	window.openAnnouncement = function() {
		modalContent.innerHTML = `
         <div class="modal-header">
              <h5 class="modal-title">💚칵테일 기초지식 알아보기!💚</h5>
             
               
              </button>
              </div>
              
              <div class="modal-body">
              <form>
                <div class="form-group2">
                  <textarea class="textbox" id="explain2" readonly>💕 칵테일의 정의

여러 종류의 술을 바탕으로 고미제(비터스), 설탕, 향료 등을 혼합하여 만든 술로 혼합주라고도 한다. 특정 술만 마시는 것이 아닌 여러가지 술과 기타 다른 재료들을 섞어 마시는 일종의 요리 개념에 가깝다. 기원은 16세기 전으로, 보통 고도수나 지나치게 강한 향 등으로 그냥 마시기 힘든 술들을 중심으로 칵테일 문화가 발전했다. 그로그, 모히토, 진 토닉, 진 라임 등의 클래식 칵테일들이 대표적인 예시이다. 

💕 관련 용어

스트레이트/니트(Straight/Neat): 얼음 없이 그대로 잔에 따라 마시는 것을 말한다.
온더락(On the rocks): 글래스에 큼직한 얼음을 미리 2~3개 넣어 놓고 그 위에 술을 따르면 바위 위에 따른 것 같이 보인다는 것에서 유래했다. 온더락 글라스에 담긴 것이 아니라도 원래 얼음을 넣지 않는 칵테일에 얼음을 넣는다면 뒤에 온더락을 붙인다.
오버 더 락(Over the rocks) : 술을 먼저 따르고 얼음을 나중에 넣는 것을 오버 더 락이라 부른다. 
베이스(base; 기주): 칵테일을 만들 때 기본이 되는 술을 말한다.
숏 드링크(Short drink): 용량이 5oz (150ml) 미만인 칵테일을 말한다.
롱 드링크(Long drink): 하이볼 글라스나 콜린스 글라스 등에 담겨 제공되는, 용량이 많고 오래 마실 수 있는 칵테일이다.
버진(Virgin): 주로 논 알콜 칵테일의 앞에 붙는 말로, 기존에 있는 칵테일을 알코올이 없는 버전으로 만든 것이다.
목테일(Mocktail): “Mock” 은 가짜라는 의미로 일명 가짜 칵테일. 즉 칵테일과 조주법이 비슷하나 알코올이 들어가지 않은 논 알콜 칵테일이라고 볼 수 있다.
스퀴즈(squeeze): 과실의 즙을 짜는 것을 말한다.
필(peel): 레몬이나 오렌지의 껍질만 벗겨내고 비틀어 칵테일에 오일을 뿌려 향을 내는 것으로, 껍질 자체를 칭하기도 한다. 레시피에 가니쉬로 레몬 필을 넣으라고 적혀 있으면 섬유질 부분 없이 깎아 낸 레몬 껍질을 넣으란 의미이다.

💕 용량(단위)

드롭(Drop) : 말 그대로 한 방울.
대쉬(Dash) : 70% 정도 채워진 비터스 병을 한 번 흔들면 나오는 양. 약 1/32 oz (0.94 ml)
스플래쉬(Splash) : 해외 칵테일 레시피에서 자주 사용하며 약 1/5 oz (6 ml)
티스푼(tsp) : 요리에서도 쓰이는 계량법으로 5 ml를 말한다. 보통 바 스푼만큼의 용량으로 본다.
테이블스푼(Tbsp.) : 요리에서도 쓰이는 계량법으로 15 ml를 말한다.
온스(oz) : Fluid Ounce(fl. oz.)를 말한다. 칵테일 계에서는 편의상 1 oz를 30 ml로 규정한다.
샷(shot) : 잔으로 이야기할 때는 1oz를 이야기하나, 칵테일의 용량에서는 45 ml를 이야기하기도 한다.
싱글(Single) : 미국에선 30 ml, 영국은 45 ml, 스코틀랜드에선 60 ml를 의미한다.
더블(Double) : 싱글의 두 배를 의미한다.

💕 조주 기법

블렌딩(blending): 블렌더(믹서)에 잘게 부순 얼음(crushed ice)과 재료들을 넣고 함께 갈아서 완성하는 것. 슬러시 형태라고 생각하면 된다. 얼음을 분쇄할 수 있는 업소용 블렌더나 아이스 크러셔가 없으면 믹서 날이 다 나가기 때문에 홈텐딩에는 적합하지 않다.
빌딩(building): 얼음이 담긴 잔 안에 바로 재료들을 부어서 저어서 완성하는 것.
셰이킹(shaking): 셰이커에 술, 설탕, 시럽, 주스 등을 정량 넣고 얼음덩이와 함께 흔들어 혼합하는 것. 쉐이커 안에서 얼음이 부딪히고 깨지면서 녹은 물과 공기가 섞여 들어가게 되어 높은 도수의 술들이 부드러워지는 효과가 있다.
스터링(stirring): 바 스푼으로 술을 저어 섞는 것. 섬세한 맛을 연출할때 사용한다.
플로팅(floating): 기주 및 부재료의 밀도 차이를 이용하여 다수의 액체를 섞이지 않게 위로 띄워서 층을 나누는 것.
쓰로잉(throwing): 재료들을 높게 붓고 낮게 받는 것을 반복해서 섞는 것. 공기접촉이 많아져 부드러워진다.

💕 제조 도구

셰이커 : 크게 코블러 셰이커와 보스턴 셰이커로 나뉘며, 일반적으로 셰이커라 하면 전자를 뜻한다.
지거 :  칵테일 제조, 위스키 서브등 정확한 계량이 필요할 때 사용한다.
보통은 스테인리스강으로 만들어지며, 특정한 용량의 잔 두 개가 서로 붙어 있는 모양새를 띠고 있다. 일반적으로는 1oz / 1½oz(30ml / 45ml)가 표준 용량이며, 그 외에도 30ml / 60ml, 25ml / 50ml 등 다양한 용량의 지거가 존재한다.
믹싱 글라스 : 칵테일 제조 기법 중 스터링를 이용할 때 쓰는 컵으로 일반 유리잔보다 벽이 두텁고 용량이 크다. 모양은 딱히 정해지지 않았지만 흔히 비커와 비슷한 모양으로 따르는 주둥이가 있다.
스퀴저 :  뾰족하고 요철이 있는 부분에 반으로 자른 레몬(라임)을 꽂아서 짜거나 돌리면서 즙을 짜낸다. 즙을 짤때는 너무 많은 힘을 주거나, 너무 심하게 내부를 긁으면 과육이 많이 손상되어 쓴맛이 생기고, 씨앗을 걸러내기 힘드므로 주의.
칵테일 스트레이너 : 스테인리스 스틸로 만들어진 판에 스프링이 달려 있는 것 같은 모양새를 하고 있다. 일반적으로 믹싱 글라스에서 교합한 액체를 따를 때 얼음이나 큰 입자를 거르기 위해 쓰며, 글라스 위에 씌워서 사용한다.
푸어러 : 술병에 꽂아서 용량대로 정확히 따를수 있도록 도와주는 도구를 말한다. 보통 재질은 따르는 관 부분이 스테인리스에 고무로 병마개 역할을 하는 부분이 나뉘어 있다. 물론 플라스틱이나 고무로만 만들어지기도 한다. 관을 덮는 캡 부분이 딸려있는 푸어러도 흔히 있어서 미사용시 입구를 막아 증발을 막아주기도 한다.
공기 구멍과 따르는 구멍이 따로 있으며 공기구멍을 엄지로 막아 나오는 속도를 조절할 수 있어 따르다 흘릴 일이 없어진다. 푸어러를 끼운 채 보틀을 높게 들면  술이 길고 멋지게 흘러내리게 되어 국내 바의 필수품으로 간주되기도 한다.

💕 형태별 종류

하이볼(High Ball): 증류주를 기주로 하이볼 글라스에 얼음을 넣고 탄산음료를 넣어 혼합한 형태를 말한다.
- 피즈(Fizz): 레몬 주스, 당, 기주를 셰이크하고 얼음 없이 탄산수를 채운다. 탄산음료를 열거나 따를때 나는 픽-하는 소리에서 유래된 것이다.
- 콜린스(Collins): 레몬 주스, 당, 기주를 믹싱한 후 탄산수를 채운다.
- 리키(Rickey): 라임 주스와 기주를 믹싱 후 탄산수를 채운다. 달지 않은 칵테일.
- 슬링(Sling): 피즈와 비슷하나 약간 용량이 많고 리큐르를 첨가하여 과일을 장식한다.
- 쿨러(Cooler): 술, 설탕, 레몬(또는 라임) 주스를 넣고 진저에일을 채운다.
사워(Sour): 레몬이나 라임을 사용한 상큼한 맛의 칵테일이다.
- 데이지(Daisy) : 큐라소와 레몬/라임을 사용한다.
- 크러스타(Crusta): 큐라소와 레몬/라임, 그외의 리큐르를 사용한다.
펀치(Punch): 펀치볼(큰그릇)에 술과 당, 향신료 혹은 차, 시트러스, 물 혹은 얼음을 넣어 대용량으로 만드는 형태를 말한다.
플립(Flip): 계란을 사용한 소용량 칵테일을 말한다.
에그노그(Egg Nog): 계란과 우유 등을 사용한 대용량 칵테일을 말한다.
줄렙(Julep): 민트 줄기를 넣은 칵테일을 말한다.
스매쉬(Smash): 줄렙과 비슷하나 Shaved Ice를 사용하며 설탕, 물을 넣고 허브 줄기를 장식한다.
코블러(Cobbler): "구두 수선공" 이란 뜻으로 여름철 더위를 식히는 음료이다. 알코올 도수가 낮은 과일주를 베이스로 한다. (와인코블러, 커피코블러)
프라페(Frappe): 프랑스어로 ‘잘 냉각된’ 이라는 의미이다. 가루 얼음을 샴페인 글라스에 가득 채우고 술을 붓고 빨대를 꽂아 마신다.
토디(Toddy): 뜨거운 물(또는 차가운 물)에 설탕과 술을 넣은 형태를 말한다.
스프리츠(Spritz): 프로세코를 기주로 하여 탄산수와 리큐르 등을 섞는 형태.
슈터 : 30~60 ml(1~2 oz)용량의 샷 글라스에 칵테일을 내놓는 것으로 보통 한번에 다 마신 뒤 입 안에 머금고 섞이는 맛을 즐긴다.
벅(Buck) 또는 뮬(Mule): 기주와 라임즙, 진저에일 또는 진저비어를 섞는 형태.
                  </textarea>
                </div>
              </form>
            </div>
      `;
		modal.style.display = 'block';
	};



	// 모달 닫기 버튼 이벤트 리스너
	document.addEventListener('click', function(event) {
		if (event.target.classList.contains('btn-close-modal')) {
			closeModal();
		}
	});

	// 모달 외부 클릭 시 닫기 기능
	window.onclick = function(event) {
		if (event.target === modal) {
			closeModal();
		}
	};

	// 모달 닫기 함수
	function closeModal() {
		modal.style.display = 'none';
		window.scrollTo(0, scrollPosition);
		$.ajax({
			type: 'POST',
			url: 'LoadPost',
			success: function(result) {
				console.log("AJAX 성공:", result);
				updatepost(result);
			},
			error: function(xhr, status, error) {
				console.error("게시물 로드 오류:", error);
			}
		});
	}

	window.submitComment = function() {

		const commentText = document.getElementById('modal-comment-text').value;
		const postIndex = document.querySelector('input[name="postIndex"]').value;

		// AJAX를 통해 댓글 서버로 전송
		$.ajax({
			type: 'POST',
			url: 'comment_up_post',
			data: {
				comment_text: commentText,
				postIndex: postIndex
			},
			success: function(response) {
				console.log("댓글 작성 성공:", response);
				// 댓글 작성 후 댓글 다시 로드
				openModal(postIndex);
			},
			error: function(xhr, status, error) {
				console.error("댓글 작성 오류:", error);
			}
		});
	}
	// 댓글 로드 함수
	function loadComments(postIndex) {
    $.ajax({
        type: 'POST',
        url: 'CommentLoad_post',
        data: { ct_index: postIndex },
        success: function(cmt) {
            console.log("댓글불러오기 성공", cmt);
            const commentContent = document.getElementById('comment-div');
            commentContent.innerHTML = '';
            good = 0;
            bad = 0;
            if (cmt != null) {
                let commentPromises = cmt.map((comment) => {
                    return new Promise((resolve, reject) => {
                        console.log(comment.content);
                        $.ajax({
                            type: 'POST',
                            url: 'http://192.168.219.175:5050/test',
                            data: { comment: comment.content },
                            success: function(result) {
                                if (result.result === '긍정') {
									console.log(comment.content+":"+result.result)
                                    good += 1;
                                } else if (result.result === '부정') {
									console.log(comment.content+":"+result.result)
                                    bad += 1;
                                } else {
                                    console.log("예상치 못한 결과: " + result.result);
                                }
                                resolve();
                            },
                            error: function(error) {
                                console.error('오류 발생:', error);
                                reject(error);
                            }
                        });
                    });
                });

                Promise.all(commentPromises).then(() => {
                    document.getElementById('like-dislike-span').innerHTML = `😊:${good} 😢:${bad}`;

                    cmt.forEach((comment) => {
                        let buttonsHtml = '';
                        if (comment.id === userId) {
                            buttonsHtml = `
                                <input type="hidden" name="commentIndex" value="${comment.cmtidx}">
                                <button type="button" class="comment-btn edit">수정</button>
                                <button type="button" class="comment-btn save" style="display:none;">저장</button>
                                <button type="button" class="comment-btn delete">삭제</button>
                            `;
                        }

                        const commentHTML = `
                            <div class="comment-div-gap">
                                <p id="img-user-info">
                                    <img src="images/${comment.img}" alt="프로필 이미지" class="comments-profile-img">
                                    <span id="cock-user">${comment.id}</span>
                                </p>
                                <div id="comments-ul">
                                    <ul id="feedmodal-comments-list">
                                        <li class="comments-body">
                                            <p class="comments-text">${comment.content}</p>
                                            <small class="text-muted">${comment.at}
                                                ${buttonsHtml}
                                            </small>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        `;
                        commentContent.insertAdjacentHTML('beforeend', commentHTML);
                    });

                    // 수정 버튼 클릭 이벤트 리스너 추가
                    commentContent.addEventListener('click', function(event) {
                        if (event.target.classList.contains('edit')) {
                            const editBtn = event.target;
                            const commentsBody = editBtn.closest('.comments-body');
                            const commentText = commentsBody.querySelector('.comments-text');
                            const saveBtn = commentsBody.querySelector('.save');
                            const deleteBtn = commentsBody.querySelector('.delete');
                            const commentIndex = commentsBody.querySelector('input[name="commentIndex"]').value;

                            // 수정 가능한 입력 폼으로 변경
                            commentText.contentEditable = true;
                            commentText.focus();

                            // 버튼 상태 변경
                            editBtn.style.display = 'none';
                            saveBtn.style.display = 'inline-block';

                            // 저장 버튼 클릭 이벤트 리스너 등록
                            saveBtn.addEventListener('click', function() {
                                const updatedContent = commentText.textContent;
                                saveComment(postIndex, commentIndex, updatedContent);
                            });

                            // 삭제 버튼 클릭 이벤트 리스너 등록
                            deleteBtn.addEventListener('click', function() {
                                deleteComment(postIndex, commentIndex);
                            });
                        }

                        // 삭제 버튼 클릭 이벤트 리스너 추가 (Event Delegation)
                        if (event.target.classList.contains('delete')) {
                            const deleteBtn = event.target;
                            const commentIndex = deleteBtn.closest('.comments-body').querySelector('input[name="commentIndex"]').value;
                            deleteComment(postIndex, commentIndex);
                        }
                    });

                }).catch((error) => {
                    console.error("댓글 처리 중 오류 발생:", error);
                });
            } else {
                console.log("불러올 댓글이 없습니다.");
            }
        },
        error: function(xhr, status, error) {
            console.error("댓글 로드 중 오류 발생:", error);
        }
    });
}


	// 댓글 저장 함수
	function saveComment(postIndex, commentIndex, updatedContent) {
		$.ajax({
			type: 'POST',
			url: 'updateComment', // 수정할 댓글 업데이트를 처리하는 서버 API 주소
			data: {
				postIndex: postIndex,
				commentIndex: commentIndex,
				updatedContent: updatedContent
			},
			success: function(response) {
				console.log("댓글 수정 성공:", response);
				openModal(postIndex); // 수정 후 댓글 다시 로드
			},
			error: function(xhr, status, error) {
				console.error("댓글 수정 오류:", error);
			}
		});
	}

	// 댓글 삭제 함수
	function deleteComment(postIndex, commentIndex) {
		$.ajax({
			type: 'POST',
			url: 'deleteComment', // 삭제할 댓글 삭제를 처리하는 서버 API 주소
			data: {
				postIndex: postIndex,
				commentIndex: commentIndex

			},
			success: function(response) {
				console.log("댓글 삭제 성공:", response);
				openModal(postIndex); // 삭제 후 댓글 다시 로드
			},
			error: function(xhr, status, error) {
				console.error("댓글 삭제 오류:", error);
			}
		});

	}
	// 게시물 수정 함수
	window.editPost = function(postIndex) {
		console.log("게시물 수정 버튼 클릭");

		const textarea = document.getElementById('explain');
		const imageUpload = document.getElementById('image-upload');
		const postImage = document.getElementById('post-image');
		const saveButton = document.querySelector('#save-button');
		const cancelButton = document.querySelector('#cancel-button');
		const editButton = document.querySelector('#btn-mdf');
		const deleteButton = document.querySelector('#btn-delete');

		// 수정 버튼과 삭제 버튼을 숨기고, 저장 버튼과 취소 버튼을 표시
		editButton.style.display = 'none';
		deleteButton.style.display = 'none';
		saveButton.style.display = 'inline-block';
		cancelButton.style.display = 'inline-block';

		// 이미지 업로드 버튼을 수정 버튼 옆에 배치
		postImage.parentNode.insertBefore(imageUpload, postImage.nextSibling);

		// 콘텐츠 수정 가능하도록 설정 (textarea 예시)
		textarea.readOnly = false;
		textarea.focus();

		// 이미지 클릭 시 파일 선택 창 열기 (수정 상태에서만 활성화)
		postImage.addEventListener('click', function() {
			imageUpload.click();
		});

		// 이미지 업로드 시 미리보기 기능 (수정 상태에서만 활성화)
		imageUpload.addEventListener('change', function(event) {
			const file = event.target.files[0];
			const reader = new FileReader();
			reader.onload = function(e) {
				postImage.src = e.target.result;
			};
			reader.readAsDataURL(file);
		});

		// 저장 버튼 클릭 시 업데이트 요청
		saveButton.addEventListener('click', function() {
			const newContent = textarea.value;
			const formData = new FormData();
			formData.append('postIndex', postIndex);
			formData.append('content', newContent);
			if (imageUpload.files[0]) {
				formData.append('image', imageUpload.files[0]);
			}




			// 게시물 업데이트 AJAX 요청
			$.ajax({
				type: 'POST',
				enctype: 'multipart/form-data',
				url: 'updatePost',
				data: formData,

				processData: false,
				contentType: false,
				success: function(response) {
					console.log("게시물 업데이트 성공:", response);
					openModal(postIndex);
				},
				error: function(xhr, status, error) {
					console.error("게시물 업데이트 오류:", error);
				}
			});
		});

		// 취소 버튼 클릭 시 편집 취소
		cancelButton.addEventListener('click', function() {
			textarea.value = getcont; // 기존 콘텐츠로 되돌리기
			textarea.readOnly = true;
			saveButton.style.display = 'none';
			cancelButton.style.display = 'none';
			editButton.style.display = 'inline-block';
			deleteButton.style.display = 'inline-block';
		});
	};



	window.confirmDelete = function(postIndex) {
		const confirmed = confirm("정말로 이 게시물을 삭제하시겠습니까?");
		if (confirmed) {
			// 게시물 삭제 AJAX 요청
			$.ajax({
				type: 'POST',
				url: 'deletePost',
				data: { postIndex: postIndex },
				success: function(response) {
					console.log("게시물 삭제 성공:", response);
					closeModal();
				},
				error: function(xhr, status, error) {
					console.error("게시물 삭제 오류:", error);
				}
			});
		}
	};
	window.searchBoard = function(){
		var query = document.getElementById('searchQueryBoard').value;
		$.ajax({
				type: 'POST',
				url: 'BoardSearchServlet',
				data: { query: query },
				success: function(result) {
					
					updatepost(result);
				},
				error: function(xhr, status, error) {
					
				}
			});
	}

});