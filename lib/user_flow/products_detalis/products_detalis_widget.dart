import '/auth/base_auth_user_provider.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'products_detalis_model.dart';
export 'products_detalis_model.dart';

class ProductsDetalisWidget extends StatefulWidget {
  const ProductsDetalisWidget({
    super.key,
    required this.proId,
    this.pricewithdiscount,
  });

  final int? proId;
  final double? pricewithdiscount;

  @override
  State<ProductsDetalisWidget> createState() => _ProductsDetalisWidgetState();
}

class _ProductsDetalisWidgetState extends State<ProductsDetalisWidget> {
  late ProductsDetalisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductsDetalisModel());
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
      future: HomeGroup.fetchOnlyProductCall.call(
        id: widget.proId,
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
        final productsDetalisFetchOnlyProductResponse = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  SingleChildScrollView(
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
                                      Text(
                                        getJsonField(
                                          HomeGroup.fetchOnlyProductCall
                                              .product(
                                            productsDetalisFetchOnlyProductResponse
                                                .jsonBody,
                                          ),
                                          r'''$.name''',
                                        ).toString(),
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
                                    ].divide(const SizedBox(width: 10.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    getJsonField(
                                      HomeGroup.fetchOnlyProductCall.product(
                                        productsDetalisFetchOnlyProductResponse
                                            .jsonBody,
                                      ),
                                      r'''$.images[:].url''',
                                    ).toString(),
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            if (HomeGroup.fetchOnlyProductCall.productprice(
                                  productsDetalisFetchOnlyProductResponse
                                      .jsonBody,
                                ) !=
                                HomeGroup.fetchOnlyProductCall
                                    .productpriceWithDiscount(
                                      productsDetalisFetchOnlyProductResponse
                                          .jsonBody,
                                    )
                                    ?.round())
                              Align(
                                alignment: const AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 0.0, 0.0),
                                  child: Container(
                                    width: 70.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFF0000),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        '-${getJsonField(
                                          HomeGroup.fetchOnlyProductCall
                                              .product(
                                            productsDetalisFetchOnlyProductResponse
                                                .jsonBody,
                                          ),
                                          r'''$.discounts[:].discountPercentage''',
                                        ).toString()}%',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFCF7),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 5.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            getJsonField(
                                              HomeGroup.fetchOnlyProductCall
                                                  .product(
                                                productsDetalisFetchOnlyProductResponse
                                                    .jsonBody,
                                              ),
                                              r'''$.images[:].url''',
                                            ).toString(),
                                            width: 50.0,
                                            height: 49.0,
                                            fit: BoxFit.cover,
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          getJsonField(
                                            HomeGroup.fetchOnlyProductCall
                                                .product(
                                              productsDetalisFetchOnlyProductResponse
                                                  .jsonBody,
                                            ),
                                            r'''$.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      decoration: const BoxDecoration(),
                                      child: Stack(
                                        children: [
                                          if (HomeGroup.fetchOnlyProductCall
                                                  .productprice(
                                                productsDetalisFetchOnlyProductResponse
                                                    .jsonBody,
                                              ) ==
                                              HomeGroup.fetchOnlyProductCall
                                                  .productpriceWithDiscount(
                                                    productsDetalisFetchOnlyProductResponse
                                                        .jsonBody,
                                                  )
                                                  ?.round())
                                            Text(
                                              '${HomeGroup.fetchOnlyProductCall.productprice(
                                                    productsDetalisFetchOnlyProductResponse
                                                        .jsonBody,
                                                  )?.toString()} LE',
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: const Color(0xFF1E2D7D),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          if (HomeGroup.fetchOnlyProductCall
                                                  .productprice(
                                                productsDetalisFetchOnlyProductResponse
                                                    .jsonBody,
                                              ) !=
                                              HomeGroup.fetchOnlyProductCall
                                                  .productpriceWithDiscount(
                                                    productsDetalisFetchOnlyProductResponse
                                                        .jsonBody,
                                                  )
                                                  ?.round())
                                            Text(
                                              '${HomeGroup.fetchOnlyProductCall.productpriceWithDiscount(
                                                    productsDetalisFetchOnlyProductResponse
                                                        .jsonBody,
                                                  )?.toString()} LE',
                                              maxLines: 2,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: const Color(0xFF1E2D7D),
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    if (HomeGroup.fetchOnlyProductCall
                                            .productprice(
                                          productsDetalisFetchOnlyProductResponse
                                              .jsonBody,
                                        ) !=
                                        HomeGroup.fetchOnlyProductCall
                                            .productpriceWithDiscount(
                                              productsDetalisFetchOnlyProductResponse
                                                  .jsonBody,
                                            )
                                            ?.round())
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, 0.0),
                                        child: Text(
                                          formatNumber(
                                            HomeGroup.fetchOnlyProductCall
                                                .productprice(
                                              productsDetalisFetchOnlyProductResponse
                                                  .jsonBody,
                                            ),
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                            currency: 'LE',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Cairo',
                                                color: const Color(0xFFBDBFC1),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'v1w4jnfo' /* About Product */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Cairo',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Container(
                            width: 390.0,
                            decoration: const BoxDecoration(),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  HomeGroup.fetchOnlyProductCall.product(
                                    productsDetalisFetchOnlyProductResponse
                                        .jsonBody,
                                  ),
                                  r'''$.description''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Cairo',
                                      color: const Color(0xFFBDBFC1),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 1.0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(5.0),
                                topRight: Radius.circular(5.0),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 65.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF6F6F6),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      -4.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (loggedIn)
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Share.share(
                                              'petsplanet://petsplanet.com${GoRouterState.of(context).uri.toString()}',
                                              sharePositionOrigin:
                                                  getWidgetBoundingBox(context),
                                            );
                                          },
                                          child: Container(
                                            width: 49.0,
                                            height: 49.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 6.0,
                                                  color: Color(0x33000000),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            child: const Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Icon(
                                                Icons.share_outlined,
                                                color: Color(0xFFFF7300),
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future:
                                            FavouriteGroup.fetchFavCall.call(
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
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          final containerFetchFavResponse =
                                              snapshot.data!;

                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.api1 = await FavouriteGroup
                                                  .favUpdateProductsCall
                                                  .call(
                                                productId: widget.proId,
                                                token: FFAppState().Token,
                                                lang: FFAppState().lang,
                                              );

                                              if ((_model.api1?.succeeded ??
                                                  true)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      FavouriteGroup
                                                          .favUpdateProductsCall
                                                          .message(
                                                        (_model.api1
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!,
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      FavouriteGroup
                                                          .favUpdateProductsCall
                                                          .message(
                                                        (_model.api1
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!,
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 49.0,
                                              height: 49.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 6.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: FavouriteGroup
                                                          .fetchFavCall
                                                          .proId(
                                                            containerFetchFavResponse
                                                                .jsonBody,
                                                          )!
                                                          .contains(
                                                              getJsonField(
                                                            HomeGroup
                                                                .fetchOnlyProductCall
                                                                .product(
                                                              productsDetalisFetchOnlyProductResponse
                                                                  .jsonBody,
                                                            ),
                                                            r'''$.id''',
                                                          ))
                                                      ? const Color(0xFFFF7300)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 10.0, 0.0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.apiResult5u9 =
                                                  await CartGroup
                                                      .updateCartProductCall
                                                      .call(
                                                productId: getJsonField(
                                                  HomeGroup.fetchOnlyProductCall
                                                      .product(
                                                    productsDetalisFetchOnlyProductResponse
                                                        .jsonBody,
                                                  ),
                                                  r'''$.id''',
                                                ),
                                                token: FFAppState().Token,
                                                lang: FFAppState().lang,
                                              );

                                              if ((_model.apiResult5u9
                                                      ?.succeeded ??
                                                  true)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      getJsonField(
                                                        (_model.apiResult5u9
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.message''',
                                                      ).toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      getJsonField(
                                                        (_model.apiResult5u9
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.message''',
                                                      ).toString(),
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '4k2sxpuo' /* ADD TO CART */,
                                            ),
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 50.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      24.0, 0.0, 24.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: const Color(0xFFFF7300),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                              elevation: 0.0,
                                              borderSide: const BorderSide(
                                                color: Color(0xFFFF7300),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
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
                      ],
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
