import '/backend/backend.dart';
import '/components/edit_listing_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_products_listing_model.dart';
export 'my_products_listing_model.dart';

/// Used specifically for the My Products page
class MyProductsListingWidget extends StatefulWidget {
  const MyProductsListingWidget({
    super.key,
    required this.productDocument,
  });

  final ProductsRecord? productDocument;

  @override
  State<MyProductsListingWidget> createState() =>
      _MyProductsListingWidgetState();
}

class _MyProductsListingWidgetState extends State<MyProductsListingWidget> {
  late MyProductsListingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProductsListingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, -1.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('MY_PRODUCTS_LISTING_Container_22kxm2sr_O');
            logFirebaseEvent('Container_navigate_to');

            context.pushNamed(
              ItemListingWidget.routeName,
              queryParameters: {
                'productsDocument': serializeParam(
                  widget.productDocument,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'productsDocument': widget.productDocument,
              },
            );
          },
          child: Container(
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: !widget.productDocument!.isSold
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).accent4,
              boxShadow: [
                BoxShadow(
                  blurRadius: 12.0,
                  color: Color(0xFF131B23),
                  offset: Offset(
                    0.0,
                    4.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(3.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              functions.convertStringToImagePath(
                                  valueOrDefault<String>(
                                widget.productDocument?.image,
                                'https://picsum.photos/seed/796/600',
                              ))!,
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.productDocument?.title,
                                    'Product Title',
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
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
                                        color: Color(0xFF131B23),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '\$${widget.productDocument?.price.toString()}',
                                textAlign: TextAlign.start,
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
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (context) => FlutterFlowIconButton(
                      borderRadius: 8.0,
                      buttonSize: 40.0,
                      fillColor: FlutterFlowTheme.of(context).primary,
                      disabledColor: Color(0x7F0073B6),
                      icon: Icon(
                        Icons.edit,
                        color: FlutterFlowTheme.of(context).info,
                        size: 24.0,
                      ),
                      onPressed: widget.productDocument!.isSold
                          ? null
                          : () async {
                              logFirebaseEvent(
                                  'MY_PRODUCTS_LISTING_COMP_edit_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: AlignmentDirectional(0.0, 0.0)
                                        .resolve(Directionality.of(context)),
                                    child: EditListingWidget(
                                      productDocumentReference:
                                          widget.productDocument!.reference,
                                    ),
                                  );
                                },
                              );
                            },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
