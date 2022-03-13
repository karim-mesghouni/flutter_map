import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jame3ty_map/data/models/vertex.dart';
import 'package:jame3ty_map/data/models/vertex.dart';

import 'edge.dart';

class Place implements Comparable<Place>{
  final LatLng latLng;
  final String name;
  List<Edge>  adjacenciesList = [];
  bool visited = false ;
  Place?  predecessor ;
  final bool isVisible ;
  double distance = double.maxFinite;
  Place({required this.isVisible, required this.name, required this.latLng});

  void setVertex(Place vertex){
    predecessor = vertex;
  }

  Place? getPredecessor(){
    return predecessor;
  }

  @override
  int compareTo(Place other) {
    if(distance < other.distance){
      return -4;
    }else if(distance > other.distance){
      return 4;
    }else{
      return 0;
    }
  }
  @override
  String toString() {
    // TODO: implement toString
    return name;
  }

  
}

