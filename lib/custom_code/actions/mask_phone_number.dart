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

Future<String> maskPhoneNumber(String phoneNumber) async {
  // Remove todos os caracteres não numéricos
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

  // Verifica se o número é celular (11 dígitos) ou fixo (10 dígitos) e aplica a máscara
  if (phoneNumber.length == 11) {
    // Para celular: (**) *****-**** com os primeiros 5 números mascarados
    return '(${phoneNumber.substring(0, 2)})*****-${phoneNumber.substring(7)}';
  } else if (phoneNumber.length == 10) {
    // Para fixo: (**) ****-**** com os primeiros 4 números mascarados
    return '(${phoneNumber.substring(0, 2)})****-${phoneNumber.substring(6)}';
  } else {
    // Se o número for menor que 10 dígitos, retorna o valor original
    return phoneNumber;
  }
}
