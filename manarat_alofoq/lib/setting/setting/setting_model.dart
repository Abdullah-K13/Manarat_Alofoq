import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'setting_widget.dart' show SettingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingModel extends FlutterFlowModel<SettingWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for up-email widget.
  FocusNode? upEmailFocusNode;
  TextEditingController? upEmailTextController;
  String? Function(BuildContext, String?)? upEmailTextControllerValidator;
  // State field(s) for up-pass widget.
  FocusNode? upPassFocusNode;
  TextEditingController? upPassTextController;
  String? Function(BuildContext, String?)? upPassTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    upEmailFocusNode?.dispose();
    upEmailTextController?.dispose();

    upPassFocusNode?.dispose();
    upPassTextController?.dispose();
  }
}
