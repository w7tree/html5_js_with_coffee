class Drawer
  constructor: (canvas_id,line_color="#333",fill_color="#fff")->
    canvas = document.getElementById(canvas_id)
    @context = canvas.getContext("2d")
    @lineColor(line_color)
    @fillColor(fill_color)

  lineColor: (color) ->
    @context.strokeStyle = color

  fillColor: (color) ->
    @context.fillStyle = color


drawRect = ()->
  drawer1 = new Drawer('main','#f00')
  drawer1.context.strokeRect(50,50,100,180)

  drawer2 = new Drawer('main','#00f','#00f')
  drawer2.context.fillRect(200,50,100,180)

drawLine = () ->
  drawer = new Drawer('main','#880')
  drawer.context.beginPath()
  drawer.context.moveTo(350,50)
  drawer.context.lineTo(600,150)
  drawer.context.lineTo(400,200)
  drawer.context.closePath()
  drawer.context.stroke()


drawCircle = () ->
  drawer1 = new Drawer('main','#088')
  drawer1.context.beginPath()
  drawer1.context.arc(200,350,80,0,2*Math.PI,false)
  drawer1.context.stroke()

  drawer2 = new Drawer('main','#000','#00f')
  drawer2.context.beginPath()
  drawer2.context.moveTo(450,350)
  drawer2.context.arc(450,350,80,0,2*Math.PI*(120/360),false)
  drawer2.context.fill()

$ ->
  $('#draw_rect').click(->
    drawRect()
  )
  $('#draw_line').click(->
    drawLine()
  )
  $('#draw_circle').click(->
    drawCircle()
  )
