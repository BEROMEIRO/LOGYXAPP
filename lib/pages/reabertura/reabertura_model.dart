import 'package:logyxapp/components/lista_o_ss_model.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reabertura_widget.dart' show ReaberturaWidget;
import 'package:flutter/material.dart';

class ReaberturaModel extends FlutterFlowModel<ReaberturaWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for osControllerReaberturaTxtField widget.
  FocusNode? osControllerReaberturaTxtFieldFocusNode;
  TextEditingController? osControllerReaberturaTxtFieldTextController;
  String? Function(BuildContext, String?)?
      osControllerReaberturaTxtFieldTextControllerValidator;
  String? _osControllerReaberturaTxtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^[a-zA-Z0-9-_]*\$').hasMatch(val)) {
      return 'Caractere especial não permitido';
    }
    return null;
  }

  late FlutterFlowDynamicModels<ListaOSsModel> listaOSsModels;
  // State field(s) for DropDProjeto widget.
  String? dropDProjetoValue;
  FormFieldController<String>? dropDProjetoValueController;
  // Stores action output result for [Backend Call - API (APIProjeto)] action in DropDProjeto widget.
  ApiCallResponse? apiProjetoResp;
  // State field(s) for DropDOcorrencia widget.
  String? dropDOcorrenciaValue;
  FormFieldController<String>? dropDOcorrenciaValueController;
  // Stores action output result for [Backend Call - API (APIOcorrencia)] action in DropDOcorrencia widget.
  ApiCallResponse? apiOcorrenciaResp;
  // State field(s) for DropDTipo widget.
  String? dropDTipoValue;
  FormFieldController<String>? dropDTipoValueController;
  // Stores action output result for [Backend Call - API (APITiposPedidos)] action in DropDTipo widget.
  ApiCallResponse? apiTipoResp;
  // State field(s) for TextFieldDescricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoTextController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (APIUploadImageName)] action in IconButton widget.
  ApiCallResponse? apiimagereaberturaok;
  // Stores action output result for [Backend Call - API (APIAbertura)] action in Button widget.
  ApiCallResponse? aPIAbertura;

  @override
  void initState(BuildContext context) {
    osControllerReaberturaTxtFieldTextControllerValidator =
        _osControllerReaberturaTxtFieldTextControllerValidator;
    listaOSsModels = FlutterFlowDynamicModels(() => ListaOSsModel());
  }

  @override
  void dispose() {
    osControllerReaberturaTxtFieldFocusNode?.dispose();
    osControllerReaberturaTxtFieldTextController?.dispose();

    listaOSsModels.dispose();
    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoTextController?.dispose();
  }
}
