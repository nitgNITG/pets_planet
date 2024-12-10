import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'addresses_widget.dart' show AddressesWidget;
import 'package:flutter/material.dart';

class AddressesModel extends FlutterFlowModel<AddressesWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Stores action output result for [Backend Call - API (Create Address)] action in Button widget.
  ApiCallResponse? apiResultzcp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
