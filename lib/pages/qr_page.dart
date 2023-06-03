import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';


class QrPage extends StatefulWidget {
  QrPage({super.key});


  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {

  var getResult = 'QR Code Result';

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
            padding: const EdgeInsets.only(left:80.0, right:80.0,bottom:80,top:120),
            child: Image.asset('lib/images/coffeeBetter.png'),
          ),
          const Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textAlign: TextAlign.center,
          "Loyalty points for our most loyal customers",
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      Text("In store only", style: TextStyle(color: Colors.grey[600])),
      const Spacer(),

            GestureDetector(
              onTap: _determinePosition,
             child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[200],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(16),
          child: Text("Get started", style: TextStyle(color: Colors.white),),
        ),
              
              
            ),
            SizedBox(height: 20.0,),
           
          ],
        )
      ),
    );
  }

  void scanQRCode() async {
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }

  }

}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

// Import package


