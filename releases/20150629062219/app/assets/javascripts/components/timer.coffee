class window.Timer
  constructor: (el) ->
    @el = $ el
#    console.log(@el)
    @secondsLeft = @el.data 'time-left'
    @iterator = parseInt(@el.data('iterator') || 1 )
#    @template = window.JST["templates/timer"]

    @secondsLeft = 0 if @secondsLeft < 0
    @el.html @template(val: @secondsLeft)
    @intervalID = setInterval @refresh, 1000


  refresh: =>
    @secondsLeft = @secondsLeft + @iterator
    clearInterval(@intervalID) if @secondsLeft < 0
    @el.html @template(val: @secondsLeft)

  template: (options) =>
    val = options.val
#    days = Math.floor(val / 86400)
#    <span> #{t('requests.index.day', days)}, </span>
#    <span class='days'>#{days}</span>
#    <span> Дней}, </span>
    """
    <span class='hours'>#{Math.floor(val / 3600 % 24)}ч.</span>
    <span class='minutes'>#{Math.floor(val / 60 % 60)}м.</span>
    <span class='seconds'>#{val % 60}с.</span>
   """



