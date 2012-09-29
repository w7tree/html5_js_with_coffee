class Mixin
  augment: (t) ->
    (t[n] = m unless n == 'augment' or !this[n].prototype?) for n, m of this

class Validation extends Mixin
  _validNumber: (value)->
    if isNaN(value)
      @error_messages.push("#{value}には数字を入力してください")
      @error += 1

  _validSeisu: (value)->
    if value <= 0
      @error_messages.push("0以上の数字を入力してください")
      @error += 1

class Exchanger
  constructor: (currency)->
    Validation::augment @
    @currency = currency
    @rate = null
    @inMoney = null
    @result = null
    @error = 0
    @error_messages = []

  _validate: ->
    @_validNumber(@inMoney)
    @_validNumber(@rate)
    @_validSeisu(@inMoney)
    @_validSeisu(@rate)

  setRate: (dom)->
    @rate = $(dom).val()

  setInMoney: (dom)->
    @inMoney = $(dom).val()

  setOutMoney: (dom)->
    $(dom).html(@result)

  _isValid: ->
    @error == 0

  _calc: (dom)->
    result = @inMoney * @rate
    result = Math.round(result * 100) / 100
    @result = "#{result} #{@currency}"
    @setOutMoney(dom)

  _sayError: (dom)->
    for i in [0...@error_messages.length]
      alert @error_messages[i]
    @error = 0
    @result = "----"
    @setOutMoney(dom)

  exchange: (dom)->
    @_validate()
    if @_isValid() then @_calc(dom) else @_sayError(dom)


class FromExchanger extends Exchanger
  _calc: (dom)->
    result = @inMoney / @rate
    result = Math.round(result * 100) / 100
    @result = "#{result} #{@currency}"
    @setOutMoney(dom)

$ ->
  $('#toYen').click(->
    toYen = new Exchanger("円")
    toYen.setRate('#rate')
    toYen.setInMoney('#inMoney')
    toYen.exchange('#outMoney')
  )
  $('#fromYen').click(->
    toYen = new FromExchanger("ドル")
    toYen.setRate('#rate')
    toYen.setInMoney('#inMoney')
    toYen.exchange('#outMoney')
  )

  $('#zero').click(->
    $('#rate').val(0)
  )

  $('#hyaku').click(->
    $('#rate').val(100)
  )
