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
  constructor: (main_dom,list_dom,audio=null,volume=null)->
    super
    @timerId = 0
    @current_image_idx = 0
    @audio = document.getElementById(audio)
    @change_image()
    @change_volume(volume) unless volume == null

    # audioについて
    # @audio = $("#audio")とすると動かない
    # $("#audio")は、[object Object]を返す
    # document.getElementById("audio")は、[object HTMLAudioElement]を返す

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
    @audio.play() unless @audio == null
    @change_image()

    if @timerId == 0
      @timerId =
        setInterval(=>
          @change_current_image_idx()
          @change_image()
        ,500)

  pause: ->
    @audio.pause() unless @audio == null
    clearInterval(@timerId)
    @timerId = 0

  stop: ->
    @audio.load() unless @audio == null
    @current_image_idx = 0
    @change_image()
    clearInterval(@timerId)
    @timerId = 0

  click_event: (start,pause,stop)->
    $(start).click(=>
      @start()
    )
    $(pause).click(=>
      @pause()
    )
    $(stop).click(=>
      @stop()
    )

  change_volume: (volume)->
    $(volume).change(=>
      @audio.volume = $(volume).val()
    )


$ ->
  new SelectGallery("#main",".thumb")
  slide_gallery = new SlideGallery("#main",".thumb",'audio','#volume')
  slide_gallery.click_event('#button_start','#button_pause','#button_stop')

