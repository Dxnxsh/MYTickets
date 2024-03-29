import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'details_model.dart';
export 'details_model.dart';

class DetailsWidget extends StatefulWidget {
  const DetailsWidget({
    Key? key,
    required this.p1,
  }) : super(key: key);

  final EventsRecord? p1;

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  late DetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.favlist = await queryFavRecordOnce(
        parent: currentUserReference,
        queryBuilder: (favRecord) => favRecord.where(
          'event',
          isEqualTo: widget.p1?.reference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.favlist?.isFav != null) {
        _model.isFav = _model.favlist!.isFav;
        await Future.delayed(const Duration(milliseconds: 100));
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF070707),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.51,
                      child: Stack(
                        alignment: AlignmentDirectional(0, 0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Hero(
                              tag: widget.p1!.imageUrl,
                              transitionOnUserGestures: true,
                              child: Image.network(
                                widget.p1!.imageUrl,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                      AlignmentDirectional(0.85, -0.4),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 50, 0, 0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 40,
                                          fillColor: Color(0x7F0F1113),
                                          icon: Icon(
                                            Icons.chevron_left_rounded,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            context.safePop();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.p1?.name,
                                  'name',
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                  fontFamily: 'Outfit',
                                  color: Color(0xFFFCF9F2),
                                  fontSize: 29,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Container(
                                constraints: BoxConstraints(
                                  maxHeight:
                                  MediaQuery.sizeOf(context).height * 0.1,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 6, 0, 0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                          AlignmentDirectional(-1, 0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              widget.p1?.description,
                                              'desc',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                              fontFamily: 'Readex Pro',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                                child: Text(
                                  'Seating Plan',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          widget.p1!.seatplan,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: widget.p1!.seatplan,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: widget.p1!.seatplan,
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      widget.p1!.seatplan,
                                      width: double.infinity,
                                      height: 113,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: StreamBuilder<List<FavRecord>>(
                                      stream: queryFavRecord(
                                        parent: currentUserReference,
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                AlwaysStoppedAnimation<
                                                    Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<FavRecord>
                                        toggleIconFavRecordList =
                                        snapshot.data!;
                                        final toggleIconFavRecord =
                                        toggleIconFavRecordList.isNotEmpty
                                            ? toggleIconFavRecordList.first
                                            : null;
                                        return ToggleIcon(
                                          onPressed: () async {
                                            setState(() =>
                                            _model.isFav = !_model.isFav);
                                            if (_model.isFav == true) {
                                              await FavRecord.createDoc(
                                                  currentUserReference!)
                                                  .set(createFavRecordData(
                                                isFav: _model.isFav,
                                                event: widget.p1?.reference,
                                              ));
                                            } else {
                                              await toggleIconFavRecord!
                                                  .reference
                                                  .delete();
                                            }
                                          },
                                          value: _model.isFav,
                                          onIcon: Icon(
                                            Icons.favorite_rounded,
                                            color: Color(0xFFFCF9F2),
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.favorite_border_rounded,
                                            color: Color(0xFFFCF9F2),
                                            size: 25,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Starting From',
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        color: Color(0xFFFCF9F2),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: StreamBuilder<List<EventTierRecord>>(
                                    stream: queryEventTierRecord(
                                      parent: widget.p1?.reference,
                                      queryBuilder: (eventTierRecord) =>
                                          eventTierRecord.orderBy('price'),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<EventTierRecord>
                                      textEventTierRecordList =
                                      snapshot.data!;
                                      return Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            textEventTierRecordList.first.price,
                                            formatType: FormatType.custom,
                                            currency: 'RM',
                                            format: '',
                                            locale: '',
                                          ),
                                          'price',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Readex Pro',
                                          color: Color(0xFFFCF9F2),
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 1),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 10, 0, 10),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'Seat',
                                      queryParameters: {
                                        'p2': serializeParam(
                                          widget.p1,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'p2': widget.p1,
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                          PageTransitionType.rightToLeft,
                                        ),
                                      },
                                    );
                                  },
                                  text: 'Pick you seat',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 50,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 0, 24, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                      fontFamily: 'Readex Pro',
                                      color: Colors.white,
                                    ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
