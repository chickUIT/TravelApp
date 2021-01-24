import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  // final latitude, longtitude;
  // MapPage({this.latitude, this.longtitude});
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  int _polylineCount = 1;
  Map<PolylineId, Polyline> _polylines = <PolylineId, Polyline>{};
  GoogleMapController _controller;
  LatLng _mapInitLocation = LatLng(10.886259326198338, 106.78205077052613);
  LatLng _originLocation = LatLng(10.886259326198338, 106.78205077052613);
  LatLng _destinationLocation = LatLng(10.886936621408166, 106.78093858365257);
  LatLng _currentLocation;
  bool _loading = false;

  GoogleMapPolyline _googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyBWpriPjxSKvR56WkU7nRcF5TmAkmTi6Gs");

  List<List<PatternItem>> patterns = <List<PatternItem>>[
    <PatternItem>[], //line
    <PatternItem>[PatternItem.dash(30.0), PatternItem.gap(20.0)], //dash
    <PatternItem>[PatternItem.dot, PatternItem.gap(10.0)], //dot
    <PatternItem>[
      //dash-dot
      PatternItem.dash(30.0),
      PatternItem.gap(20.0),
      PatternItem.dot,
      PatternItem.gap(20.0)
    ],
  ];

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }

  _setLoadingMenu(bool _status) {
    setState(() {
      _loading = _status;
    });
  }

  _addPolyline(List<LatLng> _coordinates) {
    PolylineId id = PolylineId("poly$_polylineCount");
    Polyline polyline = Polyline(
        polylineId: id,
        patterns: patterns[0],
        color: Colors.blueAccent,
        points: _coordinates,
        width: 10,
        onTap: () {});

    setState(() {
      _polylines[id] = polyline;
      _polylineCount++;
    });
  }

  _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      debugPrint(position.latitude.toString());
      debugPrint(position.longitude.toString());
      LatLng latLngPosition = new LatLng(position.latitude, position.longitude);
      CameraPosition cameraPosition =
          new CameraPosition(target: latLngPosition, zoom: 17.0);
      _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  //Get polyline with Location (latitude and longitude)
  _getPolylinesWithLocation() async {
    _setLoadingMenu(true);
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    _currentLocation = new LatLng(position.latitude, position.longitude);
    List<LatLng> _coordinates =
        await _googleMapPolyline.getCoordinatesWithLocation(
            origin: _currentLocation,
            destination: _destinationLocation,
            mode: RouteMode.driving);
    setState(() {
      _polylines.clear();
      LatLng latLngPosition =
          new LatLng(_currentLocation.latitude, _currentLocation.longitude);
      CameraPosition cameraPosition =
          new CameraPosition(target: latLngPosition, zoom: 17.0);
      _controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
    _addPolyline(_coordinates);
    _setLoadingMenu(false);
  }

  @override
  void initState() {
    super.initState();
    _getPolylinesWithLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 50),
        child: FloatingActionButton(
          child: Icon(
            Icons.my_location,
            size: 20.0,
            color: Colors.white,
          ),
          onPressed: _getCurrentLocation,
          backgroundColor: Colors.blueAccent,
        ),
      ),
      body:GoogleMap(
        onMapCreated: _onMapCreated,
        polylines: Set<Polyline>.of(_polylines.values),
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: _mapInitLocation,
          zoom: 15,
        ),
      ),
    );
  }
}


