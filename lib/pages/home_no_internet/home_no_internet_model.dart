import '/backend/api_requests/api_calls.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_no_internet_widget.dart' show HomeNoInternetWidget;
import 'package:flutter/material.dart';

class HomeNoInternetModel extends FlutterFlowModel<HomeNoInternetWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (APIValidaInternet)] action in Home_no_Internet widget.
  ApiCallResponse? internetok;
  // Model for Sidebar component.
  late SidebarModel sidebarModel;
  // State field(s) for TXT0800 widget.
  FocusNode? txt0800FocusNode;
  TextEditingController? txt0800TextController;
  String? Function(BuildContext, String?)? txt0800TextControllerValidator;
  // State field(s) for TXTWPP widget.
  FocusNode? txtwppFocusNode;
  TextEditingController? txtwppTextController;
  String? Function(BuildContext, String?)? txtwppTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sidebarModel = createModel(context, () => SidebarModel());
  }

  @override
  void dispose() {
    sidebarModel.dispose();
    txt0800FocusNode?.dispose();
    txt0800TextController?.dispose();

    txtwppFocusNode?.dispose();
    txtwppTextController?.dispose();
  }
}
