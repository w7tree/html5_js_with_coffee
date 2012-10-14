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

