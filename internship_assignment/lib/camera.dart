import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
// ...

class OpenCamera extends StatefulWidget {
  const OpenCamera({Key? key}) : super(key: key);

  @override
  _OpenCameraState createState() => _OpenCameraState();
}

class _OpenCameraState extends State<OpenCamera> {
  File? image;
  Position? userLocation;

  Future<void> getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });

      // Get user's location after taking the picture
      final position = await _getUserLocation();
      setState(() {
        userLocation = position;
      });
    }
  }

  Future<Position> _getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied');
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(
        'Latitude: ${userLocation!.latitude}, Longitude: ${userLocation!.longitude}');
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: IconButton(
              onPressed: () => getImage(),
              icon: Icon(
                Icons.camera,
                size: 50,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Please Click a selfie",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Tap on icon to open camera",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (image != null) Image.file(image!),
          if (userLocation != null)
            Text(
                'Latitude: ${userLocation!.latitude}, Longitude: ${userLocation!.longitude}'),
                
        ],
      ),
    );
  }
}
