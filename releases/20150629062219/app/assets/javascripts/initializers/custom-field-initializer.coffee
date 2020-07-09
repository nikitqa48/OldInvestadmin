window.initializers = _.extend
  customField: (el) ->
    for element, index in $ ".custom-field-container:not(.custom-field-container-initialized)", el
      new CustomFieldManager element
      $(element).addClass "custom-field-container-initialized"
  window.initializers