import '/backend/backend.dart';
import '/components/seller_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'confirm_chat_bottom_sheet_widget.dart'
    show ConfirmChatBottomSheetWidget;
import 'package:flutter/material.dart';

class ConfirmChatBottomSheetModel
    extends FlutterFlowModel<ConfirmChatBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in ConfirmChatBottomSheet widget.
  UsersRecord? sellerDocumentReference;
  // Model for SellerInfo component.
  late SellerInfoModel sellerInfoModel;

  @override
  void initState(BuildContext context) {
    sellerInfoModel = createModel(context, () => SellerInfoModel());
  }

  @override
  void dispose() {
    sellerInfoModel.dispose();
  }
}
