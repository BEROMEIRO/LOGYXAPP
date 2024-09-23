import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'token_solicitado_user_name_widget.dart'
    show TokenSolicitadoUserNameWidget;
import 'package:flutter/material.dart';

class TokenSolicitadoUserNameModel
    extends FlutterFlowModel<TokenSolicitadoUserNameWidget> {
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
  String? _nomeTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 6) {
      return 'Pelo menos 6 caracteres!';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Letras, núm ou underline! (Não use espaços)';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (APIRetornaTelefoneEmail)] action in Button widget.
  ApiCallResponse? aPIRecebeTelefoneEmail;
  // Stores action output result for [Custom Action - maskPhoneNumber] action in Button widget.
  String? telemascarado;
  // Stores action output result for [Custom Action - maskEmail] action in Button widget.
  String? emailmascarado;

  @override
  void initState(BuildContext context) {
    nomeTxtFieldTextControllerValidator = _nomeTxtFieldTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeTxtFieldFocusNode?.dispose();
    nomeTxtFieldTextController?.dispose();
  }
}
