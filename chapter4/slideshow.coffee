class Gallery
  constructor: (main_dom,list_dom)->
    @main_dom = main_dom
    @list_dom = list_dom


class SelectGallery extends Gallery
  constructor: (main_dom,list_dom)->
    super
    @select()

  select: ->
    main_dom = @main_dom
    list_dom = @list_dom
    $(list_dom).click(->
      idx = $(list_dom).index(@)
      $(main_dom).attr("src",@.src)
      $(list_dom).removeClass("select")
      $(@).addClass("select")
    )


class SlideGallery extends Gallery
  constructor: (main_dom,list_dom)->
    super
    @timerId = 0
    @current_image_idx = 0
    @change_image()
    @click_event()

  change_current_image_idx: ->
    @current_image_idx += 1
    @current_image_idx = 0  if $(@list_dom).length == @current_image_idx

  change_image: ()->
    select_img = $(@list_dom)[@current_image_idx]
    @change_main_image(select_img)
    @change_list_image(select_img)

  change_main_image: (select_img)->
    $(@main_dom).attr("src",select_img.src)

  change_list_image: (select_img)->
    $(@list_dom).removeClass("select")
    $(select_img).addClass("select")

  start: ->
    @change_image()

    if @timerId == 0
      @timerId =
        setInterval(=>
          @change_current_image_idx()
          @change_image()
        ,500)

  pause: ->
    clearInterval(@timerId)
    @timerId = 0

  stop: ->
    @current_image_idx = 0
    @change_image()
    clearInterval(@timerId)
    @timerId = 0

  click_event: ->
    $('#button_start').click(=>
      @start()
    )
    $('#button_pause').click(=>
      @pause()
    )
    $('#button_stop').click(=>
      @stop()
    )


$ ->
  new SelectGallery("#main",".thumb")
  new SlideGallery("#main",".thumb")

  # $('#button_start').click(->
  #   slide_gallery.start()
  # )
  # $('#button_pause').click(->
  #   slide_gallery.pause()
  # )
  # $('#button_stop').click(->
  #   slide_gallery.stop()
  # )
