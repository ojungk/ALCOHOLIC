let good = 0;
let bad = 0;
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
document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('searchQueryBoard');
    const searchButton = document.querySelector('.btn-primary');

    searchInput.addEventListener('keydown', function(e) {
        if (e.key === 'Enter') {
            searchBoard();
        }
    });

    searchButton.addEventListener('click', function () {
        searchBoard();
    });
});

function searchBoard() {
    var query = document.getElementById('searchQueryBoard').value;
    if (query.trim() !== "") {
        fetch('BoardSearchServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'query=' + encodeURIComponent(query)
        }) 
        .then(response => response.json())
        .then(data => {
            if (data.resultsExist) {
                console.log(data.searchBoardResults); // 여기서 데이터 확인
                displaySearchResults(data.searchBoardResults);
            } else {
                window.location.href = 'searchNothing.jsp';
            }
        })
        .catch(error => console.error('Error:', error));
    } else {
        alert('검색어를 입력하세요.');
    }
}

function displaySearchResults(results) {
    const boardContent = document.getElementById('boardContent');
    boardContent.innerHTML = '';

    results.forEach(result => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${result.post_idx}</td>
            <td><a href="#" onclick="openModal2(${result.post_idx})">${result.post_title}</a></td>
            <td><a href="#" onclick="openModal2(${result.post_idx})">${result.post_content}</a></td>
            <td>${result.user_id}</td>
            <td>${result.created_at}</td>
            <td>${result.post_views}</td>
        `;
        boardContent.appendChild(tr);
    });
}

window.openModal2 = function(postIndex) {
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
