import '/backend/api_requests/api_calls.dart';
import '/components/counter/counter_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_widget.dart' show CartWidget;
import 'package:flutter/material.dart';

class CartModel extends FlutterFlowModel<CartWidget> {
  ///  Local state fields for this page.

  String? price;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Delete Cart)] action in Container widget.
  ApiCallResponse? apiResultah6;
  // Stores action output result for [Backend Call - API (Delete Item Cart)] action in Icon widget.
  ApiCallResponse? apiResultty7;
  // Models for Counter dynamic component.
  late FlutterFlowDynamicModels<CounterModel> counterModels;
  // Stores action output result for [Backend Call - API (Delete Item Cart)] action in Icon widget.
  ApiCallResponse? apiResultty7Copy;

  @override
  void initState(BuildContext context) {
    counterModels = FlutterFlowDynamicModels(() => CounterModel());
  }

  @override
  void dispose() {
    counterModels.dispose();
  }
}
