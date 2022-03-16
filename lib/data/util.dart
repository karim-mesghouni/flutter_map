
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jame3ty_map/data/data_sources/data_source_r.dart';
import 'package:jame3ty_map/data/models/place.dart';

import 'models/edge.dart';


double calculateDistance(LatLng from, LatLng to) {
  var p = 0.017453292519943295;
  var a = 0.5 -
      cos((to.latitude - from.latitude) * p) / 2 +
      cos(from.longitude * p) *
          cos(to.latitude * p) *
          (1 - cos((to.longitude - from.longitude) * p)) /
          2;
  return 12742 * asin(sqrt(a));
}

Place getClosetPlace(List<Place>? places,LatLng latLng)  {
  double cDistance = double.maxFinite;
  var clocest;
  if(null != places){
    for (var element in places) {
      // var dis = calculateDistance(latLng, element.latLng);
      var dis = Geolocator.distanceBetween(latLng.latitude,latLng.longitude, element.latLng.latitude,element.latLng.longitude);
      if(dis < cDistance){
        cDistance = dis;
        clocest = element;

      }

    }
  }

  return clocest;
}
convertEdges(Map<String, dynamic> json, Map<String, Place> places) {
    Place start = places[json["start"]] as Place;
    Place target = places[json["target"]] as Place;
    Edge edge = Edge(start, target);
   places[start.name]?.adjacenciesList.add(edge);
  }



