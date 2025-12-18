import '/auth/firebase_auth/auth_util.dart';
import '/components/shopping_cart_listing_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'shopping_cart_model.dart';
export 'shopping_cart_model.dart';

class ShoppingCartWidget extends StatefulWidget {
  const ShoppingCartWidget({super.key});

  static String routeName = 'shoppingCart';
  static String routePath = '/shoppingCart';

  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget>
    with TickerProviderStateMixin {
  late ShoppingCartModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShoppingCartModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'shoppingCart'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SHOPPING_CART_shoppingCart_ON_INIT_STATE');
      logFirebaseEvent('shoppingCart_update_page_state');
      _model.subtotal = functions.getShoppingCartSubtotal();
      safeSetState(() {});
      logFirebaseEvent('shoppingCart_wait__delay');
      await Future.delayed(
        Duration(
          milliseconds: random_data.randomInteger(500, 750),
        ),
      );
      logFirebaseEvent('shoppingCart_update_page_state');
      _model.pageLoaded = true;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
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
        backgroundColor: Color(0xFFECE7E8),
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
              logFirebaseEvent('SHOPPING_CART_arrow_back_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'My Cart',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Opacity(
                opacity: _model.pageLoaded ? 1.0 : 0.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 8.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => Builder(
                                  builder: (context) {
                                    final shoppingCartProduct =
                                        (currentUserDocument?.shoppingCart
                                                    .toList() ??
                                                [])
                                            .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          shoppingCartProduct.length,
                                          (shoppingCartProductIndex) {
                                        final shoppingCartProductItem =
                                            shoppingCartProduct[
                                                shoppingCartProductIndex];
                                        return ShoppingCartListingWidget(
                                          key: Key(
                                              'Keyy4h_${shoppingCartProductIndex}_of_${shoppingCartProduct.length}'),
                                          productDocumentReference:
                                              shoppingCartProductItem,
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Container(
                          width: 100.0,
                          height: 75.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'Subtotal: ${formatNumber(
                                      FFAppState().cartTotal,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                      currency: '\$',
                                    )}',
                                    minFontSize: 26.0,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 50.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.shopping_cart_checkout_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    size: 35.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 20.0)),
                  ),
                ),
              ),
              if (!_model.pageLoaded)
                Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 150.0, 0.0, 0.0),
                    child: Icon(
                      Icons.cached,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 48.0,
                    ).animateOnPageLoad(
                        animationsMap['iconOnPageLoadAnimation']!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
