let heartState = 'empty';
let userId = "";
let userImg = "";
let good = 0;
let bad = 0;
$(document).ready(function() {
	var cocktailss = [];
	var cocktailss2 = [];
	let feeds =[];
	let type = 'a';
	let poto = '';
	// Initial AJAX calls
	$.ajax({
		type: 'POST',
		url: 'MypageCocktail',
		data: { type: type },
		success: function(result) {
			console.log("AJAX 성공:", result);
			updateCocktailss(result);
			
		}
		
	});
	$.ajax({
		type:'POST',
		url :'Mytaste',
		data:{type:type},
		success : function(my){
			console.log("취향 성공:", my);
			updateCocktailss2(my);
			
		},
		error: function(xhr, status, error) {
						console.error("취향 로드 오류:", error);
					}
		
	})
	$.ajax({
		type: 'POST',
		url: 'MypageCocktail_feed',
		data: { type: type },
		success: function(fdd) {
			console.log("피드불러오기성공:", fdd);
			
			update_feed(fdd);
		},
		error: function(xhr, status, error) {
						console.error("피드 로드 오류:", error);
					}
		
	});
	
	
	$.ajax({
		type: 'POST',
		url: 'Mypagecount_feed',
		data: { type: type },
		success: function(count) {
			console.log("카운트:", count);
			UploadedFeed(count);
		}
	});
	$.ajax({
		type: 'POST',
		url: 'Mypagecount',
		data: { type: type },
		success: function(count) {
			console.log("AJAX 성공:", count);
			updatebookmark(count);
		}
	});

	function updateCocktailss(result) {
		console.log("배열 업데이트 작동");
		cocktailss = []; // 기존 배열 비우기
		result.forEach(cocktail => {
			cocktailss.push({
				name: cocktail.name,
				ename: cocktail.ename,
				description: cocktail.description,
				ABV: cocktail.ABV,
				image: cocktail.image,
				rsp: cocktail.rsp,
				index: cocktail.index,
				ing: cocktail.ing
			});
		});
		console.log("업데이트된 칵테일 목록:", cocktailss); // 데이터 확인
		renderCocktailss(cocktailss);
	}
	function updateCocktailss2(my) {
		console.log("배열 업데이트 작동");
		cocktailss2 = []; // 기존 배열 비우기
		my.forEach(cocktail2 => {
			cocktailss2.push({
				name: cocktail2.name,
				ename: cocktail2.ename,
				description: cocktail2.description,
				ABV: cocktail2.ABV,
				image: cocktail2.image,
				rsp: cocktail2.rsp,
				index: cocktail2.index,
				ing: cocktail2.ing
			});
		});
		console.log("업데이트된 칵테일 목록:", cocktailss2); // 데이터 확인
		renderCocktailss2(cocktailss2);
	}
	function update_feed(fdd) {
		console.log("배열 업데이트 작동");
		feeds = []; // 기존 배열 비우기
		fdd.forEach(feed => {
			feeds.push({
				index: feed.index,
				title: feed.title,
				text: feed.text,
				img: feed.img,
				at: feed.at,
				id: feed.id,
				ing: feed.ing,
				rsp: feed.rsp,
				cmtcnt : feed.cmtcnt
			});
			Load_feed(feeds)
		});
		}
	

	function updatebookmark(count) {
		const container = document.getElementById('bookmark');
		container.innerHTML = '💚 Bookmark : ' + count;
	}
	
	function UploadedFeed(count) {
		const container = document.getElementById('Uploaded');
		container.innerHTML = '📃 Uploaded Post : ' + count;
	}
	
	function Load_feed(feeds) {
    const container1 = document.getElementById('myupload');
    container1.innerHTML = '';
    feeds.forEach((feed) => {
        // Create a new div element for the feed
        const col = document.createElement('div');
        col.className = 'col-md-4 d-flex ftco-animate';

        // Set the inner HTML of the new div
        col.innerHTML = `
            <div class="blog-entry align-self-stretch">
              <a class="block-20"  style="background-image: url('${feed.img}');">
              </a>
              <div class="text py-4 d-block">
                <div class="meta">
                  <div><a >${feed.at}</a></div>
                  <div><a >${feed.id}</a></div>
                  <div><a  class="meta-chat"><span class="icon-chat"></span> ${feed.cmtcnt}</a></div>
                </div>
                <h3 class="heading mt-2" id="upload_title"><a>${feed.title}</a></h3>
                <p id="description">${feed.text}</p>
              </div>
            </div>
        `;

        // Append the new div to the container
        container1.appendChild(col);
    });
}
	function renderCocktailss(cocktailss) {
		const container = document.getElementById('cocktail-list');
		container.innerHTML = '';
		cocktailss.forEach((cocktail, index) => {
			const col = document.createElement('div');
			col.className = 'col-md-3 d-flex ftco-animate';
			col.innerHTML = `
            <div class="blog-entry align-self-stretch">
                <a href="javascript:void(0)" class="block-20" onclick="openModal(${index})" style="background-image: url('images/cocktail/${cocktail.name}.png');"></a>
                <div class="text py-4 d-block">
                    <h3 class="heading mt-2 text-center" id="name">${cocktail.name}</h3>
                    <h3 class="heading mt-2 text-center" id="ename">${cocktail.ename}</h3>
                    <div class="info-container">                        
                        <p class="btn-open-modal" id="more_btn"><a href="javascript:void(0)" class="ml-2 btn btn-white btn-outline-white" onclick="openModal(${index})">더보기</a></p>
                    </div>
                </div>
            </div>
        `;
			container.appendChild(col);
		});


	}
	function renderCocktailss2(cocktailss2) {
		const container = document.getElementById('cocktail-list2');
		container.innerHTML = '';
		cocktailss2.forEach((cocktail2, index) => {
			const col = document.createElement('div');
			col.className = 'col-md-3 d-flex ftco-animate';
			col.innerHTML = `
            <div class="blog-entry align-self-stretch">
                <a href="javascript:void(0)" class="block-20" onclick="openModal2(${index})" style="background-image: url('images/cocktail/${cocktail2.name}.png');"></a>
                <div class="text py-4 d-block">
                    <h3 class="heading mt-2 text-center" id="name">${cocktail2.name}</h3>
                    <h3 class="heading mt-2 text-center" id="ename">${cocktail2.ename}</h3>
                    <div class="info-container">                        
                        <p class="btn-open-modal" id="more_btn"><a href="javascript:void(0)" class="ml-2 btn btn-white btn-outline-white" onclick="openModal2(${index})">더보기</a></p>
                    </div>
                </div>
            </div>
        `;
			container.appendChild(col);
		});


	}

	let scrollPosition = 0;
	const modal = document.querySelector('.modal');
	const modalContent = document.getElementById('modal-content');
	const modalClose = document.querySelector('.btn-close-modal');
	let currentCocktailIndex = -1;

	window.openModal = function(cocktailIndex) {
		console.log(cocktailIndex)
		scrollPosition = window.pageYOffset;
		currentCocktailIndex = cocktailIndex;
		const cocktail = cocktailss[cocktailIndex];
		const comments = JSON.parse(localStorage.getItem(`comments-${cocktail.name}`)) || [];
		let pick1 = cocktail.index;

		$.ajax({
			type: 'POST',
			url: 'Checkheart',
			data: { num: pick1 },
			success: function(q) {
				const heartImg = document.querySelector('.hImg');
				if (q == 1) {
					heartImg.src = 'images/빨간하트.png';
					heartState = "filled";
				} else {
					heartImg.src = 'images/빈하트.png';
					heartState = 'empty';
				}
			},
		});

		$.ajax({
			type: 'POST',
			url: 'getimg',
			data: { are: poto },
			success: function(ig) {
				userId = ig[0].getid;
				userImg = ig[0].getimg;

				modalContent.innerHTML = `
                    <div class="modal-div-left" id="mc">
                    <span id="like-dislike-span">😊:${good}  😢:${bad}</span>
                        <img src="images/cocktail/${cocktail.name}.png" alt="${cocktail.name}" id="mdImg">
                        <span id="modal-abv">ABV: ${cocktail.ABV}</span>
                        <button class="like-btn"><img class="hImg" src="images/빈하트.png"></button>
                    </div>
                    <div class="modal-div-right">
                        <h3 class="heading mt-2 text-left">${cocktail.name}<br>${cocktail.ename}</h3>
                        <p class="heading mt-2 text-right">${cocktail.description}</p>
                        <p class="heading mt-2 text-right">재료정보<span id="iToC"> ▼</span></p>
                        <textarea class="textbox" readonly>${formatIngredients(cocktail.ing)}</textarea>
                        <p class="heading mt-2 text-right">레시피<span id="iToC"> ▼</span></p>
                        <textarea class="textbox" readonly>${formatIngredients2(cocktail.rsp)}</textarea>
                    </div>
                    <div class="modal-div-center">
                        <div id="div-line-menu"></div>
                        <form id="modal-comment-form">
                                <div id="comment-form-container">
                                    <img src="images/${userImg}" alt="프로필 이미지" id="form-profile-img">
                                    <textarea id="modal-comment-text" placeholder="댓글을 작성해주세요..." required name="comment_text"></textarea>
                                    <input type="hidden" name="cocktailIndex" value="${cocktail.index}">
                                    <button type="button"   onclick="submitComment()">댓글 작성</button>
                                </div>
                            </form>
                        <div id="comment-div"></div>
                    </div>
                `;

				const likeBtn = modalContent.querySelector('button.like-btn');
				const heartImg = likeBtn.querySelector('.hImg');
				likeBtn.addEventListener('click', function() {
					console.log(heartState);
					if (heartState === 'empty') {
						heartImg.src = 'images/빨간하트.png';
						heartState = 'filled';
						let pick = cocktail.index;
						$.ajax({
							type: 'POST',
							url: 'cocktailheart',
							data: { num: pick },
							success: function(q) {
								console.log("하트누른거", q);
							}
						});
					} else if (heartState === 'filled') {
						heartImg.src = 'images/빈하트.png';
						heartState = 'empty';
						let pick = cocktail.index;
						$.ajax({
							type: 'POST',
							url: 'deleteheart',
							data: { num: pick },
							success: function(q) {
								console.log("취소성공", q);
								$.ajax({
									type: 'POST',
									url: 'MypageCocktail',
									data: { type: type },
									success: function(result) {
										console.log("AJAX 성공:", result);
										updateCocktailss(result);
										$.ajax({
											type: 'POST',
											url: 'Mypagecount',
											data: { type: type },
											success: function(count) {
												console.log("AJAX 성공:", count);
												updatebookmark(count);
											}
										});
									}
								});
							}
						});
					}
				});

				$.ajax({
					type: 'POST',
					url: 'CommentLoad',
					data: { ct_index: cocktail.index },
					success: function(cmt) {
						const commentContent = document.getElementById('comment-div');
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
                                            good += 1;
                                        } else if (result.result === '부정') {
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
							}).catch((error) => {
                            console.error("댓글 처리 중 오류 발생:", error);
                        });

							// 수정 및 삭제 버튼 클릭 이벤트 등록 (이벤트 위임)
							commentContent.addEventListener('click', function(event) {
								const target = event.target;
								if (target.classList.contains('edit')) {
									const commentsBody = target.closest('.comments-body');
									const commentText = commentsBody.querySelector('.comments-text');
									const saveBtn = commentsBody.querySelector('.save');
									const deleteBtn = commentsBody.querySelector('.delete');
									const commentIndex = commentsBody.querySelector('input[name="commentIndex"]').value;
									const ctIndex = document.querySelector('input[name="cocktailIndex"]').value;

									// 수정 가능한 입력 폼으로 변경
									commentText.contentEditable = true;
									commentText.focus();

									// 버튼 상태 변경
									target.style.display = 'none';
									saveBtn.style.display = 'inline-block';

									// 저장 버튼 클릭 이벤트 리스너 등록
									saveBtn.addEventListener('click', function() {
										const updatedContent = commentText.textContent;
										saveComment(ctIndex, commentIndex, updatedContent); // 수정된 내용 저장

										// 버튼 상태 변경 원복
										target.style.display = 'inline-block';
										saveBtn.style.display = 'none';
									});

									// 삭제 버튼 클릭 이벤트 리스너 등록
									deleteBtn.addEventListener('click', function() {
										deleteComment(ctIndex, commentIndex); // 댓글 삭제
									});
								} else if (target.classList.contains('delete')) {
									const commentsBody = target.closest('.comments-body');
									const commentIndex = commentsBody.querySelector('input[name="commentIndex"]').value;
									const ctIndex = document.querySelector('input[name="cocktailIndex"]').value;

									deleteComment(ctIndex, commentIndex); // 댓글 삭제
								}
							});
						}
					},
					error: function(xhr, status, error) {
						console.error("댓글 로드 오류:", error);
					}
				});

				window.submitComment = function() {
					const commentText = document.getElementById('modal-comment-text').value;
					const ctIndex = document.querySelector('input[name="cocktailIndex"]').value;
					

					// AJAX를 통해 댓글 서버로 전송
					$.ajax({
						type: 'POST',
						url: 'comment_up',
						data: {
							comment_text: commentText,
							ctIndex: ctIndex
						},
						success: function(response) {
							console.log("댓글 작성 성공:", response);
							// 댓글 작성 후 댓글 다시 로드
							openModal(currentCocktailIndex);
						},
						error: function(xhr, status, error) {
							console.error("댓글 작성 오류:", error);
						}
					});
				};// 댓글 저장 함수
				function saveComment(ctIndex, commentIndex, updatedContent) {
					
					$.ajax({
						type: 'POST',
						url: 'updateComment_ct',
						data: {
							ctIndex: ctIndex,
							commentIndex: commentIndex,
							updatedContent: updatedContent
						},
						success: function(response) {
							console.log("댓글 수정 성공:", response);
							openModal(currentCocktailIndex); // 수정 후 댓글 다시 로드
						},
						error: function(xhr, status, error) {
							console.error("댓글 수정 오류:", error);
						}
					});
				}

				// 댓글 삭제 함수
				function deleteComment(ctIndex, commentIndex) {
					$.ajax({
						type: 'POST',
						url: 'deleteComment_ct', // 삭제할 댓글 삭제를 처리하는 서버 API 주소
						data: {
							ctIndex: ctIndex,
							commentIndex: commentIndex
						},
						success: function(response) {
							console.log("댓글 삭제 성공:", response);
							openModal(currentCocktailIndex); // 삭제 후 댓글 다시 로드
						},
						error: function(xhr, status, error) {
							console.error("댓글 삭제 오류:", error);
						}
					});
				}
			},
		});

		modal.style.display = 'block';
	}

	
	/*ddddddddddddddddddddddddddddddddddd*/
	window.openModal2 = function(cocktailIndex) {
		console.log(cocktailIndex)
		scrollPosition = window.pageYOffset;
		currentCocktailIndex = cocktailIndex;
		const cocktail = cocktailss2[cocktailIndex];
		/*const comments = JSON.parse(localStorage.getItem(`comments-${cocktail.name}`)) || [];*/
		let pick1 = cocktail.index;

		$.ajax({
			type: 'POST',
			url: 'Checkheart',
			data: { num: pick1 },
			success: function(q) {
				const heartImg = document.querySelector('.hImg');
				if (q == 1) {
					heartImg.src = 'images/빨간하트.png';
					heartState = "filled";
				} else {
					heartImg.src = 'images/빈하트.png';
					heartState = 'empty';
				}
			},
		});

		$.ajax({
			type: 'POST',
			url: 'getimg',
			data: { are: poto },
			success: function(ig) {
				userId = ig[0].getid;
				userImg = ig[0].getimg;

				modalContent.innerHTML = `
                    <div class="modal-div-left" id="mc">
                    <span id="like-dislike-span">😊:${good}  😢:${bad}</span>
                        <img src="images/cocktail/${cocktail.name}.png" alt="${cocktail.name}" id="mdImg">
                        <span id="modal-abv">ABV: ${cocktail.ABV}</span>
                        <button class="like-btn"><img class="hImg" src="images/빈하트.png"></button>
                    </div>
                    <div class="modal-div-right">
                        <h3 class="heading mt-2 text-left">${cocktail.name}<br>${cocktail.ename}</h3>
                        <p class="heading mt-2 text-right">${cocktail.description}</p>
                        <p class="heading mt-2 text-right">재료정보<span id="iToC"> ▼</span></p>
                        <textarea class="textbox" readonly>${formatIngredients(cocktail.ing)}</textarea>
                        <p class="heading mt-2 text-right">레시피<span id="iToC"> ▼</span></p>
                        <textarea class="textbox" readonly>${formatIngredients2(cocktail.rsp)}</textarea>
                    </div>
                    <div class="modal-div-center">
                        <div id="div-line-menu"></div>
                        <form id="modal-comment-form">
                                <div id="comment-form-container">
                                    <img src="images/${userImg}" alt="프로필 이미지" id="form-profile-img">
                                    <textarea id="modal-comment-text" placeholder="댓글을 작성해주세요..." required name="comment_text"></textarea>
                                    <input type="hidden" name="cocktailIndex" value="${cocktail.index}">
                                    <button type="button"   onclick="submitComment2()">댓글 작성</button>
                                </div>
                            </form>
                        <div id="comment-div"></div>
                    </div>
                `;

				const likeBtn = modalContent.querySelector('button.like-btn');
				const heartImg = likeBtn.querySelector('.hImg');
				likeBtn.addEventListener('click', function() {
					console.log(heartState);
					if (heartState === 'empty') {
						heartImg.src = 'images/빨간하트.png';
						heartState = 'filled';
						let pick = cocktail.index;
						$.ajax({
							type: 'POST',
							url: 'cocktailheart',
							data: { num: pick },
							success: function(q) {
								console.log("하트누른거", q);
							}
						});
					} else if (heartState === 'filled') {
						heartImg.src = 'images/빈하트.png';
						heartState = 'empty';
						let pick = cocktail.index;
						$.ajax({
							type: 'POST',
							url: 'deleteheart',
							data: { num: pick },
							success: function(q) {
								console.log("취소성공", q);
								$.ajax({
									type: 'POST',
									url: 'MypageCocktail',
									data: { type: type },
									success: function(result) {
										console.log("AJAX 성공:", result);
										updateCocktailss(result);
										$.ajax({
											type: 'POST',
											url: 'Mypagecount',
											data: { type: type },
											success: function(count) {
												console.log("AJAX 성공:", count);
												updatebookmark(count);
											}
										});
									}
								});
							}
						});
					}
				});

				$.ajax({
					type: 'POST',
					url: 'CommentLoad',
					data: { ct_index: cocktail.index },
					success: function(cmt) {
						const commentContent = document.getElementById('comment-div');
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
                                            good += 1;
                                        } else if (result.result === '부정') {
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
							}).catch((error) => {
                            console.error("댓글 처리 중 오류 발생:", error);
                        });

							// 수정 및 삭제 버튼 클릭 이벤트 등록 (이벤트 위임)
							commentContent.addEventListener('click', function(event) {
								const target = event.target;
								if (target.classList.contains('edit')) {
									const commentsBody = target.closest('.comments-body');
									const commentText = commentsBody.querySelector('.comments-text');
									const saveBtn = commentsBody.querySelector('.save');
									const deleteBtn = commentsBody.querySelector('.delete');
									const commentIndex = commentsBody.querySelector('input[name="commentIndex"]').value;
									const ctIndex = document.querySelector('input[name="cocktailIndex"]').value;

									// 수정 가능한 입력 폼으로 변경
									commentText.contentEditable = true;
									commentText.focus();

									// 버튼 상태 변경
									target.style.display = 'none';
									saveBtn.style.display = 'inline-block';

									// 저장 버튼 클릭 이벤트 리스너 등록
									saveBtn.addEventListener('click', function() {
										const updatedContent = commentText.textContent;
										saveComment(ctIndex, commentIndex, updatedContent); // 수정된 내용 저장

										// 버튼 상태 변경 원복
										target.style.display = 'inline-block';
										saveBtn.style.display = 'none';
									});

									// 삭제 버튼 클릭 이벤트 리스너 등록
									deleteBtn.addEventListener('click', function() {
										deleteComment(ctIndex, commentIndex); // 댓글 삭제
									});
								} else if (target.classList.contains('delete')) {
									const commentsBody = target.closest('.comments-body');
									const commentIndex = commentsBody.querySelector('input[name="commentIndex"]').value;
									const ctIndex = document.querySelector('input[name="cocktailIndex"]').value;

									deleteComment(ctIndex, commentIndex); // 댓글 삭제
								}
							});
						}
					},
					error: function(xhr, status, error) {
						console.error("댓글 로드 오류:", error);
					}
				});

				window.submitComment2 = function() {
					const commentText = document.getElementById('modal-comment-text').value;
					const ctIndex = document.querySelector('input[name="cocktailIndex"]').value;

					// AJAX를 통해 댓글 서버로 전송
					$.ajax({
						type: 'POST',
						url: 'comment_up',
						data: {
							comment_text: commentText,
							ctIndex: ctIndex
						},
						success: function(response) {
							console.log("댓글 작성 성공:", response);
							// 댓글 작성 후 댓글 다시 로드
							openModal2(currentCocktailIndex);
						},
						error: function(xhr, status, error) {
							console.error("댓글 작성 오류:", error);
						}
					});
				};// 댓글 저장 함수
				function saveComment(ctIndex, commentIndex, updatedContent) {
					
					$.ajax({
						type: 'POST',
						url: 'updateComment_ct',
						data: {
							ctIndex: ctIndex,
							commentIndex: commentIndex,
							updatedContent: updatedContent
						},
						success: function(response) {
							console.log("댓글 수정 성공:", response);
							openModal2(currentCocktailIndex); // 수정 후 댓글 다시 로드
						},
						error: function(xhr, status, error) {
							console.error("댓글 수정 오류:", error);
						}
					});
				}

				// 댓글 삭제 함수
				function deleteComment(ctIndex, commentIndex) {
					$.ajax({
						type: 'POST',
						url: 'deleteComment_ct', // 삭제할 댓글 삭제를 처리하는 서버 API 주소
						data: {
							ctIndex: ctIndex,
							commentIndex: commentIndex
						},
						success: function(response) {
							console.log("댓글 삭제 성공:", response);
							openModal2(currentCocktailIndex); // 삭제 후 댓글 다시 로드
						},
						error: function(xhr, status, error) {
							console.error("댓글 삭제 오류:", error);
						}
					});
				}
			},
		});

		modal.style.display = 'block';
	}
//dddddddddddddddddddddddddddddddddddddddddddddddddddd
///////
	modalClose.addEventListener('click', closeModal);

	function closeModal() {
		modal.style.display = 'none';
		window.scrollTo(0, scrollPosition);
	}

	window.onclick = function(event) {
		if (event.target === modal) {
			closeModal();
		}
	};

	function formatIngredients(ingredients) {
		if (typeof ingredients === 'string') {
			var a = ingredients.replace(/],/g, '\n');
			var b = a.replace(/\[/g, '');
			return b;
		} else {
			return '실패인가';
		}
	}

	function formatIngredients2(ingredients) {
		if (typeof ingredients === 'string') {
			return ingredients.split('.').join('.\n');
		} else {
			return '실패인가';
		}
	}
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

	
});