let heartState = 'empty';
let userId = "";
let userImg = "";
let poto = "";
let gettitle = "";
let getat = "";
let geting = "";
let getproimg = "";
let getimg = "";
let getuid = "";
let getcont = "";
let getrsp = "";
let uid = "";
let good = 0;
let bad = 0;
$(document).ready(function() {
let feeds = [];
	

	$.ajax({
		type: 'POST',
		url: 'LoadFeed',
		success: function(result) {
			console.log("AJAX 성공:", result);
			updatefeed(result);
		},
		error: function(xhr, status, error) {
			console.error("feed 로드 오류:", error);
		}
	});

	function updatefeed(result) {
		console.log("배열 업데이트 작동");
		feeds = []; // 기존 배열 비우기
		result.forEach(feed => {
			feeds.push({
				index: parseInt(feed.index),
				title: feed.title,
				text: feed.text,
				img: feed.img,
				at: feed.at,
				id: feed.id,
				ing: feed.ing,
				cmtcnt: parseInt(feed.cmtcnt)
			});
		});
		console.log("담기 성공!", feeds);
		renderfeed(feeds);
	}

	function renderfeed(feeds) {
		const container = document.getElementById('cocktail-list');
		container.innerHTML = '';
		feeds.forEach((feed) => {
			let trimmedDate = feed.at.slice(0, -9);
			const col = document.createElement('div');
			col.className = 'col-md-3 d-flex ftco-animate';
			col.innerHTML = `
                <div class="blog-entry align-self-stretch">
                    <a href="javascript:void(0)" class="block-20" onclick="openModal(${feed.index})" style="background-image: url('${feed.img}');">
                        <div class="overlay">
                            <p class="overlay-text">더보기</p>
                        </div>
                    </a>
                    <div class="text py-4 d-block">
                        <p class="side-info" id="date">${trimmedDate} <span class="icon-chat"></span>${feed.cmtcnt}</p>
                        <h3 class="heading mt-2 text-center" id="title">${feed.title}</h3>
                        <p id="description">${feed.text}</p>
                    </div>
                </div>
            `;
			container.appendChild(col);
		});
	}

	let scrollPosition = 0;

	const modal = document.querySelector('.modal');
	const modalContent = document.getElementById('modal-content');

	let currentCocktailIndex = -1;

	window.openModal = function(feedIndex) { // 함수 전역 스코프에 선언
      scrollPosition = window.pageYOffset;
      currentCocktailIndex = feedIndex;
      let buttonsHtml = '';

      const feed = feeds[feedIndex];
      let pick1 = feedIndex;
      $.ajax({
         type: 'POST',
         url: 'GetFeed',
         data: { idx: pick1 },
         success: function(q) {
            gettitle = q[0].gettitle,
               getat = q[0].getat,
               geting = q[0].geting,
               getproimg = q[0].getproimg,
               getimg = q[0].getimg,
               getuid = q[0].getuid,
               getcont = q[0].getcont,
               getrsp = q[0].getrsp,
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
                  if (userId === getuid) {
                     buttonsHtml = `
                        
                                <a href="javascript:void(0)" class="btn btn-primary" id="openModalModify" onclick="openModalModify()">수정</a>
                                <a href="javascript:void(0)" class="btn btn-primary" id="openModalDelete" >삭제</a>
                            `;
                     
                  }

                  modalContent.innerHTML = `
                            <div class="modal-div-top">
                                <p class="btn-close-modal"><a href="javascript:void(0)" class="ml-2 btn btn-white btn-outline-white"
                                        id="closeModal" onclick="closeModal()">X</a>
                                </p>
                                <div class="modal-div-top-left">
                                    <img src="images/${getproimg}" alt="프로필 이미지" class="profile-img">
                                    <span>${getuid}님</span><span id="like-dislike-span">😊:${good}  😢:${bad}</span>
                                    <h3 class="heading mt-2 text-left">${gettitle}</h3>
                                </div>
                                <div class="modal-div-top-right">
                                    <form id="modal-modify">
                                        ${buttonsHtml}
                                    </form>
                                </div>
                            </div>
                            <div class="modal-div-left" id="mc">
                                <img src="${getimg}" alt="칵테일이름" id="mdImg">
                                <span id="modal-date">${getat}<span class="icon-chat"></span> 3</span>
                                <button class="like-btn"><img class="hImg" src="images/빈하트.png"></button>
                            </div>
                            <div class="modal-div-right">
                                <p class="heading mt-2 text-right" id="material-info"><img src="images/cocktail_null.png" id="material-img"> 재료정보</p>
                                <textarea class="textbox" readonly>${geting}</textarea>
                                <p class="heading mt-2 text-right" id="recipe-info"><img src="images/abcd.png" id="material-img"> 레시피</p>
                                <textarea class="textbox" readonly>${getrsp}</textarea>
                            </div>
                            <div class="modal-div-center">
                                <textarea class="textbox" id="explain" readonly>${getcont}</textarea>
                                <div id="div-line"></div>
                                <form id="modal-comment-form">
                                    <div id="comment-form-container">
                                        <img src="images/${userImg}" alt="프로필 이미지" id="form-profile-img">
                                        <textarea id="modal-comment-text" placeholder="댓글을 작성해주세요..." required></textarea>
                                        <input type="hidden" name="feedIndex" value="${feedIndex}">
                                        <button type="button" onclick="submitComment()">댓글 작성</button>
                                    </div>
                                </form>
                                <div id="comment-div-feed"></div>
                            </div>
                        `;
            const openModalDeleteBtn = document.getElementById('openModalDelete');
                if (openModalDeleteBtn) {
                    openModalDeleteBtn.addEventListener('click', function() {
                        openModalDelete(feedIndex);
                    });
                    }
                  // 하트 체크하는 AJAX 요청을 모달 컨텐츠 업데이트 후에 실행
                  $.ajax({
                     type: 'POST',
                     url: 'Checkheart_feed',
                     data: { num: pick1 },
                     success: function(q) {
                        console.log("하트체크완료", q)
                        const heartImg = document.querySelector('.hImg');
                        if (q == 1) {
                           console.log("빨간하트작동완료")
                           heartImg.src = 'images/빨간하트.png';
                           heartState = "filled";
                        } else {
                           console.log("빈하트작동완료")
                           heartImg.src = 'images/빈하트.png';
                           heartState = 'empty';
                        }
                     },
                  });
            

                  const likeBtn = modalContent.querySelector('button.like-btn');
                  const heartImg = likeBtn.querySelector('.hImg');
                  likeBtn.addEventListener('click', function() {
                     console.log(heartState);
                     if (heartState === 'empty') {
                        heartImg.src = 'images/빨간하트.png';
                        heartState = 'filled';
                        let pick = feedIndex;
                        $.ajax({
                           type: 'POST',
                           url: 'feedheart',
                           data: { num: pick },
                           success: function(q) {
                              console.log("하트누른거", q);
                           }
                        });
                     } else if (heartState === 'filled') {
                        heartImg.src = 'images/빈하트.png';
                        heartState = 'empty';
                        let pick = feedIndex;
                        $.ajax({
                           type: 'POST',
                           url: 'deleteheart_feed',
                           data: { num: pick },
                           success: function(q) {
                              console.log("취소성공", q);
                           }
                        });
                     }
                  });
                  loadComments(feedIndex);
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

	window.closeModal = function() {
		modal.style.display = 'none';
		window.scrollTo(0, scrollPosition);
		$.ajax({
			type: 'POST',
			url: 'LoadFeed',
			success: function(result) {
				console.log("AJAX 성공:", result);
				$.ajax({
					type: 'POST',
					url: 'LoadFeed',
					success: function(result) {
						console.log("AJAX 성공:", result);
						updatefeed(result);
					},
					error: function(xhr, status, error) {
						console.error("feed 로드 오류:", error);
					}
				});
			},
			error: function(xhr, status, error) {
				console.error("게시물 로드 오류:", error);
			}
		});
	};

	window.onclick = function(event) {
		if (event.target === modal) {
			closeModal();
		}
	};

	window.submitComment = function() {
		const commentText = document.getElementById('modal-comment-text').value;
		const feedIndex = document.querySelector('input[name="feedIndex"]').value;

		$.ajax({
			type: 'POST',
			url: 'comment_up_feed',
			data: {
				comment_text: commentText,
				feedIndex: feedIndex
			},
			success: function(response) {
				console.log("댓글 작성 성공:", response);
				// 댓글 작성 후 댓글 다시 로드
				loadComments(feedIndex)
			},
			error: function(xhr, status, error) {
				console.error("댓글 작성 오류:", error);
			}
		});
	};

	function loadComments(feedIndex) {
		$.ajax({
			type: 'POST',
			url: 'CommentLoad_feed',
			data: { feedIndex: feedIndex },
			success: function(cmt) {
				console.log("댓글불러오기 성공", cmt);
				const commentContent = document.getElementById('comment-div-feed');
				commentContent.innerHTML = '';
				 good = 0;
                 bad = 0;
				if (cmt != null) {
					let commentPromises = cmt.map((comment) => {
                            return new Promise((resolve, reject) => {
                                $.ajax({
                                    type: 'POST',
                                    url: 'http://192.168.219.175:5050/test',
                                    data: { comment: comment.content },
                                    success: function(result) {
                                        if (result.result === '긍정') {
											console.log(result.result)
                                            good += 1;
                                        } else if (result.result === '부정') {
											console.log(result.result)
                                            bad += 1;
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
						let buttonsHtml2 = '';
						if (comment.id === userId) {
							buttonsHtml2 = `
                            <input type="hidden" name="commentIndex" value="${comment.cmtidx}">
                            <button type="button" class="comment-btn edit">수정</button>
							<button type="button" class="comment-btn save" style="display:none;">저장</button>
							<button type="button" class="comment-btn delete">삭제</button>
                        `;
						}

						const commentHTML = `
                       <div class="comment-div-gap-feed">
						   <p id="img-user-info">
							  <img src="images/${comment.img}" alt="프로필 이미지" class="comments-profile-img">
							  <span id="cock-user">${comment.id}</span>
						   </p>
						   <div id="comments-ul">
							  <ul id="feed-comments-list">
									<li class="comments-body">
									   <p class="comments-text">${comment.content}</p>
									   <small class="text-muted">${comment.at}
										  ${buttonsHtml2}
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
								saveComment(feedIndex, commentIndex, updatedContent);
							});

							// 삭제 버튼 클릭 이벤트 리스너 등록
							deleteBtn.addEventListener('click', function() {
								deleteComment(feedIndex, commentIndex);
							});
						}

						// 삭제 버튼 클릭 이벤트 리스너 추가 (Event Delegation)
						if (event.target.classList.contains('delete')) {
							const deleteBtn = event.target;
							const commentIndex = deleteBtn.closest('.comments-body').querySelector('input[name="commentIndex"]').value;
							deleteComment(feedIndex, commentIndex);
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
	function saveComment(feedIndex, commentIndex, updatedContent) {

		$.ajax({
			type: 'POST',
			url: 'updateComment_feed',
			data: {
				feedIndex: feedIndex,
				commentIndex: commentIndex,
				updatedContent: updatedContent
			},
			success: function(response) {
				console.log("댓글 수정 성공:", response);
				loadComments(feedIndex) // 수정 후 댓글 다시 로드
			},
			error: function(xhr, status, error) {
				console.error("댓글 수정 오류:", error);
			}
		});
	}

	// 댓글 삭제 함수
	function deleteComment(feedIndex, commentIndex) {
		$.ajax({
			type: 'POST',
			url: 'deleteComment_feed', // 삭제할 댓글 삭제를 처리하는 서버 API 주소
			data: {
				feedIndex: feedIndex,
				commentIndex: commentIndex
			},
			success: function(response) {
				console.log("댓글 삭제 성공:", response);
				loadComments(feedIndex) // 삭제 후 댓글 다시 로드
			},
			error: function(xhr, status, error) {
				console.error("댓글 삭제 오류:", error);
			}
		});
	}

	// openModalModify 함수 정의
	window.openModalModify = function() {
		const modalContent = document.getElementById('modal-content');
		const feedIndex = currentCocktailIndex;
		const feed = feeds[feedIndex];

		modalContent.innerHTML = `
        <h5 class="modal-title" id="writeModalLabel">📖피드수정
        <p class="btn-close-modal"><a href="javascript:void(0)" class="ml-2 btn btn-white btn-outline-white"
            id="closeModalModify" onclick="closeModalModify()">X</a>
        </p>
        </h5>
        <div class="modal-top-title">
            <textarea class="textbox-title" rows="1" id="modify-title-info">${gettitle}</textarea>
        </div>
            
        <div class="modal-div-left" id="mc">
            <img src="${getimg}" id="mdImg" alt="업로드된 이미지">
            <input type="file" id="fileInput" accept="image/*" style="display: none;">
            <a href="#" class="ml-2 btn btn-white btn-outline-white" id="btn1">이미지 수정</a>
        </div>
        <div class="modal-div-right">
            <p class="heading mt-2 text-left" id="material-modify"><img src="images/cocktail_null.png" id="material-img"> 재료정보</p>
            <textarea class="textbox-modify" id="modify-material-info">${geting}</textarea>

            <p class="heading mt-2 text-left" id="recipe-modify"><img src="images/abcd.png" id="material-img"> 레시피</p>
            <textarea class="textbox-modify" id="modify-recipe-info">${getrsp}</textarea>
        </div>

        <div class="modal-div-center">
            <div class="modal-center-title">
                <label for="postDescription" id="modify-feed-content">📝피드 내용</label>
                <textarea class="textbox-modify" id="explain" rows="3">${getcont}</textarea>
            </div>
        </div>
        <div class="modal-footer-modify">
            <button type="button" class="btn btn-primary" id="btn-cancel-modify" onclick="closeModalModify()">취소</button>
            <button type="button" class="btn btn-primary" id="btn-save-modify" onclick="saveModalModify(${feedIndex})">저장</button>
        </div>
    `;
		// 모달 열기
		modal.style.display = 'block';

		// 이미지 수정 버튼 클릭 이벤트
		document.getElementById('btn1').addEventListener('click', function() {
			document.getElementById('fileInput').click();
		});
	};

	// 피드 수정 저장
	window.saveModalModify = function(feedIndex) {
		const modifiedTitle = document.getElementById('modify-title-info').value;
		const modifiedIng = document.getElementById('modify-material-info').value;
		const modifiedRsp = document.getElementById('modify-recipe-info').value;
		const modifiedCont = document.getElementById('explain').value;
		const fileInput = document.getElementById('fileInput');

		const formData = new FormData();
		formData.append('feedIndex', feedIndex);
		formData.append('title', modifiedTitle);
		formData.append('ing', modifiedIng);
		formData.append('content', modifiedCont);
		formData.append('rsp', modifiedRsp);

		if (fileInput.files.length > 0) {
			formData.append('img', fileInput.files[0]);
		}

		$.ajax({
			type: 'POST',
			enctype: 'multipart/form-data',
			url: 'updateFeed',
			data: formData,
			processData: false,
			contentType: false,
			success: function(result) {
				console.log("피드 수정 성공:", result);
				// 모달 닫기
				openModal(feedIndex)
				// 피드 업데이트

			},
			error: function(xhr, status, error) {
				console.error("피드 수정 오류:", error);
			}
		});
	};
	function openModalDelete(feedIndex) {
		$.ajax({
			type: 'POST',
			url: 'deleteFeed',
			data: { feedIndex: feedIndex },
			success: function(result) {
				console.log("피드 삭제 성공:", result);
				closeModal();
				$.ajax({
					type: 'POST',
					url: 'LoadFeed',
					success: function(result) {
						console.log("AJAX 성공:", result);
						updatefeed(result);
					},
					error: function(xhr, status, error) {
						console.error("feed 로드 오류:", error);
					}
				});
			},
			error: function(xhr, status, error) {
				console.error("피드 삭제 오류:", error);
			}
		});
	}






});
