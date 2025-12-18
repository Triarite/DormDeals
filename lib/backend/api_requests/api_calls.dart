import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'package:ff_commons/api_requests/api_manager.dart';


export 'package:ff_commons/api_requests/api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPriceFromImageAndTitleCall {
  static Future<ApiCallResponse> call({
    String? image = '',
    String? title = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Guess the price of the item based on the title and image, and ONLY return a simple int or float with NO other text. Title: ${escapeStringForJson(title)}."
        },
        {
          "inlineData": {
            "mimeType": "image/jpeg",
            "data": "${escapeStringForJson(image)}"
          }
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Price from Image and Title',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyCm7d04VUUiSCYA7pCitWhF7FTr2PR9b84',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetDescFromImageAndTitleCopyCall {
  static Future<ApiCallResponse> call({
    String? image = '',
    String? title = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Write a 1–2 paragraph product-style description of this item in plaintext, no markdown, based on the title and image provided. Title: ${escapeStringForJson(title)}."
        },
        {
          "inlineData": {
            "mimeType": "image/jpeg",
            "data": "${escapeStringForJson(image)}"
          }
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Desc from Image and Title Copy',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyCm7d04VUUiSCYA7pCitWhF7FTr2PR9b84',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
