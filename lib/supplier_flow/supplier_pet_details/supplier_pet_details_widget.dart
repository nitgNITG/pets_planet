import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'supplier_pet_details_model.dart';
export 'supplier_pet_details_model.dart';

class SupplierPetDetailsWidget extends StatefulWidget {
  const SupplierPetDetailsWidget({
    super.key,
    this.petId,
  });

  final int? petId;

  @override
  State<SupplierPetDetailsWidget> createState() =>
      _SupplierPetDetailsWidgetState();
}

class _SupplierPetDetailsWidgetState extends State<SupplierPetDetailsWidget> {
  late SupplierPetDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupplierPetDetailsModel());
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
      future: HomeGroup.fetchOnlyPetCall.call(
        id: widget.petId,
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
        final supplierPetDetailsFetchOnlyPetResponse = snapshot.data!;

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
                                          HomeGroup.fetchOnlyPetCall.petList(
                                            supplierPetDetailsFetchOnlyPetResponse
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
                                  child: CachedNetworkImage(
                                    fadeInDuration: const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: getJsonField(
                                      HomeGroup.fetchOnlyPetCall.petList(
                                        supplierPetDetailsFetchOnlyPetResponse
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
                            if (HomeGroup.fetchOnlyPetCall.petprice(
                                  supplierPetDetailsFetchOnlyPetResponse
                                      .jsonBody,
                                ) !=
                                HomeGroup.fetchOnlyPetCall.petpriceWithDiscount(
                                  supplierPetDetailsFetchOnlyPetResponse
                                      .jsonBody,
                                ))
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
                                          HomeGroup.fetchOnlyPetCall.petList(
                                            supplierPetDetailsFetchOnlyPetResponse
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
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                const Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                const Duration(milliseconds: 500),
                                            imageUrl: getJsonField(
                                              HomeGroup.fetchOnlyPetCall
                                                  .petList(
                                                supplierPetDetailsFetchOnlyPetResponse
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
                                            HomeGroup.fetchOnlyPetCall.petList(
                                              supplierPetDetailsFetchOnlyPetResponse
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
                                  children: [
                                    Stack(
                                      children: [
                                        if (HomeGroup.fetchOnlyPetCall.petprice(
                                              supplierPetDetailsFetchOnlyPetResponse
                                                  .jsonBody,
                                            ) ==
                                            HomeGroup.fetchOnlyPetCall
                                                .petpriceWithDiscount(
                                              supplierPetDetailsFetchOnlyPetResponse
                                                  .jsonBody,
                                            ))
                                          Text(
                                            '${HomeGroup.fetchOnlyPetCall.petprice(
                                                  supplierPetDetailsFetchOnlyPetResponse
                                                      .jsonBody,
                                                )?.toString()} LE',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Cairo',
                                                  color: const Color(0xFF1E2D7D),
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        if (HomeGroup.fetchOnlyPetCall.petprice(
                                              supplierPetDetailsFetchOnlyPetResponse
                                                  .jsonBody,
                                            ) !=
                                            HomeGroup.fetchOnlyPetCall
                                                .petpriceWithDiscount(
                                              supplierPetDetailsFetchOnlyPetResponse
                                                  .jsonBody,
                                            ))
                                          Text(
                                            '${HomeGroup.fetchOnlyPetCall.petpriceWithDiscount(
                                                  supplierPetDetailsFetchOnlyPetResponse
                                                      .jsonBody,
                                                )?.toString()} LE',
                                            style: FlutterFlowTheme.of(context)
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
                                    if (HomeGroup.fetchOnlyPetCall.petprice(
                                          supplierPetDetailsFetchOnlyPetResponse
                                              .jsonBody,
                                        ) !=
                                        HomeGroup.fetchOnlyPetCall
                                            .petpriceWithDiscount(
                                          supplierPetDetailsFetchOnlyPetResponse
                                              .jsonBody,
                                        ))
                                      Text(
                                        '${HomeGroup.fetchOnlyPetCall.petprice(
                                              supplierPetDetailsFetchOnlyPetResponse
                                                  .jsonBody,
                                            )?.toString()}',
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
                                'fh52dorh' /* About Pet */,
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
                                  HomeGroup.fetchOnlyPetCall.petList(
                                    supplierPetDetailsFetchOnlyPetResponse
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}