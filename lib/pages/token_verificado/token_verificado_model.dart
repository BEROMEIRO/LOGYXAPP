import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'token_verificado_widget.dart' show TokenVerificadoWidget;
import 'package:flutter/material.dart';

class TokenVerificadoModel extends FlutterFlowModel<TokenVerificadoWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Nome_txt_field widget.
  FocusNode? nomeTxtFieldFocusNode;
  TextEditingController? nomeTxtFieldTextController;
  String? Function(BuildContext, String?)? nomeTxtFieldTextControllerValidator;
  // State field(s) for Token_txt_field widget.
  FocusNode? tokenTxtFieldFocusNode;
  TextEditingController? tokenTxtFieldTextController;
  late bool tokenTxtFieldVisibility;
  String? Function(BuildContext, String?)? tokenTxtFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (APIValidaToken)] action in Button widget.
  ApiCallResponse? validatokenresp;

  @override
  void initState(BuildContext context) {
    tokenTxtFieldVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeTxtFieldFocusNode?.dispose();
    nomeTxtFieldTextController?.dispose();

    tokenTxtFieldFocusNode?.dispose();
    tokenTxtFieldTextController?.dispose();
  }
}
