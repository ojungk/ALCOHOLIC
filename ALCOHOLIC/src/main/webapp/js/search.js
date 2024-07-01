	// 검색 기능 활성화 버튼
document.addEventListener('DOMContentLoaded', function () {
    // 엔터키
    document.getElementById('searchQuery3').addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
			event.preventDefault();
            search();
        }
    });

    // 클릭
    document.querySelector('.btn-search').addEventListener('click', function () {
        search();
    });
});

function search() {
    var searchQuery = document.getElementById('searchQuery3').value;
    if (searchQuery.trim() !== "") {
        // 검색어가 입력된 경우
        fetch('searchService', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: 'query=' + encodeURIComponent(searchQuery)
        })
        .then(response => response.json())
        .then(data => {
            if (data.resultsExist) {
                // 검색 결과가 있는 경우
                window.location.href = 'searchNotNull.jsp';
            } else {
                // 검색 결과가 없는 경우
                window.location.href = 'searchNothing.jsp';
            }
        })
        .catch(error => console.error('Error:', error));
        console.log("서치서비스 연결 실패");
    } else {
        alert('검색어를 입력하세요.');
    }
}