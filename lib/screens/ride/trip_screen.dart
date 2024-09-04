import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({super.key});

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(0, 0);
  bool _isLoading = true;

  bool _rideCompleted = false;
  double _iconPosition = 0;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Check location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _isLoading = false;

      // Move the map camera only if the map controller is already initialized
      _moveCamera();
    });
  }

  void _moveCamera() {
    if (_mapController != null) {
      _mapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentPosition,
            zoom: 14.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'On The Way',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: _currentPosition,
                          zoom: 14.0,
                        ),
                        onMapCreated: (controller) {
                          _mapController = controller;
                          _moveCamera(); // Move the camera once the map is created
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        markers: {
                          Marker(
                            markerId: MarkerId('currentLocation'),
                            position: _currentPosition,
                            infoWindow: InfoWindow(title: 'You are here'),
                          ),
                        },
                      ),
                      Positioned(
                        top: 10,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: 80,
                          width: MediaQuery.of(context).size.width -
                              20, // Adjust width
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.location_pin),
                              Expanded(
                                // Use Expanded to avoid overflow
                                child: Text(
                                  '41, Science City, Sola, Ahmedabad, Gujarat 380060, India',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.menu,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                                height: 10), // Add some space between buttons
                            Container(
                              height: 60,
                              width: 60,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://cdn-icons-png.flaticon.com/512/3177/3177872.png',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  '4.68 miles',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  '7 min',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  margin: EdgeInsets.all(12),
                                  width: double.infinity,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: _rideCompleted
                                        ? Colors.green
                                        : Colors
                                            .red, // Change color based on ride status
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    children: [
                                      // Only show the icon if the ride is not completed
                                      if (!_rideCompleted)
                                        GestureDetector(
                                          onHorizontalDragUpdate: (details) {
                                            // Move only the icon
                                            setState(() {
                                              _iconPosition += details.delta
                                                  .dx; // Update the icon's position based on the drag
                                            });
                                          },
                                          onHorizontalDragEnd: (details) {
                                            if (_iconPosition > 100) {
                                              // Handle action for reaching the destination
                                              print("Destination Reached");
                                              setState(() {
                                                _rideCompleted =
                                                    true; // Mark ride as completed
                                                _iconPosition =
                                                    0; // Reset position
                                              });
                                            } else {
                                              // Reset icon position if not swiped far enough
                                              setState(() {
                                                _iconPosition =
                                                    0; // Reset position
                                              });
                                            }
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: _iconPosition),
                                            child: Image.network(
                                              'https://cdn-icons-png.flaticon.com/512/6130/6130466.png',
                                              height: 60,
                                              width: 60,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            _rideCompleted
                                                ? 'Ride Completed'
                                                : 'Swipe to complete ride', // Change text based on ride status
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 165,
                        right: 20,
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 4,
                                blurRadius: 4,
                                color: Color(0xffc2c2c2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/1016/1016039.png',
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
