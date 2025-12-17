import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'edit_listing_widget.dart' show EditListingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
