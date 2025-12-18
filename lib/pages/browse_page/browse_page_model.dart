import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'browse_page_widget.dart' show BrowsePageWidget;
import 'package:flutter/material.dart';

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
