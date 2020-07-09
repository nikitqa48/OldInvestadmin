window.initializers = _.extend
  numeric: (el) ->
    for element in $ '.numeric:not(.numeric-initialized)', el
      $(element).numeric().addClass 'numeric-initialized'

    for element in $ '.integer:not(.integer-initialized)', el
      $(element).numeric false, ->
        alert "Integers only"
        @value = ""
        @focus()
      .addClass 'integer-initialized'

    for element in $ '.positive:not(.positive-initialized)', el
      $(element).numeric false, ->
        alert "No negative values"
        @value = ""
        @focus()
      .addClass 'positive-initialized'

    for element in $ '.positive-integer:not(.positive-integer-initialized)', el
      $(element).numeric false, ->
        alert "Positive integers only"
        @value = ""
        @focus()
      .addClass 'positive-integer-initialized'

  window.initializers