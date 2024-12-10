import '/backend/api_requests/api_calls.dart';
import '/components/custom_nav_bar/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fav_page_widget.dart' show FavPageWidget;
import 'package:flutter/material.dart';

class FavPageModel extends FlutterFlowModel<FavPageWidget> {
  ///  Local state fields for this page.

  List<int> id = [];
  void addToId(int item) => id.add(item);
  void removeFromId(int item) => id.remove(item);
  void removeAtIndexFromId(int index) => id.removeAt(index);
  void insertAtIndexInId(int index, int item) => id.insert(index, item);
  void updateIdAtIndex(int index, Function(int) updateFn) =>
      id[index] = updateFn(id[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Fav Update Products)] action in Container widget.
  ApiCallResponse? apiResult3;
  // Stores action output result for [Backend Call - API (Update Cart Product)] action in Container widget.
  ApiCallResponse? apiResult5u9Copy;
  // Stores action output result for [Backend Call - API (Fav Update Pets)] action in Container widget.
  ApiCallResponse? apiResult4;
  // Stores action output result for [Backend Call - API (Update Cart Pets)] action in Container widget.
  ApiCallResponse? apiResult5u9;
  // Model for CustomNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    customNavBarModel.dispose();
  }
}
