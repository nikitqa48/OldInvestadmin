class window.MapSelector
  constructor: (e, options) ->
    @options = $.extend(
      coordsSelector: "coords"
      namespace: "project"
      mapContainerId: "map-container"
    , options)
    @el = $(e)


    @coordsField = $("input[name='" + @options.namespace + "[" + @options.coordsSelector + "]']", @el)

    #---- custom coord fields initialization

    @customCoordX = $("#coordX", @el)
    @customCoordY = $("#coordY", @el)
    @customCoordButton = $("#customCoordsUpdate", @el)
    @customCoordButton.bind 'click', @setCoordsByFields
    @customCoordX.val @coordsField.val().split("_")[0]
    @customCoordY.val @coordsField.val().split("_")[1]

    #----


    if @coordsField.length is 1
      @includeLeafletMap()
    else
      # TODO need add i18n
      alert "Error: can't find position fields. Please, send this message to system administrator"

  includeLeafletMap: =>
    window.map = @map = L.map $("#map-container", @el).get(0),
      zoomControl: false
      attributionControl: false

    @map.setView @options.setViewCoords, 9
    L.tileLayer(@options.tileServerPath, tms: @options.tms).addTo @map

    drawnItems = @drawItems = new L.FeatureGroup()
    map.addLayer drawnItems

    @myCustomMarker = new L.Icon
      iconUrl: "/assets/marker-icon.png"
      shadowUrl: null
      iconAnchor: new L.Point(12.5, 41)
      iconSize: new L.Point(25, 41)
#
    unless @coordsField.val() is ""
      window.marker = new L.marker(@setPlacemark(), icon: @myCustomMarker)
      drawnItems.addLayer window.marker
    AdditionalControl = L.Control.extend(
      options:
        position: "topright"

      onAdd: (map) ->
        container = L.DomUtil.create("div", "full-size-control")
        $(container).click ->
          $(".fix-leaflet").toggleClass "full-screen"
          map.invalidateSize true

        container
    )

    @drawControl = new L.Control.Draw
      draw:
        position: "topleft"
        polygon: false
        circle: false
        polyline: false
        rectangle: false
        marker:
          icon: @myCustomMarker
      edit: false

    map.addControl @drawControl
    map.addControl new AdditionalControl
    $(map).bind "draw:created", @onCreated
    $(map).bind "draw:drawstart", @onStart
    $(map).bind "draw:deleted", @onDelete

  onCreated: (ev) =>
    layer = ev.originalEvent.layer
    @drawItems.addLayer layer
    @setCoords layer._latlng
    @saveCoords()

  onStart: =>
    @customCoordX.attr "disabled",  "disabled"
    @customCoordY.attr "disabled",  "disabled"
    @customCoordButton.attr "disabled",  "disabled"
    @drawItems.clearLayers()

  onDelete: =>
    @coordsField.val ""

  setCoords: (coords) =>
    window.marker = window.marker or new L.marker([coords.lat, coords.lng], icon: @myCustomMarker)
    window.marker._latlng = coords

  saveCoords: () =>
    point = window.marker._latlng
    coordX = point["lat"]
    coordY = point["lng"]
    @coordsField.val [coordX, coordY].join("_")
    @customCoordX.val(coordX)
    @customCoordY.val(coordY)
    @customCoordX.removeAttr "disabled"
    @customCoordY.removeAttr "disabled"
    @customCoordButton.removeAttr "disabled"

  setCoordsByFields: =>
    #--- changing coordsField
    if @customCoordX.val() == "" || @customCoordY.val() == ""
      @coordsField.val ""
    else
      @coordsField.val [@customCoordX.val(), @customCoordY.val()].join("_")

    #--- redrawing the map
    @drawItems.clearLayers()
    unless @customCoordX.val() == "" || @customCoordY.val() == ""
      layer = new L.marker([@customCoordX.val(), @customCoordY.val()], icon: @myCustomMarker)
      @drawItems.addLayer layer

  setPlacemark: =>
    coords = @coordsField.val().split("_")
    x = parseFloat(coords[0])
    y = parseFloat(coords[1])
    coord = [x, y]
    coord