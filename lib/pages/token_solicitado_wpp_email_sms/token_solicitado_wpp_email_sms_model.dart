import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'token_solicitado_wpp_email_sms_widget.dart'
    show TokenSolicitadoWppEmailSmsWidget;
import 'package:flutter/material.dart';

class TokenSolicitadoWppEmailSmsModel
    extends FlutterFlowModel<TokenSolicitadoWppEmailSmsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Nome_txt_field widget.
  FocusNode? nomeTxtFieldFocusNode;
  TextEditingController? nomeTxtFieldTextController;
  String? Function(BuildContext, String?)? nomeTxtFieldTextControllerValidator;
  // State field(s) for CheckboxWpp widget.
  bool? checkboxWppValue;
  // State field(s) for CheckboxEMAIL widget.
  bool? checkboxEMAILValue;
  // State field(s) for CheckboxSMS widget.
  bool? checkboxSMSValue;
  // Stores action output result for [Backend Call - API (APICriaeEnviaToken)] action in Button widget.
  ApiCallResponse? apirespcriatoken;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeTxtFieldFocusNode?.dispose();
    nomeTxtFieldTextController?.dispose();
  }
}
