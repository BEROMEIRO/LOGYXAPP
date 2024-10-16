import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'token_alterando_senha_model.dart';
export 'token_alterando_senha_model.dart';

class TokenAlterandoSenhaWidget extends StatefulWidget {
  const TokenAlterandoSenhaWidget({super.key});

  @override
  State<TokenAlterandoSenhaWidget> createState() =>
      _TokenAlterandoSenhaWidgetState();
}

class _TokenAlterandoSenhaWidgetState extends State<TokenAlterandoSenhaWidget>
    with TickerProviderStateMixin {
  late TokenAlterandoSenhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TokenAlterandoSenhaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((currentUserData?.uid != null && currentUserData?.uid != '') ||
          (FFAppState().pWDAppState != currentUserData?.pwd)) {
        FFAppState().uidAppState = currentUserData!.uid;
        FFAppState().telefoneAppState = currentUserData!.phone;
        FFAppState().userNameAppState = currentUserData!.username;
        FFAppState().unidadeAppState = currentUserData!.codBase;
        FFAppState().cPFAppState = currentUserData!.documento;
        FFAppState().emailAppState = currentUserData!.email;
        FFAppState().nomeAppState = currentUserData!.name;
        safeSetState(() {});

        context.pushNamed('Home');
      } else {
        return;
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.nomeTxtFieldTextController ??=
        TextEditingController(text: FFAppState().userNameAppState);
    _model.nomeTxtFieldFocusNode ??= FocusNode();

    _model.senhaTxtFieldTextController ??= TextEditingController();
    _model.senhaTxtFieldFocusNode ??= FocusNode();

    _model.senhaConfTxtFieldTextController ??= TextEditingController();
    _model.senhaConfTxtFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
                    Stack(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.sizeOf(context)
                                                      .width >=
                                                  768.0
                                              ? 530.0
                                              : 630.0,
                                          constraints: const BoxConstraints(
                                            maxWidth: 570.0,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Back-mini.png',
                                              ).image,
                                            ),
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 4.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            border: Border.all(
                                              color: const Color(0xFFF1F4F8),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment:
                                                    const Alignment(0.0, 0),
                                                child: TabBar(
                                                  isScrollable: true,
                                                  labelColor:
                                                      const Color(0xFF101213),
                                                  unselectedLabelColor:
                                                      const Color(0xFF57636C),
                                                  labelPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          32.0, 0.0, 32.0, 0.0),
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  unselectedLabelStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                  indicatorWeight: 3.0,
                                                  tabs: const [
                                                    Tab(
                                                      text: 'Login',
                                                    ),
                                                  ],
                                                  controller:
                                                      _model.tabBarController,
                                                  onTap: (i) async {
                                                    [() async {}][i]();
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: TabBarView(
                                                  controller:
                                                      _model.tabBarController,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Form(
                                                        key: _model.formKey,
                                                        autovalidateMode:
                                                            AutovalidateMode
                                                                .disabled,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  12.0,
                                                                  55.0,
                                                                  12.0,
                                                                  0.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'Confirme sua nova senha!',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              const Color(0xFF0D0D0D),
                                                                          fontSize:
                                                                              20.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .nomeTxtFieldTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .nomeTxtFieldFocusNode,
                                                                      onChanged:
                                                                          (_) =>
                                                                              EasyDebounce.debounce(
                                                                        '_model.nomeTxtFieldTextController',
                                                                        const Duration(
                                                                            milliseconds:
                                                                                2000),
                                                                        () => safeSetState(
                                                                            () {}),
                                                                      ),
                                                                      autofocus:
                                                                          false,
                                                                      autofillHints: const [
                                                                        AutofillHints
                                                                            .username
                                                                      ],
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .next,
                                                                      readOnly:
                                                                          true,
                                                                      obscureText:
                                                                          false,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Nome',
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: const Color(0xFF57636C),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                        hintText:
                                                                            'Nome de Usuário',
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFE0E3E7),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFF4B39EF),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFFF5963),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFFF5963),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                        contentPadding: const EdgeInsets
                                                                            .all(
                                                                            18.0),
                                                                        suffixIcon: _model.nomeTxtFieldTextController!.text.isNotEmpty
                                                                            ? InkWell(
                                                                                onTap: () async {
                                                                                  _model.nomeTxtFieldTextController?.clear();
                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: const Icon(
                                                                                  Icons.clear,
                                                                                  color: Color(0xFF757575),
                                                                                  size: 22.0,
                                                                                ),
                                                                              )
                                                                            : null,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                const Color(0xFF101213),
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .name,
                                                                      validator: _model
                                                                          .nomeTxtFieldTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .senhaTxtFieldTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .senhaTxtFieldFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      obscureText:
                                                                          !_model
                                                                              .senhaTxtFieldVisibility,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Senha',
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: const Color(0xFF57636C),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                        hintText:
                                                                            'Insira sua Senha',
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFE0E3E7),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFF4B39EF),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFFF5963),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFFF5963),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                        contentPadding: const EdgeInsets
                                                                            .all(
                                                                            18.0),
                                                                        suffixIcon:
                                                                            InkWell(
                                                                          onTap: () =>
                                                                              safeSetState(
                                                                            () =>
                                                                                _model.senhaTxtFieldVisibility = !_model.senhaTxtFieldVisibility,
                                                                          ),
                                                                          focusNode:
                                                                              FocusNode(skipTraversal: true),
                                                                          child:
                                                                              Icon(
                                                                            _model.senhaTxtFieldVisibility
                                                                                ? Icons.visibility_outlined
                                                                                : Icons.visibility_off_outlined,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                const Color(0xFF101213),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                      validator: _model
                                                                          .senhaTxtFieldTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child:
                                                                      SizedBox(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        TextFormField(
                                                                      controller:
                                                                          _model
                                                                              .senhaConfTxtFieldTextController,
                                                                      focusNode:
                                                                          _model
                                                                              .senhaConfTxtFieldFocusNode,
                                                                      autofocus:
                                                                          false,
                                                                      textInputAction:
                                                                          TextInputAction
                                                                              .done,
                                                                      obscureText:
                                                                          !_model
                                                                              .senhaConfTxtFieldVisibility,
                                                                      decoration:
                                                                          InputDecoration(
                                                                        labelText:
                                                                            'Confirme sua senha',
                                                                        labelStyle: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: 'Plus Jakarta Sans',
                                                                              color: const Color(0xFF57636C),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                        hintText:
                                                                            'Confirme sua senha',
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFE0E3E7),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFF4B39EF),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        errorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFFF5963),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        focusedErrorBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide:
                                                                              const BorderSide(
                                                                            color:
                                                                                Color(0xFFFF5963),
                                                                            width:
                                                                                2.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(40.0),
                                                                        ),
                                                                        filled:
                                                                            true,
                                                                        fillColor:
                                                                            Colors.white,
                                                                        contentPadding: const EdgeInsets
                                                                            .all(
                                                                            18.0),
                                                                        suffixIcon:
                                                                            InkWell(
                                                                          onTap: () =>
                                                                              safeSetState(
                                                                            () =>
                                                                                _model.senhaConfTxtFieldVisibility = !_model.senhaConfTxtFieldVisibility,
                                                                          ),
                                                                          focusNode:
                                                                              FocusNode(skipTraversal: true),
                                                                          child:
                                                                              Icon(
                                                                            _model.senhaConfTxtFieldVisibility
                                                                                ? Icons.visibility_outlined
                                                                                : Icons.visibility_off_outlined,
                                                                            size:
                                                                                18.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                const Color(0xFF101213),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                      validator: _model
                                                                          .senhaConfTxtFieldTextControllerValidator
                                                                          .asValidator(
                                                                              context),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          20.0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.alterasenharesp =
                                                                          await APIAlteraSenhaCall
                                                                              .call(
                                                                        uid: FFAppState()
                                                                            .uidAppState,
                                                                        pwdConfirm: _model
                                                                            .senhaTxtFieldTextController
                                                                            .text,
                                                                        newPassword: _model
                                                                            .senhaConfTxtFieldTextController
                                                                            .text,
                                                                      );

                                                                      if ((_model
                                                                              .alterasenharesp
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        context.goNamed(
                                                                            'Login');
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: const Text('Atenção!!'),
                                                                              content: Text(getJsonField(
                                                                                (_model.alterasenharesp?.jsonBody ?? ''),
                                                                                r'''$.detail''',
                                                                              ).toString()),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: const Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text:
                                                                        'Salvar nova senha',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          200.0,
                                                                      height:
                                                                          44.0,
                                                                      padding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          18.0,
                                                                          0.0),
                                                                      iconPadding: const EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: const Color(
                                                                          0xE91881F6),
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          const BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              40.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'columnOnPageLoadAnimation']!),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation']!),
                                      ),
                                    ],
                                  ),
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
          ),
        ),
      ),
    );
  }
}
