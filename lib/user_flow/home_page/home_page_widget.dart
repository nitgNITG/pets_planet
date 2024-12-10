import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_nav_bar/custom_nav_bar_widget.dart';
import '/components/delete_pets/delete_pets_widget.dart';
import '/components/delete_products/delete_products_widget.dart';
import '/components/delete_user/delete_user_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().Language == true) {
        setAppLanguage(context, 'ar');
      } else {
        setAppLanguage(context, 'en');
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        final homePageUserDataResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            floatingActionButton: Visibility(
              visible: (UserGroup.userDataCall.userrole(
                        homePageUserDataResponse.jsonBody,
                      ) ==
                      'supplier') &&
                  (UserGroup.userDataCall.userstatus(
                        homePageUserDataResponse.jsonBody,
                      ) !=
                      'BLOCKED'),
              child: FloatingActionButton(
                onPressed: () async {
                  context.pushNamed('SelectAdd');
                },
                backgroundColor: const Color(0xFFF59B21),
                elevation: 8.0,
                child: Icon(
                  Icons.add_rounded,
                  color: FlutterFlowTheme.of(context).info,
                  size: 28.0,
                ),
              ),
            ),
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
                                if (UserGroup.userDataCall.userrole(
                                      homePageUserDataResponse.jsonBody,
                                    ) ==
                                    'supplier') {
                                  context.pushNamed('SupplierProfile');
                                } else {
                                  context.pushNamed('Profile');
                                }
                              },
                              child: Container(
                                width: 200.0,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (UserGroup.userDataCall.userrole(
                                          homePageUserDataResponse.jsonBody,
                                        ) !=
                                        'supplier')
                                      Container(
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: getJsonField(
                                              homePageUserDataResponse.jsonBody,
                                              r'''$.user.imageUrl''',
                                            ).toString(),
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (context, error, stackTrace) =>
                                                    Image.asset(
                                              'assets/images/error_image.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            UserGroup.userDataCall.userfullname(
                                              homePageUserDataResponse.jsonBody,
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
                                                homePageUserDataResponse
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
                        Divider(
                          thickness: 1.0,
                          indent: 20.0,
                          endIndent: 20.0,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        if (UserGroup.userDataCall.userrole(
                              homePageUserDataResponse.jsonBody,
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
                                      '1gpndqnf' /* Offers */,
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
                                    'qrzmr8as' /* FAQ */,
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
                                    'njft22hy' /* About US */,
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
                                    'fyoom9wx' /* Mission & Vision */,
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
                                    'tlc8r6qg' /* Contact Us */,
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
                                    'wif5bi4h' /* Privacy Policy */,
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
                                    'zo83atxn' /* Terms & Conditions */,
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
                                    '0xm5a65v' /* Delet Account  */,
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
                                    'pliu2kzz' /* Settings */,
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
                              40.0, 40.0, 40.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              GoRouter.of(context).prepareAuthEvent();
                              await authManager.signOut();
                              GoRouter.of(context).clearRedirectLocation();

                              FFAppState().Token = '';
                              FFAppState().SupId = '';
                              safeSetState(() {});
                              if (scaffoldKey.currentState!.isDrawerOpen ||
                                  scaffoldKey.currentState!.isEndDrawerOpen) {
                                Navigator.pop(context);
                              }

                              context.goNamedAuth(
                                  'OnBoarding', context.mounted);
                            },
                            text: FFLocalizations.of(context).getText(
                              'bmoo18p6' /* LOGOUT */,
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
              child: Stack(
                children: [
                  if (UserGroup.userDataCall.userrole(
                        homePageUserDataResponse.jsonBody,
                      ) !=
                      'supplier')
                    FutureBuilder<ApiCallResponse>(
                      future: FavouriteGroup.fetchFavCall.call(
                        token: FFAppState().Token,
                        lang: FFAppState().lang,
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
                        final stackFetchFavResponse = snapshot.data!;

                        return Stack(
                          children: [
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
                                                topRight: Radius.circular(0.0),
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
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            FutureBuilder<ApiCallResponse>(
                                              future:
                                                  CartGroup.countCartCall.call(
                                                token: FFAppState().Token,
                                                lang: FFAppState().lang,
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
                                                final stackCountCartResponse =
                                                    snapshot.data!;

                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed('Cart');
                                                  },
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        width: 25.0,
                                                        height: 50.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Icon(
                                                          Icons
                                                              .shopping_basket_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFF59B21),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0xFFF59B21),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      2.0,
                                                                      0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              CartGroup
                                                                  .countCartCall
                                                                  .count(
                                                                    stackCountCartResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.toString(),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  fontSize:
                                                                      13.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                            Stack(
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'Notification');
                                                  },
                                                  child: Container(
                                                    width: 25.0,
                                                    height: 50.0,
                                                    decoration: const BoxDecoration(),
                                                    child: Icon(
                                                      Icons.notifications_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                StreamBuilder<
                                                    List<NotificationRecord>>(
                                                  stream:
                                                      queryNotificationRecord(
                                                    queryBuilder:
                                                        (notificationRecord) =>
                                                            notificationRecord
                                                                .where(
                                                      'SendTo',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    ),
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
                                                    List<NotificationRecord>
                                                        containerNotificationRecordList =
                                                        snapshot.data!;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFFF59B21),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0xFFF59B21),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2.0,
                                                                    0.0,
                                                                    2.0,
                                                                    0.0),
                                                        child: Text(
                                                          containerNotificationRecordList
                                                              .length
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontSize: 13.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ].divide(const SizedBox(width: 15.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 100.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 120.0),
                                      child: SingleChildScrollView(
                                        primary: false,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(14.0),
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    border: Border.all(
                                                      color: const Color(0x2D2D2D80),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.search_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 24.0,
                                                        ),
                                                        Expanded(
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController,
                                                            focusNode: _model
                                                                .textFieldFocusNode,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController',
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                              () async {
                                                                _model.search2 =
                                                                    await HomeGroup
                                                                        .searchCall
                                                                        .call(
                                                                  keyword: _model
                                                                      .textController
                                                                      .text,
                                                                  token:
                                                                      FFAppState()
                                                                          .Token,
                                                                  lang:
                                                                      FFAppState()
                                                                          .lang,
                                                                );

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'em9lggz1' /* Search here... */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: const Color(
                                                                            0xFFBDBFC1),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if ((_model.textController
                                                            .text !=
                                                        '') &&
                                                (HomeGroup.searchCall.prodcuts(
                                                          (_model.search2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (HomeGroup.searchCall
                                                            .prodcuts(
                                                      (_model.search2
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty))
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'snpbhy5m' /* Search products */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Cairo',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.textController.text !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Builder(
                                                        builder: (context) {
                                                          final pro = (HomeGroup
                                                                      .searchCall
                                                                      .prodcuts(
                                                                        (_model.search2?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.toList() ??
                                                                  [])
                                                              .take(5)
                                                              .toList();

                                                          return GridView
                                                              .builder(
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
                                                                pro.length,
                                                            itemBuilder:
                                                                (context,
                                                                    proIndex) {
                                                              final proItem =
                                                                  pro[proIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'ProductsDetalis',
                                                                    queryParameters:
                                                                        {
                                                                      'proId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          proItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0xFF1E2D7D),
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Stack(
                                                                              alignment: const AlignmentDirectional(1.0, 1.0),
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: const Duration(milliseconds: 500),
                                                                                    fadeOutDuration: const Duration(milliseconds: 500),
                                                                                    imageUrl: getJsonField(
                                                                                      proItem,
                                                                                      r'''$.images[:].url''',
                                                                                    ).toString(),
                                                                                    width: 180.0,
                                                                                    height: 155.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 20.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.apiResultdpj1 = await FavouriteGroup.favUpdateProductsCall.call(
                                                                                        token: FFAppState().Token,
                                                                                        productId: getJsonField(
                                                                                          proItem,
                                                                                          r'''$.id''',
                                                                                        ),
                                                                                        lang: FFAppState().lang,
                                                                                      );

                                                                                      if ((_model.apiResultdpj1?.succeeded ?? true)) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              FavouriteGroup.favUpdateProductsCall.message(
                                                                                                (_model.apiResultdpj1?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              FavouriteGroup.favUpdateProductsCall.message(
                                                                                                (_model.apiResultdpj1?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      safeSetState(() {});
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
                                                                                        child: Icon(
                                                                                          Icons.favorite_sharp,
                                                                                          color: FavouriteGroup.fetchFavCall
                                                                                                  .proId(
                                                                                                    stackFetchFavResponse.jsonBody,
                                                                                                  )!
                                                                                                  .contains(getJsonField(
                                                                                                    proItem,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              ? const Color(0xFFF59B21)
                                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Container(
                                                                              width: 160.0,
                                                                              decoration: const BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    proItem,
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
                                                                                15.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 100.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (getJsonField(
                                                                                            proItem,
                                                                                            r'''$.price''',
                                                                                          ) ==
                                                                                          getJsonField(
                                                                                            proItem,
                                                                                            r'''$.priceWithDiscount''',
                                                                                          ))
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              proItem,
                                                                                              r'''$.price''',
                                                                                            ).toString()}LE',
                                                                                            maxLines: 2,
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
                                                                                            proItem,
                                                                                            r'''$.price''',
                                                                                          ) !=
                                                                                          getJsonField(
                                                                                            proItem,
                                                                                            r'''$.priceWithDiscount''',
                                                                                          ))
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              proItem,
                                                                                              r'''$.priceWithDiscount''',
                                                                                            ).toString()}LE',
                                                                                            maxLines: 2,
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
                                                                                ),
                                                                                Container(
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Visibility(
                                                                                    visible: loggedIn,
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.apiResult5u91 = await CartGroup.updateCartProductCall.call(
                                                                                          productId: getJsonField(
                                                                                            proItem,
                                                                                            r'''$.id''',
                                                                                          ),
                                                                                          token: FFAppState().Token,
                                                                                          lang: FFAppState().lang,
                                                                                        );

                                                                                        if ((_model.apiResult5u91?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResult5u91?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResult5u91?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
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
                                                                                            Icons.add,
                                                                                            color: Color(0xFFF59B21),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if (getJsonField(
                                                                                proItem,
                                                                                r'''$.price''',
                                                                              ) !=
                                                                              getJsonField(
                                                                                proItem,
                                                                                r'''$.priceWithDiscount''',
                                                                              ))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 100.0,
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              proItem,
                                                                                              r'''$.price''',
                                                                                            ).toString()}LE',
                                                                                            maxLines: 2,
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
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          proItem,
                                                                          r'''$.price''',
                                                                        ) !=
                                                                        getJsonField(
                                                                          proItem,
                                                                          r'''$.priceWithDiscount''',
                                                                        ))
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                            color:
                                                                                const Color(0xFFFF0000),
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              '% ${getJsonField(
                                                                                proItem,
                                                                                r'''$.discounts[:].discountPercentage''',
                                                                              ).toString()}',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if ((_model.textController
                                                            .text !=
                                                        '') &&
                                                (HomeGroup.searchCall.pets(
                                                          (_model.search2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) !=
                                                        null &&
                                                    (HomeGroup.searchCall.pets(
                                                      (_model.search2
                                                              ?.jsonBody ??
                                                          ''),
                                                    ))!
                                                        .isNotEmpty))
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'swcvzfpz' /* Search pets */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Cairo',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.textController.text !=
                                                    '')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Builder(
                                                        builder: (context) {
                                                          final pets = (HomeGroup
                                                                      .searchCall
                                                                      .pets(
                                                                        (_model.search2?.jsonBody ??
                                                                            ''),
                                                                      )
                                                                      ?.toList() ??
                                                                  [])
                                                              .take(5)
                                                              .toList();

                                                          return GridView
                                                              .builder(
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
                                                                pets.length,
                                                            itemBuilder:
                                                                (context,
                                                                    petsIndex) {
                                                              final petsItem =
                                                                  pets[
                                                                      petsIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'PetDetalis',
                                                                    queryParameters:
                                                                        {
                                                                      'petId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          petsItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child: Stack(
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color(
                                                                            0xFF1E2D7D),
                                                                        borderRadius:
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Stack(
                                                                              alignment: const AlignmentDirectional(1.0, 1.0),
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: const Duration(milliseconds: 500),
                                                                                    fadeOutDuration: const Duration(milliseconds: 500),
                                                                                    imageUrl: getJsonField(
                                                                                      petsItem,
                                                                                      r'''$.images[:].url''',
                                                                                    ).toString(),
                                                                                    width: 180.0,
                                                                                    height: 155.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 20.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.apiResultdpj2 = await FavouriteGroup.favUpdatePetsCall.call(
                                                                                        petId: getJsonField(
                                                                                          petsItem,
                                                                                          r'''$.id''',
                                                                                        ),
                                                                                        token: FFAppState().Token,
                                                                                        lang: FFAppState().lang,
                                                                                      );

                                                                                      if ((_model.apiResultdpj2?.succeeded ?? true)) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              FavouriteGroup.favUpdatePetsCall.message(
                                                                                                (_model.apiResultdpj2?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              FavouriteGroup.favUpdatePetsCall.message(
                                                                                                (_model.apiResultdpj2?.jsonBody ?? ''),
                                                                                              )!,
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: const Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      safeSetState(() {});
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
                                                                                        child: Icon(
                                                                                          Icons.favorite_sharp,
                                                                                          color: FavouriteGroup.fetchFavCall
                                                                                                  .petId(
                                                                                                    stackFetchFavResponse.jsonBody,
                                                                                                  )!
                                                                                                  .contains(getJsonField(
                                                                                                    petsItem,
                                                                                                    r'''$.id''',
                                                                                                  ))
                                                                                              ? const Color(0xFFF59B21)
                                                                                              : FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 22.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Container(
                                                                              width: 160.0,
                                                                              decoration: const BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  getJsonField(
                                                                                    petsItem,
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
                                                                                15.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  width: 100.0,
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Stack(
                                                                                    children: [
                                                                                      if (getJsonField(
                                                                                            petsItem,
                                                                                            r'''$.price''',
                                                                                          ) ==
                                                                                          getJsonField(
                                                                                            petsItem,
                                                                                            r'''$.priceWithDiscount''',
                                                                                          ))
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              petsItem,
                                                                                              r'''$.price''',
                                                                                            ).toString()}LE',
                                                                                            maxLines: 2,
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
                                                                                            petsItem,
                                                                                            r'''$.price''',
                                                                                          ) !=
                                                                                          getJsonField(
                                                                                            petsItem,
                                                                                            r'''$.priceWithDiscount''',
                                                                                          ))
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              petsItem,
                                                                                              r'''$.priceWithDiscount''',
                                                                                            ).toString()}LE',
                                                                                            maxLines: 2,
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
                                                                                ),
                                                                                Container(
                                                                                  decoration: const BoxDecoration(),
                                                                                  child: Visibility(
                                                                                    visible: loggedIn,
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.apiResult5u92 = await CartGroup.updateCartPetsCall.call(
                                                                                          petId: getJsonField(
                                                                                            petsItem,
                                                                                            r'''$.id''',
                                                                                          ),
                                                                                          token: FFAppState().Token,
                                                                                          lang: FFAppState().lang,
                                                                                        );

                                                                                        if ((_model.apiResult5u92?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResult5u92?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                getJsonField(
                                                                                                  (_model.apiResult5u92?.jsonBody ?? ''),
                                                                                                  r'''$.message''',
                                                                                                ).toString(),
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
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
                                                                                            Icons.add,
                                                                                            color: Color(0xFFF59B21),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          if (getJsonField(
                                                                                petsItem,
                                                                                r'''$.price''',
                                                                              ) !=
                                                                              getJsonField(
                                                                                petsItem,
                                                                                r'''$.priceWithDiscount''',
                                                                              ))
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 100.0,
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            '${getJsonField(
                                                                                              petsItem,
                                                                                              r'''$.price''',
                                                                                            ).toString()}LE',
                                                                                            maxLines: 2,
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
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    if (getJsonField(
                                                                          petsItem,
                                                                          r'''$.price''',
                                                                        ) !=
                                                                        getJsonField(
                                                                          petsItem,
                                                                          r'''$.priceWithDiscount''',
                                                                        ))
                                                                      Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                            color:
                                                                                const Color(0xFFFF0000),
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              '% ${getJsonField(
                                                                                petsItem,
                                                                                r'''$.discounts[:].discountPercentage''',
                                                                              ).toString()}',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 20.0, 20.0, 0.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: AdsGroup.ferchAdsCall
                                                      .call(),
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
                                                    final containerFerchAdsResponse =
                                                        snapshot.data!;

                                                    return Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final adss = AdsGroup
                                                                  .ferchAdsCall
                                                                  .ads(
                                                                    containerFerchAdsResponse
                                                                        .jsonBody,
                                                                  )
                                                                  ?.toList() ??
                                                              [];

                                                          return SizedBox(
                                                            width:
                                                                double.infinity,
                                                            height: 220.0,
                                                            child:
                                                                CarouselSlider
                                                                    .builder(
                                                              itemCount:
                                                                  adss.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      adssIndex,
                                                                      _) {
                                                                final adssItem =
                                                                    adss[
                                                                        adssIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                            .Type =
                                                                        getJsonField(
                                                                      adssItem,
                                                                      r'''$.type''',
                                                                    ).toString();
                                                                    safeSetState(
                                                                        () {});
                                                                    if (FFAppState()
                                                                            .Type ==
                                                                        'http') {
                                                                      await launchURL(
                                                                          getJsonField(
                                                                        adssItem,
                                                                        r'''$.route''',
                                                                      ).toString());
                                                                    } else {
                                                                      if (FFAppState()
                                                                              .Type ==
                                                                          'product') {
                                                                        context
                                                                            .pushNamed(
                                                                          'ProductsDetalis',
                                                                          queryParameters:
                                                                              {
                                                                            'proId':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                adssItem,
                                                                                r'''$.route''',
                                                                              ),
                                                                              ParamType.int,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      } else {
                                                                        if (FFAppState().Type ==
                                                                            'pet') {
                                                                          context
                                                                              .pushNamed(
                                                                            'PetDetalis',
                                                                            queryParameters:
                                                                                {
                                                                              'petId': serializeParam(
                                                                                getJsonField(
                                                                                  adssItem,
                                                                                  r'''$.route''',
                                                                                ),
                                                                                ParamType.int,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        }
                                                                      }
                                                                    }
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        CachedNetworkImage(
                                                                      fadeInDuration:
                                                                          const Duration(
                                                                              milliseconds: 500),
                                                                      fadeOutDuration:
                                                                          const Duration(
                                                                              milliseconds: 500),
                                                                      imageUrl:
                                                                          getJsonField(
                                                                        adssItem,
                                                                        r'''$.imageUrl''',
                                                                      ).toString(),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              carouselController:
                                                                  _model.carouselController ??=
                                                                      CarouselSliderController(),
                                                              options:
                                                                  CarouselOptions(
                                                                initialPage: max(
                                                                    0,
                                                                    min(
                                                                        0,
                                                                        adss.length -
                                                                            1)),
                                                                viewportFraction:
                                                                    0.8,
                                                                disableCenter:
                                                                    true,
                                                                enlargeCenterPage:
                                                                    true,
                                                                enlargeFactor:
                                                                    0.2,
                                                                enableInfiniteScroll:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                autoPlay: true,
                                                                autoPlayAnimationDuration:
                                                                    const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                autoPlayInterval: const Duration(
                                                                    milliseconds:
                                                                        (500 +
                                                                            4000)),
                                                                autoPlayCurve:
                                                                    Curves
                                                                        .linear,
                                                                pauseAutoPlayInFiniteScroll:
                                                                    true,
                                                                onPageChanged: (index,
                                                                        _) =>
                                                                    _model.carouselCurrentIndex =
                                                                        index,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '8hnfd057' /* Pet Category */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'PetCategory');
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'oh29jx55' /* View All */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Cairo',
                                                            color: const Color(
                                                                0xFFF59B21),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future: HomeGroup
                                                      .fetchSpeciesCall
                                                      .call(
                                                    lang: FFAppState().lang,
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
                                                    final rowFetchSpeciesResponse =
                                                        snapshot.data!;

                                                    return Builder(
                                                      builder: (context) {
                                                        final petsCat = HomeGroup
                                                                .fetchSpeciesCall
                                                                .petCat(
                                                                  rowFetchSpeciesResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];

                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                petsCat.length,
                                                                (petsCatIndex) {
                                                              final petsCatItem =
                                                                  petsCat[
                                                                      petsCatIndex];
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'PetsList',
                                                                      queryParameters:
                                                                          {
                                                                        'petCatName':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            petsCatItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'petId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            petsCatItem,
                                                                            r'''$.id''',
                                                                          ),
                                                                          ParamType
                                                                              .JSON,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 75.0,
                                                                    height:
                                                                        106.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: const Color(
                                                                          0x9A00BFFF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                getJsonField(
                                                                              petsCatItem,
                                                                              r'''$.imageUrl''',
                                                                            ).toString(),
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                50.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            petsCatItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Cairo',
                                                                                color: const Color(0xFF1E2D7D),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'f2hjkp8s' /* Products Category */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.pushNamed(
                                                          'ProductsCategory');
                                                    },
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '5hzto6at' /* View All */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Cairo',
                                                            color: const Color(
                                                                0xFFF59B21),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HomeGroup
                                                    .fetchCategoryCall
                                                    .call(
                                                  lang: FFAppState().lang,
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
                                                  final rowFetchCategoryResponse =
                                                      snapshot.data!;

                                                  return Builder(
                                                    builder: (context) {
                                                      final proCat = HomeGroup
                                                              .fetchCategoryCall
                                                              .proCat(
                                                                rowFetchCategoryResponse
                                                                    .jsonBody,
                                                              )
                                                              ?.toList() ??
                                                          [];

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children:
                                                              List.generate(
                                                                  proCat.length,
                                                                  (proCatIndex) {
                                                            final proCatItem =
                                                                proCat[
                                                                    proCatIndex];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'ProductsList',
                                                                    queryParameters:
                                                                        {
                                                                      'proCatName':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          proCatItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'id':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          proCatItem,
                                                                          r'''$.id''',
                                                                        ),
                                                                        ParamType
                                                                            .JSON,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFF1E2D7D),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                getJsonField(
                                                                              proCatItem,
                                                                              r'''$.imageUrl''',
                                                                            ).toString(),
                                                                            width:
                                                                                90.0,
                                                                            height:
                                                                                60.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              80.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                const Color(0xFFFFFCF7),
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: const Color(0x2D2D2D80),
                                                                              width: 1.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.all(5.0),
                                                                            child:
                                                                                Text(
                                                                              getJsonField(
                                                                                proCatItem,
                                                                                r'''$.name''',
                                                                              ).toString(),
                                                                              textAlign: TextAlign.center,
                                                                              maxLines: 1,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Cairo',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 14.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            10.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 5.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'ma1ueswe' /* Most Selling */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: HomeGroup
                                                    .fetchMosrtSellingCall
                                                    .call(
                                                  lang: FFAppState().lang,
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
                                                  final rowFetchMosrtSellingResponse =
                                                      snapshot.data!;

                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Builder(
                                                          builder: (context) {
                                                            final pro = HomeGroup
                                                                    .fetchMosrtSellingCall
                                                                    .products(
                                                                      rowFetchMosrtSellingResponse
                                                                          .jsonBody,
                                                                    )
                                                                    ?.toList() ??
                                                                [];

                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
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
                                                                  pro.length,
                                                              itemBuilder:
                                                                  (context,
                                                                      proIndex) {
                                                                final proItem =
                                                                    pro[proIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'ProductsDetalis',
                                                                      queryParameters:
                                                                          {
                                                                        'proId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            proItem,
                                                                            r'''$.id''',
                                                                          ),
                                                                          ParamType
                                                                              .int,
                                                                        ),
                                                                        'pricewithdiscount':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            proItem,
                                                                            r'''$.priceWithDiscount''',
                                                                          ),
                                                                          ParamType
                                                                              .double,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Stack(
                                                                    children: [
                                                                      Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0xFF1E2D7D),
                                                                          borderRadius:
                                                                              BorderRadius.circular(30.0),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
                                                                              child: Stack(
                                                                                alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: const Duration(milliseconds: 500),
                                                                                      fadeOutDuration: const Duration(milliseconds: 500),
                                                                                      imageUrl: getJsonField(
                                                                                        proItem,
                                                                                        r'''$.images[:].url''',
                                                                                      ).toString(),
                                                                                      width: 180.0,
                                                                                      height: 155.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 20.0),
                                                                                    child: InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.apiResultdpj = await FavouriteGroup.favUpdateProductsCall.call(
                                                                                          token: FFAppState().Token,
                                                                                          productId: getJsonField(
                                                                                            proItem,
                                                                                            r'''$.id''',
                                                                                          ),
                                                                                          lang: FFAppState().lang,
                                                                                        );

                                                                                        if ((_model.apiResultdpj?.succeeded ?? true)) {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                FavouriteGroup.favUpdateProductsCall.message(
                                                                                                  (_model.apiResultdpj?.jsonBody ?? ''),
                                                                                                )!,
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                FavouriteGroup.favUpdateProductsCall.message(
                                                                                                  (_model.apiResultdpj?.jsonBody ?? ''),
                                                                                                )!,
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                ),
                                                                                              ),
                                                                                              duration: const Duration(milliseconds: 4000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        safeSetState(() {});
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
                                                                                          child: Icon(
                                                                                            Icons.favorite_sharp,
                                                                                            color: FavouriteGroup.fetchFavCall
                                                                                                    .proId(
                                                                                                      stackFetchFavResponse.jsonBody,
                                                                                                    )!
                                                                                                    .contains(getJsonField(
                                                                                                      proItem,
                                                                                                      r'''$.id''',
                                                                                                    ))
                                                                                                ? const Color(0xFFF59B21)
                                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                                            size: 22.0,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(-1.0, -1.0),
                                                                              child: Container(
                                                                                width: 160.0,
                                                                                decoration: const BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 0.0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      proItem,
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
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 100.0,
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        if (getJsonField(
                                                                                              proItem,
                                                                                              r'''$.price''',
                                                                                            ) ==
                                                                                            getJsonField(
                                                                                              proItem,
                                                                                              r'''$.priceWithDiscount''',
                                                                                            ))
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${getJsonField(
                                                                                                proItem,
                                                                                                r'''$.price''',
                                                                                              ).toString()}LE',
                                                                                              maxLines: 2,
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
                                                                                              proItem,
                                                                                              r'''$.price''',
                                                                                            ) !=
                                                                                            getJsonField(
                                                                                              proItem,
                                                                                              r'''$.priceWithDiscount''',
                                                                                            ))
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${getJsonField(
                                                                                                proItem,
                                                                                                r'''$.priceWithDiscount''',
                                                                                              ).toString()}LE',
                                                                                              maxLines: 2,
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
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Visibility(
                                                                                      visible: loggedIn,
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          _model.apiResult5u9 = await CartGroup.updateCartProductCall.call(
                                                                                            productId: getJsonField(
                                                                                              proItem,
                                                                                              r'''$.id''',
                                                                                            ),
                                                                                            token: FFAppState().Token,
                                                                                            lang: FFAppState().lang,
                                                                                          );

                                                                                          if ((_model.apiResult5u9?.succeeded ?? true)) {
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  getJsonField(
                                                                                                    (_model.apiResult5u9?.jsonBody ?? ''),
                                                                                                    r'''$.message''',
                                                                                                  ).toString(),
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                duration: const Duration(milliseconds: 4000),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                            );
                                                                                          } else {
                                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                                              SnackBar(
                                                                                                content: Text(
                                                                                                  getJsonField(
                                                                                                    (_model.apiResult5u9?.jsonBody ?? ''),
                                                                                                    r'''$.message''',
                                                                                                  ).toString(),
                                                                                                  style: TextStyle(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                duration: const Duration(milliseconds: 4000),
                                                                                                backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                              ),
                                                                                            );
                                                                                          }

                                                                                          safeSetState(() {});
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
                                                                                              Icons.add,
                                                                                              color: Color(0xFFF59B21),
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (getJsonField(
                                                                                  proItem,
                                                                                  r'''$.price''',
                                                                                ) !=
                                                                                getJsonField(
                                                                                  proItem,
                                                                                  r'''$.priceWithDiscount''',
                                                                                ))
                                                                              Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 100.0,
                                                                                      decoration: const BoxDecoration(),
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              '${getJsonField(
                                                                                                proItem,
                                                                                                r'''$.price''',
                                                                                              ).toString()}LE',
                                                                                              maxLines: 2,
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
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      if (getJsonField(
                                                                            proItem,
                                                                            r'''$.price''',
                                                                          ) !=
                                                                          getJsonField(
                                                                            proItem,
                                                                            r'''$.priceWithDiscount''',
                                                                          ))
                                                                        Align(
                                                                          alignment: const AlignmentDirectional(
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
                                                                              color: const Color(0xFFFF0000),
                                                                              borderRadius: BorderRadius.circular(50.0),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: const AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                '% ${getJsonField(
                                                                                  proItem,
                                                                                  r'''$.discounts[:].discountPercentage''',
                                                                                ).toString()}',
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
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
                            wrapWithModel(
                              model: _model.customNavBarModel,
                              updateCallback: () => safeSetState(() {}),
                              child: const CustomNavBarWidget(
                                page: 'Home',
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  if (UserGroup.userDataCall.userrole(
                        homePageUserDataResponse.jsonBody,
                      ) ==
                      'supplier')
                    FutureBuilder<ApiCallResponse>(
                      future: SupplierGroup.supplierProductsCall.call(
                        id: UserGroup.userDataCall.userid(
                          homePageUserDataResponse.jsonBody,
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
                                  homePageUserDataResponse.jsonBody,
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
                                            'c96s0slc' /* Your Account Is Not Active Yet... */,
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 40.0, 20.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          GoRouter.of(context)
                                              .prepareAuthEvent();
                                          await authManager.signOut();
                                          GoRouter.of(context)
                                              .clearRedirectLocation();

                                          context.pushNamedAuth(
                                              'LoginPage', context.mounted);

                                          FFAppState().Token = '';
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '07l1t4xz' /* LOGOUT */,
                                        ),
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 45.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0xFFFF7300),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                                (SupplierGroup
                                                        .supplierProductsCall
                                                        .products(
                                                  stackSupplierProductsResponse
                                                      .jsonBody,
                                                ))!
                                                    .isNotEmpty) ||
                                            (UserGroup.userDataCall.userstatus(
                                                  homePageUserDataResponse
                                                      .jsonBody,
                                                ) !=
                                                'BLOCKED'))
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'ngsf9164' /* Products */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                      itemCount:
                                                          products.length,
                                                      itemBuilder: (context,
                                                          productsIndex) {
                                                        final productsItem =
                                                            products[
                                                                productsIndex];
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
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              1.0,
                                                                              1.0),
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20.0),
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            fadeInDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            fadeOutDuration:
                                                                                const Duration(milliseconds: 500),
                                                                            imageUrl:
                                                                                getJsonField(
                                                                              productsItem,
                                                                              r'''$.images[:].url''',
                                                                            ).toString(),
                                                                            width:
                                                                                180.0,
                                                                            height:
                                                                                155.0,
                                                                            fit:
                                                                                BoxFit.cover,
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
                                                                            productsItem,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          maxLines:
                                                                              2,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
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
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
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
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                        -1.0,
                                                                        -1.0),
                                                                child:
                                                                    Container(
                                                                  width: 70.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color(
                                                                        0xFFFF0000),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
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
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                          future: SupplierGroup.supplierPetsCall
                                              .call(
                                            id: UserGroup.userDataCall.userid(
                                              homePageUserDataResponse.jsonBody,
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
                                            final columnSupplierPetsResponse =
                                                snapshot.data!;

                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((SupplierGroup
                                                                .supplierPetsCall
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
                                                          homePageUserDataResponse
                                                              .jsonBody,
                                                        ) !=
                                                        'BLOCKED'))
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  25.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '6t5rm6vn' /* Pets */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 20.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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

                                                            return GridView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              gridDelegate:
                                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
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
                                                              itemBuilder:
                                                                  (context,
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
                                                                            BorderRadius.circular(30.0),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                5.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Stack(
                                                                              alignment: const AlignmentDirectional(1.0, 1.0),
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: const Duration(milliseconds: 500),
                                                                                    fadeOutDuration: const Duration(milliseconds: 500),
                                                                                    imageUrl: getJsonField(
                                                                                      pets2Item,
                                                                                      r'''$.images[:].url''',
                                                                                    ).toString(),
                                                                                    width: 180.0,
                                                                                    height: 155.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Container(
                                                                              width: 120.0,
                                                                              decoration: const BoxDecoration(),
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
                                                                                child: Text(
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
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 20.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                                        alignment: const AlignmentDirectional(
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
                                                                            color:
                                                                                const Color(0xFFFF0000),
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              '-${getJsonField(
                                                                                pets2Item,
                                                                                r'''$.discounts[:].discountPercentage''',
                                                                              ).toString()}%',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                                          homePageUserDataResponse.jsonBody,
                                        ) ==
                                        'supplier') &&
                                    (UserGroup.userDataCall.userstatus(
                                          homePageUserDataResponse.jsonBody,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        const Color(0x2D2D2D80),
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
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 50.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
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
                                                        context.pushNamed(
                                                            'SupplierMyOrder');
                                                      },
                                                      child: const FaIcon(
                                                        FontAwesomeIcons.store,
                                                        color:
                                                            Color(0xFFF59B21),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'NotificationSupplier');
                                                      },
                                                      child: Container(
                                                        width: 25.0,
                                                        height: 50.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: const Icon(
                                                          Icons
                                                              .notifications_sharp,
                                                          color:
                                                              Color(0xFFF59B21),
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                    ),
                                                    StreamBuilder<
                                                        List<
                                                            NotificationRecord>>(
                                                      stream:
                                                          queryNotificationRecord(
                                                        queryBuilder:
                                                            (notificationRecord) =>
                                                                notificationRecord
                                                                    .where(
                                                          'SendTo',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
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
                                                        List<NotificationRecord>
                                                            containerNotificationRecordList =
                                                            snapshot.data!;

                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: const Color(
                                                                0xFFF59B21),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0xFFF59B21),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        2.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Text(
                                                              containerNotificationRecordList
                                                                  .length
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        13.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        );
                                                      },
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
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
