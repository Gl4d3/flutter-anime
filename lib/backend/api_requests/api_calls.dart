import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PopularAnimeCall {
  static Future<ApiCallResponse> call({
    int? page = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Popular Anime',
      apiUrl: 'https://webdis-0a5e.onrender.com/popular',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LatestReleasesCall {
  static Future<ApiCallResponse> call({
    int? page = 1,
    int? type = 2,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Latest Releases',
      apiUrl: 'https://webdis-0a5e.onrender.com/recent-release',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
        'type': type,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TopAiringCall {
  static Future<ApiCallResponse> call({
    int? page = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Top Airing ',
      apiUrl: 'https://webdis-0a5e.onrender.com/top-airing',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SearchCall {
  static Future<ApiCallResponse> call({
    String? param = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Search',
      apiUrl: 'https://webdis-0a5e.onrender.com/search?keyw=${param}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'keyw': param,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AnimeMoviesCall {
  static Future<ApiCallResponse> call({
    int? page = 1,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Anime Movies',
      apiUrl: 'https://webdis-0a5e.onreader.com/anime-movies',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
