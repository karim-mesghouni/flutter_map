import 'package:jame3ty_map/data/models/place.dart';

import '../util.dart';

var json = {
  "palces": {
    "Pisine": {
      "name": "Pisine",
      "isVisible": true,
      "lat": 33.346968,
      "lng": 6.802437
    },
    "Khaima": {
      "name": "Khaima",
      "isVisible": true,
      "lat": 33.349311,
      "lng": 6.803374
    },
    "La coupole": {
      "name": "La coupole",
      "isVisible": true,
      "lat": 33.347537,
      "lng": 6.803501
    },
    "point1": {
      "name": "point1",
      "isVisible": false,
      "lat": 33.349487,
      "lng": 6.804106
    },
    "point2": {
      "name": "point2",
      "isVisible": false,
      "lat": 33.349076,
      "lng": 6.803774,
    },
    "point3": {
      "name": "point3",
      "isVisible": false,
      "lat": 33.346847,
      "lng": 6.802060
    },
    "point4": {
      "name": "point4",
      "isVisible": false,
      "lat": 33.347083,
      "lng": 6.802235
    },
    "point5": {
      "name": "point5",
      "isVisible": false,
      "lat": 33.345317,
      "lng": 6.800852
    },
    "point6": {
      "name": "point6",
      "isVisible": false,
      "lat": 33.344294,
      "lng": 6.802717
    },
    "point7": {
      "name": "point7",
      "isVisible": false,
      "lat": 33.345833,
      "lng": 6.803903
    },
    "point8": {
      "name": "point8",
      "isVisible": false,
      "lat": 33.348483,
      "lng": 6.805931
    },
    "point9": {
      "name": "point9",
      "isVisible": false,
      "lat": 33.347839,
      "lng": 6.802840
    },
  },
  "edges": [
    {"start": "Pisine", "target": "point4"},
    {"start": "Khaima", "target": "point2"},
    {"start": "La coupole", "target": "point9"},
    {"start": "point1", "target": "point8"},
    {"start": "point1", "target": "point2"},
    {"start": "point2", "target": "point1"},
    {"start": "point2", "target": "point9"},
    {"start": "point2", "target": "Khaima"},
    {"start": "point3", "target": "point4"},
    {"start": "point3", "target": "point5"},
    {"start": "point3", "target": "point7"},
    {"start": "point4", "target": "Pisine"},
    {"start": "point4", "target": "point3"},
    {"start": "point4", "target": "point9"},
    {"start": "point5", "target": "point3"},
    {"start": "point5", "target": "point6"},
    {"start": "point6", "target": "point5"},
    {"start": "point6", "target": "point7"},
    {"start": "point7", "target": "point3"},
    {"start": "point7", "target": "point6"},
    {"start": "point7", "target": "point8"},
    {"start": "point8", "target": "point7"},
    {"start": "point8", "target": "point1"},
    {"start": "point9", "target": "point2"},
    {"start": "point9", "target": "point4"},
    {"start": "point9", "target": "La coupole"}
  ]
};

List<Place>? fetchDataFromJson() {
  var places = (json["palces"] as Map<String, dynamic>)
      .map((key, entry) => MapEntry(key, Place.fromJson(entry)));
  (json["edges"] as List).forEach((e) => {convertEdges(e, places)});
  return places.values.toList();
}
