import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ajuste_cadastral_widget.dart' show AjusteCadastralWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AjusteCadastralModel extends FlutterFlowModel<AjusteCadastralWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Telefone_txt_field widget.
  FocusNode? telefoneTxtFieldFocusNode;
  TextEditingController? telefoneTxtFieldTextController;
  final telefoneTxtFieldMask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)?
      telefoneTxtFieldTextControllerValidator;
  String? _telefoneTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Custom Action - formatPhoneNumberAction] action in Telefone_txt_field widget.
  String? ajustaformatotel;
  // State field(s) for Nome_txt_field widget.
  FocusNode? nomeTxtFieldFocusNode;
  TextEditingController? nomeTxtFieldTextController;
  String? Function(BuildContext, String?)? nomeTxtFieldTextControllerValidator;
  String? _nomeTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for email_txtfield widget.
  FocusNode? emailTxtfieldFocusNode;
  TextEditingController? emailTxtfieldTextController;
  String? Function(BuildContext, String?)? emailTxtfieldTextControllerValidator;
  String? _emailTxtfieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido!';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (APIAlteraCadastro)] action in Button widget.
  ApiCallResponse? apiResult1l4;

  @override
  void initState(BuildContext context) {
    telefoneTxtFieldTextControllerValidator =
        _telefoneTxtFieldTextControllerValidator;
    nomeTxtFieldTextControllerValidator = _nomeTxtFieldTextControllerValidator;
    emailTxtfieldTextControllerValidator =
        _emailTxtfieldTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    telefoneTxtFieldFocusNode?.dispose();
    telefoneTxtFieldTextController?.dispose();

    nomeTxtFieldFocusNode?.dispose();
    nomeTxtFieldTextController?.dispose();

    emailTxtfieldFocusNode?.dispose();
    emailTxtfieldTextController?.dispose();
  }
}
