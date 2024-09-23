import '/flutter_flow/flutter_flow_util.dart';
import 'lista_o_ss_widget.dart' show ListaOSsWidget;
import 'package:flutter/material.dart';

class ListaOSsModel extends FlutterFlowModel<ListaOSsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
