import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_map_widget.dart' show TestMapWidget;
import 'package:flutter/material.dart';

class TestMapModel extends FlutterFlowModel<TestMapWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // Stores action output result for [Backend Call - API (Create Address)] action in Button widget.
  ApiCallResponse? apiResultzcppp;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
