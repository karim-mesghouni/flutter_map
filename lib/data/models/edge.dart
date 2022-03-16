import 'package:jame3ty_map/data/models/place.dart';

import '../util.dart';

class Edge {
  double? weight;
  final Place startVertex;
  final Place targetVertex;

  Edge(this.startVertex, this.targetVertex) {
    _calculateWeight();
  }

  void _calculateWeight() {
    weight = calculateDistance(startVertex.latLng, targetVertex.latLng);
  }

   

 
}
