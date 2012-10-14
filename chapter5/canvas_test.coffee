drawRect = ()->
  # $('#main')ではなぜか動かない。
  # document.getElementById("main")と書く必要あり
  canvas = document.getElementById("main")
  context = canvas.getContext("2d")

  context.strokeStyle = "red"

  # strokeRect(x,y,w,h)
  context.strokeRect(50,50,100,180)

  context.fillStyle = "blue"

  context.fillRect(200,50,100,180)

drawLine = () ->
  canvas = document.getElementById("main")
  context = canvas.getContext("2d")

  context.strokeStyle = "#f00"

  context.beginPath()

  context.moveTo(350,50) #始点の移動

  context.lineTo(600,150) #線の作成

  context.lineTo(400,200)

  context.closePath()

  #パスの描画:このメソッドを呼ぶまでは描画されない(表示されない)
  context.stroke()


drawCircle = () ->
  canvas = document.getElementById("main")
  context = canvas.getContext("2d")

  context.strokeStyle = "red"

  context.beginPath()

  # context.arc(x,y,radius(半径),startAngle,endAngle,anticlockwise)
  # x,y = 中心座標
  # anticlockwise: true = 反時計回り, false = 時計回り
  context.arc(200,350,80,0,2*Math.PI,false)
  context.stroke()

  context.fillStyle = "#00f"
  context.beginPath()
  context.moveTo(450,350)
  context.arc(450,350,80,0,2*Math.PI*(120/360),false)
  context.fill()

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
