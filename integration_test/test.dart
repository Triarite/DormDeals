import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dorm_deals/flutter_flow/flutter_flow_drop_down.dart';
import 'package:dorm_deals/flutter_flow/flutter_flow_icon_button.dart';
import 'package:dorm_deals/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:dorm_deals/index.dart';
import 'package:dorm_deals/main.dart';
import 'package:dorm_deals/flutter_flow/flutter_flow_util.dart';

import 'package:provider/provider.dart';
import 'package:dorm_deals/backend/firebase/firebase_config.dart';
import 'package:dorm_deals/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
  });

  group('Account Creation Group', () {
    testWidgets('Successful Account Creation', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: MyApp(
          entryPage: AuthenticationWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      await tester.tap(find.byKey(const ValueKey('CreateAccountTab_ufk5')));
      await tester.enterText(
          find.byKey(const ValueKey('emailAddress_Create_mkv3')),
          'cadije@uri.edu ');
      await tester.enterText(
          find.byKey(const ValueKey('password_Create_5asp')), 'Sharky_2010');
      await tester.enterText(
          find.byKey(const ValueKey('password_CreateConfirm_7qv7')),
          'Sharky_2010');
      await tester.tap(find.byKey(const ValueKey('Button_7j5x')));
      await tester.pumpAndSettle(const Duration(milliseconds: 5000));
      expect(find.byKey(const ValueKey('Text_x4o7')), findsOneWidget);
    });

    testWidgets('Account Already Exists', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'cadije2222@gmail.com');
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'Sharky_2010');
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'Sharky_2010');
      await tester.tap(find.byKey(const ValueKey('UNDEFINED')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('Email address invalid ', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.enterText(find.byKey(const ValueKey('UNDEFINED')), 'cadije');
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'Sharky_2010');
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'Sharky_2010');
      await tester.tap(find.byKey(const ValueKey('UNDEFINED')));
      expect(find.text('Error'), findsOneWidget);
    });

    testWidgets('Passwords do not match', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'cadije7@gmail.com');
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'Sharky_2010');
      await tester.enterText(
          find.byKey(const ValueKey('UNDEFINED')), 'Shark_2010');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(find.text('Error'), findsOneWidget);
    });
  });

  group('US3-Profile creation', () {
    testWidgets('leave everything empty', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'cadije7@gmail.com', password: 'Sharky_2010');
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('CreateProfileButton_b5y8')));
      await tester.pumpAndSettle();
      expect(find.text('DormDeals'), findsWidgets);
    });

    testWidgets('Create profile without a profile picture ',
        (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'cadije@uri.edu ', password: 'Sharky_2010');
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.enterText(find.byKey(const ValueKey('Name_nzlv')), 'test2');
      await tester.enterText(
          find.byKey(const ValueKey('Major_871k')), 'comp sci');
      await tester.enterText(find.byKey(const ValueKey('Bio_6153')), 'Hello ');
      await tester.tap(find.byKey(const ValueKey('CreateProfileButton_b5y8')));
      await tester.pumpAndSettle();
      expect(find.text('DormDeals'), findsWidgets);
    });

    testWidgets('Missing Name', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'azul@gmail.com', password: '123456');
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.enterText(find.byKey(const ValueKey('Major_871k')), 'comp');
      await tester.tap(find.byKey(const ValueKey('Year_zb7l')));
      await tester.enterText(find.byKey(const ValueKey('Bio_6153')), 'Hello ');
      await tester.tap(find.byKey(const ValueKey('CreateProfileButton_b5y8')));
      await tester.pumpAndSettle();
      expect(find.text('DormDeals'), findsWidgets);
    });

    testWidgets('Successfully create profile', (WidgetTester tester) async {
      _overrideOnError();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'cadije@gmail.com', password: 'Shark_2010');
      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: const MyApp(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.enterText(find.byKey(const ValueKey('Name_nzlv')), 'test4');
      await tester.enterText(
          find.byKey(const ValueKey('Major_871k')), 'comp sci');
      await tester.tap(find.byKey(const ValueKey('Year_zb7l')));
      await tester.enterText(find.byKey(const ValueKey('Bio_6153')), 'hello');
      await tester.tap(find.byKey(const ValueKey('CreateProfileButton_b5y8')));
      await tester.pumpAndSettle();
      expect(find.text('DormDeals'), findsWidgets);
    });
  });

  group('Item Listing', () {
    setUp(() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: 'paolo.montelbano@uri.edu', password: 'theminer30');
    });

    testWidgets('View User Profile', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: MyApp(
          entryPage: BrowsePageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.text('\$'));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.text('Seller:'));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      expect(find.text('Bio'), findsOneWidget);
    }, skip: true);

    testWidgets('Change Item Title', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: MyApp(
          entryPage: BrowsePageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('ProductCard_z4ih')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('EditListingButton_ik5k')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('Dropdown Details')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.text('Product Title'));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.enterText(
          find.text('Detail Input'), 'New Title for Testing');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('Change Detail')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      expect(find.byKey(const ValueKey('Title_zf08')), findsOneWidget);
    });

    testWidgets('Change Item Price', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: MyApp(
          entryPage: BrowsePageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('ProductCard_z4ih')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('EditListingButton_ik5k')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('Dropdown Details')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.text('Product Price'));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.enterText(find.text('Detail Input'), '50');
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('Change Detail')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      expect(find.byKey(const ValueKey('Title_zf08')), findsOneWidget);
    });

    testWidgets('Delete Item', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FFAppState(),
          ),
        ],
        child: MyApp(
          entryPage: BrowsePageWidget(),
        ),
      ));
      await GoogleFonts.pendingFonts();

      await tester.tap(find.byKey(const ValueKey('ProductCard_z4ih')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('EditListingButton_ik5k')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.byKey(const ValueKey('Delete Listing')));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      await tester.tap(find.text('Delete'));
      await tester.pumpAndSettle(
        const Duration(milliseconds: 2000),
        EnginePhase.sendSemanticsUpdate,
        const Duration(milliseconds: 10000),
      );
      expect(find.byKey(const ValueKey('Title_zf08')), findsOneWidget);
    });
  });

  testWidgets('US2User Login ', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
      ],
      child: MyApp(
        entryPage: AuthenticationWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_2e33')), 'aloha.oi@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_el3c')), 'SpaceDandy');
    await tester.tap(find.byKey(const ValueKey('Button_3f0u')));
    await tester.pumpAndSettle(const Duration(milliseconds: 5000));
    expect(find.byKey(const ValueKey('ChoiceChips_4dgn')), findsOneWidget);
  });

  testWidgets('US5-GoldenPath-PostListing', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('Column_ch9f')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('titleField_xbw5')), 'CSC305 Textbook');
    await tester.enterText(
        find.byKey(const ValueKey('priceField_6dco')), '15.00');
    await tester.enterText(find.byKey(const ValueKey('descriptionField_y2at')),
        'Lightly used textbook for CSC305.');
    await tester.tap(find.byKey(const ValueKey('PublishButton_fwwn')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('CSC305 Textbook'), findsNothing);
  });

  testWidgets('US5-OwnerAttribution-CurrentUser', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('Column_ch9f')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('titleField_xbw5')), 'CSC305 Textbook');
    await tester.enterText(
        find.byKey(const ValueKey('priceField_6dco')), '15.00');
    await tester.enterText(find.byKey(const ValueKey('descriptionField_y2at')),
        'Lightly used textbook for CSC305.');
    await tester.tap(find.byKey(const ValueKey('PublishButton_fwwn')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('CSC305 Textbook'), findsNothing);
    await tester.tap(find.byKey(const ValueKey('ProductCard_z4ih')));
    await tester.pumpAndSettle(const Duration(milliseconds: 2000));
  });

  testWidgets('US5-ImageUpload-PreviewRenders', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('Column_ch9f')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('titleField_xbw5')), 'CSC305 Textbook');
    await tester.enterText(
        find.byKey(const ValueKey('priceField_6dco')), '15.00');
    await tester.enterText(find.byKey(const ValueKey('descriptionField_y2at')),
        'Lightly used textbook for CSC305.');
    await tester.tap(find.byKey(const ValueKey('PublishButton_fwwn')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('CSC305 Textbook'), findsNothing);
    expect(find.byKey(const ValueKey('ProductCard')), findsNothing);
  });

  testWidgets('US5-validation when fields are empty',
      (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.tap(find.byKey(const ValueKey('PublishButton_fwwn')));
    await tester.pumpAndSettle(const Duration(milliseconds: 1500));
    expect(find.text('Error'), findsNothing);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
