import '/backend/api_requests/api_calls.dart';
import '/components/lista_o_ss_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'reabertura_model.dart';
export 'reabertura_model.dart';

class ReaberturaWidget extends StatefulWidget {
  const ReaberturaWidget({
    super.key,
    this.osNumber,
    this.project,
    this.oco,
    this.type,
    this.description,
  });

  final String? osNumber;
  final String? project;
  final String? oco;
  final String? type;
  final String? description;

  @override
  State<ReaberturaWidget> createState() => _ReaberturaWidgetState();
}

class _ReaberturaWidgetState extends State<ReaberturaWidget> {
  late ReaberturaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReaberturaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.getCurrentLocation();
    });

    _model.osControllerReaberturaTxtFieldTextController ??=
        TextEditingController(text: widget.osNumber);
    _model.osControllerReaberturaTxtFieldFocusNode ??= FocusNode();

    _model.textFieldDescricaoTextController ??= TextEditingController();
    _model.textFieldDescricaoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: PopScope(
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: const Color(0xFF3976EF),
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                FFAppState().projeto = '';
                FFAppState().ocorrencia = '';
                FFAppState().tipo = '';
                FFAppState().ossList = [];
                FFAppState().isDropdownVisible = false;
                FFAppState().isDropdownProjetoReset = false;
                FFAppState().isFirstDropdownSelected = false;
                FFAppState().isSecondDropdownSelected = false;
                FFAppState().isThirdDropdownSelected = false;

                context.pushNamed('Home');
              },
            ),
            title: Text(
              'Reabertura do Chamado',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [
              FFButtonWidget(
                onPressed: () async {
                  var shouldSetState = false;
                  if ((_model.dropDProjetoValue == null ||
                          _model.dropDProjetoValue == '') ||
                      (_model.dropDOcorrenciaValue == null ||
                          _model.dropDOcorrenciaValue == '') ||
                      (_model.dropDTipoValue == null ||
                          _model.dropDTipoValue == '') ||
                      (_model.textFieldDescricaoTextController.text == '') ||
                      ((_model.uploadedLocalFile.bytes?.isEmpty ?? true)) ||
                      (FFAppState().ossList.first == '')) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Atenção!'),
                          content: const Text(
                              'Favor preencher todos os dados! OS precisa estar na lista para ser enviado, verificar a descrição da ocorrência e também tirar nova foto!'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  _model.aPIAbertura = await APIAberturaCall.call(
                    telefoneTecnico: FFAppState().telefoneAppState,
                    problemaApresentado:
                        _model.textFieldDescricaoTextController.text,
                    ocorrencia: _model.dropDOcorrenciaValue,
                    projeto: _model.dropDProjetoValue,
                    tipoAtendimento: _model.dropDTipoValue,
                    tecnico: FFAppState().nomeAppState,
                    uid: FFAppState().uidAppState,
                    latitude: FFAppState().currentLat.toString(),
                    longitude: FFAppState().currentLng.toString(),
                    imageurl: FFAppState().urlphoto,
                    unidade: FFAppState().unidadeAppState,
                    ossList: FFAppState().ossList,
                  );

                  setState(() {
                    shouldSetState = true;
                  });

                  if ((_model.aPIAbertura?.succeeded ?? true)) {
                    FFAppState().urlphoto = getJsonField(
                      (_model.apiimagereaberturaok?.jsonBody ?? ''),
                      r'''$.url''',
                    ).toString();

                    if (!mounted) return;
                    context.pushNamed('Home');
                  } else {
                    if (!mounted) return;

                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Faltou informações!'),
                          content: const Text(
                              'Verifique as informações solicitadas'),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Navigator.pop(alertDialogContext),
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  if (shouldSetState) safeSetState(() {});
                },
                text: 'Salvar',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF3976EF),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
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
            centerTitle: true,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Visibility(
              visible: responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 805.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/micro3.png',
                          ).image,
                        ),
                      ),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Form(
                              key: _model.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .osControllerReaberturaTxtFieldTextController,
                                          focusNode: _model
                                              .osControllerReaberturaTxtFieldFocusNode,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Número da OS',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                letterSpacing: 0.0,
                                              ),
                                          validator: _model
                                              .osControllerReaberturaTxtFieldTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }
                                          FFAppState().addToOssList(_model
                                              .osControllerReaberturaTxtFieldTextController
                                              .text);
                                          FFAppState().isDropdownVisible = true;
                                          safeSetState(() {
                                            _model
                                                .osControllerReaberturaTxtFieldTextController
                                                ?.clear();
                                          });
                                        },
                                        text: 'Add na lista',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFFEFA139),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: const BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Builder(
                                builder: (context) {
                                  final listagemOSReaberta =
                                      FFAppState().ossList.toList();

                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listagemOSReaberta.length,
                                    itemBuilder:
                                        (context, listagemOSReabertaIndex) {
                                      final listagemOSReabertaItem =
                                          listagemOSReaberta[
                                              listagemOSReabertaIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ListaOSsWidget(
                                            key: Key(
                                                'Keyope_${listagemOSReabertaIndex}_of_${listagemOSReaberta.length}'),
                                            numOS: listagemOSReabertaItem,
                                            botaoExcluir:
                                                listagemOSReabertaIndex,
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Opacity(
                              opacity: 0.4,
                              child: Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 8.0, 50.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: APIProjetoCall.call(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final dropDProjetoAPIProjetoResponse =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDProjetoValueController ??=
                                            FormFieldController<String>(
                                          _model.dropDProjetoValue ??= () {
                                            if (widget.project == 'TESTE') {
                                              return FFAppState().projeto;
                                            } else if ((getJsonField(
                                                      dropDProjetoAPIProjetoResponse
                                                          .jsonBody,
                                                      r'''$[:].projeto''',
                                                    ) ==
                                                    null) ||
                                                (getJsonField(
                                                      dropDProjetoAPIProjetoResponse
                                                          .jsonBody,
                                                      r'''$[:].projeto''',
                                                    ) ==
                                                    null)) {
                                              return valueOrDefault<String>(
                                                getJsonField(
                                                  dropDProjetoAPIProjetoResponse
                                                      .jsonBody,
                                                  r'''$[:].projeto''',
                                                )?.toString(),
                                                'FIRST',
                                              );
                                            } else {
                                              return widget.project;
                                            }
                                          }(),
                                        ),
                                        options: (getJsonField(
                                                      dropDProjetoAPIProjetoResponse
                                                          .jsonBody,
                                                      r'''$[:].projeto''',
                                                    ) ==
                                                    null) ||
                                                (getJsonField(
                                                      dropDProjetoAPIProjetoResponse
                                                          .jsonBody,
                                                      r'''$[:].projeto''',
                                                    ) ==
                                                    null)
                                            ? APIProjetoCall.cliente(
                                                dropDProjetoAPIProjetoResponse
                                                    .jsonBody,
                                              )!
                                            : (getJsonField(
                                                dropDProjetoAPIProjetoResponse
                                                    .jsonBody,
                                                r'''$[:].projeto''',
                                                true,
                                              ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.dropDProjetoValue = val);
                                          var shouldSetState = false;
                                          _model.apiProjetoResp =
                                              await APIProjetoCall.call();

                                          shouldSetState = true;
                                          if ((_model
                                                  .apiProjetoResp?.succeeded ??
                                              true)) {
                                            FFAppState().projeto =
                                                _model.dropDProjetoValue!;
                                            await Future.delayed(const Duration(
                                                milliseconds: 20));
                                          } else {
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                        },
                                        width: 300.0,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Projeto',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 8.0, 50.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: APIOcorrenciaCall.call(
                                      name: () {
                                        if (widget.project == 'TESTE') {
                                          return FFAppState().projeto;
                                        } else if ((getJsonField(
                                                  (_model.apiProjetoResp
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$[:].projeto''',
                                                ) ==
                                                null) ||
                                            (getJsonField(
                                                  (_model.apiProjetoResp
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$[:].projeto''',
                                                ) ==
                                                null)) {
                                          return FFAppState().projeto;
                                        } else {
                                          return _model.dropDProjetoValue;
                                        }
                                      }(),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final dropDOcorrenciaAPIOcorrenciaResponse =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDOcorrenciaValueController ??=
                                            FormFieldController<String>(
                                          _model.dropDOcorrenciaValue ??= () {
                                            if (widget.project == 'TESTE') {
                                              return FFAppState().ocorrencia;
                                            } else if ((getJsonField(
                                                      dropDOcorrenciaAPIOcorrenciaResponse
                                                          .jsonBody,
                                                      r'''$[:].motivo''',
                                                    ) ==
                                                    null) ||
                                                (getJsonField(
                                                      dropDOcorrenciaAPIOcorrenciaResponse
                                                          .jsonBody,
                                                      r'''$[:].motivo''',
                                                    ) ==
                                                    null)) {
                                              return FFAppState().ocorrencia;
                                            } else {
                                              return widget.oco;
                                            }
                                          }(),
                                        ),
                                        options: (getJsonField(
                                                      dropDOcorrenciaAPIOcorrenciaResponse
                                                          .jsonBody,
                                                      r'''$[:].motivo''',
                                                    ) ==
                                                    null) ||
                                                (getJsonField(
                                                      dropDOcorrenciaAPIOcorrenciaResponse
                                                          .jsonBody,
                                                      r'''$[:].motivo''',
                                                    ) ==
                                                    null)
                                            ? APIOcorrenciaCall.motivo(
                                                dropDOcorrenciaAPIOcorrenciaResponse
                                                    .jsonBody,
                                              )!
                                            : (getJsonField(
                                                dropDOcorrenciaAPIOcorrenciaResponse
                                                    .jsonBody,
                                                r'''$[:].motivo''',
                                                true,
                                              ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() => _model
                                              .dropDOcorrenciaValue = val);
                                          var shouldSetState = false;
                                          _model.apiOcorrenciaResp =
                                              await APIOcorrenciaCall.call(
                                            name: _model.dropDProjetoValue,
                                          );

                                          shouldSetState = true;
                                          if ((_model.apiOcorrenciaResp
                                                  ?.succeeded ??
                                              true)) {
                                            await Future.delayed(const Duration(
                                                milliseconds: 20));
                                          } else {
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                        },
                                        width: 300.0,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Ocorrência',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 8.0, 50.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: APITiposPedidosCall.call(
                                      projeto: () {
                                        if (widget.project == 'TESTE') {
                                          return FFAppState().projeto;
                                        } else if ((getJsonField(
                                                  (_model.apiProjetoResp
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$[:].projeto''',
                                                ) ==
                                                null) ||
                                            (getJsonField(
                                                  (_model.apiProjetoResp
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$[:].projeto''',
                                                ) ==
                                                null)) {
                                          return getJsonField(
                                            (_model.apiProjetoResp?.jsonBody ??
                                                ''),
                                            r'''$[:].projeto''',
                                          ).toString();
                                        } else {
                                          return widget.project;
                                        }
                                      }(),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final dropDTipoAPITiposPedidosResponse =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDTipoValueController ??=
                                                FormFieldController<String>(
                                          _model.dropDTipoValue ??= () {
                                            if (widget.project == 'TESTE') {
                                              return FFAppState().tipo;
                                            } else if ((getJsonField(
                                                      (_model.apiTipoResp
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$[:].Tipo_Atendimento''',
                                                    ) ==
                                                    null) ||
                                                (getJsonField(
                                                      (_model.apiTipoResp
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$[:].Tipo_Atendimento''',
                                                    ) ==
                                                    null)) {
                                              return FFAppState().tipo;
                                            } else {
                                              return widget.type;
                                            }
                                          }(),
                                        ),
                                        options: (getJsonField(
                                                      (_model.apiTipoResp
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$[:].Tipo_Atendimento''',
                                                    ) ==
                                                    null) &&
                                                (getJsonField(
                                                      (_model.apiTipoResp
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$[:].Tipo_Atendimento''',
                                                    ) ==
                                                    null)
                                            ? APITiposPedidosCall
                                                .tipoAtendimento(
                                                dropDTipoAPITiposPedidosResponse
                                                    .jsonBody,
                                              )!
                                            : (getJsonField(
                                                (_model.apiTipoResp?.jsonBody ??
                                                    ''),
                                                r'''$[:].Tipo_Atendimento''',
                                                true,
                                              ) as List)
                                                .map<String>(
                                                    (s) => s.toString())
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.dropDTipoValue = val);
                                          var shouldSetState = false;
                                          _model.apiTipoResp =
                                              await APITiposPedidosCall.call(
                                            projeto: FFAppState().projeto,
                                          );

                                          shouldSetState = true;
                                          if ((_model.apiTipoResp?.succeeded ??
                                              true)) {
                                            await Future.delayed(const Duration(
                                                milliseconds: 50));
                                          } else {
                                            if (shouldSetState) {
                                              safeSetState(() {});
                                            }
                                            return;
                                          }

                                          if (shouldSetState) {
                                            safeSetState(() {});
                                          }
                                        },
                                        width: 300.0,
                                        height: 56.0,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: 'Tipo',
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 2.0,
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: const EdgeInsetsDirectional
                                            .fromSTEB(16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (FFAppState().isDropdownVisible)
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .textFieldDescricaoTextController,
                                            focusNode: _model
                                                .textFieldDescricaoFocusNode,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintText: 'Descrição',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  letterSpacing: 0.0,
                                                ),
                                            validator: _model
                                                .textFieldDescricaoTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Opacity(
                              opacity: 0.4,
                              child: Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Opacity(
                                      opacity: 0.89,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 15.0,
                                          borderWidth: 1.0,
                                          buttonSize: 50.0,
                                          fillColor: const Color(0xFF4898F8),
                                          disabledColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          icon: Icon(
                                            Icons.camera_alt_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 25.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed:
                                              (_model.textFieldDescricaoTextController
                                                          .text ==
                                                      '')
                                                  ? null
                                                  : () async {
                                                      var shouldSetState =
                                                          false;
                                                      final selectedMedia =
                                                          await selectMedia(
                                                        maxWidth: 720.00,
                                                        maxHeight: 720.00,
                                                        imageQuality: 90,
                                                        multiImage: false,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        safeSetState(() => _model
                                                                .isDataUploading =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        try {
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
                                                                        height: m
                                                                            .dimensions
                                                                            ?.height,
                                                                        width: m
                                                                            .dimensions
                                                                            ?.width,
                                                                        blurHash:
                                                                            m.blurHash,
                                                                      ))
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading =
                                                              false;
                                                        }
                                                        if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length) {
                                                          safeSetState(() {
                                                            _model.uploadedLocalFile =
                                                                selectedUploadedFiles
                                                                    .first;
                                                          });
                                                        } else {
                                                          safeSetState(() {});
                                                          return;
                                                        }
                                                      }

                                                      _model.apiimagereaberturaok =
                                                          await APIUploadImageNameCall
                                                              .call(
                                                        file: _model
                                                            .uploadedLocalFile,
                                                        os: FFAppState()
                                                            .ossList[0],
                                                        uid: FFAppState()
                                                            .uidAppState,
                                                        latitude: FFAppState()
                                                            .currentLat
                                                            .toString(),
                                                        longitude: FFAppState()
                                                            .currentLng
                                                            .toString(),
                                                      );

                                                      shouldSetState = true;
                                                      if ((_model
                                                              .apiimagereaberturaok
                                                              ?.succeeded ??
                                                          true)) {
                                                        FFAppState().urlphoto =
                                                            getJsonField(
                                                          (_model.apiimagereaberturaok
                                                                  ?.jsonBody ??
                                                              ''),
                                                          r'''$.url''',
                                                        ).toString();
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: const Text(
                                                                  'FOTO SALVA!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child:
                                                                      const Text(
                                                                          'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        if (shouldSetState) {
                                                          safeSetState(() {});
                                                        }
                                                        return;
                                                      }

                                                      if (shouldSetState) {
                                                        safeSetState(() {});
                                                      }
                                                    },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
