# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

L.mapbox.accessToken = 'pk.eyJ1IjoidGVrbm9maXJlIiwiYSI6ImNpZjBpbWloYzBoZDdzbGtxcjJyczJwY2YifQ.B6AYB5o1EFpJn4vUegVQew'

class OutageReporter
  constructor: () ->
    return if $('#map').length == 0

    @geocoder = L.mapbox.geocoder('mapbox.places')
    @map = L.mapbox.map('map', 'teknofire.nhofm92j')
    @map.setView([64.833173, -147.800445], 10)
    @locator = L.control.locate({
      drawCircle: false,
      follow: true,
      setView: true
    })
    @locator.addTo(@map)

    @addLayers()

    @map.on 'startfollowing', @onFindingLocation
    @map.on 'draw:created', @onMarkerPlaced

    @marker = new L.Draw.Marker(@map)

    $('[data-behavior="report-outage"]').on 'click', =>
      if $(this).data('location') == 'current'
        @locator.start()
      else
        @marker.enable()

  onMarkerPlaced: (e) =>
    @getFormInfo(e.layer.getLatLng())

  addLayers: () =>
    for layer in $('#map layer')
      switch($(layer).data('type'))
        when 'geojson'
          @addFeatureLayer($(layer))

  addFeatureLayer: (layer) =>
    L.mapbox.featureLayer(layer.data('url')).addTo(@map)

  onFindingLocation: (e) =>
    $('#finding-location-modal').modal();
    @map.on 'locationfound', @onLocationFound

  onLocationFound: (e) =>
    $('#finding-location-modal').modal('hide')
    @locator.stop()
    @map.off 'locationfound', @onLocationFound

  getFormInfo: (latlng) =>
    modal = $('#report-outage-modal').modal()
    $('#outage_report_location').val("#{latlng.lat}, #{latlng.lng}")
    @findAddress(latlng)

  findAddress: (latlng) =>
    @geocoder.reverseQuery([latlng.lng, latlng.lat], @setAddress)

  setAddress: (err, data) =>
    info = {}
    for item in data.features
      name = item.id.split('.')[0]
      info[name] = item.place_name

    if info.address?
      location = info.address.split(/,\s+/)
    else if info.place?
      location = [''].concat info.place.split(/,\s+/)
    else if info.postcode?
      location = ['', ''].concat info.postcode.split(/,\s+/)

    $('#outage_report_address').val("#{location[0]}\n#{location[1]}, #{location[3]} #{location[2]}")
$(document).on 'ready page:load', ->
  reporter = new OutageReporter()
