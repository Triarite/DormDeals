import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'sell_page_widget.dart' show SellPageWidget;
import 'package:flutter/material.dart';

class SellPageModel extends FlutterFlowModel<SellPageWidget> {
  ///  Local state fields for this page.

  String? finalImageUrl;

  bool isImageUploaded = false;

  bool priceIsGenerating = false;

  bool descIsGenerating = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  bool isDataUploading_uploadedImage = false;
  FFUploadedFile uploadedLocalFile_uploadedImage =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for titleField widget.
  FocusNode? titleFieldFocusNode;
  TextEditingController? titleFieldTextController;
  String? Function(BuildContext, String?)? titleFieldTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for priceField widget.
  FocusNode? priceFieldFocusNode;
  TextEditingController? priceFieldTextController;
  String? Function(BuildContext, String?)? priceFieldTextControllerValidator;
  // Stores action output result for [Custom Action - uploadedFileToBase64] action in GeneratePrice widget.
  String? fileBase64;
  // Stores action output result for [Backend Call - API (Get Price from Image and Title)] action in GeneratePrice widget.
  ApiCallResponse? generatedPrice;
  // State field(s) for descriptionField widget.
  FocusNode? descriptionFieldFocusNode;
  TextEditingController? descriptionFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionFieldTextControllerValidator;
  // Stores action output result for [Custom Action - uploadedFileToBase64] action in GenerateDesc widget.
  String? fileBase64Desc;
  // Stores action output result for [Backend Call - API (Get Desc from Image and Title Copy)] action in GenerateDesc widget.
  ApiCallResponse? generatedDesc;
  bool isDataUploading_uploadDataLf9 = false;
  FFUploadedFile uploadedLocalFile_uploadDataLf9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataLf9 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
    titleFieldFocusNode?.dispose();
    titleFieldTextController?.dispose();

    priceFieldFocusNode?.dispose();
    priceFieldTextController?.dispose();

    descriptionFieldFocusNode?.dispose();
    descriptionFieldTextController?.dispose();
  }
}
