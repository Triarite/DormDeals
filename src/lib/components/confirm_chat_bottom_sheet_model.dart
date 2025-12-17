import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/seller_info_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'confirm_chat_bottom_sheet_widget.dart'
    show ConfirmChatBottomSheetWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
