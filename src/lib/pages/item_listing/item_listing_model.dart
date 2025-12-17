import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/components/confirm_chat_bottom_sheet_widget.dart';
import '/components/edit_listing_widget.dart';
import '/components/payment_fail_notif_widget.dart';
import '/components/payment_notif_widget.dart';
import '/components/seller_info_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'item_listing_widget.dart' show ItemListingWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ItemListingModel extends FlutterFlowModel<ItemListingWidget> {
  ///  Local state fields for this page.
  /// True if description is expanded, false otherwise
  bool isDescriptionExpanded = false;

  bool isOptionsContainerOpen = false;

  bool hideOptionsContainer = true;

  ///  State fields for stateful widgets in this page.

  // Model for SellerInfo component.
  late SellerInfoModel sellerInfoModel;
  // Stores action output result for [Stripe Payment] action in buyNow widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {
    sellerInfoModel = createModel(context, () => SellerInfoModel());
  }

  @override
  void dispose() {
    sellerInfoModel.dispose();
  }

  /// Action blocks.
  /// Used when you need a widget to do an action but don't have the
  /// functionality for that action yet.
  ///
  /// Essentially this is a placeholder action.
  Future testAlert(
    BuildContext context, {
    /// What is this supposed to be replaced with eventually?
    String? toDo,
  }) async {
    logFirebaseEvent('TestAlert_alert_dialog');
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: Text('Test'),
          content: Text(toDo!),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Cool'),
            ),
          ],
        );
      },
    );
  }
}
