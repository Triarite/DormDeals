import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profile_viewer_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'seller_info_widget.dart' show SellerInfoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SellerInfoModel extends FlutterFlowModel<SellerInfoWidget> {
  ///  Local state fields for this component.

  double? averageRating = 0.0;

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in SellerInfo widget.
  UsersRecord? sellerDocument;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
