import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/product_card_widget.dart';
import '/components/profile_viewer_component_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'browse_page_widget.dart' show BrowsePageWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BrowsePageModel extends FlutterFlowModel<BrowsePageWidget> {
  ///  Local state fields for this page.

  String? productImageConverted;

  String? selectedCategory;

  String? searchText;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchItem widget.
  FocusNode? searchItemFocusNode;
  TextEditingController? searchItemTextController;
  String? Function(BuildContext, String?)? searchItemTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchItemFocusNode?.dispose();
    searchItemTextController?.dispose();
  }
}
