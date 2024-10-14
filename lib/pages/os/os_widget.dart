import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'os_model.dart';
export 'os_model.dart';

class OsWidget extends StatefulWidget {
  const OsWidget({
    super.key,
    required this.parOS,
    required this.parData,
    required this.parStatus,
    required this.parOcorrencia,
    required this.parNrAtendimento,
    required this.parAtendente,
    this.parProjeto,
    this.parTipo,
    required this.parObs,
  });

  final String? parOS;
  final String? parData;
  final String? parStatus;
  final String? parOcorrencia;
  final String? parNrAtendimento;
  final String? parAtendente;
  final String? parProjeto;
  final String? parTipo;
  final String? parObs;

  @override
  State<OsWidget> createState() => _OsWidgetState();
}

class _OsWidgetState extends State<OsWidget> {
  late OsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OsModel());

    getCurrentUserLocation(
            defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
              context.pushNamed('Home');
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.parOS,
              'OS',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Container(
          height: 893.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/AAA.png',
              ).image,
            ),
          ),
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 20.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: FlutterFlowTheme.of(context).accent4,
                                offset: const Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        'DADOS DO CHAMADO',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              'Ordem de Serviço:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.parOS,
                                                'os',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Projeto:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.parProjeto,
                                              'Projeto',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Tipo de Serviço:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.parTipo,
                                              'Tipo',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Data:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.parData,
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            'Status:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.parStatus,
                                              'status',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              'Ocorrência:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.parOcorrencia,
                                                'Ocorrência',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    fontSize: 11.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.4,
                          child: Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: APIHistoricoOSCall.call(
                            os: widget.parOS,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final listViewAPIHistoricoOSResponse =
                                snapshot.data!;

                            return ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: FlutterFlowTheme.of(context)
                                            .accent4,
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Evidência',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Opacity(
                                                    opacity: 0.89,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(20.0,
                                                              8.0, 0.0, 8.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 15.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        fillColor: const Color(
                                                            0xFF4898F8),
                                                        icon: Icon(
                                                          Icons
                                                              .camera_alt_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await launchURL(
                                                              getJsonField(
                                                            listViewAPIHistoricoOSResponse
                                                                .jsonBody,
                                                            r'''$.imageurl''',
                                                          ).toString());
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Reabrir',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Opacity(
                                                    opacity: 0.89,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(35.0,
                                                              8.0, 0.0, 8.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 15.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        fillColor: const Color(
                                                            0xFF39D271),
                                                        icon: Icon(
                                                          Icons.cached,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          FFAppState().os =
                                                              widget.parOS!;
                                                          FFAppState().projeto =
                                                              widget
                                                                  .parProjeto!;
                                                          FFAppState()
                                                                  .ocorrencia =
                                                              widget
                                                                  .parOcorrencia!;
                                                          FFAppState().tipo =
                                                              widget.parTipo!;
                                                          FFAppState().ossList =
                                                              [];
                                                          FFAppState()
                                                              .update(() {});

                                                          context.pushNamed(
                                                            'Reabertura',
                                                            queryParameters: {
                                                              'osNumber':
                                                                  serializeParam(
                                                                widget.parOS,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'project':
                                                                  serializeParam(
                                                                widget
                                                                    .parProjeto,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'oco':
                                                                  serializeParam(
                                                                widget
                                                                    .parOcorrencia,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'type':
                                                                  serializeParam(
                                                                widget.parTipo,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Localização',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                  Opacity(
                                                    opacity: 0.89,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(5.0,
                                                              8.0, 0.0, 8.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        key: ValueKey(
                                                            currentUserLocationValue!
                                                                .toString()),
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 15.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        icon: Icon(
                                                          key: ValueKey(
                                                              currentUserLocationValue!
                                                                  .toString()),
                                                          Icons.location_on,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          await launchURL(functions
                                                              .generateGoogleMapsURL(
                                                                  getJsonField(
                                                                    listViewAPIHistoricoOSResponse
                                                                        .jsonBody,
                                                                    r'''$.latitude''',
                                                                  ).toString(),
                                                                  getJsonField(
                                                                    listViewAPIHistoricoOSResponse
                                                                        .jsonBody,
                                                                    r'''$.longitude''',
                                                                  ).toString())!);
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
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Opacity(
                          opacity: 0.4,
                          child: Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.0,
                                color: FlutterFlowTheme.of(context).accent4,
                                offset: const Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 0.0, 0.0, 0.0),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        'Dados do atendimento',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                    if ((widget.parStatus != '...') &&
                                        (widget.parStatus !=
                                            'ERRO DE ABERTURA') &&
                                        (widget.parStatus !=
                                            'AÇÃO ESPECIAL TROCA DE PARQUE') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – COM AJUSTE CADASTRAL') &&
                                        (widget.parStatus !=
                                            'VISITA INVÁLIDA - ATUALIZAR GEOLOCALIZAÇÃO PARA PROCEGUIR') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT - REAG COM CONTATO') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – REAG OBRIGATÓRIO') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – REALIZAR ATENDIMENTO') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – SEM AJUSTE CADASTRAL'))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              'Número de Atendimento:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.parNrAtendimento,
                                                'Número do Atendimento',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    if (!((widget.parStatus ==
                                            'CANCELADA R-LOG') ||
                                        (widget.parStatus ==
                                            'CIESEQ - FICOU EM TRATATIVA D+8') ||
                                        (widget.parData ==
                                            'VISITA VALIDADA - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'FALTA DE COMPONENTE - EM TRATATIVA') ||
                                        (widget.parStatus ==
                                            'FISEQ - PESQUISA') ||
                                        (widget.parStatus ==
                                            'FISEQ - FICOU EM TRATATIVA D+1') ||
                                        (widget.parStatus ==
                                            'FISEQ - TRATATIVA CAÇA-POS') ||
                                        (widget.parStatus ==
                                            'FICOU EM TRATATIVA D+8') ||
                                        (widget.parStatus ==
                                            'INSUCESSO ANOTADO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'FICOU EM TRATATIVA D+1') ||
                                        (widget.parStatus ==
                                            'OS INDISPONÍVEL NO SISTEMA ATERS-IMAC') ||
                                        (widget.parStatus ==
                                            'PEDIDO REALIZADO') ||
                                        (widget.parStatus ==
                                            'SEGUIR ROTA - MENSAGEM ENVIADA') ||
                                        (widget.parStatus ==
                                            'PROTOCOLO AUT - OUTRO PRESTADOR') ||
                                        (widget.parStatus ==
                                            'INSUCESSO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'SAFRAPAY - FICOU EM TRATATIVA D+1') ||
                                        (widget.parStatus ==
                                            'SAFRAPAY - TRATATIVA CAÇA-POS') ||
                                        (widget.parStatus ==
                                            'SISTEMA ATERS-IMAC FORA DO AR') ||
                                        (widget.parStatus ==
                                            'INSUCESSO CONTATO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'SOLICITAÇÃO CANCELAMENTO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'SOLICITAÇÃO CANCELAMENTO') ||
                                        (widget.parStatus ==
                                            'TROCA DE PARQUE - SUSPENSÃO PARA ANÁLISE')))
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 0.0, 5.0),
                                                child: Text(
                                                  'Observação:',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    if (!((widget.parStatus ==
                                            'CIESEQ - FICOU EM TRATATIVA D+8') ||
                                        (widget.parStatus ==
                                            'VISITA VALIDADA - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'FALTA DE COMPONENTE - EM TRATATIVA') ||
                                        (widget.parStatus ==
                                            'FISEQ - PESQUISA') ||
                                        (widget.parStatus ==
                                            'FISEQ - FICOU EM TRATATIVA D+1') ||
                                        (widget.parStatus ==
                                            'FISEQ - TRATATIVA CAÇA-POS') ||
                                        (widget.parStatus ==
                                            'CANCELADA R-LOG') ||
                                        (widget.parStatus ==
                                            'FICOU EM TRATATIVA D+8') ||
                                        (widget.parStatus ==
                                            'INSUCESSO ANOTADO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'FICOU EM TRATATIVA D+1') ||
                                        (widget.parStatus ==
                                            'OS INDISPONÍVEL NO SISTEMA ATERS-IMAC') ||
                                        (widget.parStatus ==
                                            'PEDIDO REALIZADO') ||
                                        (widget.parStatus ==
                                            'SEGUIR ROTA - MENSAGEM ENVIADA') ||
                                        (widget.parStatus ==
                                            'PROTOCOLO AUT - OUTRO PRESTADOR') ||
                                        (widget.parStatus ==
                                            'INSUCESSO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'SAFRAPAY - FICOU EM TRATATIVA D+1') ||
                                        (widget.parStatus ==
                                            'SAFRAPAY - TRATATIVA CAÇA-POS') ||
                                        (widget.parStatus ==
                                            'SISTEMA ATERS-IMAC FORA DO AR') ||
                                        (widget.parStatus ==
                                            'INSUCESSO CONTATO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'SOLICITAÇÃO CANCELAMENTO - SEGUIR ROTA') ||
                                        (widget.parStatus ==
                                            'SOLICITAÇÃO CANCELAMENTO') ||
                                        (widget.parStatus ==
                                            'TROCA DE PARQUE - SUSPENSÃO PARA ANÁLISE')))
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(5.0, 0.0, 0.0, 5.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget.parObs,
                                            'Histórico',
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
                                        ),
                                      ),
                                    if ((widget.parStatus != '...') &&
                                        (widget.parStatus !=
                                            'ERRO DE ABERTURA') &&
                                        (widget.parStatus !=
                                            'AÇÃO ESPECIAL TROCA DE PARQUE') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – COM AJUSTE CADASTRAL') &&
                                        (widget.parStatus !=
                                            'VISITA INVÁLIDA - ATUALIZAR GEOLOCALIZAÇÃO PARA PROCEGUIR') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT - REAG COM CONTATO') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – REAG OBRIGATÓRIO') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – REALIZAR ATENDIMENTO') &&
                                        (widget.parStatus !=
                                            'CANC NÃO AUT – SEM AJUSTE CADASTRAL'))
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 1.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      0.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                'Atendente:',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      5.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget.parAtendente,
                                                  'Atendente de Fechamento',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
