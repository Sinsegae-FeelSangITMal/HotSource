$(() => {
	const currentPath = window.location.pathname;	//	현재 URL을 불러옴

	// 헤더 중앙 버튼 (home, image, sound, sale) 클릭 시 class에 active 활성화 (css 적용을 위함ㅁ)
	$('.menu-list .my-link').each(function () {
		if (this.getAttribute('href') === currentPath) {
			$('.menu-list .my-item').removeClass('active');
			$(this).parent('.my-item').addClass('active');
		}
	});
});