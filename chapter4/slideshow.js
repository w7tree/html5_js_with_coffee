// Generated by CoffeeScript 1.3.3
var SelectGallery;

SelectGallery = (function() {

  function SelectGallery() {
    this.mainDom = null;
    this.listDom = null;
  }

  SelectGallery.prototype.select = function() {
    var listDom, mainDom;
    mainDom = this.mainDom;
    listDom = this.listDom;
    return $(listDom).click(function() {
      var idx;
      idx = $(listDom).index(this);
      $(mainDom).attr("src", this.src);
      $(listDom).removeClass("select");
      return $(this).addClass("select");
    });
  };

  SelectGallery.prototype.start = function() {
    return this.select();
  };

  return SelectGallery;

})();

$(function() {
  var selectgallery;
  selectgallery = new SelectGallery;
  selectgallery.mainDom = "#main";
  selectgallery.listDom = ".thumb";
  return selectgallery.start();
});
