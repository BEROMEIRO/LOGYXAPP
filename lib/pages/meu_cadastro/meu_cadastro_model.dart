import '/flutter_flow/flutter_flow_util.dart';
import 'meu_cadastro_widget.dart' show MeuCadastroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MeuCadastroModel extends FlutterFlowModel<MeuCadastroWidget> {
  ///  State fields for stateful widgets in this page.

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
  // Stores action output result for [Custom Action - formatPhoneNumberAction] action in Telefone_txt_field widget.
  String? ajustaformatotel;
  // State field(s) for User_Name_txt_field widget.
  FocusNode? userNameTxtFieldFocusNode;
  TextEditingController? userNameTxtFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTxtFieldTextControllerValidator;
  // State field(s) for Nome_txt_field widget.
  FocusNode? nomeTxtFieldFocusNode;
  TextEditingController? nomeTxtFieldTextController;
  String? Function(BuildContext, String?)? nomeTxtFieldTextControllerValidator;
  // State field(s) for email_txtfield widget.
  FocusNode? emailTxtfieldFocusNode;
  TextEditingController? emailTxtfieldTextController;
  String? Function(BuildContext, String?)? emailTxtfieldTextControllerValidator;
  // State field(s) for CPF_txt_field widget.
  FocusNode? cPFTxtFieldFocusNode;
  TextEditingController? cPFTxtFieldTextController;
  final cPFTxtFieldMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cPFTxtFieldTextControllerValidator;
  // State field(s) for Unidade_txt_field widget.
  FocusNode? unidadeTxtFieldFocusNode;
  TextEditingController? unidadeTxtFieldTextController;
  String? Function(BuildContext, String?)?
      unidadeTxtFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    telefoneTxtFieldFocusNode?.dispose();
    telefoneTxtFieldTextController?.dispose();

    userNameTxtFieldFocusNode?.dispose();
    userNameTxtFieldTextController?.dispose();

    nomeTxtFieldFocusNode?.dispose();
    nomeTxtFieldTextController?.dispose();

    emailTxtfieldFocusNode?.dispose();
    emailTxtfieldTextController?.dispose();

    cPFTxtFieldFocusNode?.dispose();
    cPFTxtFieldTextController?.dispose();

    unidadeTxtFieldFocusNode?.dispose();
    unidadeTxtFieldTextController?.dispose();
  }
}
