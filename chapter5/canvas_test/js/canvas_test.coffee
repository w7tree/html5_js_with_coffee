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
