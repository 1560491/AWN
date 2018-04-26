$(document).ready(function() {





	$("#showmenu-mobile").click(function(){
		if($("#menu-mobile-display").hasClass('menu-mobile'))
		{
			$("#menu-mobile-display").removeClass('menu-mobile');
			$("#menu-mobile-display").addClass('menu-mobile-active');
			$('#OpacityPage').addClass('OP');
		}
		else
		{
			$("#menu-mobile-display").removeClass('menu-mobile');
			$("#menu-mobile-display").addClass('menu-mobile-active'); 
			$('#OpacityPage').addClass('OP');

		}
	});

	$("#close-menu").click(function(){
		$("#menu-mobile-display").removeClass('menu-mobile-active');
		$("#menu-mobile-display").addClass('menu-mobile');
		$('#OpacityPage').removeClass('OP');
	});


	$(document).mouseup(function (e)
						{
		var container = $("#menu-mobile-display");

		if (!container.is(e.target) // if the target of the click isn't the container...
			&& container.has(e.target).length === 0) // ... nor a descendant of the container
		{
			container.hide();
			$("#menu-mobile-display").removeClass('menu-mobile-active');
			$("#menu-mobile-display").addClass('menu-mobile');
			$('#OpacityPage').removeClass('OP');
		}

	});

	
$(document).ready(function() {
	$('#slide_banner').owlCarousel({
		items : 1, //10 items above 1000px browser width
		itemsDesktop : [1024,1], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,1], // 3 items betweem 900px and 601px
		itemsTablet: [600,1], //2 items between 600 and 0;
		itemsMobile : [320,1],
		navigation : false,
		navigationText : false,
		slideSpeed : 300,
		autoPlay: true, 
		pagination : true, 
		afterMove: function (elem) {
			var current = this.currentItem;
			var src = elem.find(".owl-item").eq(current).find("img").attr('src');
			if (src.indexOf('slide1') >= 0){
				$(".slideshow_full_width").removeClass('slide2_bgcolor');
				$(".slideshow_full_width").removeClass('slide3_bgcolor');
				$(".slideshow_full_width").removeClass('slide4_bgcolor');
				$(".slideshow_full_width").removeClass('slide5_bgcolor');
				$(".slideshow_full_width").addClass('slide1_bgcolor');
			} else if (src.indexOf('slide2') >= 0){
				$(".slideshow_full_width").removeClass('slide1_bgcolor');
				$(".slideshow_full_width").removeClass('slide3_bgcolor');
				$(".slideshow_full_width").removeClass('slide4_bgcolor');
				$(".slideshow_full_width").removeClass('slide5_bgcolor');
				$(".slideshow_full_width").addClass('slide2_bgcolor');
			}else if (src.indexOf('slide3') >= 0){
				$(".slideshow_full_width").removeClass('slide1_bgcolor');
				$(".slideshow_full_width").removeClass('slide2_bgcolor');
				$(".slideshow_full_width").removeClass('slide4_bgcolor');
				$(".slideshow_full_width").removeClass('slide5_bgcolor');
				$(".slideshow_full_width").addClass('slide3_bgcolor');
			}else if (src.indexOf('slide4') >= 0){
				$(".slideshow_full_width").removeClass('slide1_bgcolor');
				$(".slideshow_full_width").removeClass('slide2_bgcolor');
				$(".slideshow_full_width").removeClass('slide3_bgcolor');
				$(".slideshow_full_width").removeClass('slide5_bgcolor');
				$(".slideshow_full_width").addClass('slide4_bgcolor');
			}else if (src.indexOf('slide5') >= 0){
				$(".slideshow_full_width").removeClass('slide1_bgcolor');
				$(".slideshow_full_width").removeClass('slide3_bgcolor');
				$(".slideshow_full_width").removeClass('slide4_bgcolor');
				$(".slideshow_full_width").removeClass('slide2_bgcolor');
				$(".slideshow_full_width").addClass('slide5_bgcolor');
			}
		}
	});	
});
	
	
	


	

	/* For menu limit display and menu collection mobile */

	$('div#ct-show').each(function(){

		var LiN = $(this).find('li').length;

		if( LiN > 3){    
			$('li', this).eq(2).nextAll().hide().addClass('toggleable');
			$(this).append('<li class="more nav-item fix-col-all disable_bacground"><h2 class="item_bl"><a>Xem thêm</a></li></h2>');    
		}

	});


	$('div#ct-show').on('click','.more', function(){

		if( $(this).hasClass('less') ){    
			$(this).html('<h2 class="item_bl"><a>Xem thêm</a></h2>').removeClass('less');    
		}else{
			$(this).html('<h2 class="item_bl"><a class="nav-item fix-col-all disable_bacground">Thu gọn</></h2>').addClass('less'); 
		}

		$(this).siblings('li.toggleable').slideToggle();

	}); 


	/*Scroll menu main mobile*/

	$(function () {

		//Adjust element dimensions on resize event
		$(window).on('resize', function () {
			$('.menu-mobile .content-menu').css('max-height', $(this).height() + "px");
			$('.menu-mobile .content-menu').css("overflow", "scroll", "background", "#f7f8f9");
			$('.menu-mobile .content-menu').css("-webkit-overflow-scrolling", "touch");
		});
		//Trigger the event
		$(window).trigger('resize');
	});


	/* For button search */
	$('.btnsearch').before('<span class="search-before"></span>');

	/*Check price sale if 0% */
	$( ".onsale:contains('-0%')" ).html( "-1%" );
	$( ".onsale:contains('-100%')" ).html( "-99%" );
	$( ".on_sale > span.price_sale:contains('-0%')" ).html( "-1%" );
	$( ".on_sale > span.price_sale:contains('-100%')" ).html( "-99%" );
	
	
	
	
	
	/*FOr toggle footer mobile*/
	$('#toogle_click h5.widget-title').click(function(){
		$(this).next('ul').slideToggle();
		$(this).find('i').toggleClass('fa-angle-down fa-angle-right')
	});
	/**/




	jQuery(".topnavmobile").accordion({
		accordion:false,
		speed: 300,
		closedSign: '<i class="fa fa-angle-right" aria-hidden="true"></i>',
		openedSign: '<i class="fa fa-angle-up" aria-hidden="true"></i>'
	});


	$("#myTab li").click(function () {
		$('.box').hide().eq($(this).index()).show();
	});


	$('#danhmuc_tintuc').click(function() {
		$('#menu_danhmuc_tintuc').slideToggle('300');
		return false;
	});



	$('#click_show_list_boloc').click(function() {
		$('#show_list_boloc').show();
		return false;
	});
	$('#off-show-all-collection').click(function() {
		$('#ct-show').slideToggle();
		return false;
	});

	$('#show_boloc_mb').click(function() {
		$('#collection_boloc').show();
		$('#main_boloc_mobile').hide();
		return false;
	});


	$('#back_boloc').click(function() {
		$('#collection_boloc').hide();
		$('#main_boloc_mobile').show();
		return false;
	});

	/*JS Bình luận số lượng ký tự*/
	$('#limit_text').text('Bình luận tối đa 500 ký tự');
	$('#comment').keyup(function () {
		var max = 500;
		var len = $(this).val().length;
		if (len >= max) {
			$('#limit_text').text(' Bạn đã hết số ký tự cho phép bình luận');
		} else {
			var ch = max - len;
			$('#limit_text').text('Bạn còn ' + ch + ' ký tự');
		}
	});



	/*CHECK TEXT BOX NULL OR*/
	/*For login Form */
	$(window).load(function(){
		/*Time limit display text*/
		setTimeout(function(){ $('.form-error').fadeOut() }, 2000);
		setTimeout(function(){ $('#errorFill').fadeOut() }, 5000);
	});
	function hasHtml5Validation () {
		return typeof document.createElement('input').checkValidity === 'function';
	}

	if (hasHtml5Validation()) {
		$('#customer_login').submit(function (e) {
			if (!this.checkValidity()) {
				e.preventDefault();
				$(this).addClass('invalid');
				$('#errorFill').html('Đăng nhập thất bại, kiểm tra lại thông tin đăng nhập');
			} else {
				$(this).removeClass('invalid');
				$('#errorFill').html('Đang kiểm tra tài khoản');
			}
		});
	}

	/* Reset Pass*/



	/**/


	// JS Noti Login - Register - Recover ///

	//$("#demo").fadeOut(3000);

	//Brand thuong hieu //
	$('#owl-brand').owlCarousel({
		items : 6, //10 items above 1000px browser width
		itemsDesktop : [1024,6], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,4], // 3 items betweem 900px and 601px
		itemsTablet: [600,3], //2 items between 600 and 0;
		itemsMobile : [320,1],
		navigation : false,
		navigationText : false,
		slideSpeed : 500,
		pagination : false
	});



	/*Best sale	*/

	$("#upsell-products-slider").owlCarousel({

		items : 5, //10 items above 1000px browser width
		itemsDesktop : [1024,5], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
		itemsTablet: [600,2], //2 items between 600 and 0;
		itemsMobile : [320,2],
		navigation : false,
		navigationText : false,
		slideSpeed : 500,
		pagination : false,
		dots: false,
		margin: 0,

	});



});

/*For nav tab index responsive tab to next slide on mobile*/
(function($) {

	'use strict';

	$(document).on('show.bs.tab', '.nav-tabs-responsive [data-toggle="tab"]', function(e) {
		var $target = $(e.target);
		var $tabs = $target.closest('.nav-tabs-responsive');
		var $current = $target.closest('li');
		var $parent = $current.closest('li.dropdown');
		$current = $parent.length > 0 ? $parent : $current;
		var $next = $current.next();
		var $prev = $current.prev();
		var updateDropdownMenu = function($el, position){
			$el
				.find('.dropdown-menu')
				.removeClass('pull-xs-left pull-xs-center pull-xs-right')
				.addClass( 'pull-xs-' + position );
		};

		$tabs.find('>li').removeClass('next prev');
		$prev.addClass('prev');
		$next.addClass('next');

		updateDropdownMenu( $prev, 'left' );
		updateDropdownMenu( $current, 'center' );
		updateDropdownMenu( $next, 'right' );
	});

});


/*Check*/
$(document).ready(function() {	

	function valid(o,w){
		o.value = o.value.replace(valid.r[w],'');
	}
	valid.r={
		'numbers':/[^\d]/g
	}
});