window.initializers = _.extend
  timer: (el) ->
    for element, index in $ ".timer:not(.timer-initialized)", el
      new Timer element
      $(element).addClass "timer-initialized"
  window.initializers