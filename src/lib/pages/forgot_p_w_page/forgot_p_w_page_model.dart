import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'forgot_p_w_page_widget.dart' show ForgotPWPageWidget;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPWPageModel extends FlutterFlowModel<ForgotPWPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for enterResetEmail widget.
  FocusNode? enterResetEmailFocusNode;
  TextEditingController? enterResetEmailTextController;
  String? Function(BuildContext, String?)?
      enterResetEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    enterResetEmailFocusNode?.dispose();
    enterResetEmailTextController?.dispose();
  }
}
