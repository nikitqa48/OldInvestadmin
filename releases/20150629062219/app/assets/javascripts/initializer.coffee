window.initialize = (el = document) ->
  func? el for key, func of window.initializers

$ ->
  initialize()

window.addComponent = (klass, className, handler) ->
  if _.isObject className
    options = className
  else
    options =
      className: className
      handler: handler
      view: false

  if _.isFunction klass
    componentName = klass.toString().match(/function (\w+)\(.*/)[1]
  else
    componentName = klass
    klass = eval "#{componentName}"

  dasherize = (str)->
    return str.replace(/\W+/g, '-').replace(/([a-z\d])([A-Z])/g, '$1-$2').toLowerCase()
  className = options.className || dasherize(componentName)
  initializedClassName = "#{className}-initialized"
  disabledInitializeClassName = "disable-initializer"
  disabledCurrentInitializeClassName = "disable-#{className}"
  window.initializers ||= {}
  window.initializers[componentName] = (el)->
    targets = $ ".#{className}:not(.#{initializedClassName}, .#{disabledInitializeClassName}, .#{disabledCurrentInitializeClassName})", el

    targets.each (i, target)->
      item = undefined
      if options.view
        item = new klass {el: target}
      else
        item = new klass target
      $(target).addClass initializedClassName
      options.handler?(item)