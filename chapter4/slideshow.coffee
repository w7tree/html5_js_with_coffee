class SelectGallery
  constructor: (imgArray) ->
    @imgArray = imgArray
    @mainDom = null
    @listDom = null

  select: ->
    imgArray = @imgArray
    mainDom = @mainDom
    listDom = @listDom
    $(listDom).click(->
      idx = $(listDom).index(@)
      $(mainDom).attr("src",imgArray[idx])
      $(listDom).removeClass("select")
      $(@).addClass("select")
    )

  start: ->
    @select()


$ ->
  imgArray = [
    "img/sample0.jpg",
    "img/sample1.jpg",
    "img/sample2.jpg",
    "img/sample3.jpg",
    "img/sample4.jpg"
  ]

  selectgallery = new SelectGallery(imgArray)
  selectgallery.mainDom = "#main"
  selectgallery.listDom = ".thumb"
  selectgallery.start()
