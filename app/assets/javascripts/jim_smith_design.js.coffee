$ ->

	# # # # # # # # # # # # #
	#	Navigation Functions  #
	# # # # # # # # # # # # #

	if $(window).scrollTop() is 0
	  $("#main-nav").removeClass "scrolled"
	else
	  $("#main-nav").addClass "scrolled"

	$(window).scroll ->
	  if $(window).scrollTop() is 0
	    $("#main-nav").removeClass "scrolled"
	  else
	    $("#main-nav").addClass "scrolled"
	  return


	# # # # # # # # # # #
	#	Header Functions  #
	# # # # # # # # # # #

	$(".imac-screen").flexslider
	  prevText: "<i class=\"fa fa-angle-left\"></i>"
	  nextText: "<i class=\"fa fa-angle-right\"></i>"
	  animation: "slide"
	  slideshowSpeed: 3000
	  useCSS: true
	  controlNav: false
	  directionNav: false
	  pauseOnAction: false
	  pauseOnHover: false
	  smoothHeight: false

	$("#home .text-col h1").fitText 0.9,
	  minFontSize: "38px"
	  maxFontSize: "63px"

	$("#home .text-col p").fitText 1.2,
	  minFontSize: "18px"
	  maxFontSize: "32px"

	$(".imac-screen img").load ->
	  $("#home .text-col h1, #home .text-col p, #home .imac-frame").addClass "in"


	# # # # # # # # # # #
	#	Skills Functions  #
	# # # # # # # # # # #

	color = $("#home").css("backgroundColor")
	$(".skills").waypoint (->
	  $(".chart").each ->
	    $(@).easyPieChart
	      size: 140
	      animate: 2000
	      lineCap: "butt"
	      scaleColor: false
	      barColor: color
	      trackColor: "transparent"
	      lineWidth: 10
	),
	  offset: "80%"


	# # # # # # # # # # # # # # #
	#	Project thumbs - Masonry  #
	# # # # # # # # # # # # # # #

	$(window).load ->
	  $("#projects-container").css visibility: "visible"
	  $("#projects-container").masonry
	    itemSelector: ".project-item:not(.filtered)"
	    columnWidth: 320
	    isFitWidth: true
	    isResizable: true
	    isAnimated: not Modernizr.csstransitions
	    gutterWidth: 25

	  scrollSpyRefresh()
	  waypointsRefresh()


	# # # # # # # # # #
	#	Filter Projects #
	# # # # # # # # # #

	$("#filter-works a").click (e) ->
	  e.preventDefault()
	  $("#filter-works li").removeClass "active"
	  $(@).parent("li").addClass "active"
	  category = $(@).attr("data-filter")
	  $(".project-item").each ->
	    if $(@).is(category)
	      $(@).removeClass "filtered"
	    else
	      $(@).addClass "filtered"
	    $("#projects-container").masonry "reload"

	  scrollSpyRefresh()
	  waypointsRefresh()


	# # # # # # # # # #
	#	Project Preview #
	# # # # # # # # # #

	$(".project-item").click (e) ->
	  e.preventDefault()
	  elem = $(@)
	  title = elem.find(".project-title").text()
	  descr = elem.find(".project-description").html()
	  slidesHtml = "<ul class=\"slides\">"
	  elemDataCont = elem.find(".project-description")
	  slides = elem.find(".project-description").data("images").split(",")
	  i = 0

	  while i < slides.length
	    slidesHtml = slidesHtml + "<li><img src=" + slides[i] + " alt=\"\"></li>"
	    ++i
	  slidesHtml = slidesHtml + "</ul>"
	  $("#project-modal").on("show.bs.modal", ->
	    $(@).find("#hdr-title").text title
	    $(@).find("#sdbr-title").text title
	    $(@).find("#project-content").html descr
	    $(@).find(".screen").addClass("flexslider").html slidesHtml
	    if elemDataCont.data("category")
	      $(@).find("#sdbr-category").show().text elemDataCont.data("category")
	    else
	      $(@).find("#sdbr-category").hide()
	    if elemDataCont.data("date")
	      $(@).find("#sdbr-date").show().text elemDataCont.data("date")
	    else
	      $(@).find("#sdbr-date").hide()
	    if elemDataCont.data("client")
	      $(@).find("#sdbr-client").show().text elemDataCont.data("client")
	    else
	      $(@).find("#sdbr-client").hide()
	    if elemDataCont.data("link")
	      extLink = elemDataCont.data("link").split(",")
	      $(@).find("#sdbr-link").show().find("a").text(extLink[0]).attr "href", extLink[1]
	    else
	      $(@).find("#sdbr-link").hide()
	    if elemDataCont.data("descr")
	      $(@).find("#sdbr-descr").show().text elemDataCont.data("descr")
	    else
	      $(@).find("#sdbr-descr").hide()
	    setTimeout (->
	      $(".screen.flexslider").flexslider
	        prevText: "<i class=\"fa fa-angle-left\"></i>"
	        nextText: "<i class=\"fa fa-angle-right\"></i>"
	        slideshowSpeed: 3000
	        animation: "slide"
	        controlNav: false
	        pauseOnAction: false
	        pauseOnHover: true
	        start: ->
	          $("#project-modal .screen").addClass("done").prev(".loader").fadeOut()

	    ), 1000
	  ).modal backdrop: false

	$("#project-modal").on "hidden.bs.modal", ->
	  $(@).find(".loader").show()
	  $(@).find(".screen").removeClass("flexslider").removeClass("done").html("").flexslider "destroy"


	# # # # # # # # # #
	#	ScrollTo Links  #
	# # # # # # # # # #

	$("a.scrollto").click (e) ->
	  $("html,body").scrollTo @hash, @hash,
	    gap:
	      y: -50

	    animation:
	      easing: "easeInOutCubic"
	      duration: 1600

	  e.preventDefault()

		if $(".navbar-collapse").hasClass("in")
	  	$(".navbar-collapse").removeClass("in").addClass "collapse"


	# # # # # # # # #
	#	Contact Form  #
	# # # # # # # # #

	$(".label_better").label_better
	  easing: "bounce"
	  offset: 5


	# # # # # # #
	#	Tooltips  #
	# # # # # # #

	$("[data-toggle='tooltip']").tooltip()


	# # # # # # # # # # # # #
	#	Placeholder Detection #
	# # # # # # # # # # # # #

	unless Modernizr.input.placeholder
		$("#contact-form").addClass "no-placeholder"


	# # # # # # # # # # # # #
	#	Scrolling Animations  #
	# # # # # # # # # # # # #

	$(".scrollimation").waypoint (->
	  $(@).addClass "in"
	),
	  offset: ->
	    h = $(window).height()
	    elemh = $(@).outerHeight()
	    if elemh > h * 0.3
	      h * 0.7
	    else
	      h - elemh


	# # # # # # # # # # #
	#	Resize Functions  #
	# # # # # # # # # # #

	$(window).resize ->
	  scrollSpyRefresh()
	  waypointsRefresh()


	# # # # # # # # # # # # # # # #
	#	Refresh scrollSpy function  #
	# # # # # # # # # # # # # # # #

	scrollSpyRefresh = ->
	  setTimeout (->
	    $("body").scrollspy "refresh"
	  ), 1000


	# # # # # # # # # # # # # # # #
	#	Refresh waypoints function  #
	# # # # # # # # # # # # # # # #

	waypointsRefresh = ->
	  setTimeout (->
	    $.waypoints "refresh"
	  ), 1000
