class window.CustomFieldManager
  constructor: (el) ->
    @el = $ el
    @template = $ ".template", @el
    @addBtn = $ ".btn-add", @el
    @addBtn.bind "click", @add
    new CustomFieldGroup(element) for element, index in $ ".custom-field-wrap:not(.template)", @el

  add: =>
     group = @template.clone().insertBefore(@addBtn).removeClass "template"
     new CustomFieldGroup(group)

class window.CustomFieldGroup
  constructor: (el) ->
    @el = $ el
    @addAttr()
    @destroyBtn = $ ".btn-delete", @el
    @destroyBtn.bind "click", @destroy

  destroy: =>
    @el.remove()

  addAttr: =>
    guid = $.Guid.New().replace(/-/g, "")
    for element, index in $ "input", @el
      field = $(element)
      if !field.data("init")
        name = field.data("name")
        field.attr "name", "platform[buildings][#{guid}][#{name}]"



