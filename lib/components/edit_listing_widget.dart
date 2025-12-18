import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_listing_model.dart';
export 'edit_listing_model.dart';

/// edit item listing
class EditListingWidget extends StatefulWidget {
  const EditListingWidget({
    super.key,
    required this.productDocumentReference,
  });

  final DocumentReference? productDocumentReference;

  @override
  State<EditListingWidget> createState() => _EditListingWidgetState();
}

class _EditListingWidgetState extends State<EditListingWidget>
    with TickerProviderStateMixin {
  late EditListingModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditListingModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('EDIT_LISTING_editListing_ON_INIT_STATE');
      logFirebaseEvent('editListing_backend_call');
      _model.productDocument = await ProductsRecord.getDocumentOnce(
          widget.productDocumentReference!);
      logFirebaseEvent('editListing_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: 200,
        ),
      );
      logFirebaseEvent('editListing_update_component_state');
      _model.isLoaded = true;
      safeSetState(() {});
    });

    _model.detailFieldTextController ??= TextEditingController();
    _model.detailFieldFocusNode ??= FocusNode();

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
    return Stack(
      children: [
        if (!_model.isLoaded)
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              Icons.cached,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 36.0,
            ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
          ),
        if (_model.isLoaded)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0x33000000),
                    offset: Offset(
                      0.0,
                      4.0,
                    ),
                    spreadRadius: 0.0,
                  )
                ],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Edit Listing',
                      textAlign: TextAlign.center,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                color: Color(0xFF131B23),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                              ),
                    ),
                    FFButtonWidget(
                      onPressed: (_model.productDocument?.isSold == true)
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'EDIT_LISTING_COMP_MarkSold_ON_TAP');
                              logFirebaseEvent('MarkSold_backend_call');

                              await widget.productDocumentReference!
                                  .update(createProductsRecordData(
                                isSold: true,
                              ));
                              logFirebaseEvent(
                                  'MarkSold_close_dialog_drawer_etc');
                              Navigator.pop(context);
                              logFirebaseEvent('MarkSold_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Product marked as sold!',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              logFirebaseEvent('MarkSold_navigate_to');

                              context.pushNamed(BrowsePageWidget.routeName);
                            },
                      text: 'Mark as Sold',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                        disabledColor: Color(0x8000598C),
                        disabledTextColor: FlutterFlowTheme.of(context).accent4,
                      ),
                    ),
                    FFButtonWidget(
                      key: ValueKey('Delete Listing'),
                      onPressed: () async {
                        logFirebaseEvent(
                            'EDIT_LISTING_COMP_DeleteListing_ON_TAP');
                        logFirebaseEvent('DeleteListing_alert_dialog');
                        var confirmDialogResponse = await showDialog<bool>(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Confirm Deletion'),
                                  content: Text(
                                      'Are you sure you want to delete this product from the marketplace?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, false),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(
                                          alertDialogContext, true),
                                      child: Text('Delete Item'),
                                    ),
                                  ],
                                );
                              },
                            ) ??
                            false;
                        if (confirmDialogResponse) {
                          logFirebaseEvent('DeleteListing_backend_call');
                          await _model.productDocument!.reference.delete();
                          logFirebaseEvent('DeleteListing_navigate_to');

                          context.pushNamed(BrowsePageWidget.routeName);
                        }
                      },
                      text: 'Delete Listing',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).error,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    if (!_model.productDocument!.isSold)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Change Details',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: FlutterFlowDropDown<String>(
                                  key: ValueKey('Dropdown Details'),
                                  controller:
                                      _model.detailsDropDownValueController ??=
                                          FormFieldController<String>(null),
                                  optionsHasValueKeys: true,
                                  options: [
                                    'Product Title',
                                    'Product Description',
                                    'Product Price'
                                  ],
                                  onChanged: (val) async {
                                    safeSetState(() =>
                                        _model.detailsDropDownValue = val);
                                    logFirebaseEvent(
                                        'EDIT_LISTING_DetailsDropDown_ON_FORM_WID');
                                    if (_model.detailsDropDownValue ==
                                        'Product Title') {
                                      logFirebaseEvent(
                                          'DetailsDropDown_set_form_field');
                                      safeSetState(() {
                                        _model.detailFieldTextController?.text =
                                            _model.productDocument!.title;
                                      });
                                    } else if (_model.detailsDropDownValue ==
                                        'Product Description') {
                                      logFirebaseEvent(
                                          'DetailsDropDown_set_form_field');
                                      safeSetState(() {
                                        _model.detailFieldTextController?.text =
                                            _model.productDocument!.description;
                                      });
                                    } else if (_model.detailsDropDownValue ==
                                        'Product Price') {
                                      logFirebaseEvent(
                                          'DetailsDropDown_set_form_field');
                                      safeSetState(() {
                                        _model.detailFieldTextController?.text =
                                            _model.productDocument!.price
                                                .toString();
                                      });
                                    }
                                  },
                                  width: 200.0,
                                  height: 40.0,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  hintText: 'Select...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2.0,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 200.0,
                                      child: TextFormField(
                                        key: ValueKey('Detail Input'),
                                        controller:
                                            _model.detailFieldTextController,
                                        focusNode: _model.detailFieldFocusNode,
                                        autofocus: false,
                                        enabled: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'Enter Detail Here...',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        maxLines: _model.detailsDropDownValue ==
                                                'Product Description'
                                            ? 3
                                            : 1,
                                        minLines: _model.detailsDropDownValue ==
                                                'Product Description'
                                            ? 3
                                            : 1,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        enableInteractiveSelection: true,
                                        validator: _model
                                            .detailFieldTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    key: ValueKey('Change Detail'),
                                    borderRadius: 8.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'EDIT_LISTING_COMP_SetDetail_ON_TAP');
                                      if (_model.detailsDropDownValue ==
                                          'Product Title') {
                                        logFirebaseEvent(
                                            'SetDetail_backend_call');

                                        await widget.productDocumentReference!
                                            .update(createProductsRecordData(
                                          title: _model
                                              .detailFieldTextController.text,
                                        ));
                                      } else if (_model.detailsDropDownValue ==
                                          'Product Price') {
                                        logFirebaseEvent(
                                            'SetDetail_backend_call');

                                        await widget.productDocumentReference!
                                            .update(createProductsRecordData(
                                          price: double.tryParse(_model
                                              .detailFieldTextController.text),
                                        ));
                                      } else if (_model.detailsDropDownValue ==
                                          'Product Description') {
                                        logFirebaseEvent(
                                            'SetDetail_backend_call');

                                        await widget.productDocumentReference!
                                            .update(createProductsRecordData(
                                          description: _model
                                              .detailFieldTextController.text,
                                        ));
                                      } else {
                                        logFirebaseEvent(
                                            'SetDetail_show_snack_bar');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please select a detail to edit',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }

                                      logFirebaseEvent(
                                          'SetDetail_close_dialog_drawer_etc');
                                      Navigator.pop(context);
                                      logFirebaseEvent(
                                          'SetDetail_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Product successfully edited!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                      );
                                      logFirebaseEvent('SetDetail_navigate_to');

                                      context.pushNamed(
                                          BrowsePageWidget.routeName);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('EDIT_LISTING_COMP_Cancel_ON_TAP');
                        logFirebaseEvent('Cancel_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
