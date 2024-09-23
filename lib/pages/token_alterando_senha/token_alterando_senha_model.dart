import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'token_alterando_senha_widget.dart' show TokenAlterandoSenhaWidget;
import 'package:flutter/material.dart';

class TokenAlterandoSenhaModel
    extends FlutterFlowModel<TokenAlterandoSenhaWidget> {
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
  // State field(s) for Senha_txt_field widget.
  FocusNode? senhaTxtFieldFocusNode;
  TextEditingController? senhaTxtFieldTextController;
  late bool senhaTxtFieldVisibility;
  String? Function(BuildContext, String?)? senhaTxtFieldTextControllerValidator;
  String? _senhaTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 6) {
      return 'A senha deve conter pelo menos 6 caracteres!';
    }

    if (!RegExp(
            '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$')
        .hasMatch(val)) {
      return 'Usar letras maiúsculas/minúsculas, núm. e caractere especial.';
    }
    return null;
  }

  // State field(s) for Senha_Conf_txt_field widget.
  FocusNode? senhaConfTxtFieldFocusNode;
  TextEditingController? senhaConfTxtFieldTextController;
  late bool senhaConfTxtFieldVisibility;
  String? Function(BuildContext, String?)?
      senhaConfTxtFieldTextControllerValidator;
  String? _senhaConfTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 6) {
      return 'A senha deve conter pelo menos 6 caracteres!';
    }

    if (!RegExp(
            '^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@\$!%*?&])[A-Za-z\\d@\$!%*?&]{8,}\$')
        .hasMatch(val)) {
      return 'Usar letras maiúsculas/minúsculas, núm. e caractere especial.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (APIAlteraSenha)] action in Button widget.
  ApiCallResponse? alterasenharesp;

  @override
  void initState(BuildContext context) {
    senhaTxtFieldVisibility = false;
    senhaTxtFieldTextControllerValidator =
        _senhaTxtFieldTextControllerValidator;
    senhaConfTxtFieldVisibility = false;
    senhaConfTxtFieldTextControllerValidator =
        _senhaConfTxtFieldTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    nomeTxtFieldFocusNode?.dispose();
    nomeTxtFieldTextController?.dispose();

    senhaTxtFieldFocusNode?.dispose();
    senhaTxtFieldTextController?.dispose();

    senhaConfTxtFieldFocusNode?.dispose();
    senhaConfTxtFieldTextController?.dispose();
  }
}
