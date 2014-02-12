hi = hi || {}

hi.app = angular.module("HeuteIn", ["ngResource", 'hi.factories', 'hi.directives','ui.map','ui.event'])

@MainCtrl = ["$scope", ($scope) ->

  $scope.name = 'Markus'

  ll = new google.maps.LatLng(52.5233, 13.4127)
  $scope.mapOptions =
    zoom: 13
    center: ll
    disableDefaultUI: true
    mapTypeId: google.maps.MapTypeId.ROADMAP

  #$scope.map = new google.maps.Map($('#map-canvas'), $scope.mapOptions);
  $scope.geocoder = new google.maps.Geocoder();

  #Markers should be added after map is loaded
  $scope.onMapIdle = ->
    if $scope.myMarkers is `undefined`
      marker = new google.maps.Marker(
        map: $scope.myMap
        position: ll
      )
      $scope.myMarkers = [marker]

  $scope.markerClicked = (m) ->
    window.alert m

]
