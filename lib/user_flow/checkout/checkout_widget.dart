import 'package:paymob_payment/paymob_payment.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key});

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  late CheckoutModel _model;
  PaymobResponse? response;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());
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
      future: _model.cass(
        requestFn: () => CartGroup.fetchCartsCall.call(
          token: FFAppState().Token,
          lang: FFAppState().lang,
        ),
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
        final checkoutFetchCartsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: FutureBuilder<ApiCallResponse>(
                future: _model.ww(
                  requestFn: () => UserGroup.userDataCall.call(
                    token: FFAppState().Token,
                    lang: FFAppState().lang,
                  ),
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
                  final columnUserDataResponse = snapshot.data!;

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 70.0,
                          decoration: const BoxDecoration(
                            color: Color(0xFF1E2D7D),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25.0),
                              bottomRight: Radius.circular(25.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 5.0, 25.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.white,
                                        borderRadius: 50.0,
                                        borderWidth: 1.0,
                                        buttonSize: 25.0,
                                        icon: Icon(
                                          Icons.arrow_back_ios_rounded,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 10.0,
                                        ),
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'j76zolum' /* Checkout */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
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
                        Container(
                          decoration: const BoxDecoration(),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '7bjazwme' /* Shipping Address */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed('Address');
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'z4wfng3m' /* Add Address */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: const Color(0xFFF59B21),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'bwfo7xy8' /* Name:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  UserGroup.userDataCall
                                                      .userfullname(
                                                    columnUserDataResponse
                                                        .jsonBody,
                                                  ),
                                                  'a',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              const Color(0xFF7A7AAE),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'w2bh50c0' /* Phone:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  UserGroup.userDataCall
                                                      .userphone(
                                                    columnUserDataResponse
                                                        .jsonBody,
                                                  ),
                                                  'a',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              const Color(0xFF7A7AAE),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'mzbx4sik' /* Address:  */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                              Container(
                                                width: 250.0,
                                                decoration: const BoxDecoration(),
                                                child: Text(
                                                  FFAppState().Address,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color:
                                                            const Color(0xFF7A7AAE),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 30.0))
                                      .addToStart(const SizedBox(height: 20.0)),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'wmrvmny2' /* Payment Method */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().payment = 'COD';
                                          FFAppState().update(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState().payment == 'COD')
                                              const Icon(
                                                Icons.radio_button_checked,
                                                color: Color(0xFFEEB002),
                                                size: 24.0,
                                              ),
                                            if (FFAppState().payment != 'COD')
                                              Icon(
                                                Icons.radio_button_off,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lcgge3gz' /* Cash on delivery  */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          FFAppState().payment = 'Creadit Card';
                                          FFAppState().update(() {});
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState().payment ==
                                                'Creadit Card')
                                              const Icon(
                                                Icons.radio_button_checked,
                                                color: Color(0xFFEEB002),
                                                size: 24.0,
                                              ),
                                            if (FFAppState().payment !=
                                                'Creadit Card')
                                              Icon(
                                                Icons.radio_button_off,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '3h7w6u9w' /* Creadit Card */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ]
                                      .divide(const SizedBox(height: 10.0))
                                      .addToStart(const SizedBox(height: 50.0)),
                                ),
                                Divider(
                                  thickness: 2.0,
                                  indent: 10.0,
                                  endIndent: 10.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 10.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'v6l64si9' /* Product List */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black,
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Builder(
                                        builder: (context) {
                                          final prod = CartGroup.fetchCartsCall
                                                  .products(
                                                    checkoutFetchCartsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toList() ??
                                              [];

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: prod.length,
                                            itemBuilder: (context, prodIndex) {
                                              final prodItem = prod[prodIndex];
                                              return Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 5.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        color:
                                                            const Color(0x6D57636C),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 5.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: const Color(
                                                                0x6D57636C),
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      10.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    fadeInDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    fadeOutDuration:
                                                                        const Duration(
                                                                            milliseconds:
                                                                                500),
                                                                    imageUrl:
                                                                        getJsonField(
                                                                      prodItem,
                                                                      r'''$.image.url''',
                                                                    ).toString(),
                                                                    width: 80.0,
                                                                    height:
                                                                        80.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        200.0,
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        prodItem,
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
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  RichText(
                                                                    textScaler:
                                                                        MediaQuery.of(context)
                                                                            .textScaler,
                                                                    text:
                                                                        TextSpan(
                                                                      children: [
                                                                        TextSpan(
                                                                          text: FFLocalizations.of(context).languageCode == 'en'
                                                                              ? 'Qty: '
                                                                              : 'الكميه: ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Cairo',
                                                                                color: Colors.black,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                        TextSpan(
                                                                          text:
                                                                              getJsonField(
                                                                            prodItem,
                                                                            r'''$.quantity''',
                                                                          ).toString(),
                                                                          style:
                                                                              const TextStyle(),
                                                                        )
                                                                      ],
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Cairo',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        if (getJsonField(
                                                                              prodItem,
                                                                              r'''$.price''',
                                                                            ) ==
                                                                            getJsonField(
                                                                              prodItem,
                                                                              r'''$.priceWithDiscount''',
                                                                            ))
                                                                          Text(
                                                                            getJsonField(
                                                                              prodItem,
                                                                              r'''$.price''',
                                                                            ).toString(),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: const Color(0xFF1E2D7D),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              prodItem,
                                                                              r'''$.price''',
                                                                            ) !=
                                                                            getJsonField(
                                                                              prodItem,
                                                                              r'''$.priceWithDiscount''',
                                                                            ))
                                                                          Text(
                                                                            getJsonField(
                                                                              prodItem,
                                                                              r'''$.priceWithDiscount''',
                                                                            ).toString(),
                                                                            maxLines:
                                                                                2,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Inter',
                                                                                  color: const Color(0xFF1E2D7D),
                                                                                  fontSize: 16.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(const SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: Builder(
                                          builder: (context) {
                                            final pets =
                                                CartGroup.fetchCartsCall
                                                        .pets(
                                                          checkoutFetchCartsResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: pets.length,
                                              itemBuilder:
                                                  (context, petsIndex) {
                                                final petsItem =
                                                    pets[petsIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 5.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0x6D57636C),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: const Color(
                                                                  0x6D57636C),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(),
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
                                                                        petsItem,
                                                                        r'''$.image.url''',
                                                                      ).toString(),
                                                                      width:
                                                                          80.0,
                                                                      height:
                                                                          80.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          200.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Text(
                                                                        getJsonField(
                                                                          petsItem,
                                                                          r'''$.name''',
                                                                        ).toString(),
                                                                        maxLines:
                                                                            2,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Cairo',
                                                                              color: Colors.black,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if ((CartGroup.fetchCartsCall.petspriceWithDiscount(
                                                                                checkoutFetchCartsResponse.jsonBody,
                                                                              )?[petsIndex]) ==
                                                                              (CartGroup.fetchCartsCall.petsprice(
                                                                                checkoutFetchCartsResponse.jsonBody,
                                                                              )?[petsIndex]))
                                                                            Text(
                                                                              getJsonField(
                                                                                petsItem,
                                                                                r'''$.price''',
                                                                              ).toString(),
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: const Color(0xFF1E2D7D),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
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
                                                                            Text(
                                                                              getJsonField(
                                                                                petsItem,
                                                                                r'''$.priceWithDiscount''',
                                                                              ).toString(),
                                                                              maxLines: 2,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Inter',
                                                                                    color: const Color(0xFF1E2D7D),
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ].divide(const SizedBox(
                                                                      height:
                                                                          10.0)),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ].addToStart(const SizedBox(height: 50.0)),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'l65jsfgg' /* Order Summary */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ub3pvi8c' /* VAT */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${FFAppState().VAT.toString()}%',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF8B8B8B),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'jjyu8uly' /* VAT Total */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  formatNumber(
                                                    valueOrDefault<double>(
                                                          CartGroup
                                                              .fetchCartsCall
                                                              .totalWithDiscount(
                                                            checkoutFetchCartsResponse
                                                                .jsonBody,
                                                          ),
                                                          0.0,
                                                        ) *
                                                        (FFAppState().VAT /
                                                            100.0),
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                    currency: 'LE',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color:
                                                            const Color(0xFF8B8B8B),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFAAD6FD),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'm46h9tf3' /* Subtotal */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Text(
                                                        formatNumber(
                                                          CartGroup
                                                              .fetchCartsCall
                                                              .totalWithDiscount(
                                                            checkoutFetchCartsResponse
                                                                .jsonBody,
                                                          ),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                          currency: 'LE',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Inter',
                                                              color: const Color(
                                                                  0xFF8B8B8B),
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .warning,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'sko90gcb' /* Total */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Cairo',
                                                        color: Colors.black,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                            Text(
                                              formatNumber(
                                                valueOrDefault<double>(
                                                      CartGroup.fetchCartsCall
                                                          .totalWithDiscount(
                                                        checkoutFetchCartsResponse
                                                            .jsonBody,
                                                      ),
                                                      0.0,
                                                    ) +
                                                    (valueOrDefault<double>(
                                                          CartGroup
                                                              .fetchCartsCall
                                                              .totalWithDiscount(
                                                            checkoutFetchCartsResponse
                                                                .jsonBody,
                                                          ),
                                                          0.0,
                                                        ) *
                                                        (FFAppState().VAT /
                                                            100.0)),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: 'LE',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Inter',
                                                    color: const Color(0xFF8B8B8B),
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    if (FFAppState().couponsSelect == true)
                                      Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                          color: Color(0xDDF97A58),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '9zsvbc2d' /* After Offer */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    functions.couponsTotel(
                                                        valueOrDefault<double>(
                                                              CartGroup
                                                                  .fetchCartsCall
                                                                  .totalWithDiscount(
                                                                checkoutFetchCartsResponse
                                                                    .jsonBody,
                                                              ),
                                                              0.0,
                                                            ) +
                                                            (valueOrDefault<
                                                                    double>(
                                                                  CartGroup
                                                                      .fetchCartsCall
                                                                      .totalWithDiscount(
                                                                    checkoutFetchCartsResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  0.0,
                                                                ) *
                                                                (FFAppState()
                                                                        .VAT /
                                                                    100.0)),
                                                        FFAppState()
                                                            .CouponsRatio
                                                            .toDouble()),
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType:
                                                        DecimalType.automatic,
                                                    currency: 'LE',
                                                  ),
                                                  'LR',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          color:
                                                              const Color(0xFF8B8B8B),
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ]
                                      .divide(const SizedBox(height: 15.0))
                                      .addToStart(const SizedBox(height: 50.0)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('coupons');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: const Color(0xFFFF7300),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                              Icons.discount_outlined,
                                              color: Color(0xFFFF7300),
                                              size: 24.0,
                                            ),
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'pkl82jhx' /* Choose a coupon */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Icon(
                                              Icons.chevron_right_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().couponsSelect == true)
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        FFAppState().couponsSelect = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: const Color(0xFFFF7300),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.remove_circle,
                                                color: Color(0xFFFF7300),
                                                size: 24.0,
                                              ),
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '2uvz4uje' /* Remove a Coupon */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Icon(
                                                Icons.chevron_right_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().payment == 'COD')
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 35.0, 20.0, 20.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.apiResulty6n = await OrdersGroup
                                            .createOrderCall
                                            .call(
                                          address: FFAppState().Address,
                                          phone: valueOrDefault<String>(
                                            UserGroup.userDataCall.userphone(
                                              columnUserDataResponse.jsonBody,
                                            ),
                                            '0',
                                          ),
                                          name: UserGroup.userDataCall
                                              .userfullname(
                                            columnUserDataResponse.jsonBody,
                                          ),
                                          token: FFAppState().Token,
                                          lang: FFAppState().lang,
                                          addressId: FFAppState().AddressId,
                                          total: FFAppState().couponsSelect ==
                                                  true
                                              ? functions.couponsTotel(
                                                  valueOrDefault<double>(
                                                        CartGroup.fetchCartsCall
                                                            .totalWithDiscount(
                                                          checkoutFetchCartsResponse
                                                              .jsonBody,
                                                        ),
                                                        0.0,
                                                      ) +
                                                      (valueOrDefault<double>(
                                                            CartGroup
                                                                .fetchCartsCall
                                                                .totalWithDiscount(
                                                              checkoutFetchCartsResponse
                                                                  .jsonBody,
                                                            ),
                                                            0.0,
                                                          ) *
                                                          (FFAppState().VAT /
                                                              100.0)),
                                                  FFAppState()
                                                      .CouponsRatio
                                                      .toDouble())
                                              : (valueOrDefault<double>(
                                                    CartGroup.fetchCartsCall
                                                        .totalWithDiscount(
                                                      checkoutFetchCartsResponse
                                                          .jsonBody,
                                                    ),
                                                    0.0,
                                                  ) +
                                                  (valueOrDefault<double>(
                                                        CartGroup.fetchCartsCall
                                                            .totalWithDiscount(
                                                          checkoutFetchCartsResponse
                                                              .jsonBody,
                                                        ),
                                                        0.0,
                                                      ) *
                                                      (FFAppState().VAT /
                                                          100.0))),
                                        );

                                        if ((_model.apiResulty6n?.succeeded ??
                                            true)) {
                                          _model.output = actions
                                              .getUserDocumentReference(
                                            CartGroup.fetchCartsCall.supplierId(
                                              checkoutFetchCartsResponse
                                                  .jsonBody,
                                            )!,
                                          );

                                          var notificationRecordReference =
                                              NotificationRecord.collection
                                                  .doc();
                                          await notificationRecordReference
                                              .set(createNotificationRecordData(
                                            sendFrom: currentUserReference,
                                            sendTo: _model.output,
                                            descreption: FFLocalizations.of(
                                                            context)
                                                        .languageCode ==
                                                    'ar'
                                                ? 'تم طلب اوردر '
                                                : 'Order Has Been Requested',
                                            time: getCurrentTimestamp,
                                            title: FFLocalizations.of(context)
                                                        .languageCode ==
                                                    'ar'
                                                ? 'تم طلب اوردر '
                                                : 'Order Has Been Requested',
                                            orderid: getJsonField(
                                              (_model.apiResulty6n?.jsonBody ??
                                                  ''),
                                              r'''$.orders.id''',
                                            ),
                                            userId: getJsonField(
                                              (_model.apiResulty6n?.jsonBody ??
                                                  ''),
                                              r'''$.orders.userId''',
                                            ).toString(),
                                            address: getJsonField(
                                              (_model.apiResulty6n?.jsonBody ??
                                                  ''),
                                              r'''$.orders.address''',
                                            ).toString(),
                                            name: getJsonField(
                                              (_model.apiResulty6n?.jsonBody ??
                                                  ''),
                                              r'''$.orders.name''',
                                            ).toString(),
                                            phone: getJsonField(
                                              (_model.apiResulty6n?.jsonBody ??
                                                  ''),
                                              r'''$.orders.phone''',
                                            ).toString(),
                                            status: getJsonField(
                                              (_model.apiResulty6n?.jsonBody ??
                                                  ''),
                                              r'''$.orders.status''',
                                            ).toString(),
                                            createdAt: getJsonField(
                                              (_model.apiResulty6n?.jsonBody ??
                                                  ''),
                                              r'''$.orders.createdAt''',
                                            ).toString(),
                                          ));
                                          _model.not = NotificationRecord
                                              .getDocumentFromData(
                                                  createNotificationRecordData(
                                                    sendFrom:
                                                        currentUserReference,
                                                    sendTo: _model.output,
                                                    descreption: FFLocalizations
                                                                    .of(context)
                                                                .languageCode ==
                                                            'ar'
                                                        ? 'تم طلب اوردر '
                                                        : 'Order Has Been Requested',
                                                    time: getCurrentTimestamp,
                                                    title: FFLocalizations.of(
                                                                    context)
                                                                .languageCode ==
                                                            'ar'
                                                        ? 'تم طلب اوردر '
                                                        : 'Order Has Been Requested',
                                                    orderid: getJsonField(
                                                      (_model.apiResulty6n
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.orders.id''',
                                                    ),
                                                    userId: getJsonField(
                                                      (_model.apiResulty6n
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.orders.userId''',
                                                    ).toString(),
                                                    address: getJsonField(
                                                      (_model.apiResulty6n
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.orders.address''',
                                                    ).toString(),
                                                    name: getJsonField(
                                                      (_model.apiResulty6n
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.orders.name''',
                                                    ).toString(),
                                                    phone: getJsonField(
                                                      (_model.apiResulty6n
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.orders.phone''',
                                                    ).toString(),
                                                    status: getJsonField(
                                                      (_model.apiResulty6n
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.orders.status''',
                                                    ).toString(),
                                                    createdAt: getJsonField(
                                                      (_model.apiResulty6n
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.orders.createdAt''',
                                                    ).toString(),
                                                  ),
                                                  notificationRecordReference);
                                          triggerPushNotification(
                                            notificationTitle:
                                                _model.not!.title,
                                            notificationText:
                                                _model.not!.descreption,
                                            userRefs: [_model.output!],
                                            initialPageName: 'SupplierMyOrder',
                                            parameterData: {},
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.apiResulty6n
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );

                                          context.goNamed('MyOrder');

                                          FFAppState().AddressId = 0;
                                          FFAppState().Address = '';
                                          FFAppState().Latlang = '';
                                          FFAppState().CouponsRatio = 0;
                                          FFAppState().couponsId = 0;
                                          FFAppState().couponsSelect = false;
                                          safeSetState(() {});
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                getJsonField(
                                                  (_model.apiResulty6n
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.message''',
                                                ).toString(),
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  const Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'sjy8zqac' /* Place Order */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 380.0,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFFFF7300),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Inter Tight',
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().payment == 'Creadit Card')
                                  ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        maximumSize: Size(
                                            MediaQuery.of(context).size.width * 0.9,
                                            MediaQuery.of(context).size.height *
                                                0.06),
                                        minimumSize: Size(
                                            MediaQuery.of(context).size.width * 0.9,
                                            MediaQuery.of(context).size.height *
                                                0.06),
                                        foregroundColor: Colors.white,
                                        backgroundColor: Color(
                                            0xFFFF7300), // Text and icon color
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              50), // Rounded corners
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16.0,
                                            horizontal:
                                            32.0), // Increased padding for better spacing
                                        elevation:
                                        5, // Add a slight elevation for shadow effect
                                      ),
                                      icon: Icon(
                                        Icons.payment, // Payment icon
                                        size: 24.0,
                                      ),
                                      label: Text(' Pay With VISA ${
                                          FFAppState().couponsSelect == true
                                              ? functions.couponsTotel(
                                              valueOrDefault<double>(
                                                CartGroup.fetchCartsCall
                                                    .totalWithDiscount(
                                                  checkoutFetchCartsResponse
                                                      .jsonBody,
                                                ),
                                                0.0,
                                              ) +
                                                  (valueOrDefault<double>(
                                                    CartGroup
                                                        .fetchCartsCall
                                                        .totalWithDiscount(
                                                      checkoutFetchCartsResponse
                                                          .jsonBody,
                                                    ),
                                                    0.0,
                                                  ) *
                                                      (FFAppState().VAT /
                                                          100.0)),
                                              FFAppState()
                                                  .CouponsRatio
                                                  .toDouble())
                                              : (valueOrDefault<double>(
                                            CartGroup.fetchCartsCall
                                                .totalWithDiscount(
                                              checkoutFetchCartsResponse
                                                  .jsonBody,
                                            ),
                                            0.0,
                                          ) +
                                              (valueOrDefault<double>(
                                                CartGroup.fetchCartsCall
                                                    .totalWithDiscount(
                                                  checkoutFetchCartsResponse
                                                      .jsonBody,
                                                ),
                                                0.0,
                                              ) *
                                                  (FFAppState().VAT /
                                                      100.0)))
                                      } LE'),
                                      onPressed: () {
                                        if(FFAppState().couponsSelect==false){

                                          double Total=valueOrDefault<double>(
                                            CartGroup.fetchCartsCall
                                                .totalWithDiscount(
                                              checkoutFetchCartsResponse
                                                  .jsonBody,
                                            ),
                                            0.0,
                                          ) +
                                              (valueOrDefault<double>(
                                                CartGroup.fetchCartsCall
                                                    .totalWithDiscount(
                                                  checkoutFetchCartsResponse
                                                      .jsonBody,
                                                ),
                                                0.0,
                                              ) *
                                                  (FFAppState().VAT / 100.0));
                                          PaymobPayment.instance.pay(
                                              context: context,
                                              currency: "EGP",
                                              amountInCents: '${Total*100}', // Amount in cents
                                              onPayment: (response) async {
                                                setState(
                                                        () => this.response = response);
                                                if(this.response!.success){
                                                  _model.apiResulty6nmm =
                                                  await OrdersGroup.createOrderCall
                                                      .call(
                                                    address: FFAppState().Address,
                                                    phone: valueOrDefault<String>(
                                                      UserGroup.userDataCall.userphone(
                                                        columnUserDataResponse.jsonBody,
                                                      ),
                                                      '0',
                                                    ),
                                                    name: UserGroup.userDataCall
                                                        .userfullname(
                                                      columnUserDataResponse.jsonBody,
                                                    ),
                                                    token: FFAppState().Token,
                                                    lang: FFAppState().lang,
                                                    addressId: FFAppState().AddressId,
                                                    total: FFAppState().couponsSelect ==
                                                        true
                                                        ? functions.couponsTotel(
                                                        valueOrDefault<double>(
                                                          CartGroup.fetchCartsCall
                                                              .totalWithDiscount(
                                                            checkoutFetchCartsResponse
                                                                .jsonBody,
                                                          ),
                                                          0.0,
                                                        ) +
                                                            (valueOrDefault<double>(
                                                              CartGroup
                                                                  .fetchCartsCall
                                                                  .totalWithDiscount(
                                                                checkoutFetchCartsResponse
                                                                    .jsonBody,
                                                              ),
                                                              0.0,
                                                            ) *
                                                                (FFAppState().VAT /
                                                                    100.0)),
                                                        FFAppState()
                                                            .CouponsRatio
                                                            .toDouble())
                                                        : (valueOrDefault<double>(
                                                      CartGroup.fetchCartsCall
                                                          .totalWithDiscount(
                                                        checkoutFetchCartsResponse
                                                            .jsonBody,
                                                      ),
                                                      0.0,
                                                    ) +
                                                        (valueOrDefault<double>(
                                                          CartGroup.fetchCartsCall
                                                              .totalWithDiscount(
                                                            checkoutFetchCartsResponse
                                                                .jsonBody,
                                                          ),
                                                          0.0,
                                                        ) *
                                                            (FFAppState().VAT /
                                                                100.0))),
                                                  );

                                                  if ((_model.apiResulty6nmm?.succeeded ??
                                                      true)) {
                                                    _model.output9 = actions
                                                        .getUserDocumentReference(
                                                      CartGroup.fetchCartsCall.supplierId(
                                                        checkoutFetchCartsResponse
                                                            .jsonBody,
                                                      )!,
                                                    );

                                                    var notificationRecordReference =
                                                    NotificationRecord.collection
                                                        .doc();
                                                    await notificationRecordReference
                                                        .set(createNotificationRecordData(
                                                      sendFrom: currentUserReference,
                                                      sendTo: _model.output9,
                                                      descreption: FFLocalizations.of(
                                                          context)
                                                          .languageCode ==
                                                          'ar'
                                                          ? 'تم طلب اوردر '
                                                          : 'Order Has Been Requested',
                                                      time: getCurrentTimestamp,
                                                      title: FFLocalizations.of(context)
                                                          .languageCode ==
                                                          'ar'
                                                          ? 'تم طلب اوردر '
                                                          : 'Order Has Been Requested',
                                                      orderid: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.id''',
                                                      ),
                                                      userId: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.userId''',
                                                      ).toString(),
                                                      address: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.address''',
                                                      ).toString(),
                                                      name: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.name''',
                                                      ).toString(),
                                                      phone: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.phone''',
                                                      ).toString(),
                                                      status: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.status''',
                                                      ).toString(),
                                                      createdAt: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.createdAt''',
                                                      ).toString(),
                                                    ));
                                                    _model.noti = NotificationRecord
                                                        .getDocumentFromData(
                                                        createNotificationRecordData(
                                                          sendFrom:
                                                          currentUserReference,
                                                          sendTo: _model.output9,
                                                          descreption: FFLocalizations
                                                              .of(context)
                                                              .languageCode ==
                                                              'ar'
                                                              ? 'تم طلب اوردر '
                                                              : 'Order Has Been Requested',
                                                          time: getCurrentTimestamp,
                                                          title: FFLocalizations.of(
                                                              context)
                                                              .languageCode ==
                                                              'ar'
                                                              ? 'تم طلب اوردر '
                                                              : 'Order Has Been Requested',
                                                          orderid: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.id''',
                                                          ),
                                                          userId: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.userId''',
                                                          ).toString(),
                                                          address: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.address''',
                                                          ).toString(),
                                                          name: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.name''',
                                                          ).toString(),
                                                          phone: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.phone''',
                                                          ).toString(),
                                                          status: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.status''',
                                                          ).toString(),
                                                          createdAt: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.createdAt''',
                                                          ).toString(),
                                                        ),
                                                        notificationRecordReference);
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                      _model.noti!.title,
                                                      notificationText:
                                                      _model.noti!.descreption,
                                                      userRefs: [_model.output9!],
                                                      initialPageName: 'SupplierMyOrder',
                                                      parameterData: {},
                                                    );
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration:
                                                        const Duration(milliseconds: 4000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(context)
                                                            .secondary,
                                                      ),
                                                    );

                                                    context.goNamed('MyOrder');

                                                    FFAppState().AddressId = 0;
                                                    FFAppState().Address = '';
                                                    FFAppState().Latlang = '';
                                                    FFAppState().CouponsRatio = 0;
                                                    FFAppState().couponsId = 0;
                                                    FFAppState().couponsSelect = false;
                                                    safeSetState(() {});
                                                  } else {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration:
                                                        const Duration(milliseconds: 4000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(context)
                                                            .secondary,
                                                      ),
                                                    );
                                                  }

                                                  safeSetState(() {});

                                                }
                                                if(this.response!.success==false){
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'The card information is incorrect',
                                                          style: TextStyle(
                                                            color:
                                                            FlutterFlowTheme.of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(context)
                                                            .secondary,
                                                      )
                                                  );

                                                }
                                              }
                                          );
                                        }
                                        if(FFAppState().couponsSelect==true){
                                          double? total2 = functions.couponsTotel(
                                              valueOrDefault<double>(
                                                CartGroup.fetchCartsCall
                                                    .totalWithDiscount(
                                                  checkoutFetchCartsResponse
                                                      .jsonBody,
                                                ),
                                                0.0,
                                              ) +
                                                  (valueOrDefault<double>(
                                                    CartGroup
                                                        .fetchCartsCall
                                                        .totalWithDiscount(
                                                      checkoutFetchCartsResponse
                                                          .jsonBody,
                                                    ),
                                                    0.0,
                                                  ) *
                                                      (FFAppState().VAT /
                                                          100.0)),
                                              FFAppState()
                                                  .CouponsRatio
                                                  .toDouble());

                                          PaymobPayment.instance.pay(
                                              context: context,
                                              currency: "EGP",
                                              amountInCents: '${total2!*100}', // Amount in cents
                                              onPayment: (response) async {
                                                setState(
                                                        () => this.response = response);
                                                if(this.response!.success){
                                                  _model.apiResulty6nmm =
                                                  await OrdersGroup.createOrderCall
                                                      .call(
                                                    address: FFAppState().Address,
                                                    phone: valueOrDefault<String>(
                                                      UserGroup.userDataCall.userphone(
                                                        columnUserDataResponse.jsonBody,
                                                      ),
                                                      '0',
                                                    ),
                                                    name: UserGroup.userDataCall
                                                        .userfullname(
                                                      columnUserDataResponse.jsonBody,
                                                    ),
                                                    token: FFAppState().Token,
                                                    lang: FFAppState().lang,
                                                    addressId: FFAppState().AddressId,
                                                    total: FFAppState().couponsSelect ==
                                                        true
                                                        ? functions.couponsTotel(
                                                        valueOrDefault<double>(
                                                          CartGroup.fetchCartsCall
                                                              .totalWithDiscount(
                                                            checkoutFetchCartsResponse
                                                                .jsonBody,
                                                          ),
                                                          0.0,
                                                        ) +
                                                            (valueOrDefault<double>(
                                                              CartGroup
                                                                  .fetchCartsCall
                                                                  .totalWithDiscount(
                                                                checkoutFetchCartsResponse
                                                                    .jsonBody,
                                                              ),
                                                              0.0,
                                                            ) *
                                                                (FFAppState().VAT /
                                                                    100.0)),
                                                        FFAppState()
                                                            .CouponsRatio
                                                            .toDouble())
                                                        : (valueOrDefault<double>(
                                                      CartGroup.fetchCartsCall
                                                          .totalWithDiscount(
                                                        checkoutFetchCartsResponse
                                                            .jsonBody,
                                                      ),
                                                      0.0,
                                                    ) +
                                                        (valueOrDefault<double>(
                                                          CartGroup.fetchCartsCall
                                                              .totalWithDiscount(
                                                            checkoutFetchCartsResponse
                                                                .jsonBody,
                                                          ),
                                                          0.0,
                                                        ) *
                                                            (FFAppState().VAT /
                                                                100.0))),
                                                  );

                                                  if ((_model.apiResulty6nmm?.succeeded ??
                                                      true)) {
                                                    _model.output9 = actions
                                                        .getUserDocumentReference(
                                                      CartGroup.fetchCartsCall.supplierId(
                                                        checkoutFetchCartsResponse
                                                            .jsonBody,
                                                      )!,
                                                    );

                                                    var notificationRecordReference =
                                                    NotificationRecord.collection
                                                        .doc();
                                                    await notificationRecordReference
                                                        .set(createNotificationRecordData(
                                                      sendFrom: currentUserReference,
                                                      sendTo: _model.output9,
                                                      descreption: FFLocalizations.of(
                                                          context)
                                                          .languageCode ==
                                                          'ar'
                                                          ? 'تم طلب اوردر '
                                                          : 'Order Has Been Requested',
                                                      time: getCurrentTimestamp,
                                                      title: FFLocalizations.of(context)
                                                          .languageCode ==
                                                          'ar'
                                                          ? 'تم طلب اوردر '
                                                          : 'Order Has Been Requested',
                                                      orderid: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.id''',
                                                      ),
                                                      userId: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.userId''',
                                                      ).toString(),
                                                      address: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.address''',
                                                      ).toString(),
                                                      name: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.name''',
                                                      ).toString(),
                                                      phone: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.phone''',
                                                      ).toString(),
                                                      status: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.status''',
                                                      ).toString(),
                                                      createdAt: getJsonField(
                                                        (_model.apiResulty6nmm
                                                            ?.jsonBody ??
                                                            ''),
                                                        r'''$.orders.createdAt''',
                                                      ).toString(),
                                                    ));
                                                    _model.noti = NotificationRecord
                                                        .getDocumentFromData(
                                                        createNotificationRecordData(
                                                          sendFrom:
                                                          currentUserReference,
                                                          sendTo: _model.output9,
                                                          descreption: FFLocalizations
                                                              .of(context)
                                                              .languageCode ==
                                                              'ar'
                                                              ? 'تم طلب اوردر '
                                                              : 'Order Has Been Requested',
                                                          time: getCurrentTimestamp,
                                                          title: FFLocalizations.of(
                                                              context)
                                                              .languageCode ==
                                                              'ar'
                                                              ? 'تم طلب اوردر '
                                                              : 'Order Has Been Requested',
                                                          orderid: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.id''',
                                                          ),
                                                          userId: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.userId''',
                                                          ).toString(),
                                                          address: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.address''',
                                                          ).toString(),
                                                          name: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.name''',
                                                          ).toString(),
                                                          phone: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.phone''',
                                                          ).toString(),
                                                          status: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.status''',
                                                          ).toString(),
                                                          createdAt: getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.orders.createdAt''',
                                                          ).toString(),
                                                        ),
                                                        notificationRecordReference);
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                      _model.noti!.title,
                                                      notificationText:
                                                      _model.noti!.descreption,
                                                      userRefs: [_model.output9!],
                                                      initialPageName: 'SupplierMyOrder',
                                                      parameterData: {},
                                                    );
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration:
                                                        const Duration(milliseconds: 4000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(context)
                                                            .secondary,
                                                      ),
                                                    );

                                                    context.goNamed('MyOrder');

                                                    FFAppState().AddressId = 0;
                                                    FFAppState().Address = '';
                                                    FFAppState().Latlang = '';
                                                    FFAppState().CouponsRatio = 0;
                                                    FFAppState().couponsId = 0;
                                                    FFAppState().couponsSelect = false;
                                                    safeSetState(() {});
                                                  } else {
                                                    ScaffoldMessenger.of(context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          getJsonField(
                                                            (_model.apiResulty6nmm
                                                                ?.jsonBody ??
                                                                ''),
                                                            r'''$.message''',
                                                          ).toString(),
                                                          style: TextStyle(
                                                            color: FlutterFlowTheme.of(
                                                                context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration:
                                                        const Duration(milliseconds: 4000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(context)
                                                            .secondary,
                                                      ),
                                                    );
                                                  }
                                                  safeSetState(() {});
                                                }
                                                if(this.response?.success==false){
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'The card information is incorrect',
                                                          style: TextStyle(
                                                            color:
                                                            FlutterFlowTheme.of(context)
                                                                .primaryText,
                                                          ),
                                                        ),
                                                        duration: const Duration(
                                                            milliseconds: 4000),
                                                        backgroundColor:
                                                        FlutterFlowTheme.of(context)
                                                            .secondary,
                                                      )
                                                  );

                                                }
                                              }
                                          );
                                        }

                                      }
                                  ),
                                SizedBox(height: 30,),

                                // Padding(
                                  //   padding: const EdgeInsetsDirectional.fromSTEB(
                                  //       20.0, 35.0, 20.0, 20.0),
                                  //   child: FFButtonWidget(
                                  //     onPressed: () async {
                                  //       _model.apiResulty6nmm =
                                  //           await OrdersGroup.createOrderCall
                                  //               .call(
                                  //         address: FFAppState().Address,
                                  //         phone: valueOrDefault<String>(
                                  //           UserGroup.userDataCall.userphone(
                                  //             columnUserDataResponse.jsonBody,
                                  //           ),
                                  //           '0',
                                  //         ),
                                  //         name: UserGroup.userDataCall
                                  //             .userfullname(
                                  //           columnUserDataResponse.jsonBody,
                                  //         ),
                                  //         token: FFAppState().Token,
                                  //         lang: FFAppState().lang,
                                  //         addressId: FFAppState().AddressId,
                                  //         total: FFAppState().couponsSelect ==
                                  //                 true
                                  //             ? functions.couponsTotel(
                                  //                 valueOrDefault<double>(
                                  //                       CartGroup.fetchCartsCall
                                  //                           .totalWithDiscount(
                                  //                         checkoutFetchCartsResponse
                                  //                             .jsonBody,
                                  //                       ),
                                  //                       0.0,
                                  //                     ) +
                                  //                     (valueOrDefault<double>(
                                  //                           CartGroup
                                  //                               .fetchCartsCall
                                  //                               .totalWithDiscount(
                                  //                             checkoutFetchCartsResponse
                                  //                                 .jsonBody,
                                  //                           ),
                                  //                           0.0,
                                  //                         ) *
                                  //                         (FFAppState().VAT /
                                  //                             100.0)),
                                  //                 FFAppState()
                                  //                     .CouponsRatio
                                  //                     .toDouble())
                                  //             : (valueOrDefault<double>(
                                  //                   CartGroup.fetchCartsCall
                                  //                       .totalWithDiscount(
                                  //                     checkoutFetchCartsResponse
                                  //                         .jsonBody,
                                  //                   ),
                                  //                   0.0,
                                  //                 ) +
                                  //                 (valueOrDefault<double>(
                                  //                       CartGroup.fetchCartsCall
                                  //                           .totalWithDiscount(
                                  //                         checkoutFetchCartsResponse
                                  //                             .jsonBody,
                                  //                       ),
                                  //                       0.0,
                                  //                     ) *
                                  //                     (FFAppState().VAT /
                                  //                         100.0))),
                                  //       );
                                  //
                                  //       if ((_model.apiResulty6nmm?.succeeded ??
                                  //           true)) {
                                  //         _model.output9 = actions
                                  //             .getUserDocumentReference(
                                  //           CartGroup.fetchCartsCall.supplierId(
                                  //             checkoutFetchCartsResponse
                                  //                 .jsonBody,
                                  //           )!,
                                  //         );
                                  //
                                  //         var notificationRecordReference =
                                  //             NotificationRecord.collection
                                  //                 .doc();
                                  //         await notificationRecordReference
                                  //             .set(createNotificationRecordData(
                                  //           sendFrom: currentUserReference,
                                  //           sendTo: _model.output9,
                                  //           descreption: FFLocalizations.of(
                                  //                           context)
                                  //                       .languageCode ==
                                  //                   'ar'
                                  //               ? 'تم طلب اوردر '
                                  //               : 'Order Has Been Requested',
                                  //           time: getCurrentTimestamp,
                                  //           title: FFLocalizations.of(context)
                                  //                       .languageCode ==
                                  //                   'ar'
                                  //               ? 'تم طلب اوردر '
                                  //               : 'Order Has Been Requested',
                                  //           orderid: getJsonField(
                                  //             (_model.apiResulty6nmm
                                  //                     ?.jsonBody ??
                                  //                 ''),
                                  //             r'''$.orders.id''',
                                  //           ),
                                  //           userId: getJsonField(
                                  //             (_model.apiResulty6nmm
                                  //                     ?.jsonBody ??
                                  //                 ''),
                                  //             r'''$.orders.userId''',
                                  //           ).toString(),
                                  //           address: getJsonField(
                                  //             (_model.apiResulty6nmm
                                  //                     ?.jsonBody ??
                                  //                 ''),
                                  //             r'''$.orders.address''',
                                  //           ).toString(),
                                  //           name: getJsonField(
                                  //             (_model.apiResulty6nmm
                                  //                     ?.jsonBody ??
                                  //                 ''),
                                  //             r'''$.orders.name''',
                                  //           ).toString(),
                                  //           phone: getJsonField(
                                  //             (_model.apiResulty6nmm
                                  //                     ?.jsonBody ??
                                  //                 ''),
                                  //             r'''$.orders.phone''',
                                  //           ).toString(),
                                  //           status: getJsonField(
                                  //             (_model.apiResulty6nmm
                                  //                     ?.jsonBody ??
                                  //                 ''),
                                  //             r'''$.orders.status''',
                                  //           ).toString(),
                                  //           createdAt: getJsonField(
                                  //             (_model.apiResulty6nmm
                                  //                     ?.jsonBody ??
                                  //                 ''),
                                  //             r'''$.orders.createdAt''',
                                  //           ).toString(),
                                  //         ));
                                  //         _model.noti = NotificationRecord
                                  //             .getDocumentFromData(
                                  //                 createNotificationRecordData(
                                  //                   sendFrom:
                                  //                       currentUserReference,
                                  //                   sendTo: _model.output9,
                                  //                   descreption: FFLocalizations
                                  //                                   .of(context)
                                  //                               .languageCode ==
                                  //                           'ar'
                                  //                       ? 'تم طلب اوردر '
                                  //                       : 'Order Has Been Requested',
                                  //                   time: getCurrentTimestamp,
                                  //                   title: FFLocalizations.of(
                                  //                                   context)
                                  //                               .languageCode ==
                                  //                           'ar'
                                  //                       ? 'تم طلب اوردر '
                                  //                       : 'Order Has Been Requested',
                                  //                   orderid: getJsonField(
                                  //                     (_model.apiResulty6nmm
                                  //                             ?.jsonBody ??
                                  //                         ''),
                                  //                     r'''$.orders.id''',
                                  //                   ),
                                  //                   userId: getJsonField(
                                  //                     (_model.apiResulty6nmm
                                  //                             ?.jsonBody ??
                                  //                         ''),
                                  //                     r'''$.orders.userId''',
                                  //                   ).toString(),
                                  //                   address: getJsonField(
                                  //                     (_model.apiResulty6nmm
                                  //                             ?.jsonBody ??
                                  //                         ''),
                                  //                     r'''$.orders.address''',
                                  //                   ).toString(),
                                  //                   name: getJsonField(
                                  //                     (_model.apiResulty6nmm
                                  //                             ?.jsonBody ??
                                  //                         ''),
                                  //                     r'''$.orders.name''',
                                  //                   ).toString(),
                                  //                   phone: getJsonField(
                                  //                     (_model.apiResulty6nmm
                                  //                             ?.jsonBody ??
                                  //                         ''),
                                  //                     r'''$.orders.phone''',
                                  //                   ).toString(),
                                  //                   status: getJsonField(
                                  //                     (_model.apiResulty6nmm
                                  //                             ?.jsonBody ??
                                  //                         ''),
                                  //                     r'''$.orders.status''',
                                  //                   ).toString(),
                                  //                   createdAt: getJsonField(
                                  //                     (_model.apiResulty6nmm
                                  //                             ?.jsonBody ??
                                  //                         ''),
                                  //                     r'''$.orders.createdAt''',
                                  //                   ).toString(),
                                  //                 ),
                                  //                 notificationRecordReference);
                                  //         triggerPushNotification(
                                  //           notificationTitle:
                                  //               _model.noti!.title,
                                  //           notificationText:
                                  //               _model.noti!.descreption,
                                  //           userRefs: [_model.output9!],
                                  //           initialPageName: 'SupplierMyOrder',
                                  //           parameterData: {},
                                  //         );
                                  //         ScaffoldMessenger.of(context)
                                  //             .showSnackBar(
                                  //           SnackBar(
                                  //             content: Text(
                                  //               getJsonField(
                                  //                 (_model.apiResulty6nmm
                                  //                         ?.jsonBody ??
                                  //                     ''),
                                  //                 r'''$.message''',
                                  //               ).toString(),
                                  //               style: TextStyle(
                                  //                 color: FlutterFlowTheme.of(
                                  //                         context)
                                  //                     .primaryText,
                                  //               ),
                                  //             ),
                                  //             duration:
                                  //                 const Duration(milliseconds: 4000),
                                  //             backgroundColor:
                                  //                 FlutterFlowTheme.of(context)
                                  //                     .secondary,
                                  //           ),
                                  //         );
                                  //
                                  //         context.goNamed('MyOrder');
                                  //
                                  //         FFAppState().AddressId = 0;
                                  //         FFAppState().Address = '';
                                  //         FFAppState().Latlang = '';
                                  //         FFAppState().CouponsRatio = 0;
                                  //         FFAppState().couponsId = 0;
                                  //         FFAppState().couponsSelect = false;
                                  //         safeSetState(() {});
                                  //       } else {
                                  //         ScaffoldMessenger.of(context)
                                  //             .showSnackBar(
                                  //           SnackBar(
                                  //             content: Text(
                                  //               getJsonField(
                                  //                 (_model.apiResulty6nmm
                                  //                         ?.jsonBody ??
                                  //                     ''),
                                  //                 r'''$.message''',
                                  //               ).toString(),
                                  //               style: TextStyle(
                                  //                 color: FlutterFlowTheme.of(
                                  //                         context)
                                  //                     .primaryText,
                                  //               ),
                                  //             ),
                                  //             duration:
                                  //                 const Duration(milliseconds: 4000),
                                  //             backgroundColor:
                                  //                 FlutterFlowTheme.of(context)
                                  //                     .secondary,
                                  //           ),
                                  //         );
                                  //       }
                                  //
                                  //       safeSetState(() {});
                                  //
                                  //     },
                                  //     text: FFLocalizations.of(context).getText(
                                  //       '1cdrzm4v' /* Pay With Visa */,
                                  //     ),
                                  //     options: FFButtonOptions(
                                  //       width: 380.0,
                                  //       height: 50.0,
                                  //       padding: const EdgeInsetsDirectional.fromSTEB(
                                  //           24.0, 0.0, 24.0, 0.0),
                                  //       iconPadding:
                                  //           const EdgeInsetsDirectional.fromSTEB(
                                  //               0.0, 0.0, 0.0, 0.0),
                                  //       color: const Color(0xFFFF7300),
                                  //       textStyle: FlutterFlowTheme.of(context)
                                  //           .titleSmall
                                  //           .override(
                                  //             fontFamily: 'Inter Tight',
                                  //             color: Colors.white,
                                  //             fontSize: 20.0,
                                  //             letterSpacing: 0.0,
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //       elevation: 3.0,
                                  //       borderSide: const BorderSide(
                                  //         color: Colors.transparent,
                                  //         width: 1.0,
                                  //       ),
                                  //       borderRadius:
                                  //           BorderRadius.circular(50.0),
                                  //     ),
                                  //   ),
                                  // ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
