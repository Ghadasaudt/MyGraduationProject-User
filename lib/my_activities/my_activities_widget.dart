import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/ratecollection_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_activities_model.dart';
export 'my_activities_model.dart';

class MyActivitiesWidget extends StatefulWidget {
  const MyActivitiesWidget({Key? key}) : super(key: key);

  @override
  _MyActivitiesWidgetState createState() => _MyActivitiesWidgetState();
}

class _MyActivitiesWidgetState extends State<MyActivitiesWidget> {
  late MyActivitiesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyActivitiesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF4F3F0),
        body: SafeArea(
          child: Stack(
            children: [
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('email', isEqualTo: currentUserEmail),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: Color(0xFF0184BD),
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> tabBarUsersRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final tabBarUsersRecord = tabBarUsersRecordList.isNotEmpty
                      ? tabBarUsersRecordList.first
                      : null;
                  return DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: Color(0xFF7EAEBD),
                            labelStyle: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16.0,
                                ),
                            indicatorColor: Color(0xDFE1D7C6),
                            tabs: [
                              Tab(
                                text: 'فرصي',
                              ),
                              Tab(
                                text: 'أنشطتي',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (valueOrDefault(
                                            currentUserDocument?.type, '') ==
                                        'student')
                                      AuthUserStreamWidget(
                                        builder: (context) => ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            StreamBuilder<
                                                List<OppApplicationsRecord>>(
                                              stream:
                                                  queryOppApplicationsRecord(
                                                queryBuilder:
                                                    (oppApplicationsRecord) =>
                                                        oppApplicationsRecord.where(
                                                            'app_email',
                                                            isEqualTo:
                                                                currentUserEmail),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            Color(0xFF0184BD),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<OppApplicationsRecord>
                                                    columnOppApplicationsRecordList =
                                                    snapshot.data!;
                                                return SingleChildScrollView(
                                                  primary: false,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnOppApplicationsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnOppApplicationsRecord =
                                                          columnOppApplicationsRecordList[
                                                              columnIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    15.0,
                                                                    15.0,
                                                                    15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                                offset: Offset(
                                                                    0.0, 2.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        columnOppApplicationsRecord
                                                                            .oppName!,
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF565656),
                                                                              fontSize: 18.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'حالة التقديم',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF777373),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    )),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .flaky,
                                                                        color: Color(
                                                                            0xFF777373),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      columnOppApplicationsRecord
                                                                          .status!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF7EAEBD),
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (valueOrDefault(
                                            currentUserDocument?.type, '') ==
                                        'admin')
                                      AuthUserStreamWidget(
                                        builder: (context) =>
                                            SingleChildScrollView(
                                          primary: false,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              StreamBuilder<
                                                  List<OpportunitiesRecord>>(
                                                stream:
                                                    queryOpportunitiesRecord(
                                                  queryBuilder: (opportunitiesRecord) =>
                                                      opportunitiesRecord.where(
                                                          'OpProvider_email',
                                                          isEqualTo:
                                                              currentUserEmail),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              Color(0xFF0184BD),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<OpportunitiesRecord>
                                                      listViewOpportunitiesRecordList =
                                                      snapshot.data!;
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewOpportunitiesRecordList
                                                            .length,
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewOpportunitiesRecord =
                                                          listViewOpportunitiesRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    15.0,
                                                                    15.0,
                                                                    15.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'MyOppDetails',
                                                              queryParams: {
                                                                'opportunityID':
                                                                    serializeParam(
                                                                  listViewOpportunitiesRecord
                                                                      .opID,
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      4.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                          0.0,
                                                                          2.0),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          15.0,
                                                                          15.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              15.0),
                                                                          child:
                                                                              Text(
                                                                            listViewOpportunitiesRecord.oppName!,
                                                                            style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Color(0xFF565656),
                                                                                  fontSize: 18.0,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              'حالة التقديم',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF777373),
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            )),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 5.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.flaky,
                                                                                color: Color(0xFF777373),
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              listViewOpportunitiesRecord.status!,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF7EAEBD),
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'MyOppDetails',
                                                                        queryParams:
                                                                            {
                                                                          'opportunityID':
                                                                              serializeParam(
                                                                            listViewOpportunitiesRecord.opID,
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .chevron_right_rounded,
                                                                      color: Color(
                                                                          0xFF777373),
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if ((tabBarUsersRecord!.type ==
                                            'student') &&
                                        (tabBarUsersRecord!.email ==
                                            currentUserEmail))
                                      Builder(
                                        builder: (context) {
                                          final useractlist = tabBarUsersRecord!
                                              .usersActs!
                                              .toList();
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: useractlist.length,
                                            itemBuilder:
                                                (context, useractlistIndex) {
                                              final useractlistItem =
                                                  useractlist[useractlistIndex];
                                              return StreamBuilder<
                                                  List<ExtraActsRecord>>(
                                                stream: queryExtraActsRecord(
                                                  queryBuilder:
                                                      (extraActsRecord) =>
                                                          extraActsRecord.where(
                                                              'Act_ID',
                                                              isEqualTo:
                                                                  useractlistItem),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color:
                                                              Color(0xFF0184BD),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ExtraActsRecord>
                                                      columnExtraActsRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final columnExtraActsRecord =
                                                      columnExtraActsRecordList
                                                              .isNotEmpty
                                                          ? columnExtraActsRecordList
                                                              .first
                                                          : null;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    15.0,
                                                                    15.0,
                                                                    15.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4.0,
                                                                color: Color(
                                                                    0x33000000),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        15.0,
                                                                        15.0,
                                                                        15.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceAround,
                                                                    children: [
                                                                      Text(
                                                                        columnExtraActsRecord!
                                                                            .actName!,
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF565656),
                                                                              fontSize: 18.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .schedule,
                                                                          color:
                                                                              Color(0xFF0184BD),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                            'M/d h:mm a',
                                                                            columnExtraActsRecord!.sdate!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF0184BD),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .schedule,
                                                                          color:
                                                                              Color(0xFF0184BD),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'M/d h:mm a',
                                                                          columnExtraActsRecord!
                                                                              .edate!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF0184BD),
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .schedule,
                                                                          color:
                                                                              Color(0xFF0184BD),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'آخر فرصة لإلغاء الإلتحاق',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF0184BD),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                          'M/d h:mm a',
                                                                          columnExtraActsRecord!
                                                                              .lastD2disenroll!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF0184BD),
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          15.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .location_on_sharp,
                                                                          color:
                                                                              Color(0xFF0184BD),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          columnExtraActsRecord!
                                                                              .actLoc!,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF0184BD),
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                if (getCurrentTimestamp <=
                                                                    columnExtraActsRecord!
                                                                        .lastD2disenroll!)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            15.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              StreamBuilder<List<NotifyRecord>>(
                                                                            stream:
                                                                                queryNotifyRecord(
                                                                              queryBuilder: (notifyRecord) => notifyRecord.where('act_ID', isEqualTo: columnExtraActsRecord!.actID),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      color: Color(0xFF0184BD),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<NotifyRecord> buttonNotifyRecordList = snapshot.data!;
                                                                              final buttonNotifyRecord = buttonNotifyRecordList.isNotEmpty ? buttonNotifyRecordList.first : null;
                                                                              return FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  if (columnExtraActsRecord!.seats!) {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('هل تريد إلغاء تسجيلك في هذا النشاط؟'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('لا'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('نعم'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      final usersUpdateData1 = {
                                                                                        'users_acts': FieldValue.arrayRemove([
                                                                                          columnExtraActsRecord!.actID
                                                                                        ]),
                                                                                      };
                                                                                      await tabBarUsersRecord!.reference.update(usersUpdateData1);

                                                                                      final extraActsUpdateData = {
                                                                                        'num_seats': FieldValue.increment(1),
                                                                                      };
                                                                                      await columnExtraActsRecord!.reference.update(extraActsUpdateData);
                                                                                      if (buttonNotifyRecord != null) {
                                                                                        triggerPushNotification(
                                                                                          notificationTitle: 'أهلاً بك ',
                                                                                          notificationText: 'تم توفر مقعد في ${columnExtraActsRecord!.actName}',
                                                                                          notificationSound: 'default',
                                                                                          userRefs: buttonNotifyRecord!.multiuser!.toList(),
                                                                                          initialPageName: 'course_info',
                                                                                          parameterData: {
                                                                                            'courseid': columnExtraActsRecord!.actID,
                                                                                          },
                                                                                        );
                                                                                      }
                                                                                    }
                                                                                  } else {
                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              title: Text('هل تريد إلغاء تسجيلك في هذا النشاط؟'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                  child: Text('لا'),
                                                                                                ),
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                  child: Text('نعم'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        ) ??
                                                                                        false;
                                                                                    if (confirmDialogResponse) {
                                                                                      final usersUpdateData2 = {
                                                                                        'users_acts': FieldValue.arrayRemove([
                                                                                          columnExtraActsRecord!.actID
                                                                                        ]),
                                                                                      };
                                                                                      await tabBarUsersRecord!.reference.update(usersUpdateData2);
                                                                                    }
                                                                                  }

                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                    SnackBar(
                                                                                      content: Text(
                                                                                        'تم إلغاء إلتحاقك بنجاح!',
                                                                                        style: TextStyle(
                                                                                          color: Color(0xE1FFFFFF),
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),
                                                                                      ),
                                                                                      duration: Duration(milliseconds: 4000),
                                                                                      backgroundColor: Color(0xE15BD85B),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                text: 'إلغاء اللإلتحاق',
                                                                                options: FFButtonOptions(
                                                                                  width: 130.0,
                                                                                  height: 35.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFFB72F31),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                        fontSize: 16.0,
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(25.0),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          15.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      if (getCurrentTimestamp >
                                                                          columnExtraActsRecord!
                                                                              .edate!)
                                                                        Expanded(
                                                                          child:
                                                                              StreamBuilder<List<ActRatingsRecord>>(
                                                                            stream:
                                                                                queryActRatingsRecord(
                                                                              queryBuilder: (actRatingsRecord) => actRatingsRecord.where('act_id', isEqualTo: columnExtraActsRecord!.actID),
                                                                              singleRecord: true,
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 50.0,
                                                                                    height: 50.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      color: Color(0xFF0184BD),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<ActRatingsRecord> buttonActRatingsRecordList = snapshot.data!;
                                                                              final buttonActRatingsRecord = buttonActRatingsRecordList.isNotEmpty ? buttonActRatingsRecordList.first : null;
                                                                              return FFButtonWidget(
                                                                                onPressed: (buttonActRatingsRecord != null) && buttonActRatingsRecord!.raters!.toList().contains(currentUserUid)
                                                                                    ? null
                                                                                    : () async {
                                                                                        if (!(buttonActRatingsRecord != null)) {
                                                                                          final actRatingsCreateData = createActRatingsRecordData(
                                                                                            actId: columnExtraActsRecord!.actID,
                                                                                            num1: 0,
                                                                                            num2: 0,
                                                                                            num3: 0,
                                                                                            num4: 0,
                                                                                            num5: 0,
                                                                                            count: 0,
                                                                                            num21: 0,
                                                                                            num22: 0,
                                                                                            num23: 0,
                                                                                            num24: 0,
                                                                                            num25: 0,
                                                                                            num31: 0,
                                                                                            num32: 0,
                                                                                            num33: 0,
                                                                                            num34: 0,
                                                                                            num35: 0,
                                                                                          );
                                                                                          await ActRatingsRecord.collection.doc().set(actRatingsCreateData);
                                                                                        }
                                                                                        await showModalBottomSheet(
                                                                                          isScrollControlled: true,
                                                                                          backgroundColor: Color(0x00000000),
                                                                                          barrierColor: Color(0x00000000),
                                                                                          context: context,
                                                                                          builder: (bottomSheetContext) {
                                                                                            return GestureDetector(
                                                                                              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                                                                              child: Padding(
                                                                                                padding: MediaQuery.of(bottomSheetContext).viewInsets,
                                                                                                child: Container(
                                                                                                  height: 500.0,
                                                                                                  child: RatecollectionWidget(
                                                                                                    ratingactID: columnExtraActsRecord!.actID,
                                                                                                    ratingtype: columnExtraActsRecord!.actType,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => setState(() {}));
                                                                                      },
                                                                                text: 'تقييم النشاط',
                                                                                options: FFButtonOptions(
                                                                                  width: 130.0,
                                                                                  height: 35.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: Color(0xFF7EAEBD),
                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(25.0),
                                                                                  disabledColor: Color(0xFF95A1AC),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    if (tabBarUsersRecord!.type == 'admin')
                                      StreamBuilder<List<ExtraActsRecord>>(
                                        stream: queryExtraActsRecord(
                                          queryBuilder: (extraActsRecord) =>
                                              extraActsRecord.where(
                                                  'Act_provider_email',
                                                  isEqualTo: currentUserEmail),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xFF0184BD),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ExtraActsRecord>
                                              listViewExtraActsRecordList =
                                              snapshot.data!;
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewExtraActsRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewExtraActsRecord =
                                                  listViewExtraActsRecordList[
                                                      listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 15.0, 15.0, 15.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'MyActDetails',
                                                      queryParams: {
                                                        'actsdetails':
                                                            serializeParam(
                                                          listViewExtraActsRecord
                                                              .actID,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset:
                                                              Offset(0.0, 2.0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  15.0,
                                                                  15.0,
                                                                  15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Text(
                                                                    listViewExtraActsRecord
                                                                        .actName!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF565656),
                                                                          fontSize:
                                                                              18.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      'حالة التقديم',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF777373),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    )),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .flaky,
                                                                        color: Color(
                                                                            0xFF777373),
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      listViewExtraActsRecord
                                                                          .status!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF7EAEBD),
                                                                          ),
                                                                    )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                'MyActDetails',
                                                                queryParams: {
                                                                  'actsdetails':
                                                                      serializeParam(
                                                                    listViewExtraActsRecord
                                                                        .actID,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: Color(
                                                                  0xFF777373),
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
