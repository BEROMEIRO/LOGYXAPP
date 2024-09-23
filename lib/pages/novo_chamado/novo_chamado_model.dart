import '/backend/api_requests/api_calls.dart';
import '/components/lista_o_ss_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'novo_chamado_widget.dart' show NovoChamadoWidget;
import 'package:flutter/material.dart';

class NovoChamadoModel extends FlutterFlowModel<NovoChamadoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for osController widget.
  FocusNode? osControllerFocusNode;
  TextEditingController? osControllerTextController;
  String? Function(BuildContext, String?)? osControllerTextControllerValidator;
  String? _osControllerTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^[a-zA-Z0-9-_]*\$').hasMatch(val)) {
      return 'Caractere especial não permitido';
    }
    return null;
  }

  // Models for ListaOSs dynamic component.
  late FlutterFlowDynamicModels<ListaOSsModel> listaOSsModels;
  // State field(s) for DropDProjeto widget.
  String? dropDProjetoValue;
  FormFieldController<String>? dropDProjetoValueController;
  // Stores action output result for [Backend Call - API (APIProjeto)] action in DropDProjeto widget.
  ApiCallResponse? apiProjetoResp;
  // State field(s) for DropDOcorrencia widget.
  String? dropDOcorrenciaValue;
  FormFieldController<String>? dropDOcorrenciaValueController;
  // State field(s) for DropDTipo widget.
  String? dropDTipoValue;
  FormFieldController<String>? dropDTipoValueController;
  // Stores action output result for [Backend Call - API (APIProjeto)] action in DropDTipo widget.
  ApiCallResponse? apiResult7gb;
  // State field(s) for TextFieldDescricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoTextController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (APIUploadImageName)] action in IconButton widget.
  ApiCallResponse? apiimageok;
  // Stores action output result for [Backend Call - API (APIAbertura)] action in Button widget.
  ApiCallResponse? aPIAbertura;

  @override
  void initState(BuildContext context) {
    osControllerTextControllerValidator = _osControllerTextControllerValidator;
    listaOSsModels = FlutterFlowDynamicModels(() => ListaOSsModel());
  }

  @override
  void dispose() {
    osControllerFocusNode?.dispose();
    osControllerTextController?.dispose();

    listaOSsModels.dispose();
    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoTextController?.dispose();
  }
}
