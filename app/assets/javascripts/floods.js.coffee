# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  map = $ "#gmap"
  location_field = $ "#flood_location"
  address = $ "#flood_address"
  lat_field = $ "#flood_latitude"
  long_field = $ "#flood_longitude"
  address = address.geocomplete map: map
  
  $.geolocation.get(enableHighAccuracy: true).done (position)->
    latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
    lat_field.val position.coords.latitude
    long_field.val position.coords.longitude
    address.geocomplete map: map, location: latlng

  address.bind "geocode:result", (event, result)->
    map.parent().height('400px').width 'auto'
    lat_field.val result.geometry.location.lat()
    long_field.val result.geometry.location.lng()
