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

    @map.on 'startfollowing', @onFindingLocation

    $('[data-behavior="report-outage"]').on 'click', =>
      @locator.start()


  onFindingLocation: (e) =>
    $('#finding-location-modal').modal();
    @map.on 'locationfound', @onLocationFound

  onLocationFound: (e) =>
    $('#finding-location-modal').modal('hide')
    @locator.stop()
    @map.off 'locationfound', @onLocationFound

    modal = $('#report-outage-modal').modal()
    $('#outage_report_location').val("#{e.latlng.lat}, #{e.latlng.lng}")
    @findAddress(e.latlng)

  findAddress: (latlng) =>
    @geocoder.reverseQuery([latlng.lng, latlng.lat], @setAddress)

  setAddress: (err, data) =>
    console.log data

$(document).on 'ready page:load', ->
  reporter = new OutageReporter()
