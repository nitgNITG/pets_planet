import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'change_password_widget.dart' show ChangePasswordWidget;
import 'package:flutter/material.dart';

class ChangePasswordModel extends FlutterFlowModel<ChangePasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for currentpass widget.
  FocusNode? currentpassFocusNode;
  TextEditingController? currentpassTextController;
  late bool currentpassVisibility;
  String? Function(BuildContext, String?)? currentpassTextControllerValidator;
  String? _currentpassTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'g70wjoy9' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for newpass widget.
  FocusNode? newpassFocusNode;
  TextEditingController? newpassTextController;
  late bool newpassVisibility;
  String? Function(BuildContext, String?)? newpassTextControllerValidator;
  // State field(s) for confirmnewpass widget.
  FocusNode? confirmnewpassFocusNode;
  TextEditingController? confirmnewpassTextController;
  late bool confirmnewpassVisibility;
  String? Function(BuildContext, String?)?
      confirmnewpassTextControllerValidator;
  // Stores action output result for [Backend Call - API (Change Password)] action in Button widget.
  ApiCallResponse? apiResultzkc;

  @override
  void initState(BuildContext context) {
    currentpassVisibility = false;
    currentpassTextControllerValidator = _currentpassTextControllerValidator;
    newpassVisibility = false;
    confirmnewpassVisibility = false;
  }

  @override
  void dispose() {
    currentpassFocusNode?.dispose();
    currentpassTextController?.dispose();

    newpassFocusNode?.dispose();
    newpassTextController?.dispose();

    confirmnewpassFocusNode?.dispose();
    confirmnewpassTextController?.dispose();
  }
}
