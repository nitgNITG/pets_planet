import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'register_store_widget.dart' show RegisterStoreWidget;
import 'package:flutter/material.dart';

class RegisterStoreModel extends FlutterFlowModel<RegisterStoreWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullname widget.
  FocusNode? fullnameFocusNode;
  TextEditingController? fullnameTextController;
  String? Function(BuildContext, String?)? fullnameTextControllerValidator;
  String? _fullnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '12qsidea' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Sign Up Supplier Second)] action in Button widget.
  ApiCallResponse? apiResultq8n;

  /// Query cache managers for this widget.

  final _cashManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> cash({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _cashManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCashCache() => _cashManager.clear();
  void clearCashCacheKey(String? uniqueKey) =>
      _cashManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    fullnameTextControllerValidator = _fullnameTextControllerValidator;
  }

  @override
  void dispose() {
    fullnameFocusNode?.dispose();
    fullnameTextController?.dispose();

    /// Dispose query cache managers for this widget.

    clearCashCache();
  }
}
