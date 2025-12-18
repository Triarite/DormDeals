import '/backend/backend.dart';
import '/components/profile_viewer_component_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'seller_info_model.dart';
export 'seller_info_model.dart';

/// Seller Info for Item listing
class SellerInfoWidget extends StatefulWidget {
  const SellerInfoWidget({
    super.key,
    required this.sellerDocumentReference,
  });

  final DocumentReference? sellerDocumentReference;

  @override
  State<SellerInfoWidget> createState() => _SellerInfoWidgetState();
}

class _SellerInfoWidgetState extends State<SellerInfoWidget>
    with TickerProviderStateMixin {
  late SellerInfoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SellerInfoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SELLER_INFO_SellerInfo_ON_INIT_STATE');
      // Get Seller Doc from Reference
      logFirebaseEvent('SellerInfo_GetSellerDocfromReference');
      _model.sellerDocument =
          await UsersRecord.getDocumentOnce(widget.sellerDocumentReference!);
      // Get Average
      logFirebaseEvent('SellerInfo_GetAverage');
      _model.averageRating = functions
          .getAverageFromIntList(_model.sellerDocument?.ratings.toList());
      safeSetState(() {});
      // Wait for Illusion of Loading
      logFirebaseEvent('SellerInfo_WaitforIllusionofLoading');
      await Future.delayed(
        Duration(
          milliseconds: random_data.randomInteger(200, 1000),
        ),
      );
      // Set to Not Loading
      logFirebaseEvent('SellerInfo_SettoNotLoading');
      _model.isLoading = false;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 3.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!_model.isLoading)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('SELLER_INFO_COMP_SellerInfoRow_ON_TAP');
                    if (widget.sellerDocumentReference != null) {
                      logFirebaseEvent('SellerInfoRow_bottom_sheet');
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 515.0,
                              child: ProfileViewerComponentWidget(
                                userDocumentReference:
                                    widget.sellerDocumentReference!,
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    } else {
                      logFirebaseEvent('SellerInfoRow_alert_dialog');
                      await showDialog(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Seller info is missing; can\'t navigate.'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext),
                                child: Text('Ok'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 5.0, 0.0),
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            valueOrDefault<String>(
                              _model.sellerDocument?.photoUrl != null &&
                                      _model.sellerDocument?.photoUrl != ''
                                  ? _model.sellerDocument?.photoUrl
                                  : 'https://cdna.artstation.com/p/assets/images/images/084/124/296/large/matthew-blank-profile-photo-1.jpg',
                              'https://cdna.artstation.com/p/assets/images/images/084/124/296/large/matthew-blank-profile-photo-1.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              'Seller: ${_model.sellerDocument?.displayName}',
                              'Seller: Seller Name',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if ((_model.averageRating! > 0.0) &&
                                  (_model.averageRating! < 1.0))
                                Icon(
                                  Icons.star_half,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if (_model.averageRating! >= 1.0)
                                Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if ((_model.averageRating! > 1.0) &&
                                  (_model.averageRating! < 2.0))
                                Icon(
                                  Icons.star_half,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if (_model.averageRating! >= 2.0)
                                Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if ((_model.averageRating! > 2.0) &&
                                  (_model.averageRating! < 3.0))
                                Icon(
                                  Icons.star_half,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if (_model.averageRating! >= 3.0)
                                Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if ((_model.averageRating! > 3.0) &&
                                  (_model.averageRating! < 4.0))
                                Icon(
                                  Icons.star_half,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if (_model.averageRating! >= 4.0)
                                Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if ((_model.averageRating! > 4.0) &&
                                  (_model.averageRating! < 5.0))
                                Icon(
                                  Icons.star_half,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              if (_model.averageRating! >= 5.0)
                                Icon(
                                  Icons.star,
                                  color: FlutterFlowTheme.of(context).warning,
                                  size: 24.0,
                                ),
                              Text(
                                '(${_model.sellerDocument!.ratings.isNotEmpty ? _model.sellerDocument?.ratings.length.toString() : 'No Ratings'})',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                    ],
                  ),
                ),
              if (_model.isLoading)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Icon(
                        Icons.cached,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 36.0,
                      ).animateOnPageLoad(
                          animationsMap['iconOnPageLoadAnimation']!),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Loading User Data...',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
