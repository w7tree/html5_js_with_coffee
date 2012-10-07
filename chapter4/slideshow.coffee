class SelectGallery
  constructor: (main_dom,list_dom)->
    @main_dom = main_dom
    @list_dom = list_dom
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

$ ->
  selectgallery = new SelectGallery("#main",".thumb")
