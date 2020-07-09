window.initializers = _.extend(
  mapSelector: (el) ->
    config =
      setViewCoords: [52.522906,39.195786]
      tileServerPath: 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png'
      tms: false

    $('.map-selector:not(.map-selector-initialized)', el).each((i, target) ->
      element = $(target)
      type = element.data('map-selector')
      namespace = element.data('namespace')
      options =
        tileServerPath: config.tileServerPath
        setViewCoords: config.setViewCoords
        tms: config.tms
      options.namespace = namespace if namespace

      initMap = (type) ->
        switch type
          when 'area'
            new MapAreaSelector(target, options)
          when 'line'
            new MapLineSelector(target, options)
          else
            new MapSelector(target, options)

      console.log "initMap #{type}"
      initMap type

      $mapTypeSelect = $ '.map-type-select'
      $mapTypeSelect.bind 'change', ->
        mapSelectorType = $('option:selected', $mapTypeSelect).attr 'map-type'
        $('#map-container').replaceWith $('<div>', id: 'map-container')
        initMap mapSelectorType

    ).addClass 'map-selector-initialized'
, window.initializers)