# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

L.mapbox.accessToken = 'pk.eyJ1IjoidGVrbm9maXJlIiwiYSI6ImNpZjBpbWloYzBoZDdzbGtxcjJyczJwY2YifQ.B6AYB5o1EFpJn4vUegVQew'

class OutageReporter
  constructor: (@map, @locator) ->

  onFindingLocation: (e) =>
    $('#finding-location-modal').modal();
    @map.on 'locationfound', @onLocationFound

  onLocationFound: (e) =>
    $('#finding-location-modal').modal('hide')
    @locator.stop()
    @map.off 'locationfound', @onLocationFound

    console.log e.latlng
    modal = $('#report-outage-modal').modal()
    $('#report-outage-modal .location').html(e.latlng.toString())


$(document).on 'ready page:load', ->
  map = L.mapbox.map('map', 'teknofire.nhofm92j')
  map.setView([64.833173, -147.800445], 10)
  lc = L.control.locate({
    drawCircle: false,
    follow: true,
    setView: true
  })
  lc.addTo(map)

  reporter = new OutageReporter(map, lc)
  map.on 'startfollowing', reporter.onFindingLocation

  $('[data-behavior="report-outage"]').on 'click', ->
    lc.start()
