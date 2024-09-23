// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geolocator/geolocator.dart';

Future<void> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('Serviço de localização está desabilitado.');
    return;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Permissão de localização foi negada.');
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    print('Permissão de localização foi negada permanentemente.');
    return;
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  // Formata a latitude e longitude para 14 casas decimais
  double currentLat = double.parse(position.latitude.toStringAsFixed(14));
  double currentLng = double.parse(position.longitude.toStringAsFixed(14));

  FFAppState().currentLat = currentLat;
  FFAppState().currentLng = currentLng;

  print(
      'Latitude: ${FFAppState().currentLat}, Longitude: ${FFAppState().currentLng}');
}
