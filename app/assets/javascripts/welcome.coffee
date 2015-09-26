# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

L.mapbox.accessToken = 'pk.eyJ1IjoidGVrbm9maXJlIiwiYSI6ImNpZjBpbWloYzBoZDdzbGtxcjJyczJwY2YifQ.B6AYB5o1EFpJn4vUegVQew'

$(document).on 'ready page:load', ->
  map = L.mapbox.map('map', 'teknofire.nhofm92j')
  map.setView([64.833173, -147.800445], 10)
  L.control.locate().addTo(map)
  
  featureGroup = L.featureGroup().addTo(map)
