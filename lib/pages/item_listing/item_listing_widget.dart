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
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_listing_model.dart';
export 'item_listing_model.dart';

/// Displays an item listing
class ItemListingWidget extends StatefulWidget {
  const ItemListingWidget({
    super.key,
    required this.productsDocument,
    this.sellerDocumentReference,
  });

  final ProductsRecord? productsDocument;
  final DocumentReference? sellerDocumentReference;

  static String routeName = 'ItemListing';
  static String routePath = '/itemListing';

  @override
  State<ItemListingWidget> createState() => _ItemListingWidgetState();
}

class _ItemListingWidgetState extends State<ItemListingWidget>
    with TickerProviderStateMixin {
  late ItemListingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemListingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'ItemListing'});
    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: Offset(100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 250.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: Visibility(
          visible: (widget.productsDocument?.ownerUid != currentUserUid) &&
              !widget.productsDocument!.isSold,
          child: FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('ITEM_LISTING_PAGE_optionsButton_ON_TAP');
              if (_model.isOptionsContainerOpen == true) {
                // Animate Away Options
                logFirebaseEvent('optionsButton_AnimateAwayOptions');
                if (animationsMap['containerOnActionTriggerAnimation2'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation2']!
                      .controller
                      .reverse();
                }
                // Animate Away Background
                logFirebaseEvent('optionsButton_AnimateAwayBackground');
                if (animationsMap['containerOnActionTriggerAnimation1'] !=
                    null) {
                  await animationsMap['containerOnActionTriggerAnimation1']!
                      .controller
                      .reverse();
                }
                logFirebaseEvent('optionsButton_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 100,
                  ),
                );
                // Hide Options Container
                logFirebaseEvent('optionsButton_HideOptionsContainer');
                _model.hideOptionsContainer = true;
                safeSetState(() {});
                // Set to Closed
                logFirebaseEvent('optionsButton_SettoClosed');
                _model.isOptionsContainerOpen = false;
                safeSetState(() {});
              } else {
                // Show Options Container
                logFirebaseEvent('optionsButton_ShowOptionsContainer');
                _model.hideOptionsContainer = false;
                safeSetState(() {});
                logFirebaseEvent('optionsButton_wait__delay');
                await Future.delayed(
                  Duration(
                    milliseconds: 100,
                  ),
                );
                // Animate In Options
                logFirebaseEvent('optionsButton_AnimateInOptions');
                if (animationsMap['containerOnActionTriggerAnimation2'] !=
                    null) {
                  animationsMap['containerOnActionTriggerAnimation2']!
                      .controller
                      .forward(from: 0.0);
                }
                // Animate In Background
                logFirebaseEvent('optionsButton_AnimateInBackground');
                if (animationsMap['containerOnActionTriggerAnimation1'] !=
                    null) {
                  await animationsMap['containerOnActionTriggerAnimation1']!
                      .controller
                      .forward(from: 0.0);
                }
                // Set to Open
                logFirebaseEvent('optionsButton_SettoOpen');
                _model.isOptionsContainerOpen = true;
                safeSetState(() {});
              }
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            elevation: 10.0,
            child: FaIcon(
              FontAwesomeIcons.ellipsisH,
              color: FlutterFlowTheme.of(context).info,
              size: 24.0,
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('ITEM_LISTING_PAGE_Back_ON_TAP');
              logFirebaseEvent('Back_navigate_back');
              context.pop();
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: Color(0x4000598C),
                                  width: 2.0,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_LISTING_PAGE_Image_gchucfuh_ON_TAP');
                                  logFirebaseEvent('Image_expand_image');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          functions.convertStringToImagePath(
                                              valueOrDefault<String>(
                                            widget.productsDocument?.image,
                                            'https://picsum.photos/seed/57/600',
                                          ))!,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: functions.convertStringToImagePath(
                                            valueOrDefault<String>(
                                          widget.productsDocument?.image,
                                          'https://picsum.photos/seed/57/600',
                                        ))!,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: functions.convertStringToImagePath(
                                      valueOrDefault<String>(
                                    widget.productsDocument?.image,
                                    'https://picsum.photos/seed/57/600',
                                  ))!,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.network(
                                      functions.convertStringToImagePath(
                                          valueOrDefault<String>(
                                        widget.productsDocument?.image,
                                        'https://picsum.photos/seed/57/600',
                                      ))!,
                                      width: double.infinity,
                                      height: 220.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 2.0, 0.0),
                              child: Container(
                                width: 100.0,
                                constraints: BoxConstraints(
                                  minHeight: 50.0,
                                  maxWidth: 300.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        4.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(15.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      formatNumber(
                                        widget.productsDocument?.price,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '\$',
                                      ),
                                      '\$0',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            if ((widget.productsDocument?.ownerUid ==
                                    currentUserUid) &&
                                !widget.productsDocument!.isSold)
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2.0, 2.0, 0.0, 0.0),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 50.0,
                                      maxWidth: 100.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0xA1FFFFFF),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(15.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Builder(
                                      builder: (context) =>
                                          FlutterFlowIconButton(
                                        key: ValueKey('EditListingButton_ik5k'),
                                        borderRadius: 8.0,
                                        buttonSize: 48.0,
                                        icon: Icon(
                                          Icons.edit_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'ITEM_LISTING_EditListingButton_ON_TAP');
                                          logFirebaseEvent(
                                              'EditListingButton_alert_dialog');
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: EditListingWidget(
                                                    productDocumentReference:
                                                        widget
                                                            .productsDocument!
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 14.0, 0.0, 14.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.productsDocument?.title,
                                  'Item Name',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Listed ${dateTimeFormat("relative", widget.productsDocument?.createdAt)} - ${!widget.productsDocument!.isSold ? 'On Campus' : 'SOLD'}',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 14.0, 0.0, 14.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Text(
                                  'Item Description',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'ITEM_LISTING_PAGE_Text_96babbz2_ON_TAP');
                                        logFirebaseEvent(
                                            'Text_update_page_state');
                                        _model.isDescriptionExpanded =
                                            !_model.isDescriptionExpanded;
                                        safeSetState(() {});
                                      },
                                      child: Text(
                                        valueOrDefault<String>(
                                          widget.productsDocument?.description,
                                          'No description',
                                        ),
                                        maxLines: _model.isDescriptionExpanded
                                            ? 1000
                                            : 3,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                              ),
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                      if (widget.productsDocument?.ownerRef != null
                          ? true
                          : false)
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: wrapWithModel(
                              model: _model.sellerInfoModel,
                              updateCallback: () => safeSetState(() {}),
                              child: SellerInfoWidget(
                                sellerDocumentReference:
                                    widget.productsDocument!.ownerRef!,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              if (!_model.hideOptionsContainer)
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('ITEM_LISTING_backgroundGradient_ON_TAP');
                    logFirebaseEvent('backgroundGradient_update_page_state');
                    _model.isOptionsContainerOpen = false;
                    safeSetState(() {});
                    logFirebaseEvent('backgroundGradient_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation2'] !=
                        null) {
                      animationsMap['containerOnActionTriggerAnimation2']!
                          .controller
                          .reverse();
                    }
                    logFirebaseEvent('backgroundGradient_widget_animation');
                    if (animationsMap['containerOnActionTriggerAnimation1'] !=
                        null) {
                      await animationsMap['containerOnActionTriggerAnimation1']!
                          .controller
                          .reverse();
                    }
                    logFirebaseEvent('backgroundGradient_update_page_state');
                    _model.hideOptionsContainer = true;
                    safeSetState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x54131B23), Color(0x00FFFFFF)],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(1.0, 0.0),
                        end: AlignmentDirectional(-1.0, 0),
                      ),
                    ),
                  ),
                ).animateOnActionTrigger(
                  animationsMap['containerOnActionTriggerAnimation1']!,
                ),
              if (!_model.hideOptionsContainer)
                Align(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 100.0),
                    child: Container(
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if ((currentUserDocument?.shoppingCart.toList() ??
                                      [])
                                  .contains(
                                      widget.productsDocument?.reference) ==
                              true)
                            AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ITEM_LISTING_PAGE_removeFromCart_ON_TAP');
                                  // Remove from cart
                                  logFirebaseEvent(
                                      'removeFromCart_Removefromcart');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'shopping_cart':
                                            FieldValue.arrayRemove([
                                          widget.productsDocument?.reference
                                        ]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent(
                                      'removeFromCart_rebuild_page');
                                  safeSetState(() {});
                                  logFirebaseEvent(
                                      'removeFromCart_update_app_state');
                                  FFAppState().cartTotal =
                                      functions.decrementCart(
                                          widget.productsDocument!.price,
                                          FFAppState().cartTotal);
                                  safeSetState(() {});
                                },
                                text: 'Remove from Cart',
                                icon: Icon(
                                  Icons.remove_shopping_cart_outlined,
                                  size: 24.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).error,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          if ((currentUserDocument?.shoppingCart.toList() ??
                                      [])
                                  .contains(
                                      widget.productsDocument?.reference) ==
                              false)
                            AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'ITEM_LISTING_PAGE_addToCart_ON_TAP');
                                  // Add to cart
                                  logFirebaseEvent('addToCart_Addtocart');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'shopping_cart': FieldValue.arrayUnion([
                                          widget.productsDocument?.reference
                                        ]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('addToCart_rebuild_page');
                                  safeSetState(() {});
                                  logFirebaseEvent(
                                      'addToCart_update_app_state');
                                  FFAppState().cartTotal =
                                      functions.incrementCart(
                                          widget.productsDocument!.price,
                                          FFAppState().cartTotal);
                                  safeSetState(() {});
                                },
                                text: 'Add to Cart',
                                icon: Icon(
                                  Icons.add_shopping_cart,
                                  size: 24.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
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
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ITEM_LISTING_PAGE_buyNow_ON_TAP');
                                logFirebaseEvent('buyNow_stripe_payment');
                                final paymentResponse =
                                    await processStripePayment(
                                  context,
                                  amount: functions
                                      .by100(widget.productsDocument?.price)!,
                                  currency: 'USD',
                                  customerEmail: currentUserEmail,
                                  allowGooglePay: false,
                                  allowApplePay: false,
                                );
                                if (paymentResponse.paymentId == null &&
                                    paymentResponse.errorMessage != null) {
                                  showSnackbar(
                                    context,
                                    'Error: ${paymentResponse.errorMessage}',
                                  );
                                }
                                _model.paymentId =
                                    paymentResponse.paymentId ?? '';

                                if (_model.paymentId != null &&
                                    _model.paymentId != '') {
                                  logFirebaseEvent('buyNow_backend_call');

                                  await widget.productsDocument!.reference
                                      .update(createProductsRecordData(
                                    isSold: true,
                                  ));
                                  logFirebaseEvent('buyNow_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: PaymentNotifWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  logFirebaseEvent('buyNow_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: ConfirmChatBottomSheetWidget(
                                            sellerDocumentReference: widget
                                                .productsDocument!.ownerRef!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                } else {
                                  logFirebaseEvent('buyNow_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () {
                                            FocusScope.of(dialogContext)
                                                .unfocus();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                          },
                                          child: PaymentFailNotifWidget(),
                                        ),
                                      );
                                    },
                                  );
                                }

                                safeSetState(() {});
                              },
                              text: 'Buy Now',
                              icon: Icon(
                                Icons.done,
                                size: 24.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
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
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'ITEM_LISTING_PAGE_chatWithSeller_ON_TAP');
                              logFirebaseEvent('chatWithSeller_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: Container(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.5,
                                        child: ConfirmChatBottomSheetWidget(
                                          sellerDocumentReference: widget
                                              .productsDocument!.ownerRef!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            },
                            text: 'Chat with Seller',
                            icon: Icon(
                              Icons.chat_outlined,
                              size: 24.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ].divide(SizedBox(height: 15.0)),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
