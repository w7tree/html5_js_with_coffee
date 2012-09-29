# clock = ->
#   now = new Date()
#   hour = now.getHours()
#   min = now.getMinutes()
#   sec = now.getSeconds()
#
#   setTimeElement = $("#time").html("#{hour}:#{min}:#{sec}")
#
# $ ->
#   clock()

class Clock
  weekArray: ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]

  constructor: ->
    @now = new Date
    @setTime("#time")
    @setDate("#date")
    @reload()

  setDate: (dom)->
    @year = @now.getFullYear()
    @month = @now.getMonth() + 1
    @day = @now.getDate()
    @week = @weekArray[@now.getDay()]
    $(dom).html("#{@year}/#{@month}/#{@day}(#{@week})")

  setTime: (dom)->
    @hour = @now.getHours()
    @hour = "0#{@hour}" if @hour < 10
    @min = @now.getMinutes()
    @min = "0#{@min}" if @min < 10
    @sec = @now.getSeconds()
    @sec = "0#{@sec}" if @sec < 10
    $(dom).html("#{@hour}:#{@min}:#{@sec}")

  reload: ->
    setTimeout("new Clock",1000)

new Clock
