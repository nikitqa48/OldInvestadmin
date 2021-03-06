class window.MapLineSelector
  constructor: (e, options) ->
    @el = $(e)
    @options = $.extend
      coordsSelector: 'coords'
      namespace: 'project'
      mapContainerId: 'map-container'
    , options

    @coordsField = $("input[name='" + @options.namespace + '[' + @options.coordsSelector + "]']", @el)
    unless @coordsField.length is 1
      alert "Error: can't find position fields. Please, send this message to system administrator"
    else
      @includeLeafletMap()

  includeLeafletMap: =>
    map = @map = L.map($("#map-container", @el).get(0),
      zoomControl: false
      attributionControl: false
    )

    @map.setView @options.setViewCoords, 9
    L.tileLayer(@options.tileServerPath, tms: @options.tms).addTo @map

    drawnItems = @drawItems = new L.FeatureGroup()
    map.addLayer drawnItems
#    window.polygon = new L.Polygon(@setPolygon())
    window.polyline = new L.Polyline @setPolyline()
    drawnItems.addLayer window.polyline

    AdditionalControl = L.Control.extend
      options:
        position: 'topright'
      onAdd: (map) ->
        container = L.DomUtil.create('div', 'full-size-control')
        $(container).click ->
          $('.fix-leaflet').toggleClass 'full-screen'
          map.invalidateSize true
        container

    drawControl = new L.Control.Draw
      draw:
        position: 'topleft'
        polygon: false
        circle: false
        polyline:
          title: 'Нарисовать линию'
          allowIntersection: false
          drawError:
            color: '#b00b00'
            timeout: 1000
            message: 'Линии не могут пересекаться'
          shapeOptions:
            color: '#03F'
        rectangle: false
        marker: false
      edit:
        edit:
          title: 'Редактирование'
        featureGroup: drawnItems
        remove:
          title: 'Очистить'

    map.addControl drawControl
    map.addControl new AdditionalControl
    $(map).bind 'draw:created', @onCreated
    $(map).bind 'draw:edited', @onEdit
    $(map).bind 'draw:drawstart', @onStart
    $(map).bind 'draw:deleted', @onDelete

  onStart: =>
    @drawItems.clearLayers()

  onCreated: (ev) =>
    layer = ev.originalEvent.layer
    @drawItems.addLayer layer
    @setCoords layer._latlngs
    @saveCoords()

  onEdit: =>
    @saveCoords()

  onDelete: =>
    @coordsField.val ""

  setCoords: (coords) ->
    window.polyline._latlngs = coords

  getCoords: ->
    window.polyline._latlngs

  saveCoords: =>
    coords = @getCoords()
    if coords and coords.length > 0
      coordsX = []
      coordsY = []
      $.each coords, (index, el) ->
        if el and el["lng"] and el["lat"]
          coordsX.push el["lat"]
          coordsY.push el["lng"]
      @coordsField.val coordsX.join(",") + "_" + coordsY.join(",")

  setPolyline: =>
    val = @coordsField.val()
    if val and val.length > 1
      coords = val.split('_')
      if coords
        coordsX = coords[0].split(',')
        coordsY = coords[1].split(',')
        if coordsX.length > 0 and coordsY.length > 0
          resultCoords = []
          $.each coordsX, (i, el) ->
            x = parseFloat(el)
            y = parseFloat(coordsY[i])
            resultCoords.push [x, y] if not isNaN(x) and not isNaN(y)
          resultCoords

    else
      [[0, 0]]