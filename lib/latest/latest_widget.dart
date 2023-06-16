import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'latest_model.dart';
export 'latest_model.dart';

class LatestWidget extends StatefulWidget {
  const LatestWidget({Key? key}) : super(key: key);

  @override
  _LatestWidgetState createState() => _LatestWidgetState();
}

class _LatestWidgetState extends State<LatestWidget> {
  late LatestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
              context.pop();
            },
          ),
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Latest',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.0,
          ),
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    setState(() => _model.pagingController?.refresh());
                    await _model.waitForOnePage();
                  },
                  child: PagedListView<ApiPagingParams, dynamic>(
                    pagingController: () {
                      if (_model.pagingController != null) {
                        return _model.pagingController!;
                      }

                      _model.pagingController = PagingController(
                        firstPageKey: ApiPagingParams(
                          nextPageNumber: 0,
                          numItems: 0,
                          lastResponse: null,
                        ),
                      );
                      _model.pagingController!
                          .addPageRequestListener((nextPageMarker) {
                        LatestReleasesCall.call()
                            .then((listViewLatestReleasesResponse) {
                          final pageItems = (getJsonField(
                                    listViewLatestReleasesResponse.jsonBody,
                                    r'''$''',
                                  ) ??
                                  [])
                              .take(20 - nextPageMarker.numItems)
                              .toList() as List;
                          final newNumItems =
                              nextPageMarker.numItems + pageItems.length;
                          _model.pagingController!.appendPage(
                            pageItems,
                            (pageItems.length > 0) && newNumItems < 20
                                ? ApiPagingParams(
                                    nextPageNumber:
                                        nextPageMarker.nextPageNumber + 1,
                                    numItems: newNumItems,
                                    lastResponse:
                                        listViewLatestReleasesResponse,
                                  )
                                : null,
                          );
                        });
                      });
                      return _model.pagingController!;
                    }(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    builderDelegate: PagedChildBuilderDelegate<dynamic>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              100.0, 100.0, 100.0, 100.0),
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: SpinKitFoldingCube(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 40.0,
                            ),
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, popularAnimeIndex) {
                        final popularAnimeItem = _model
                            .pagingController!.itemList![popularAnimeIndex];
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(8.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                    child: Image.network(
                                      getJsonField(
                                        popularAnimeItem,
                                        r'''$..animeImg''',
                                      ),
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AutoSizeText(
                                          getJsonField(
                                            popularAnimeItem,
                                            r'''$..animeTitle''',
                                          ).toString(),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Episodes Released :  ${valueOrDefault<String>(
                                            getJsonField(
                                              popularAnimeItem,
                                              r'''$..episodeNum''',
                                            ).toString(),
                                            'N/A',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
