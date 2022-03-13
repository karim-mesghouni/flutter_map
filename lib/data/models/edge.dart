import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jame3ty_map/data/data_sources/data_source_r.dart';
import 'package:jame3ty_map/data/models/vertex.dart';

import '../util.dart';


class Edge {
  double? weight;
  final Place startVertex;
  final Place targetVertex;

  Edge(this.startVertex,this.targetVertex){
    _calculateWeight();

  }



  void _calculateWeight(){
    weight = calculateDistance(startVertex.latLng,targetVertex.latLng);
  }


}