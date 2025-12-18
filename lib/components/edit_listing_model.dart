import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_listing_widget.dart' show EditListingWidget;
import 'package:flutter/material.dart';

class EditListingModel extends FlutterFlowModel<EditListingWidget> {
  ///  Local state fields for this component.

  bool isLoaded = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in editListing widget.
  ProductsRecord? productDocument;
  // State field(s) for DetailsDropDown widget.
  String? detailsDropDownValue;
  FormFieldController<String>? detailsDropDownValueController;
  // State field(s) for DetailField widget.
  FocusNode? detailFieldFocusNode;
  TextEditingController? detailFieldTextController;
  String? Function(BuildContext, String?)? detailFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    detailFieldFocusNode?.dispose();
    detailFieldTextController?.dispose();
  }
}
