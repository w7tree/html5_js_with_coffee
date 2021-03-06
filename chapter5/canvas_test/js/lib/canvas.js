// Generated by CoffeeScript 1.3.3
var DrawCircle, DrawLine, DrawRect, Drawer,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Drawer = (function() {

  function Drawer(canvas_id, line_color, fill_color) {
    var canvas;
    if (line_color == null) {
      line_color = "#333";
    }
    if (fill_color == null) {
      fill_color = "#fff";
    }
    canvas = document.getElementById(canvas_id);
    this.context = canvas.getContext("2d");
    this._lineColor(line_color);
    this._fillColor(fill_color);
  }

  Drawer.prototype.beginPath = function() {
    return this.context.beginPath();
  };

  Drawer.prototype.closePath = function() {
    return this.context.closePath();
  };

  Drawer.prototype.moveTo = function(x, y) {
    return this.context.moveTo(x, y);
  };

  Drawer.prototype.stroke = function() {
    return this.context.stroke();
  };

  Drawer.prototype.fill = function() {
    return this.context.fill();
  };

  Drawer.prototype._lineColor = function(color) {
    return this.context.strokeStyle = color;
  };

  Drawer.prototype._fillColor = function(color) {
    return this.context.fillStyle = color;
  };

  return Drawer;

})();

DrawRect = (function(_super) {

  __extends(DrawRect, _super);

  function DrawRect() {
    return DrawRect.__super__.constructor.apply(this, arguments);
  }

  DrawRect.prototype.strokeRect = function(x, y, w, h) {
    return this.context.strokeRect(x, y, w, h);
  };

  DrawRect.prototype.fillRect = function(x, y, w, h) {
    return this.context.fillRect(x, y, w, h);
  };

  return DrawRect;

})(Drawer);

DrawLine = (function(_super) {

  __extends(DrawLine, _super);

  function DrawLine() {
    return DrawLine.__super__.constructor.apply(this, arguments);
  }

  DrawLine.prototype.lineTo = function(x, y) {
    return this.context.lineTo(x, y);
  };

  return DrawLine;

})(Drawer);

DrawCircle = (function(_super) {

  __extends(DrawCircle, _super);

  function DrawCircle() {
    return DrawCircle.__super__.constructor.apply(this, arguments);
  }

  DrawCircle.prototype.arc = function(x, y, radius, start_angle, end_angle, anticlockwise) {
    var _end_angle;
    if (anticlockwise == null) {
      anticlockwise = false;
    }
    _end_angle = 2 * Math.PI * (end_angle / 360);
    return this.context.arc(x, y, radius, start_angle, _end_angle, anticlockwise);
  };

  return DrawCircle;

})(Drawer);
