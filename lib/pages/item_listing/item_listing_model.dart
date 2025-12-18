import '/components/seller_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'item_listing_widget.dart' show ItemListingWidget;
import 'package:flutter/material.dart';

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
