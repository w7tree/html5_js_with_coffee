class Drawer
  constructor: (canvas_id,line_color="#333",fill_color="#fff")->
    canvas = document.getElementById(canvas_id)
    @context = canvas.getContext("2d")
    @_lineColor(line_color)
    @_fillColor(fill_color)

  beginPath: ()->
    @context.beginPath()

  closePath: ()->
    @context.closePath()

  moveTo: (x,y)->
    @context.moveTo(x,y)

  stroke: ()->
    @context.stroke()

  fill: ()->
    @context.fill()

  _lineColor: (color) ->
    @context.strokeStyle = color

  _fillColor: (color) ->
    @context.fillStyle = color


class DrawRect extends Drawer
  strokeRect: (x,y,w,h)->
    @context.strokeRect(x,y,w,h)

  fillRect: (x,y,w,h)->
    @context.fillRect(x,y,w,h)

class DrawLine extends Drawer
  lineTo: (x,y)->
    @context.lineTo(x,y)

class DrawCircle extends Drawer
  arc: (x,y,radius,start_angle,end_angle,anticlockwise=false)->
    _end_angle = 2 * Math.PI * (end_angle / 360)
    @context.arc(x,y,radius,start_angle,_end_angle,anticlockwise)


drawRect1 = ()->
  drawer = new DrawRect('main','#f00')
  drawer.strokeRect(50,50,100,180)

drawRect2 = ()->
  drawer = new DrawRect('main','#00f','#00f')
  drawer.fillRect(200,50,100,180)

drawLine = () ->
  drawer = new DrawLine('main','#880')
  drawer.beginPath()
  drawer.moveTo(350,50)
  drawer.lineTo(600,150)
  drawer.lineTo(400,200)
  drawer.closePath()
  drawer.stroke()

drawCircle1 = () ->
  drawer = new DrawCircle('main','#088')
  drawer.beginPath()
  drawer.arc(200,350,80,0,360)
  drawer.stroke()

drawCircle2 = () ->
  drawer = new DrawCircle('main','#000','#00f')
  drawer.beginPath()
  drawer.moveTo(450,350)
  drawer.arc(450,350,80,0,180,false)
  drawer.fill()


$ ->
  $('#draw_rect').click(->
    drawRect1()
    drawRect2()
  )
  $('#draw_line').click(->
    drawLine()
  )
  $('#draw_circle').click(->
    drawCircle1()
    drawCircle2()
  )
