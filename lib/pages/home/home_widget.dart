import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/sidebar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.respok = await APIValidaInternetCall.call();

      if ((_model.respok?.succeeded ?? true)) {
        return;
      }

      context.goNamed('Home_no_Internet');
    });

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          drawer: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.sidebarModel,
              updateCallback: () => safeSetState(() {}),
              child: const SidebarWidget(),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: AppBar(
              backgroundColor: const Color(0xFF3976EF),
              automaticallyImplyLeading: true,
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 52.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'LOGYXAPP',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 24.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'LISTA DE CHAMADOS',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 4.0,
            ),
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD3C9C9),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Back-mini.png',
                          ).image,
                        ),
                      ),
                      child: FutureBuilder<ApiCallResponse>(
                        future: (_model.apiRequestCompleter ??=
                                Completer<ApiCallResponse>()
                                  ..complete(APIOrdensAtendidasCall.call(
                                    uid: FFAppState().uidAppState,
                                  )))
                            .future,
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 40.0,
                                height: 40.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).success,
                                  ),
                                ),
                              ),
                            );
                          }
                          final listViewAPIOrdensAtendidasResponse =
                              snapshot.data!;

                          return Builder(
                            builder: (context) {
                              final listachamados =
                                  (listViewAPIOrdensAtendidasResponse.jsonBody
                                                  .toList()
                                                  .map<OrdensAtendidasStruct?>(
                                                      OrdensAtendidasStruct
                                                          .maybeFromMap)
                                                  .toList()
                                              as Iterable<
                                                  OrdensAtendidasStruct?>)
                                          .withoutNulls
                                          .map((e) => e)
                                          .toList()
                                          .toList() ??
                                      [];

                              return RefreshIndicator(
                                onRefresh: () async {
                                  safeSetState(
                                      () => _model.apiRequestCompleter = null);
                                },
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listachamados.length,
                                  itemBuilder: (context, listachamadosIndex) {
                                    final listachamadosItem =
                                        listachamados[listachamadosIndex];
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: APIHistoricoOSCall.call(
                                                  os: listachamadosItem.os,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final cardAPIHistoricoOSResponse =
                                                      snapshot.data!;

                                                  return Card(
                                                    clipBehavior: Clip
                                                        .antiAliasWithSaveLayer,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    elevation: 4.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(10.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.goNamed(
                                                            'OS',
                                                            queryParameters: {
                                                              'parOS':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.os''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parData':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.dt_abertura''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parStatus':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.status''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parOcorrencia':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.ocorrencia''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parNrAtendimento':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.nr_atendimento''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parObs':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.problema_apresentado''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parAtendente':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.atendente_fechamento''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parProjeto':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.projeto''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'parTipo':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  cardAPIHistoricoOSResponse
                                                                      .jsonBody,
                                                                  r'''$.tipo_atendimento''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            if ((listachamadosItem.status == 'AÇÃO ESPECIAL TROCA DE PARQUE') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'CANC NÃO AUT – COM AJUSTE CADASTRAL') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'CANC NÃO AUT - REAG COM CONTATO') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'CANC NÃO AUT – REAG OBRIGATÓRIO') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'CANC NÃO AUT – REALIZAR ATENDIMENTO') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'CANC NÃO AUT – SEM AJUSTE CADASTRAL') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'VISITA INVÁLIDA - ATUALIZAR GEOLOCALIZAÇÃO PARA PROSSEGUIR'))
                                                              const Icon(
                                                                Icons
                                                                    .check_rounded,
                                                                color: Color(
                                                                    0xFF3993D2),
                                                                size: 40.0,
                                                              ),
                                                            if ((listachamadosItem.status == 'CANCELADA R-LOG') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'CIESEQ - FICOU EM TRATATIVA D+8') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'ERRO DE ABERTURA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'FALTA DE COMPONENTE - EM TRATATIVA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'FICOU EM TRATATIVA D+1') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'FICOU EM TRATATIVA D+8') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'FISEQ - FICOU EM TRATATIVA D+1') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'FISEQ - PESQUISA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'FISEQ - TRATATIVA CAÇA-POS') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'INSUCESSO - SEGUIR ROTA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'INSUCESSO ANOTADO - SEGUIR ROTA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'INSUCESSO CONTATO - SEGUIR ROTA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'OS INDISPONÍVEL NO SISTEMA ATERS-IMAC') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'PEDIDO REALIZADO') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'PROTOCOLO AUT - OUTRO PRESTADOR') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'SAFRAPAY - FICOU EM TRATATIVA D+1') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'SAFRAPAY - TRATATIVA CAÇA-POS') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'SEGUIR ROTA - MENSAGEM ENVIADA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'SEGUIR ROTA - MENSAGEM ENVIADA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'SISTEMA ATERS-IMAC FORA DO AR') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'SOLICITAÇÃO CANCELAMENTO') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'SOLICITAÇÃO CANCELAMENTO - SEGUIR ROTA') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'TROCA DE PARQUE - SUSPENSÃO PARA ANÁLISE') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    'VISITA VALIDADA - SEGUIR ROTA'))
                                                              Icon(
                                                                Icons
                                                                    .warning_amber,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                                size: 40.0,
                                                              ),
                                                            if ((listachamadosItem
                                                                            .status ==
                                                                        '') ||
                                                                (listachamadosItem
                                                                        .status ==
                                                                    '...'))
                                                              const Icon(
                                                                Icons
                                                                    .autorenew_rounded,
                                                                color: Color(
                                                                    0xFF38AD25),
                                                                size: 40.0,
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      listachamadosItem
                                                                          .os,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      listachamadosItem
                                                                          .status,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    listachamadosItem
                                                                        .conclusaoOperador,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          fontSize:
                                                                              10.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 110.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/down.png',
                          ).image,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 30.0, 80.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: const Color(0xFF0A0A0A),
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Colors.white,
                                icon: Icon(
                                  Icons.add,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.internetok =
                                      await APIValidaInternetCall.call();

                                  if ((_model.internetok?.succeeded ?? true)) {
                                    FFAppState().Projeto = '';
                                    FFAppState().Ocorrencia = '';
                                    FFAppState().Tipo = '';
                                    FFAppState().urlphoto = '';
                                    FFAppState().isFirstDropdownSelected =
                                        false;
                                    FFAppState().isSecondDropdownSelected =
                                        false;
                                    FFAppState().isDropdownVisible = false;
                                    FFAppState().ossList = [];
                                    FFAppState().isThirdDropdownSelected =
                                        false;
                                    FFAppState().isDropdownProjetoReset = false;

                                    context.goNamed('NovoChamado');
                                  } else {
                                    context.goNamed('Home_no_Internet');
                                  }

                                  safeSetState(() {});
                                },
                              ),
                            ),
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
    );
  }
}
