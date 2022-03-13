

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jame3ty_map/data/models/edge.dart';

import '../models/vertex.dart';


class Data extends ChangeNotifier{
   List<Place> places = [];

  var scinceFaclty =  Place(
      isVisible: true,
      name: "كلية العلوم الدقيقة",
      latLng: const LatLng(33.396591, 6.861211));


  var techFaclty =  Place(
      isVisible: true,
      name: "كلية التكنولوجيا",
      latLng: const LatLng(33.395659, 6.860256));


  var languegeFaclty =  Place(
      isVisible: true,
      name: "كلية اللغات",
      latLng: const LatLng(33.397048, 6.859901));


  var roundPoint11 =  Place(
    isVisible: false,
      name: "11",
      latLng: const LatLng(33.397232, 6.860465));


  var roundPoint1 =  Place(
    isVisible: false,
      name: "1",
      latLng: const LatLng(33.396815, 6.860631));


  var roundPoint2 =  Place(
    isVisible: false,
      name: "2",
      latLng: const LatLng(33.396468, 6.861571));


  var roundPoint3 =  Place(
    isVisible: false,
      name: "3",
      latLng: const LatLng(33.396181, 6.861686));


  var roundPoint4 =  Place(
    isVisible: false,
      name: "4",
      latLng: const LatLng(33.395318, 6.861261));

  init(){
    places.add(scinceFaclty);
    places.add(techFaclty);
    places.add(languegeFaclty);
    places.add(roundPoint4);
    places.add(roundPoint2);
    places.add(roundPoint3);
    places.add(roundPoint11);
    places.add(roundPoint1);
    scinceFaclty.adjacenciesList.add(Edge(scinceFaclty,roundPoint1));
    scinceFaclty.adjacenciesList.add(Edge(scinceFaclty,roundPoint2));
    roundPoint1.adjacenciesList.add(Edge(roundPoint1,scinceFaclty));
    roundPoint1.adjacenciesList.add(Edge(roundPoint1,roundPoint11));
    roundPoint11.adjacenciesList.add(Edge(roundPoint11,roundPoint1));
    roundPoint11.adjacenciesList.add(Edge(roundPoint11,languegeFaclty));
    languegeFaclty.adjacenciesList.add(Edge(languegeFaclty,roundPoint11));
    roundPoint2.adjacenciesList.add(Edge(roundPoint2,scinceFaclty));
    roundPoint2.adjacenciesList.add(Edge(roundPoint2,roundPoint3));
    roundPoint3.adjacenciesList.add(Edge(roundPoint3,roundPoint2));
    roundPoint3.adjacenciesList.add(Edge(roundPoint3,roundPoint4));
    roundPoint4.adjacenciesList.add(Edge(roundPoint4,roundPoint3));
    roundPoint4.adjacenciesList.add(Edge(roundPoint4,techFaclty));
    techFaclty.adjacenciesList.add(Edge(techFaclty,roundPoint4));
  }


}



