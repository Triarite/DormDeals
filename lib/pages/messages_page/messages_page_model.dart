import '/flutter_flow/flutter_flow_util.dart';
import 'messages_page_widget.dart' show MessagesPageWidget;
import 'package:flutter/material.dart';

class MessagesPageModel extends FlutterFlowModel<MessagesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for MessagesTextField widget.
  FocusNode? messagesTextFieldFocusNode;
  TextEditingController? messagesTextFieldTextController;
  String? Function(BuildContext, String?)?
      messagesTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    messagesTextFieldFocusNode?.dispose();
    messagesTextFieldTextController?.dispose();
  }
}
