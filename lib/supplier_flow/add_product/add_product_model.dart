import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_product_widget.dart' show AddProductWidget;
import 'package:flutter/material.dart';

class AddProductModel extends FlutterFlowModel<AddProductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'appbk424' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for namear widget.
  FocusNode? namearFocusNode;
  TextEditingController? namearTextController;
  String? Function(BuildContext, String?)? namearTextControllerValidator;
  String? _namearTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'qcrqp4kw' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  String? _priceTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        't9xlix9i' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for descreption widget.
  FocusNode? descreptionFocusNode;
  TextEditingController? descreptionTextController;
  String? Function(BuildContext, String?)? descreptionTextControllerValidator;
  String? _descreptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0igjomya' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for descrptionAr widget.
  FocusNode? descrptionArFocusNode;
  TextEditingController? descrptionArTextController;
  String? Function(BuildContext, String?)? descrptionArTextControllerValidator;
  String? _descrptionArTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd2vwwwjm' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for stock widget.
  FocusNode? stockFocusNode;
  TextEditingController? stockTextController;
  String? Function(BuildContext, String?)? stockTextControllerValidator;
  String? _stockTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '13421qxr' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for discount widget.
  FocusNode? discountFocusNode;
  TextEditingController? discountTextController;
  String? Function(BuildContext, String?)? discountTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (AddProduct)] action in Button widget.
  ApiCallResponse? apiResultste;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    namearTextControllerValidator = _namearTextControllerValidator;
    priceTextControllerValidator = _priceTextControllerValidator;
    descreptionTextControllerValidator = _descreptionTextControllerValidator;
    descrptionArTextControllerValidator = _descrptionArTextControllerValidator;
    stockTextControllerValidator = _stockTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    namearFocusNode?.dispose();
    namearTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    descreptionFocusNode?.dispose();
    descreptionTextController?.dispose();

    descrptionArFocusNode?.dispose();
    descrptionArTextController?.dispose();

    stockFocusNode?.dispose();
    stockTextController?.dispose();

    discountFocusNode?.dispose();
    discountTextController?.dispose();
  }
}
