import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for UserName_txt_field widget.
  FocusNode? userNameTxtFieldFocusNode;
  TextEditingController? userNameTxtFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTxtFieldTextControllerValidator;
  // State field(s) for Senha_txt_field widget.
  FocusNode? senhaTxtFieldFocusNode;
  TextEditingController? senhaTxtFieldTextController;
  late bool senhaTxtFieldVisibility;
  String? Function(BuildContext, String?)? senhaTxtFieldTextControllerValidator;
  // Stores action output result for [Backend Call - API (APILogin)] action in Button widget.
  ApiCallResponse? apilogin;

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
