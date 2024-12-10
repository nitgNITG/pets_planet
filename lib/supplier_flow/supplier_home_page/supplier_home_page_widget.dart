import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/delete_pets/delete_pets_widget.dart';
import '/components/delete_products/delete_products_widget.dart';
import '/components/delete_user/delete_user_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'supplier_home_page_model.dart';
export 'supplier_home_page_model.dart';

class SupplierHomePageWidget extends StatefulWidget {
  const SupplierHomePageWidget({super.key});

  @override
  State<SupplierHomePageWidget> createState() => _SupplierHomePageWidgetState();
}

class _SupplierHomePageWidgetState extends State<SupplierHomePageWidget> {
  late SupplierHomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupplierHomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: UserGroup.userDataCall.call(
        token: FFAppState().Token,
        lang: FFAppState().lang,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
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
        final supplierHomePageUserDataResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E2D7D),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (scaffoldKey.currentState!.isDrawerOpen ||
                                    scaffoldKey.currentState!.isEndDrawerOpen) {
                                  Navigator.pop(context);
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('SupplierProfile');
                              },
                              child: Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            UserGroup.userDataCall.userfullname(
                                              supplierHomePageUserDataResponse
                                                  .jsonBody,
                                            ),
                                            'a',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(),
                                          child: Text(
                                            valueOrDefault<String>(
                                              UserGroup.userDataCall.useremail(
                                                supplierHomePageUserDataResponse
                                                    .jsonBody,
                                              ),
                                              'm',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (loggedIn)
                          Divider(
                            thickness: 1.0,
                            indent: 20.0,
                            endIndent: 20.0,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        if (UserGroup.userDataCall.userrole(
                              supplierHomePageUserDataResponse.jsonBody,
                            ) !=
                            'supplier')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                60.0, 10.0, 0.0, 5.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('OfferPage');
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.local_offer_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 24.0,
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'sbjzucf6' /* Offers */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ].divide(const SizedBox(width: 30.0)),
                              ),
                            ),
                          ),
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('FAQ');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidQuestionCircle,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'xcrz25v8' /* FAQ */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('AboutUs');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.info_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2gtw8p1z' /* About US */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('MissionVision');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.local_offer_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'bj6aapgz' /* Mission & Vision */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('ContactUs');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '231gcxh1' /* Contact Us */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('PrivacyPolices');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.privacy_tip,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'zt2mm22u' /* Privacy Policy */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('TermsConditions');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.solidStickyNote,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '6r3qskq8' /* Terms & Conditions */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: GestureDetector(
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: const DeleteUserWidget(),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'r82rz166' /* Delet Account  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              60.0, 10.0, 0.0, 5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('Settings');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.settings_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 24.0,
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '2qfbp4s7' /* Settings */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ].divide(const SizedBox(width: 30.0)),
                            ),
                          ),
                        ),
                        if (loggedIn)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 40.0, 40.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.pushNamedAuth(
                                    'LoginPage', context.mounted);

                                FFAppState().Token = '';
                                safeSetState(() {});
                                if (scaffoldKey.currentState!.isDrawerOpen ||
                                    scaffoldKey.currentState!.isEndDrawerOpen) {
                                  Navigator.pop(context);
                                }
                              },
                              text: FFLocalizations.of(context).getText(
                                '0814dyex' /* LOGOUT */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 45.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFFF7300),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        if (!loggedIn)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                40.0, 40.0, 40.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: FFLocalizations.of(context).getText(
                                'rc2la1bp' /* LOGIN */,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 45.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFFF7300),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Visibility(
                visible: UserGroup.userDataCall.userrole(
                      supplierHomePageUserDataResponse.jsonBody,
                    ) ==
                    'supplier',
                child: FutureBuilder<ApiCallResponse>(
                  future: SupplierGroup.supplierProductsCall.call(
                    id: UserGroup.userDataCall.userid(
                      supplierHomePageUserDataResponse.jsonBody,
                    ),
                    lang: FFAppState().lang,
                    token: FFAppState().Token,
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
                    final stackSupplierProductsResponse = snapshot.data!;

                    return Stack(
                      children: [
                        if (UserGroup.userDataCall.userstatus(
                              supplierHomePageUserDataResponse.jsonBody,
                            ) ==
                            'BLOCKED')
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'u3m5z1zf' /* Your Account Is Not Active Yet... */,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                if (loggedIn)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 40.0, 20.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.pushNamedAuth(
                                            'LoginPage', context.mounted);

                                        FFAppState().Token = '';
                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'zwqosk5k' /* LOGOUT */,
                                      ),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 45.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFFF7300),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((SupplierGroup.supplierProductsCall
                                                    .products(
                                                  stackSupplierProductsResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            (SupplierGroup.supplierProductsCall
                                                    .products(
                                              stackSupplierProductsResponse
                                                  .jsonBody,
                                            ))!
                                                .isNotEmpty) ||
                                        (UserGroup.userDataCall.userstatus(
                                              supplierHomePageUserDataResponse
                                                  .jsonBody,
                                            ) !=
                                            'BLOCKED'))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'dvsej649' /* Products */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 10.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                final products = SupplierGroup
                                                        .supplierProductsCall
                                                        .products(
                                                          stackSupplierProductsResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                                return GridView.builder(
                                                  padding: EdgeInsets.zero,
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 10.0,
                                                    mainAxisSpacing: 10.0,
                                                    childAspectRatio: 0.55,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: products.length,
                                                  itemBuilder:
                                                      (context, productsIndex) {
                                                    final productsItem =
                                                        products[productsIndex];
                                                    return Stack(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFF1E2D7D),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: Stack(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          1.0,
                                                                          1.0),
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            const Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            'https://pets.nitg-eg.com${getJsonField(
                                                                          productsItem,
                                                                          r'''$.images[:].url''',
                                                                        ).toString()}',
                                                                        width:
                                                                            180.0,
                                                                        height:
                                                                            155.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        -1.0),
                                                                child:
                                                                    Container(
                                                                  width: 120.0,
                                                                  decoration:
                                                                      const BoxDecoration(),
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        productsItem,
                                                                        r'''$.name''',
                                                                      ).toString(),
                                                                      maxLines:
                                                                          2,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color:
                                                                                Colors.white,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        if (getJsonField(
                                                                              productsItem,
                                                                              r'''$.price''',
                                                                            ) ==
                                                                            getJsonField(
                                                                              productsItem,
                                                                              r'''$.priceWithDiscount''',
                                                                            ))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                productsItem,
                                                                                r'''$.price''',
                                                                              ).toString()} LE',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Cairo',
                                                                                    color: const Color(0xFFF59B21),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              productsItem,
                                                                              r'''$.price''',
                                                                            ) !=
                                                                            getJsonField(
                                                                              productsItem,
                                                                              r'''$.priceWithDiscount''',
                                                                            ))
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                productsItem,
                                                                                r'''$.priceWithDiscount''',
                                                                              ).toString()} LE',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Cairo',
                                                                                    color: const Color(0xFFF59B21),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                    if (loggedIn)
                                                                      Container(
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'EditProduct',
                                                                                  queryParameters: {
                                                                                    'name': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.name''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'nameAr': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.name''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'cat': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.categoryId''',
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                    'price': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.price''',
                                                                                      ),
                                                                                      ParamType.double,
                                                                                    ),
                                                                                    'description': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.description''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'descriptionAr': serializeParam(
                                                                                      '',
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'stock': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.stock''',
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                    'discount': serializeParam(
                                                                                      getJsonField(
                                                                                                productsItem,
                                                                                                r'''$.discounts''',
                                                                                              ) !=
                                                                                              null
                                                                                          ? getJsonField(
                                                                                              productsItem,
                                                                                              r'''$.discounts[:].discountPercentage''',
                                                                                            )
                                                                                          : 0,
                                                                                      ParamType.int,
                                                                                    ),
                                                                                    'isoffer': serializeParam(
                                                                                      getJsonField(
                                                                                            productsItem,
                                                                                            r'''$.discounts[:].discountPercentage''',
                                                                                          ) !=
                                                                                          null,
                                                                                      ParamType.bool,
                                                                                    ),
                                                                                    'startDate': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.discounts[:].startDate''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'endtDate': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.discounts[:].endDate''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'image': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.images[:].url''',
                                                                                      ).toString(),
                                                                                      ParamType.String,
                                                                                    ),
                                                                                    'proId': serializeParam(
                                                                                      getJsonField(
                                                                                        productsItem,
                                                                                        r'''$.id''',
                                                                                      ),
                                                                                      ParamType.int,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Material(
                                                                                color: Colors.transparent,
                                                                                elevation: 5.0,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(50.0),
                                                                                ),
                                                                                child: Container(
                                                                                  width: 35.0,
                                                                                  height: 35.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: const Icon(
                                                                                    Icons.edit_square,
                                                                                    color: Color(0xFFF59B21),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return WebViewAware(
                                                                                        child: GestureDetector(
                                                                                          onTap: () => FocusScope.of(context).unfocus(),
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: DeleteProductsWidget(
                                                                                              id: getJsonField(
                                                                                                productsItem,
                                                                                                r'''$.id''',
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                                child: Material(
                                                                                  color: Colors.transparent,
                                                                                  elevation: 5.0,
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(50.0),
                                                                                  ),
                                                                                  child: Container(
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(50.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: const Icon(
                                                                                      Icons.delete_sweep,
                                                                                      color: Color(0xFFF59B21),
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (getJsonField(
                                                                    productsItem,
                                                                    r'''$.price''',
                                                                  ) !=
                                                                  getJsonField(
                                                                    productsItem,
                                                                    r'''$.priceWithDiscount''',
                                                                  ))
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          20.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${getJsonField(
                                                                                productsItem,
                                                                                r'''$.price''',
                                                                              ).toString()} LE',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Cairo',
                                                                                    color: const Color(0xFFF59B21),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    decoration: TextDecoration.lineThrough,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        if (getJsonField(
                                                              productsItem,
                                                              r'''$.price''',
                                                            ) !=
                                                            getJsonField(
                                                              productsItem,
                                                              r'''$.priceWithDiscount''',
                                                            ))
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Container(
                                                              width: 70.0,
                                                              height: 30.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xFFFF0000),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  '-${getJsonField(
                                                                    productsItem,
                                                                    r'''$.discounts[:].discountPercentage''',
                                                                  ).toString()}%',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    FutureBuilder<ApiCallResponse>(
                                      future:
                                          SupplierGroup.supplierPetsCall.call(
                                        id: UserGroup.userDataCall.userid(
                                          supplierHomePageUserDataResponse
                                              .jsonBody,
                                        ),
                                        lang: FFAppState().lang,
                                        token: FFAppState().Token,
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
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final columnSupplierPetsResponse =
                                            snapshot.data!;

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((SupplierGroup.supplierPetsCall
                                                            .pets(
                                                          columnSupplierPetsResponse
                                                              .jsonBody,
                                                        ) !=
                                                        null &&
                                                    (SupplierGroup
                                                            .supplierPetsCall
                                                            .pets(
                                                      columnSupplierPetsResponse
                                                          .jsonBody,
                                                    ))!
                                                        .isNotEmpty) ||
                                                (UserGroup.userDataCall
                                                        .userstatus(
                                                      supplierHomePageUserDataResponse
                                                          .jsonBody,
                                                    ) !=
                                                    'BLOCKED'))
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 25.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'mrse3fzb' /* Pets */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 10.0, 10.0, 20.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Builder(
                                                      builder: (context) {
                                                        final pets2 = SupplierGroup
                                                                .supplierPetsCall
                                                                .pets(
                                                                  columnSupplierPetsResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];

                                                        return GridView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          gridDelegate:
                                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10.0,
                                                            mainAxisSpacing:
                                                                10.0,
                                                            childAspectRatio:
                                                                0.55,
                                                          ),
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              pets2.length,
                                                          itemBuilder: (context,
                                                              pets2Index) {
                                                            final pets2Item =
                                                                pets2[
                                                                    pets2Index];
                                                            return Stack(
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFF1E2D7D),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Stack(
                                                                          alignment: const AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                              child: CachedNetworkImage(
                                                                                fadeInDuration: const Duration(milliseconds: 500),
                                                                                fadeOutDuration: const Duration(milliseconds: 500),
                                                                                imageUrl: 'https://pets.nitg-eg.com${getJsonField(
                                                                                  pets2Item,
                                                                                  r'''$.images[:].url''',
                                                                                ).toString()}',
                                                                                width: 180.0,
                                                                                height: 155.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              120.0,
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                pets2Item,
                                                                                r'''$.name''',
                                                                              ).toString(),
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Cairo',
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (getJsonField(
                                                                                      pets2Item,
                                                                                      r'''$.price''',
                                                                                    ) ==
                                                                                    getJsonField(
                                                                                      pets2Item,
                                                                                      r'''$.priceWithDiscount''',
                                                                                    ))
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      '${getJsonField(
                                                                                        pets2Item,
                                                                                        r'''$.price''',
                                                                                      ).toString()} LE',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Cairo',
                                                                                            color: const Color(0xFFF59B21),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                if (getJsonField(
                                                                                      pets2Item,
                                                                                      r'''$.price''',
                                                                                    ) !=
                                                                                    getJsonField(
                                                                                      pets2Item,
                                                                                      r'''$.priceWithDiscount''',
                                                                                    ))
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      '${getJsonField(
                                                                                        pets2Item,
                                                                                        r'''$.priceWithDiscount''',
                                                                                      ).toString()} LE',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Cairo',
                                                                                            color: const Color(0xFFF59B21),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            if (loggedIn)
                                                                              Container(
                                                                                decoration: const BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          'EditPets',
                                                                                          queryParameters: {
                                                                                            'name': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.name''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'nameAr': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.name''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'cat': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.speciesId''',
                                                                                              ),
                                                                                              ParamType.int,
                                                                                            ),
                                                                                            'price': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.priceWithDiscount''',
                                                                                              ),
                                                                                              ParamType.double,
                                                                                            ),
                                                                                            'description': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.description''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'descriptionAr': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.description''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'stock': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.stock''',
                                                                                              ),
                                                                                              ParamType.int,
                                                                                            ),
                                                                                            'discount': serializeParam(
                                                                                              getJsonField(
                                                                                                        pets2Item,
                                                                                                        r'''$.discounts''',
                                                                                                      ) !=
                                                                                                      null
                                                                                                  ? getJsonField(
                                                                                                      pets2Item,
                                                                                                      r'''$.discounts[:].discountPercentage''',
                                                                                                    )
                                                                                                  : 0,
                                                                                              ParamType.int,
                                                                                            ),
                                                                                            'isoffer': serializeParam(
                                                                                              getJsonField(
                                                                                                    pets2Item,
                                                                                                    r'''$.discounts[:].discountPercentage''',
                                                                                                  ) !=
                                                                                                  null,
                                                                                              ParamType.bool,
                                                                                            ),
                                                                                            'startDate': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.discounts[:].startDate''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'endtDate': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.discounts[:].endDate''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'image': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.images[:].url''',
                                                                                              ).toString(),
                                                                                              ParamType.String,
                                                                                            ),
                                                                                            'proId': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.id''',
                                                                                              ),
                                                                                              ParamType.int,
                                                                                            ),
                                                                                            'age': serializeParam(
                                                                                              getJsonField(
                                                                                                pets2Item,
                                                                                                r'''$.age''',
                                                                                              ),
                                                                                              ParamType.int,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      child: Material(
                                                                                        color: Colors.transparent,
                                                                                        elevation: 5.0,
                                                                                        shape: RoundedRectangleBorder(
                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                        ),
                                                                                        child: Container(
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(50.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              width: 1.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: const Icon(
                                                                                            Icons.edit_square,
                                                                                            color: Color(0xFFF59B21),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.all(8.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await showModalBottomSheet(
                                                                                            isScrollControlled: true,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            enableDrag: false,
                                                                                            context: context,
                                                                                            builder: (context) {
                                                                                              return WebViewAware(
                                                                                                child: GestureDetector(
                                                                                                  onTap: () => FocusScope.of(context).unfocus(),
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: DeletePetsWidget(
                                                                                                      petId: getJsonField(
                                                                                                        pets2Item,
                                                                                                        r'''$.id''',
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ).then((value) => safeSetState(() {}));
                                                                                        },
                                                                                        child: Material(
                                                                                          color: Colors.transparent,
                                                                                          elevation: 5.0,
                                                                                          shape: RoundedRectangleBorder(
                                                                                            borderRadius: BorderRadius.circular(50.0),
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: 35.0,
                                                                                            height: 35.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(50.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: const Icon(
                                                                                              Icons.delete_sweep,
                                                                                              color: Color(0xFFF59B21),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      if (getJsonField(
                                                                            pets2Item,
                                                                            r'''$.price''',
                                                                          ) !=
                                                                          getJsonField(
                                                                            pets2Item,
                                                                            r'''$.priceWithDiscount''',
                                                                          ))
                                                                        Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              10.0,
                                                                              20.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      '${getJsonField(
                                                                                        pets2Item,
                                                                                        r'''$.price''',
                                                                                      ).toString()} LE',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Cairo',
                                                                                            color: const Color(0xFFF59B21),
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            decoration: TextDecoration.lineThrough,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (getJsonField(
                                                                      pets2Item,
                                                                      r'''$.price''',
                                                                    ) !=
                                                                    getJsonField(
                                                                      pets2Item,
                                                                      r'''$.priceWithDiscount''',
                                                                    ))
                                                                  Align(
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          70.0,
                                                                      height:
                                                                          30.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0xFFFF0000),
                                                                        borderRadius:
                                                                            BorderRadius.circular(50.0),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '-${getJsonField(
                                                                            pets2Item,
                                                                            r'''$.discounts[:].discountPercentage''',
                                                                          ).toString()}%',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if ((UserGroup.userDataCall.userrole(
                                      supplierHomePageUserDataResponse.jsonBody,
                                    ) ==
                                    'supplier') &&
                                (UserGroup.userDataCall.userstatus(
                                      supplierHomePageUserDataResponse.jsonBody,
                                    ) !=
                                    'BLOCKED'))
                              Material(
                                color: Colors.transparent,
                                elevation: 10.0,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                      topLeft: Radius.circular(0.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              FlutterFlowIconButton(
                                                borderColor: const Color(0x2D2D2D80),
                                                borderRadius: 50.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: const Icon(
                                                  Icons.menu_rounded,
                                                  color: Color(0xFFF59B21),
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  scaffoldKey.currentState!
                                                      .openDrawer();
                                                },
                                              ),
                                              ClipRRect(
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/kk.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 10.0)),
                                          ),
                                        ),
                                        Container(
                                          width: 100.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                    'SupplierMyOrder');
                                              },
                                              child: const FaIcon(
                                                FontAwesomeIcons.store,
                                                color: Color(0xFFF59B21),
                                                size: 24.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
