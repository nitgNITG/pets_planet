import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_product_widget.dart' show EditProductWidget;
import 'package:flutter/material.dart';

class EditProductModel extends FlutterFlowModel<EditProductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '46jj7hgu' /* Field is required */,
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
        '32bf6zqk' /* Field is required */,
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
        '79hw8tp1' /* Field is required */,
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
        'bmygxwjm' /* Field is required */,
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
  // Stores action output result for [Backend Call - API (Edit Product)] action in Button widget.
  ApiCallResponse? apiResultste;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    priceTextControllerValidator = _priceTextControllerValidator;
    descreptionTextControllerValidator = _descreptionTextControllerValidator;
    stockTextControllerValidator = _stockTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    descreptionFocusNode?.dispose();
    descreptionTextController?.dispose();

    stockFocusNode?.dispose();
    stockTextController?.dispose();

    discountFocusNode?.dispose();
    discountTextController?.dispose();
  }
}
