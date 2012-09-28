value = 0;

getSliderValue = ->
  value = $("#slider").val()

$ ->
  $("#create").click(->
    getSliderValue()
    alert("slider value is #{value}")
  )
