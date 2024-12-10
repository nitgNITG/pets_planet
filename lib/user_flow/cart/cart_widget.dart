import '/backend/api_requests/api_calls.dart';
import '/components/counter/counter_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
export 'cart_model.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  late CartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartModel());
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
      future: CartGroup.fetchCartsCall.call(
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
        final cartFetchCartsResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(25.0, 5.0, 25.0, 10.0),
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
                                    color: FlutterFlowTheme.of(context).info,
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
                                      'm5nvitfn' /* Cart */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Cairo',
                                          color: FlutterFlowTheme.of(context)
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
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) ||
                              (CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 15.0, 15.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.apiResultah6 =
                                          await CartGroup.deleteCartCall.call(
                                        cartId: getJsonField(
                                          cartFetchCartsResponse.jsonBody,
                                          r'''$.cartId''',
                                        ),
                                        token: FFAppState().Token,
                                        lang: FFAppState().lang,
                                      );

                                      if ((_model.apiResultah6?.succeeded ??
                                          true)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiResultah6
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              getJsonField(
                                                (_model.apiResultah6
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.message''',
                                              ).toString(),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.delete_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 28.0,
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '0qc78sz7' /* Delete Cart */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ) !=
                                  null &&
                              (CartGroup.fetchCartsCall.products(
                                cartFetchCartsResponse.jsonBody,
                              ))!
                                  .isNotEmpty)
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '16e9lnlg' /* Products */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          Builder(
                            builder: (context) {
                              final products = CartGroup.fetchCartsCall
                                      .products(
                                        cartFetchCartsResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: products.length,
                                itemBuilder: (context, productsIndex) {
                                  final productsItem = products[productsIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: const Color(0x6D57636C),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 10.0, 15.0, 0.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, -1.0),
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
                                                        _model.apiResultty7 =
                                                            await CartGroup
                                                                .deleteItemCartCall
                                                                .call(
                                                          id: getJsonField(
                                                            productsItem,
                                                            r'''$.cartItemId''',
                                                          ),
                                                          token: FFAppState()
                                                              .Token,
                                                          lang:
                                                              FFAppState().lang,
                                                        );

                                                        if ((_model.apiResultty7
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.apiResultty7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.apiResultty7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 10.0, 12.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<String>(
                                                            getJsonField(
                                                              productsItem,
                                                              r'''$.image.url''',
                                                            )?.toString(),
                                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/800px-No_image_available.svg.png',
                                                          ),
                                                          width: 100.0,
                                                          height: 100.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 150.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                productsItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              if (getJsonField(
                                                                    productsItem,
                                                                    r'''$.price''',
                                                                  ) ==
                                                                  getJsonField(
                                                                    productsItem,
                                                                    r'''$.priceWithDiscount''',
                                                                  ))
                                                                Text(
                                                                  getJsonField(
                                                                    productsItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF1E2D7D),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                                                Text(
                                                                  getJsonField(
                                                                    productsItem,
                                                                    r'''$.priceWithDiscount''',
                                                                  ).toString(),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF1E2D7D),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 15.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Divider(
                                                thickness: 2.0,
                                                indent: 4.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: wrapWithModel(
                                                  model: _model.counterModels
                                                      .getModel(
                                                    getJsonField(
                                                      productsItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    productsIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  updateOnChange: true,
                                                  child: CounterWidget(
                                                    key: Key(
                                                      'Keyen9_${getJsonField(
                                                        productsItem,
                                                        r'''$.name''',
                                                      ).toString()}',
                                                    ),
                                                    quant: getJsonField(
                                                      productsItem,
                                                      r'''$.quantity''',
                                                    ),
                                                    cartid: getJsonField(
                                                      productsItem,
                                                      r'''$.cartItemId''',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          if (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ) !=
                                  null &&
                              (CartGroup.fetchCartsCall.pets(
                                cartFetchCartsResponse.jsonBody,
                              ))!
                                  .isNotEmpty)
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'j4s6lmbh' /* Pets */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                          Builder(
                            builder: (context) {
                              final pets = CartGroup.fetchCartsCall
                                      .pets(
                                        cartFetchCartsResponse.jsonBody,
                                      )
                                      ?.toList() ??
                                  [];

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: pets.length,
                                itemBuilder: (context, petsIndex) {
                                  final petsItem = pets[petsIndex];
                                  return Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: const Color(0x6D57636C),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 10.0, 15.0, 0.0),
                                                child: Container(
                                                  decoration: const BoxDecoration(),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1.0, -1.0),
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
                                                        _model.apiResultty7Copy =
                                                            await CartGroup
                                                                .deleteItemCartCall
                                                                .call(
                                                          id: getJsonField(
                                                            petsItem,
                                                            r'''$.cartItemId''',
                                                          ),
                                                          token: FFAppState()
                                                              .Token,
                                                          lang:
                                                              FFAppState().lang,
                                                        );

                                                        if ((_model
                                                                .apiResultty7Copy
                                                                ?.succeeded ??
                                                            true)) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.apiResultty7Copy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                getJsonField(
                                                                  (_model.apiResultty7Copy
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                  r'''$.message''',
                                                                ).toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                              ),
                                                              duration: const Duration(
                                                                  milliseconds:
                                                                      4000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          );
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.close_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 10.0, 15.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0.0),
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<String>(
                                                            getJsonField(
                                                              petsItem,
                                                              r'''$.image.url''',
                                                            )?.toString(),
                                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/800px-No_image_available.svg.png',
                                                          ),
                                                          width: 100.0,
                                                          height: 100.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 150.0,
                                                          decoration:
                                                              const BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                petsItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
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
                                                                Text(
                                                                  getJsonField(
                                                                    petsItem,
                                                                    r'''$.price''',
                                                                  ).toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF1E2D7D),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Inter',
                                                                        color: const Color(
                                                                            0xFF1E2D7D),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          height: 15.0)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                          if ((CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) ||
                              (CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Divider(
                              thickness: 1.5,
                              indent: 10.0,
                              endIndent: 10.0,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          if ((CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) ||
                              (CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFAAD6FD),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'avw4yo6x' /* VAT */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          Text(
                                            '${FFAppState().VAT.toString()}%',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if ((CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) ||
                              (CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFAAD6FD),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          if (CartGroup.fetchCartsCall
                                                  .totalWithDiscount(
                                                cartFetchCartsResponse.jsonBody,
                                              ) ==
                                              CartGroup.fetchCartsCall
                                                  .totalProduct(
                                                    cartFetchCartsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble())
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ejmcsx27' /* Total */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'd2zoe3w5' /* Total */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              formatNumber(
                                                CartGroup.fetchCartsCall
                                                    .totalWithDiscount(
                                                  cartFetchCartsResponse
                                                      .jsonBody,
                                                ),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                                currency: 'LE',
                                              ),
                                              '0',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if ((CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) ||
                              (CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFAAD6FD),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          if (CartGroup.fetchCartsCall
                                                  .totalWithDiscount(
                                                cartFetchCartsResponse.jsonBody,
                                              ) ==
                                              CartGroup.fetchCartsCall
                                                  .totalProduct(
                                                    cartFetchCartsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble())
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0vgtt92r' /* VAT Total */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              '5jh966se' /* VAT Total */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          Text(
                                            formatNumber(
                                              valueOrDefault<double>(
                                                    CartGroup.fetchCartsCall
                                                        .totalWithDiscount(
                                                      cartFetchCartsResponse
                                                          .jsonBody,
                                                    ),
                                                    0.0,
                                                  ) *
                                                  (FFAppState().VAT / 100.0),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.automatic,
                                              currency: 'LE',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if ((CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) ||
                              (CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFAAD6FD),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          if (CartGroup.fetchCartsCall
                                                  .totalWithDiscount(
                                                cartFetchCartsResponse.jsonBody,
                                              ) ==
                                              CartGroup.fetchCartsCall
                                                  .totalProduct(
                                                    cartFetchCartsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble())
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1v07iqwc' /* Subtotal */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          if (CartGroup.fetchCartsCall
                                                  .totalWithDiscount(
                                                cartFetchCartsResponse.jsonBody,
                                              ) !=
                                              CartGroup.fetchCartsCall
                                                  .totalProduct(
                                                    cartFetchCartsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble())
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7rk8akof' /* Subtotal */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          if (CartGroup.fetchCartsCall
                                                  .totalWithDiscount(
                                                cartFetchCartsResponse.jsonBody,
                                              ) !=
                                              CartGroup.fetchCartsCall
                                                  .totalProduct(
                                                    cartFetchCartsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble())
                                            Text(
                                              formatNumber(
                                                (CartGroup.fetchCartsCall
                                                        .totalWithDiscount(
                                                      cartFetchCartsResponse
                                                          .jsonBody,
                                                    )!) +
                                                    (valueOrDefault<double>(
                                                          CartGroup
                                                              .fetchCartsCall
                                                              .totalWithDiscount(
                                                            cartFetchCartsResponse
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          if (CartGroup.fetchCartsCall
                                                  .totalWithDiscount(
                                                cartFetchCartsResponse.jsonBody,
                                              ) ==
                                              CartGroup.fetchCartsCall
                                                  .totalProduct(
                                                    cartFetchCartsResponse
                                                        .jsonBody,
                                                  )
                                                  ?.toDouble())
                                            Text(
                                              formatNumber(
                                                valueOrDefault<double>(
                                                      CartGroup.fetchCartsCall
                                                          .totalWithDiscount(
                                                        cartFetchCartsResponse
                                                            .jsonBody,
                                                      ),
                                                      0.0,
                                                    ) +
                                                    (valueOrDefault<double>(
                                                          CartGroup
                                                              .fetchCartsCall
                                                              .totalWithDiscount(
                                                            cartFetchCartsResponse
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
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          if ((CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) ||
                              (CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 30.0, 20.0, 30.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'Address',
                                    queryParameters: {
                                      'pricewith': serializeParam(
                                        CartGroup.fetchCartsCall
                                            .totalWithDiscount(
                                          cartFetchCartsResponse.jsonBody,
                                        ),
                                        ParamType.double,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: FFLocalizations.of(context).getText(
                                  'aq8y4uf3' /* Continue to checkout */,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0xFFFF7300),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Cairo',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFF7300),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                          if (!(CartGroup.fetchCartsCall.products(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.products(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty) &&
                              !(CartGroup.fetchCartsCall.pets(
                                        cartFetchCartsResponse.jsonBody,
                                      ) !=
                                      null &&
                                  (CartGroup.fetchCartsCall.pets(
                                    cartFetchCartsResponse.jsonBody,
                                  ))!
                                      .isNotEmpty))
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'wb31eslp' /* Cart Is Empty */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
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
        );
      },
    );
  }
}
