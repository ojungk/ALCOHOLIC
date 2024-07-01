$(document).ready(function() {
    var type = "null";
    var ingredientArray = [];
    var cocktails = [];
	
    // 페이지 로드 시 초기 데이터 불러오기
    loadIngredientData(type);
	
    // 탭 클릭 이벤트 핸들러 설정
    $('#v-pills-1-tab').click(function(event) {
        event.preventDefault();
        type = "null";
        loadIngredientData(type);
    });

    $('#v-pills-2-tab').click(function(event) {
        event.preventDefault();
        type = "HIGH ABV";
        loadIngredientData(type);
    });

    $('#v-pills-3-tab').click(function(event) {
        event.preventDefault();
        type = "LOW ABV";
        loadIngredientData(type);
    });

    $('#v-pills-4-tab').click(function(event) {
        event.preventDefault();
        type = "DRINK";
        loadIngredientData(type);
    });

    $('#v-pills-5-tab').click(function(event) {
        event.preventDefault();
        type = "FRUIT";
        loadIngredientData(type);
    });

    $('#v-pills-6-tab').click(function(event) {
        event.preventDefault();
        type = "ETC";
        loadIngredientData(type);
    });

    // 서버에서 데이터를 가져오는 함수
    function loadIngredientData(type) {
        $.ajax({
            type: 'POST',
            url: 'ingredientType',
            data: { type: type },
            success: function(result) {
                console.log("AJAX 성공:", result);
               
                
                updateCocktails(result);
              
                }
          
        });
    }

    // cocktails 배열 업데이트 함수
    function updateCocktails(result) {
        console.log("배열 업데이트 작동");
        cocktails = []; // 기존 배열 비우기
        result.forEach(cocktail => {
            cocktails.push({
                name: cocktail.name,
                ename: cocktail.ename,
                description: cocktail.description,
                type: cocktail.type,
                image: cocktail.img
            });
        });

        console.log("업데이트된 칵테일 목록:", cocktails); // 데이터 확인

        // 여기에서 새로운 데이터로 화면을 업데이트하는 함수 호출
        renderCocktails(cocktails);
        
    }
   function renderCocktails(cocktails) {
        const container = document.getElementById('cocktail-list');
        container.innerHTML = '';
        console.log("포이치작동");

        cocktails.forEach((cocktail, index) => {
          const col = document.createElement('div');
          col.className = 'col-md-3 d-flex ftco-animate';
          col.innerHTML = `<div class="blog-entry align-self-stretch">
              <a href="javascript:void(0)" class="block-20" onclick="openModal(${index})" style="background-image: url('${cocktail.image}');"></a>
              <div class="text py-4 d-block">
                <h3 class="heading mt-2 text-center">${cocktail.name}</h3>
                <h3 class="heading mt-2 text-center">(${cocktail.ename})</h3>
                <p class="description">${cocktail.description}</p>
                <div class="info-container">
                  <p class="price"><span id="degree">TYPE : </span><span>${cocktail.type}</span></p>
                  <p class="btn-open-modal"><a href="#" class="ml-2 btn btn-white btn-outline-white" onclick="openModal(${index})">더보기</a></p>
                </div>
              </div>
            </div>`;
          container.appendChild(col);
        });
        console.log("포이치작동완료");
      }

      renderCocktails(cocktails);
    
      const modal = document.querySelector('.modal');
  const modalContent = document.getElementById('modal-content');
  const modalClose = document.querySelector('.btn-close-modal');
  
  window.openModal = function(cocktailIndex) {
    const cocktail = cocktails[cocktailIndex];
    loadcocktail(cocktail['name']);
     function loadcocktail(name) {
		console.log("에이젝스작동합니다")
        $.ajax({
            type: 'POST',
            url: 'loadingrsp',
            data: { name: name },
            success: function(load) {
                console.log("AJAX 로드성공:", load);
                
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
        <textarea class="textbox" readonly>${generateCocktailList(load)}</textarea>
      </div>
    `;

    modal.style.display = 'block'; // Display the modal
                
      
              
                }
          
        });
    }
	/* coctail.name가져가서 굴려서 이름들표시*/
	
    
  };

  window.closeModal = function() {
    modal.style.display = 'none'; // Hide the modal
  };

  window.onclick = function(event) {
    if (event.target === modal) {
      closeModal(); // Close modal if clicked outside the modal content
    }
  };

  modalClose.addEventListener('click', closeModal);

  // 초기 렌더링 호출
  renderCocktails(cocktails);
    // 화면을 업데이트하는 함수(renderCocktails) 구현은 생략했습니다.
    function generateCocktailList(load) {
		
		var a = load.map((item, index) => `${JSON.stringify(item)}`).join('\n')
		a=a.replace(/"/g, '');
		a=a.replace(/{/g, '');
		a=a.replace(/}/g, '');
		a=a.replace(/name/g, '');
		a=a.replace(/:/g, '');
		
		return a;
    
		
}

});
