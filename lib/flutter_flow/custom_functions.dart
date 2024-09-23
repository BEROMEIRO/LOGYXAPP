import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/custom_auth/auth_util.dart';

String? generateGoogleMapsURL(
  String? lat,
  String? lng,
) {
  // create a function in Flutter that opens a Google Maps URL with my current location dynamically every time I open or refresh the app and using: if (FFAppState().currentLat == null || FFAppState().currentLng == null) {     return 'https://www.google.com/maps';   }      final lat = FFAppState().currentLat;   final lng = FFAppState().currentLng;    return 'https://www.google.com/maps/search/?api=1&query=$lat,$lng'; }
  if (lat == null || lng == null) {
    return 'https://www.google.com/maps';
  }
  final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
  return url;
}

String? validateUsername() {
  String username = '';
  final regex = RegExp(r'^[a-zA-Z0-9_]+$');
  if (username.length < 6) {
    return 'O nome de usuário deve conter pelo menos 6 caracteres!';
  }
  if (!regex.hasMatch(username)) {
    return 'O nome de usuário deve conter apenas letras, números e underline! (Não use espaços)';
  }
  return null;
}
