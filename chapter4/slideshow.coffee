class Mixin
  augment: (t) ->
    (t[n] = m unless n == 'augment' or !this[n].prototype?) for n, m of this

class Audio extends Mixin
  audio: (audio) ->
    unless audio == null
      document.getElementById(audio)
    else
      null

  change_volume: (volume) ->
    unless volume == null
      $(volume).change(=>
        @audio.volume = $(volume).val()
      )

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
    Audio::augment @
    @timerId = 0
    @change_speed = 1000
    @current_image_idx = 0
    @change_image()
    @audio = Audio::audio(audio)
    @change_volume(volume)

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
    @change_image()

    if @timerId == 0
      @timerId =
        setInterval(=>
          @change_current_image_idx()
          @change_image()
        ,@change_speed)

  pause: ->
    clearInterval(@timerId)
    @timerId = 0

  stop: ->
    @current_image_idx = 0
    @change_image()
    clearInterval(@timerId)
    @timerId = 0

  click_event: (start,pause,stop)->
    $(start).click(=>
      @start()
      @audio.play() unless @audio == null
    )
    $(pause).click(=>
      @pause()
      @audio.pause() unless @audio == null
    )
    $(stop).click(=>
      @stop()
      @audio.load() unless @audio == null
    )



$ ->
  new SelectGallery("#main",".thumb")
  slide_gallery = new SlideGallery("#main",".thumb",'audio','#volume')
  # slide_gallery = new SlideGallery("#main",".thumb") #audio,volumeのnullテスト用
  slide_gallery.click_event('#button_start','#button_pause','#button_stop')
  # slide_gallery.change_speed = 100
