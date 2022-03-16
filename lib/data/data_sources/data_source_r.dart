

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jame3ty_map/data/models/edge.dart';

import '../models/place.dart';


class Data extends ChangeNotifier{
   List<Place> places = [];

  var pisine =  Place(
      isVisible: true,
      name: "Piscine",
      latLng: const LatLng(33.346968, 6.802437));


  var khaima =  Place(
      isVisible: true,
      name: "Kheima",
      latLng: const LatLng(33.349311, 6.803374));


  var unkowne =  Place(
      isVisible: true,
      name: "La coupole",
      latLng: const LatLng(33.347537, 6.803501));


  var roundPoint1 =  Place(
    isVisible: true,
      name: "1",
      latLng: const LatLng(33.349487, 6.804106));


  var roundPoint2 =  Place(
    isVisible: true,
      name: "2",
      latLng: const LatLng(33.349076, 6.803774));


  var roundPoint3 =  Place(
    isVisible: true,
      name: "3",
      latLng: const LatLng(33.346847, 6.802060));


  var roundPoint4 =  Place(
    isVisible: true,
      name: "4",
      latLng: const LatLng(33.347083, 6.802235));


    var roundPoint5 =  Place(
    isVisible: true,
      name: "5",
      latLng: const LatLng(33.345317, 6.800852));

   var roundPoint6 =  Place(
       isVisible: true,
       name: "6",
       latLng: const LatLng(33.344294, 6.802717));


   var roundPoint7 =  Place(
       isVisible: true,
       name: "7",
       latLng: const LatLng(33.345833, 6.803903));
   var roundPoint8 =  Place(
       isVisible: true,
       name: "8",
       latLng: const LatLng(33.348483, 6.805931));

   var roundPoint9 =  Place(
       isVisible: true,
       name: "9",
       latLng: const LatLng(33.347839, 6.802840));


   init(){
    places.add(pisine);
    places.add(khaima);
    places.add(unkowne);
    places.add(roundPoint4);
    places.add(roundPoint2);
    places.add(roundPoint3);
    places.add(roundPoint5);
    places.add(roundPoint6);
    places.add(roundPoint7);
    places.add(roundPoint8);
    places.add(roundPoint9);
    places.add(roundPoint8);
    places.add(roundPoint1);

   _linkPisine();
   _linkKhiama();
   _linkUnkown();

   _linkRound1();

   _linkRound2();

   _linkRound3();

   _linkRound4();

   _linkRound5();


   _linkRound6();

   _linkRound7();

   _linkRound8();
   _linkRound9();




  }

   _linkPisine() {
     pisine.adjacenciesList.add(Edge(pisine,roundPoint4));
   }

   _linkKhiama() {
     khaima.adjacenciesList.add(Edge(khaima, roundPoint2));
   }

   _linkUnkown() {
     unkowne.adjacenciesList.add(Edge(unkowne,roundPoint9));
   }

   _linkRound1() {
     roundPoint1.adjacenciesList.add(Edge(roundPoint1, roundPoint2));
     roundPoint1.adjacenciesList.add(Edge(roundPoint1, roundPoint8));
   }

   _linkRound2() {
     roundPoint2.adjacenciesList.add(Edge(roundPoint2, roundPoint1));
     roundPoint2.adjacenciesList.add(Edge(roundPoint2, khaima));
     roundPoint2.adjacenciesList.add(Edge(roundPoint2, roundPoint9));
   }

   _linkRound3() {
     roundPoint3.adjacenciesList.add(Edge(roundPoint3, roundPoint4));
     roundPoint3.adjacenciesList.add(Edge(roundPoint3, roundPoint7));
     roundPoint3.adjacenciesList.add(Edge(roundPoint3, roundPoint5));
   }

   _linkRound4() {
     roundPoint4.adjacenciesList.add(Edge(roundPoint4, pisine));
     roundPoint4.adjacenciesList.add(Edge(roundPoint4, roundPoint3));
     roundPoint4.adjacenciesList.add(Edge(roundPoint4, roundPoint9));
   }

   _linkRound5() {
     roundPoint5.adjacenciesList.add(Edge(roundPoint5, roundPoint3));
     roundPoint5.adjacenciesList.add(Edge(roundPoint5, roundPoint6));
   }

   _linkRound6() {
     roundPoint6.adjacenciesList.add(Edge(roundPoint6, roundPoint5));
     roundPoint6.adjacenciesList.add(Edge(roundPoint6, roundPoint7));
   }

   _linkRound7() {
     roundPoint7.adjacenciesList.add(Edge(roundPoint7, roundPoint6));
     roundPoint7.adjacenciesList.add(Edge(roundPoint7, roundPoint3));
     roundPoint7.adjacenciesList.add(Edge(roundPoint7, roundPoint8));
   }

   _linkRound8() {
     roundPoint8.adjacenciesList.add(Edge(roundPoint8, roundPoint7));
     roundPoint8.adjacenciesList.add(Edge(roundPoint8, roundPoint1));
   }

   _linkRound9() {
     roundPoint9.adjacenciesList.add(Edge(roundPoint9, unkowne));
     roundPoint9.adjacenciesList.add(Edge(roundPoint9, roundPoint2));
     roundPoint9.adjacenciesList.add(Edge(roundPoint9, roundPoint4));
   }








}





