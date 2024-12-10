import '/backend/api_requests/api_calls.dart';
import '/components/custom_nav_bar/custom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (search)] action in TextField widget.
  ApiCallResponse? search2;
  // Stores action output result for [Backend Call - API (Fav Update Products)] action in Container widget.
  ApiCallResponse? apiResultdpj1;
  // Stores action output result for [Backend Call - API (Update Cart Product)] action in Container widget.
  ApiCallResponse? apiResult5u91;
  // Stores action output result for [Backend Call - API (Fav Update Pets)] action in Container widget.
  ApiCallResponse? apiResultdpj2;
  // Stores action output result for [Backend Call - API (Update Cart Pets)] action in Container widget.
  ApiCallResponse? apiResult5u92;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  // Stores action output result for [Backend Call - API (Fav Update Products)] action in Container widget.
  ApiCallResponse? apiResultdpj;
  // Stores action output result for [Backend Call - API (Update Cart Product)] action in Container widget.
  ApiCallResponse? apiResult5u9;
  // Model for CustomNavBar component.
  late CustomNavBarModel customNavBarModel;

  @override
  void initState(BuildContext context) {
    customNavBarModel = createModel(context, () => CustomNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    customNavBarModel.dispose();
  }
}
