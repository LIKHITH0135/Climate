import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
class Location {
  late double latitude;
  late double longitude;
 Future<void> getCurrentLocation() async{
    try {

      // Check if the app has location permission
      var status = await Permission.location.request();
      if (status == PermissionStatus.granted) {
        // Permission granted, proceed to get location
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
        );
        latitude = position.latitude;
        longitude =position.longitude;
        print('Latitude is $latitude ,Logitude is $longitude');
      } else {
        // Permission denied, handle accordingly (show a message, ask again, etc.)
        print("Permission denied");
      }
    } catch (e) {
      print("Error getting location: $e");
      // Handle the error appropriately, e.g., show an error message to the user.
    }
  }
}


// double temprature = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
// String cityName = decodedData['name'];