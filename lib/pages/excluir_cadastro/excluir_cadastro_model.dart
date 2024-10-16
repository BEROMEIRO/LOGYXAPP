import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'excluir_cadastro_widget.dart' show ExcluirCadastroWidget;
import 'package:flutter/material.dart';

class ExcluirCadastroModel extends FlutterFlowModel<ExcluirCadastroWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for User_Name_txt_field widget.
  FocusNode? userNameTxtFieldFocusNode;
  TextEditingController? userNameTxtFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTxtFieldTextControllerValidator;
  // State field(s) for Senha_txt_field widget.
  FocusNode? senhaTxtFieldFocusNode;
  TextEditingController? senhaTxtFieldTextController;
  late bool senhaTxtFieldVisibility;
  String? Function(BuildContext, String?)? senhaTxtFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (APIDeletaUser)] action in Button widget.
  ApiCallResponse? deletadoapi;

  @override
  void initState(BuildContext context) {
    senhaTxtFieldVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    userNameTxtFieldFocusNode?.dispose();
    userNameTxtFieldTextController?.dispose();

    senhaTxtFieldFocusNode?.dispose();
    senhaTxtFieldTextController?.dispose();
  }
}
