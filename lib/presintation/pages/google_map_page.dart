import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../data/data_sources/dijkstraShortestPath.dart';
import '../../data/models/place.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;
  final Location location = Location();
  late LatLng latLng;
  var _map_style;

  var initialCameraPosition = const CameraPosition(
    target: LatLng(33.354037, 6.809174),
    zoom: 18.0,
  );

  List<Marker> mapMarkers = [];
  List<Circle> mapCircle = [];

  Set<Polyline> polylins = Set();

  @override
  void initState() {
    // SchedulerBinding.instance?.addPostFrameCallback((_) {
    //   rootBundle.loadString("map_style.txt").then((string) {
    //     _map_style = string;
    //   });
    // });



    _getMarks();
    _computeDistance();
  }

  void _onMapCreated(GoogleMapController controller) async {
    var locatioinData = await location.getLocation();
    mapController = controller;
    _map_style = await rootBundle.loadString('assets/style/map_style.txt');
    mapController.setMapStyle(_map_style);
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(locatioinData.latitude ?? 33.354037,
            locatioinData.longitude ?? 6.809174),
        zoom: 18.0)));
  }

  // void _onMapCreated(GoogleMapController controller) {
  //
  //   mapController = controller;
  //
  // }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GoogleMap(
          mapToolbarEnabled: true,
          myLocationEnabled: true,
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          circles: mapCircle.toSet(),
          onMapCreated: _onMapCreated,
          markers: mapMarkers.toSet(),
          initialCameraPosition: initialCameraPosition,
          polylines: polylins,
          onLongPress: (it) {},
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   foregroundColor: Colors.white,
      //   onPressed: getCurrentLocation,
      //   child: const Icon(Icons.my_location_sharp),
      // ),
    );
  }

  _getMarks() {
    Provider.of<DijkstraShortestPath>(context, listen: false)
        .jsonData
        ?.forEach((element) {
         if(element.isVisible){
           var mark = Marker(
               markerId: MarkerId(element.name),
               infoWindow: InfoWindow(title: element.name),
               draggable: false,
               position: LatLng(element.latLng.latitude, element.latLng.longitude),
               visible: element.isVisible,
               onTap: () {
                 _drawPloyLine(element);
               },
               icon:
               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan));
           mapMarkers.add(mark);
         }
    });
  }

  _drawPloyLine(Place place) {
    List<LatLng> points = [];
    points.add(latLng);
    Provider.of<DijkstraShortestPath>(context, listen: false)
        .getShortestPathTo(place)
        .then((value) => {
              value.forEach((element) {
                points.add(element.latLng);
                print(element.name);
              }),
              // polylins.add(
              //   Polyline(
              //       polylineId: const PolylineId("dots"),
              //       color: Colors.red,
              //       points: [
              //         LatLng(latLng.latitude, latLng.longitude),
              //         LatLng(points.first.latitude, points.first.longitude)
              //       ],
              //       patterns: const [
              //         PatternItem.dot
              //       ]),
              // )
            });

    var polyline = Polyline(
        polylineId: const PolylineId("polylineId"),
        color: Colors.red,
        points: points);
    polylins.add(polyline);
    setState(() {});
  }

  Future<void> upDataLocation(LocationData locationData) async {
    LatLng latLng =
        LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0);
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 18.0)));
    var marker = Marker(
      markerId: const MarkerId("markerId"),
      position: LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    );

    var circle = Circle(
        circleId: const CircleId("circleId"),
        center: latLng,
        strokeWidth: 10,
        fillColor: Colors.blue,
        strokeColor: Colors.blueAccent);
    mapCircle.add(circle);
    mapMarkers.add(marker);
    setState(() {});
  }

  // Future<void> getCurrentLocation() async {
  //   location.getLocation().then((value) => {
  //         Provider.of<DijkstraShortestPath>(context, listen: false)
  //             .computeShortestPaths(
  //                 LatLng(value.latitude ?? 0, value.longitude ?? 0)),
  //         latLng = LatLng(value.latitude!, value.longitude!),
  //         upDataLocation(value)
  //       });
  //   location.onLocationChanged.listen((event) {
  //     // upDataLocation(event);
  //   });
  // }

  _computeDistance() async {
    location.getLocation().then((value) => {
          Provider.of<DijkstraShortestPath>(context, listen: false)
              .computeShortestPaths(
                  LatLng(value.latitude ?? 0, value.longitude ?? 0)),
          latLng = LatLng(value.latitude!, value.longitude!),
          upDataLocation(value)
        });
  }

}
