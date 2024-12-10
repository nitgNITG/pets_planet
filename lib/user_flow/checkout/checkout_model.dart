import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'checkout_widget.dart' show CheckoutWidget;
import 'package:flutter/material.dart';

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Create Order)] action in Button widget.
  ApiCallResponse? apiResulty6n;
  // Stores action output result for [Custom Action - getUserDocumentReference] action in Button widget.
  DocumentReference? output;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? not;
  // Stores action output result for [Backend Call - API (Create Order)] action in Button widget.
  ApiCallResponse? apiResulty6nmm;
  // Stores action output result for [Custom Action - getUserDocumentReference] action in Button widget.
  DocumentReference? output9;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotificationRecord? noti;

  /// Query cache managers for this widget.

  final _cassManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cass({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cassManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCassCache() => _cassManager.clear();
  void clearCassCacheKey(String? uniqueKey) =>
      _cassManager.clearRequest(uniqueKey);

  final _wwManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> ww({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _wwManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearWwCache() => _wwManager.clear();
  void clearWwCacheKey(String? uniqueKey) => _wwManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearCassCache();

    clearWwCache();
  }
}
