class SelectGallery
  constructor: ->
    @mainDom = null
    @listDom = null

  select: ->
    mainDom = @mainDom
    listDom = @listDom
    $(listDom).click(->
      idx = $(listDom).index(@)
      $(mainDom).attr("src",@.src)
      $(listDom).removeClass("select")
      $(@).addClass("select")
    )

  start: ->
    @select()


$ ->
  selectgallery = new SelectGallery
  selectgallery.mainDom = "#main"
  selectgallery.listDom = ".thumb"
  selectgallery.start()
