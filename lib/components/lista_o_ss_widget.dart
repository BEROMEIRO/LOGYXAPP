import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lista_o_ss_model.dart';

export 'lista_o_ss_model.dart';

class ListaOSsWidget extends StatefulWidget {
  const ListaOSsWidget({
    super.key,
    this.numOS,
    this.botaoExcluir,
  });

  final String? numOS;
  final int? botaoExcluir;

  @override
  State<ListaOSsWidget> createState() => _ListaOSsWidgetState();
}

class _ListaOSsWidgetState extends State<ListaOSsWidget> {
  late ListaOSsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaOSsModel());

    _model.textController ??= TextEditingController(text: widget.numOS);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  Future<void> _handleDelete() async {
    bool shouldProceed = false;

    if ((FFAppState().ossList.contains(widget.numOS) == false) &&
        (widget.botaoExcluir != null)) {
      FFAppState().ossList = [];
      FFAppState().isDropdownVisible = false;
      FFAppState().isFirstDropdownSelected = false;
      FFAppState().isSecondDropdownSelected = false;
      FFAppState().isThirdDropdownSelected = false;

      // Exibir o diálogo
      shouldProceed = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: const Text('Caso Removido!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(alertDialogContext, true);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          ) ??
          false; // Atribuir o resultado da janela de diálogo a shouldProceed
    } else {
      FFAppState().removeFromOssList(widget.numOS!);
      FFAppState().isFirstDropdownSelected = false;
      FFAppState().isSecondDropdownSelected = false;
      FFAppState().isThirdDropdownSelected = false;

      // Exibir o diálogo
      shouldProceed = await showDialog<bool>(
            context: context,
            builder: (alertDialogContext) {
              return AlertDialog(
                content: const Text('Caso Removido!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(alertDialogContext, true);
                    },
                    child: const Text('Ok'),
                  ),
                ],
              );
            },
          ) ??
          false; // Atribuir o resultado da janela de diálogo a shouldProceed
    }

    // Verificar se deve prosseguir com a navegação
    if (shouldProceed) {
      // Verificar se o widget ainda está montado
      if (mounted) {
        Navigator.of(context).pushNamed(
          'NovoChamado',
          arguments: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              onChanged: (_) => EasyDebounce.debounce(
                '_model.textController',
                const Duration(milliseconds: 2000),
                () async {
                  FFAppState().updateOssListAtIndex(
                    widget.botaoExcluir!,
                    (_) => _model.textController.text,
                  );
                },
              ),
              autofocus: false,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily: 'Readex Pro',
                      letterSpacing: 0.0,
                    ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).alternate,
                    letterSpacing: 0.0,
                  ),
              validator: _model.textControllerValidator.asValidator(context),
            ),
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            if (mounted) {
              await _handleDelete(); // Chama o método para lidar com a exclusão
            }
          },
          text: 'Excluir',
          icon: const Icon(
            Icons.delete_forever_sharp,
            size: 15.0,
          ),
          options: FFButtonOptions(
            height: 40.0,
            padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 5.0, 0.0),
            iconPadding:
                const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).error,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: Colors.white,
                  letterSpacing: 0.0,
                ),
            elevation: 3.0,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ],
    );
  }
}
