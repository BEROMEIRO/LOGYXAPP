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

Future<String> formatPhoneNumberAction(String input) async {
  // Remove todos os caracteres que não sejam números
  input = input.replaceAll(RegExp(r'\D'), '');

  // Limitar o comprimento para 11 caracteres (DDD + número)
  if (input.length > 11) {
    input = input.substring(0, 11);
  }

  // Aplicar a formatação (XX) XXXXX-XXXX
  if (input.length >= 3 && input.length <= 6) {
    input = '(${input.substring(0, 2)}) ${input.substring(2)}';
  } else if (input.length >= 7) {
    input =
        '(${input.substring(0, 2)}) ${input.substring(2, 7)}-${input.substring(7)}';
  }

  // Retorna o número de telefone formatado
  return input;
}
