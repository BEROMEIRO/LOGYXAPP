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
import 'novo_chamado_model.dart';
export 'novo_chamado_model.dart';

class NovoChamadoWidget extends StatefulWidget {
  const NovoChamadoWidget({
    super.key,
    this.osNumber,
  });

  final String? osNumber;

  @override
  State<NovoChamadoWidget> createState() => _NovoChamadoWidgetState();
}

class _NovoChamadoWidgetState extends State<NovoChamadoWidget> {
  late NovoChamadoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NovoChamadoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.getCurrentLocation();
    });

    _model.osControllerTextController ??= TextEditingController();
    _model.osControllerFocusNode ??= FocusNode();

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
                FFAppState().urlphoto = '';
                FFAppState().isDropdownVisible = false;
                FFAppState().isDropdownProjetoReset = false;
                FFAppState().isFirstDropdownSelected = false;
                FFAppState().isSecondDropdownSelected = false;
                FFAppState().isThirdDropdownSelected = false;

                context.goNamed('Home');
              },
            ),
            title: Text(
              'Novo Chamado',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [
              FFButtonWidget(
                onPressed: () async {
                  var shouldSetState = false;
                  if ((FFAppState().ossList.first == '') ||
                      (_model.dropDProjetoValue == null ||
                          _model.dropDProjetoValue == '') ||
                      (_model.dropDOcorrenciaValue == null ||
                          _model.dropDOcorrenciaValue == '') ||
                      (_model.dropDTipoValue == null ||
                          _model.dropDTipoValue == '') ||
                      (_model.textFieldDescricaoTextController.text == '') ||
                      ((_model.uploadedLocalFile.bytes?.isEmpty ?? true))) {
                    await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          content: const Text(
                              'Favor preencher todos os dados! OS precisa estar na lista para ser enviado, verificar a descrição da ocorrência e também tirar uma foto!'),
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
                    /*if (shouldSetState) safeSetState(() {});
                    return;*/
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

                  shouldSetState = true;

                  /*estou ajustando daqui para baixo*/

                  Future<void> showErrorDialog(BuildContext context) async {
                    if (mounted) {
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
                  }

// Encapsula a lógica em uma função async
                  Future<void> executeMainLogic(BuildContext context) async {
                    if ((_model.aPIAbertura?.succeeded ?? true)) {
                      FFAppState().urlphoto = getJsonField(
                        (_model.apiimageok?.jsonBody ?? ''),
                        r'''$.url''',
                      ).toString();

                      if (mounted) {
                        context.goNamed('Home');
                      }
                    } else {
                      await showErrorDialog(context);
                    }
                  }

                  void executeLogic(BuildContext context) {
                    if (mounted) {
                      executeMainLogic(context); // Chama a função sem 'await'
                    }
                  }

                  /*estou ajustando daqui para cima*/

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
                            'assets/images/micro2.png',
                          ).image,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 8.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.osControllerTextController,
                                        focusNode: _model.osControllerFocusNode,
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
                                            .osControllerTextControllerValidator
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
                                        if (_model.osControllerTextController
                                                .text ==
                                            '') {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: const Text('Atenção!'),
                                                content: const Text(
                                                    'Precisa de uma OS pelo menos!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: const Text('Ok'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        } else {
                                          FFAppState().addToOssList(_model
                                              .osControllerTextController.text);
                                          FFAppState().isDropdownVisible = true;
                                          safeSetState(() {
                                            _model.osControllerTextController
                                                ?.clear();
                                          });
                                        }
                                      },
                                      text: 'Add na lista',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24.0, 0.0, 24.0, 0.0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFEFA139),
                                        textStyle: FlutterFlowTheme.of(context)
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Builder(
                              builder: (context) {
                                final listagemOSAberta =
                                    FFAppState().ossList.toList();

                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listagemOSAberta.length,
                                  itemBuilder:
                                      (context, listagemOSAbertaIndex) {
                                    final listagemOSAbertaItem =
                                        listagemOSAberta[listagemOSAbertaIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        wrapWithModel(
                                          model: _model.listaOSsModels.getModel(
                                            listagemOSAbertaItem,
                                            listagemOSAbertaIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ListaOSsWidget(
                                            key: Key(
                                              'Keyaoi_$listagemOSAbertaItem',
                                            ),
                                            numOS: listagemOSAbertaItem,
                                            botaoExcluir: listagemOSAbertaIndex,
                                          ),
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
                              if (FFAppState().isDropdownVisible &&
                                  (FFAppState().ossList.isNotEmpty))
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
                                            FormFieldController<String>(null),
                                        options: (getJsonField(
                                          dropDProjetoAPIProjetoResponse
                                              .jsonBody,
                                          r'''$[:].projeto''',
                                          true,
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.dropDProjetoValue = val);

                                          // Chama a API apenas se um projeto foi selecionado
                                          if (val != null && val.isNotEmpty) {
                                            _model.apiProjetoResp =
                                                await APIProjetoCall.call();

                                            // Verifica se a chamada foi bem-sucedida
                                            if (_model.apiProjetoResp
                                                    ?.succeeded ??
                                                false) {
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 50));
                                              FFAppState()
                                                      .isFirstDropdownSelected =
                                                  true;
                                            } else {
                                              // Exibe uma mensagem de erro, se necessário
                                              await showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: const Text(
                                                        'Erro ao carregar os dados do projeto.'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            }
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
                              if (FFAppState().isFirstDropdownSelected)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 8.0, 50.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: APIOcorrenciaCall.call(
                                      name: _model.dropDProjetoValue,
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
                                            FormFieldController<String>(null),
                                        options: (getJsonField(
                                          dropDOcorrenciaAPIOcorrenciaResponse
                                              .jsonBody,
                                          r'''$[:].motivo''',
                                          true,
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() => _model
                                              .dropDOcorrenciaValue = val);
                                          FFAppState()
                                              .isSecondDropdownSelected = true;

                                          if (_model.dropDProjetoValue !=
                                                  null &&
                                              _model.dropDProjetoValue!
                                                  .isNotEmpty) {
                                            // Chama a API somente se o valor do projeto estiver definido
                                            _model.apiResult7gb =
                                                await APIProjetoCall.call();
                                            // Atualiza o estado após a chamada
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
                              if (FFAppState().isSecondDropdownSelected)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50.0, 8.0, 50.0, 8.0),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: APITiposPedidosCall.call(
                                      projeto: _model.dropDProjetoValue,
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
                                        controller: _model
                                                .dropDTipoValueController ??=
                                            FormFieldController<String>(null),
                                        options: (getJsonField(
                                          dropDTipoAPITiposPedidosResponse
                                              .jsonBody,
                                          r'''$[:].Tipo_Atendimento''',
                                          true,
                                        ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.dropDTipoValue = val);
                                          FFAppState().isThirdDropdownSelected =
                                              true;

                                          // Verifica se o projeto está vazio
                                          if (_model.dropDProjetoValue ==
                                                  null ||
                                              _model
                                                  .dropDProjetoValue!.isEmpty) {
                                            return; // Se o projeto estiver vazio, retorna sem fazer nada
                                          }

                                          // Chama a API se o projeto estiver válido
                                          _model.apiResult7gb =
                                              await APIProjetoCall.call();
                                          safeSetState(
                                              () {}); // Atualiza o estado após a chamada da API
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().isThirdDropdownSelected)
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
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            hintText: 'Descrição',
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (FFAppState().isThirdDropdownSelected)
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
                                          disabledIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          icon: Icon(
                                            Icons.camera_alt_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 25.0,
                                          ),
                                          showLoadingIndicator: true,
                                          onPressed: (FFAppState()
                                                      .ossList
                                                      .first ==
                                                  '')
                                              ? null
                                              : () async {
                                                  var shouldSetState = false;
                                                  final selectedMedia =
                                                      await selectMedia(
                                                    maxWidth: 720.00,
                                                    maxHeight: 720.00,
                                                    imageQuality: 90,
                                                    multiImage: false,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() =>
                                                        _model.isDataUploading =
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
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                  ))
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length) {
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

                                                  _model.apiimageok =
                                                      await APIUploadImageNameCall
                                                          .call(
                                                    file: _model
                                                        .uploadedLocalFile,
                                                    os: FFAppState().ossList[0],
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
                                                  if ((_model.apiimageok
                                                          ?.succeeded ??
                                                      true)) {
                                                    FFAppState().urlphoto =
                                                        getJsonField(
                                                      (_model.apiimageok
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
                                                              'FOTO SALVA'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text(
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
