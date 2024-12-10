import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_pets_widget.dart' show EditPetsWidget;
import 'package:flutter/material.dart';

class EditPetsModel extends FlutterFlowModel<EditPetsWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uy2lz7vk' /* Field is required */,
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
        '65p0zyzz' /* Field is required */,
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
        'a3u9cp6b' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for stock widget.
  FocusNode? stockFocusNode1;
  TextEditingController? stockTextController1;
  String? Function(BuildContext, String?)? stockTextController1Validator;
  String? _stockTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'vd35cuam' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for stock widget.
  FocusNode? stockFocusNode2;
  TextEditingController? stockTextController2;
  String? Function(BuildContext, String?)? stockTextController2Validator;
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
  // Stores action output result for [Backend Call - API (Edit Pet)] action in Button widget.
  ApiCallResponse? apiResultste;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    priceTextControllerValidator = _priceTextControllerValidator;
    descreptionTextControllerValidator = _descreptionTextControllerValidator;
    stockTextController1Validator = _stockTextController1Validator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    descreptionFocusNode?.dispose();
    descreptionTextController?.dispose();

    stockFocusNode1?.dispose();
    stockTextController1?.dispose();

    stockFocusNode2?.dispose();
    stockTextController2?.dispose();

    discountFocusNode?.dispose();
    discountTextController?.dispose();
  }
}
