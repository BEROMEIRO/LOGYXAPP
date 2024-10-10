import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'criar_user_widget.dart' show CriarUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
// import 'package:flutter/services.dart';

class CriarUserModel extends FlutterFlowModel<CriarUserWidget> {
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
  // State field(s) for User_Name_txt_field widget.
  FocusNode? userNameTxtFieldFocusNode;
  TextEditingController? userNameTxtFieldTextController;
  String? Function(BuildContext, String?)?
      userNameTxtFieldTextControllerValidator;
  String? _userNameTxtFieldTextControllerValidator(
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

  // State field(s) for CPF_txt_field widget.
  FocusNode? cPFTxtFieldFocusNode;
  TextEditingController? cPFTxtFieldTextController;
  final cPFTxtFieldMask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cPFTxtFieldTextControllerValidator;

  String? _cPFTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    // if (!RegExp('^\\d{3}\\.\\d{3}\\.\\d{3}\\-\\d{2}\$').hasMatch(val)) {
    //   return 'CPF inválido!';
    // }

    // Remove caracteres não numéricos (se necessário para uso posterior)
    String cpf = val.replaceAll(RegExp(r'\D'), '');

    // Se necessário, adicione outras validações aqui, caso você queira
    // Verifica se o CPF contém 11 dígitos e se não são todos iguais
    if (cpf.length != 11 || List.filled(11, cpf[0]).join() == cpf) {
      return 'CPF inválido!'; // CPF com todos os dígitos iguais ou com menos de 11 dígitos
    }

    // Lógica de validação dos dígitos verificadores
    // int sum = 0;
    // int remainder;

    // for (int i = 1; i <= 9; i++) {
    //   sum += int.parse(cpf[i - 1]) * (11 - i);
    // }

    // remainder = (sum * 10) % 11;
    // if (remainder == 10 || remainder == 11) {
    //   remainder = 0;
    // }
    // if (remainder != int.parse(cpf[9])) {
    //   return 'CPF inválido!'; // Primeiro dígito verificador inválido
    // }

    // sum = 0;
    // for (int i = 1; i <= 10; i++) {
    //   sum += int.parse(cpf[i - 1]) * (12 - i);
    // }

    // remainder = (sum * 10) % 11;
    // if (remainder == 10 || remainder == 11) {
    //   remainder = 0;
    // }
    // if (remainder != int.parse(cpf[10])) {
    //   return 'CPF inválido!'; // Segundo dígito verificador inválido
    // }

    // Apenas queremos manter o formato correto por enquanto.

    return null; // CPF válido
  }

  // State field(s) for Unidade_txt_field widget.
  FocusNode? unidadeTxtFieldFocusNode;
  TextEditingController? unidadeTxtFieldTextController;
  String? Function(BuildContext, String?)?
      unidadeTxtFieldTextControllerValidator;
  String? _unidadeTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

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

  // Stores action output result for [Backend Call - API (APICriaOUsuario)] action in Button widget.
  ApiCallResponse? aPICriarUser;

  @override
  void initState(BuildContext context) {
    telefoneTxtFieldTextControllerValidator =
        _telefoneTxtFieldTextControllerValidator;
    userNameTxtFieldTextControllerValidator =
        _userNameTxtFieldTextControllerValidator;
    nomeTxtFieldTextControllerValidator = _nomeTxtFieldTextControllerValidator;
    emailTxtfieldTextControllerValidator =
        _emailTxtfieldTextControllerValidator;
    cPFTxtFieldTextControllerValidator = _cPFTxtFieldTextControllerValidator;
    unidadeTxtFieldTextControllerValidator =
        _unidadeTxtFieldTextControllerValidator;
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

    senhaTxtFieldFocusNode?.dispose();
    senhaTxtFieldTextController?.dispose();

    senhaConfTxtFieldFocusNode?.dispose();
    senhaConfTxtFieldTextController?.dispose();
  }
}
