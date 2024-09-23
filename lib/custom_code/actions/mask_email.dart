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

Future<String> maskEmail(String email) async {
  // Verifica se o email contém @ e um domínio válido
  int atIndex = email.indexOf('@');
  if (atIndex > 2) {
    // Mantém os últimos 4 caracteres antes do '@', e mascara o restante
    return '${'*' * (atIndex - 4)}${email.substring(atIndex - 4)}';
  } else {
    return email; // Retorna o email sem formatação se for muito curto
  }
}
