// Generated by CoffeeScript 1.3.3
var drawCircle1, drawCircle2, drawLine, drawRect1, drawRect2;

drawRect1 = function() {
  var drawer;
  drawer = new DrawRect('main', '#f00');
  return drawer.strokeRect(50, 50, 100, 180);
};

drawRect2 = function() {
  var drawer;
  drawer = new DrawRect('main', '#00f', '#00f');
  return drawer.fillRect(200, 50, 100, 180);
};

drawLine = function() {
  var drawer;
  drawer = new DrawLine('main', '#880');
  drawer.beginPath();
  drawer.moveTo(350, 50);
  drawer.lineTo(600, 150);
  drawer.lineTo(400, 200);
  drawer.closePath();
  return drawer.stroke();
};

drawCircle1 = function() {
  var drawer;
  drawer = new DrawCircle('main', '#088');
  drawer.beginPath();
  drawer.arc(200, 350, 80, 0, 360);
  return drawer.stroke();
};

drawCircle2 = function() {
  var drawer;
  drawer = new DrawCircle('main', '#000', '#00f');
  drawer.beginPath();
  drawer.moveTo(450, 350);
  drawer.arc(450, 350, 80, 0, 180, false);
  return drawer.fill();
};

$(function() {
  $('#draw_rect').click(function() {
    drawRect1();
    return drawRect2();
  });
  $('#draw_line').click(function() {
    return drawLine();
  });
  return $('#draw_circle').click(function() {
    drawCircle1();
    return drawCircle2();
  });
});