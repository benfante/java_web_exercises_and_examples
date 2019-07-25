(function($) {
	"use strict";

	/*
	 * ================================ Preloader
	 * ==================================
	 */

	var preloader = $('#preloader');
	$(window).on('load', function() {
		preloader.fadeOut('slow', function() {
			$(this).remove();
		});
	});

	/*
	 * ================================ sidebar collapsing
	 * ==================================
	 */
	$('.nav-btn').on('click', function() {
		$('.page-container').toggleClass('sbar_collapsed');
	});

	/*
	 * ================================ Start Footer resizer
	 * ==================================
	 */
	var e = function() {
		var e = (window.innerHeight > 0 ? window.innerHeight
				: this.screen.height) - 5;
		(e -= 67) < 1 && (e = 1), e > 67
				&& $(".main-content").css("min-height", e + "px")
	};
	$(window).ready(e), $(window).on("resize", e);

	/*
	 * ================================ sidebar menu
	 * ==================================
	 */
	$("#menu").metisMenu();

	/*
	 * ================================ slimscroll activation
	 * ==================================
	 */
	$('.menu-inner').slimScroll({
		height : 'auto'
	});
	$('.nofity-list').slimScroll({
		height : '435px'
	});
	$('.timeline-area').slimScroll({
		height : '500px'
	});
	$('.recent-activity').slimScroll({
		height : 'calc(100vh - 114px)'
	});
	$('.settings-list').slimScroll({
		height : 'calc(100vh - 158px)'
	});

	/*
	 * ================================ stickey Header
	 * ==================================
	 */
	$(window)
			.on(
					'scroll',
					function() {
						var scroll = $(window).scrollTop(), mainHeader = $('#sticky-header'), mainHeaderHeight = mainHeader
								.innerHeight();

						// console.log(mainHeader.innerHeight());
						if (scroll > 1) {
							$("#sticky-header").addClass("sticky-menu");
						} else {
							$("#sticky-header").removeClass("sticky-menu");
						}
					});

	/*
	 * ================================ form bootstrap validation
	 * ==================================
	 */
	$('[data-toggle="popover"]').popover()

	/*------------- Start form Validation -------------*/
	window.addEventListener('load', function() {
		// Fetch all the forms we want to apply custom Bootstrap validation
		// styles to
		var forms = document.getElementsByClassName('needs-validation');
		// Loop over them and prevent submission
		var validation = Array.prototype.filter.call(forms, function(form) {
			form.addEventListener('submit', function(event) {
				if (form.checkValidity() === false) {
					event.preventDefault();
					event.stopPropagation();
				}
				form.classList.add('was-validated');
			}, false);
		});
	}, false);

	/*
	 * ================================ datatable active
	 * ==================================
	 */
	if ($('#dataTable').length) {
		$('#dataTable').DataTable({
			responsive : true
		});
	}
	if ($('#dataTable2').length) {
		$('#dataTable2').DataTable({
			responsive : true
		});
	}
	if ($('#dataTable3').length) {
		$('#dataTable3').DataTable({
			responsive : true
		});
	}
	if ($('#dataTableAllocations').length) {
		$('#dataTableAllocations thead .filterfield')
				.each(
						function(index) {
							var title = $(this).text();
							$(this)
									.html(
											'<input id=\'filterField'
													+ index
													+ '\' type="text" placeholder=" Filtra... " />');
						});
		let table = $('#dataTableAllocations').DataTable({
			"language" : {
				"search" : "Global search : "
			},
			"autoWidth" : false,
			responsive : true,
			"orderCellsTop" : true,
			"columnDefs" : [ {
				"orderable" : false,
				"targets" : [ 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 ]
			}, {
				"width" : "5%",
				"targets" : [ 2 ]
			} ]
		});
		table.columns().every(function(index) {
			if (index < 4) {
				var that = this;
				$('#filterField' + index).on('keyup change', function() {
					if (that.search() !== this.value) {
						that.search(this.value).draw();
					}
				});
			}
		});
		$('.request-value-cell').each(function() {
			let capacity = Number($(this).data('capacity'));
			let requested = Number($(this).text());
			if (capacity < (requested * 8)) {
				$(this).addClass('table-danger');
			}
			if (capacity == (requested * 8)) {
				$(this).addClass('table-success');
			}
		});
			$(".requested-editable-text").editable('/allocations/updaterequest',
					{callback: function() {
						$('.request-value-cell').each(function(){
							let capacity = Number($(this).data('capacity'));
							let requested = Number($(this).text());
							$(this).removeClass('table-danger');
							$(this).removeClass('table-success');
							if(capacity<(requested*8)) {
								$(this).addClass('table-danger');
							}
							if(capacity==(requested*8)) {
								$(this).addClass('table-success');
							}
						});						
					}});
			$(".approved-editable-text").editable('/allocations/approverequest');
		
	}

	/*
	 * ================================ Slicknav mobile menu
	 * ==================================
	 */
	$('ul#nav_menu').slicknav({
		prependTo : "#mobile_menu"
	});

	/*
	 * ================================ login form
	 * ==================================
	 */
	$('.form-gp input').on('focus', function() {
		$(this).parent('.form-gp').addClass('focused');
	});
	$('.form-gp input').on('focusout', function() {
		if ($(this).val().length === 0) {
			$(this).parent('.form-gp').removeClass('focused');
		}
	});

	/*
	 * ================================ slider-area background setting
	 * ==================================
	 */
	$('.settings-btn, .offset-close').on('click', function() {
		$('.offset-area').toggleClass('show_hide');
		$('.settings-btn').toggleClass('active');
	});

	/*
	 * ================================ Owl Carousel
	 * ==================================
	 */
	function slider_area() {
		var owl = $('.testimonial-carousel').owlCarousel({
			margin : 50,
			loop : true,
			autoplay : false,
			nav : false,
			dots : true,
			responsive : {
				0 : {
					items : 1
				},
				450 : {
					items : 1
				},
				768 : {
					items : 2
				},
				1000 : {
					items : 2
				},
				1360 : {
					items : 1
				},
				1600 : {
					items : 2
				}
			}
		});
	}
	slider_area();

	/*
	 * ================================ Fullscreen Page
	 * ==================================
	 */

	if ($('#full-view').length) {

		var requestFullscreen = function(ele) {
			if (ele.requestFullscreen) {
				ele.requestFullscreen();
			} else if (ele.webkitRequestFullscreen) {
				ele.webkitRequestFullscreen();
			} else if (ele.mozRequestFullScreen) {
				ele.mozRequestFullScreen();
			} else if (ele.msRequestFullscreen) {
				ele.msRequestFullscreen();
			} else {
				console.log('Fullscreen API is not supported.');
			}
		};

		var exitFullscreen = function() {
			if (document.exitFullscreen) {
				document.exitFullscreen();
			} else if (document.webkitExitFullscreen) {
				document.webkitExitFullscreen();
			} else if (document.mozCancelFullScreen) {
				document.mozCancelFullScreen();
			} else if (document.msExitFullscreen) {
				document.msExitFullscreen();
			} else {
				console.log('Fullscreen API is not supported.');
			}
		};

		var fsDocButton = document.getElementById('full-view');
		var fsExitDocButton = document.getElementById('full-view-exit');

		fsDocButton.addEventListener('click', function(e) {
			e.preventDefault();
			requestFullscreen(document.documentElement);
			$('body').addClass('expanded');
		});

		fsExitDocButton.addEventListener('click', function(e) {
			e.preventDefault();
			exitFullscreen();
			$('body').removeClass('expanded');
		});
	}

	/*
	 * ================================ Change of days according to the week and
	 * the year ==================================
	 */

	if ($('form#allocation').length) {
		$('form#allocation select#year').on(
				'change',
				function() {
					var d = new Date();
					let year = Number($('form#allocation select#year').val());
					if (year > d.getFullYear()) {
						$('form#allocation select#week').empty();

						var i = 1;
						do {
							$('form#allocation select#week').append(
									"<option value='" + i + "'> " + i++
											+ " </option>")
						} while (i <= 53);
					}

//					else {
//						$('form#allocation select#week').empty();
//
//						var i = d.getWeek();
//						do {
//							$('form#allocation select#week').append(
//									"<option value='" + i + "'> " + i++
//											+ " </option>")
//						} while (i <= 53);
//					}
				});
	}

	if ($('form#allocation').length) {
		$('form#allocation select#year').on('change', function() {
			let year = Number($('form#allocation select#year').val())
			let week = Number($('form#allocation select#week').val())
			$('form#allocation input#dateInTheWeek').val(year + " " + week);
		});
		$('form#allocation select#week').on('change', function() {
			let year = Number($('form#allocation select#year').val())
			let week = Number($('form#allocation select#week').val())
			$('form#allocation input#dateInTheWeek').val(year + " " + week);
		});
	}

})(jQuery);