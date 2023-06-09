import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:geexclub/pages/Scanner/QRscannerOverlay.dart';
import 'package:geexclub/pages/Scanner/foundScreen.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  MobileScannerController  cameraController = MobileScannerController();
  bool _screenOpened = false;

  @override
  void initState() {
    // TODO: implement initState
    this._screenWasClosed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: _foundBarcode,
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
        ],
      )
    );
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args){
    print(barcode);
    if(!_screenOpened){
      final String code = barcode.rawValue ?? "___";
      _screenOpened = false;
      //here push navigation result page
      Navigator.push(context, MaterialPageRoute(builder: (context)=> FoundScreen(value: code, screenClose: _screenWasClosed))).then((value) => print(value));

          // builder: builder) => FoundScreen(value: code, screenClose: _screenWasClosed))
    }
  }

  void _screenWasClosed(){
    _screenOpened = false;
  }
}