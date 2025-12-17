import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'shopping_cart_listing_widget.dart' show ShoppingCartListingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShoppingCartListingModel
    extends FlutterFlowModel<ShoppingCartListingWidget> {
  ///  Local state fields for this component.

  ProductsRecord? productDocument;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in shoppingCartListing widget.
  ProductsRecord? productDocumentOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
