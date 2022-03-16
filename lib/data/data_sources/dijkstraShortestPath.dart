import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:jame3ty_map/data/repository/repository.dart';
import 'package:jame3ty_map/data/util.dart';

import '../models/edge.dart';
import '../models/place.dart';


class DijkstraShortestPath extends ChangeNotifier {
  //Data data = Data();
  List<Place>? jsonData = fetchDataFromJson();

  DijkstraShortestPath() {
    //data.init();
  }

  Future<void> computeShortestPaths(LatLng latLng) async {
    var sourceVertex = getClosetPlace(jsonData, latLng);
    print("Closet Place to me is:$sourceVertex");
    sourceVertex.distance = 0;

    PriorityQueue<Place> priorityQueue = PriorityQueue();
    priorityQueue.add(sourceVertex);
    sourceVertex.visited = true;

    while (priorityQueue.isNotEmpty) {
      // Getting the minimum distance vertex from priority queue
      Place actualVertex = priorityQueue.removeFirst();

      for (Edge edge in actualVertex.adjacenciesList) {
        Place v = edge.targetVertex;
        if (!v.visited) {
          double newDistance = actualVertex.distance + edge.weight!;

          if (newDistance < v.distance) {
            priorityQueue.remove(v);
            v.distance = newDistance;
            v.setVertex(actualVertex);
            priorityQueue.add(v);
          }
        }
      }
      actualVertex.visited = true;
    }
  }

  Future<List<Place>> getShortestPathTo(Place targetVertex) async {
    List<Place> path = [];
    Place? vertex = targetVertex;
    while (vertex != null) {
      path.add(vertex);
      vertex = vertex.getPredecessor();
    }

    return path.reversed.toList();
  }
}
