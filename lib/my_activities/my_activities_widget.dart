import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/push_notifications/push_notifications_util.dart';
import '../components/ratecollection_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF4F3F0),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
                        width: 50,
                        height: 50,
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
                        TabBar(
                          labelColor: Color(0xFF777373),
                          labelStyle:
                              FlutterFlowTheme.of(context).title2.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                  ),
                          indicatorColor:
                              FlutterFlowTheme.of(context).alternate,
                          tabs: [
                            Tab(
                              text: 'فرصي',
                            ),
                            Tab(
                              text: 'أنشطتي',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SingleChildScrollView(
                                primary: false,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (tabBarUsersRecord!.type == 'student')
                                      ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        children: [
                                          StreamBuilder<
                                              List<OppApplicationsRecord>>(
                                            stream: queryOppApplicationsRecord(
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
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: Color(0xFF0184BD),
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
                                                                  6, 6, 6, 6),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 7,
                                                              color: Color(
                                                                  0xFF777373),
                                                              offset:
                                                                  Offset(0, 3),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFFE4DFDA),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      12,
                                                                      12,
                                                                      12),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            8),
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
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .title3
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF1C8EC1),
                                                                            fontSize:
                                                                                20,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                child: Row(
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
                                                                          .subtitle1,
                                                                    )),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              60,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .flaky,
                                                                        color: Color(
                                                                            0xFF575F6C),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                    ),
                                                                    SelectionArea(
                                                                        child:
                                                                            Text(
                                                                      columnOppApplicationsRecord
                                                                          .status!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    )),
                                                                  ],
                                                                ),
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
                                    SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (tabBarUsersRecord!.type ==
                                              'admin')
                                            StreamBuilder<
                                                List<OpportunitiesRecord>>(
                                              stream: queryOpportunitiesRecord(
                                                queryBuilder:
                                                    (opportunitiesRecord) =>
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
                                                      width: 50,
                                                      height: 50,
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
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewOpportunitiesRecord =
                                                        listViewOpportunitiesRecordList[
                                                            listViewIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 12,
                                                                  16, 0),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 3,
                                                              color: Color(
                                                                  0x25000000),
                                                              offset:
                                                                  Offset(0, 2),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          12,
                                                                          16,
                                                                          12),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    listViewOpportunitiesRecord
                                                                        .oppName!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .title2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              22,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      listViewOpportunitiesRecord
                                                                          .opProvider!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF57636C),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      listViewOpportunitiesRecord
                                                                          .status!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF4B39EF),
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          160,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  if (Navigator.of(
                                                                          context)
                                                                      .canPop()) {
                                                                    context
                                                                        .pop();
                                                                  }
                                                                  context
                                                                      .pushNamed(
                                                                    'MyOppDetails',
                                                                    queryParams:
                                                                        {
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
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios_rounded,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
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
                                                        width: 50,
                                                        height: 50,
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
                                                                    6, 6, 6, 6),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 7,
                                                                color: Color(
                                                                    0xFF777373),
                                                                offset: Offset(
                                                                    0, 3),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFFE4DFDA),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12,
                                                                        12,
                                                                        12,
                                                                        12),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          8),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        columnExtraActsRecord!
                                                                            .actName!,
                                                                        textAlign:
                                                                            TextAlign.end,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .title3
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: Color(0xFF1C8EC1),
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
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
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    child: CircularProgressIndicator(
                                                                                      color: Color(0xFF0184BD),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<NotifyRecord> buttonNotifyRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
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
                                                                                      triggerPushNotification(
                                                                                        notificationTitle: 'حياك!!',
                                                                                        notificationText: 'لقينا لك مقعد',
                                                                                        notificationSound: 'default',
                                                                                        userRefs: buttonNotifyRecord!.multiuser!.toList(),
                                                                                        initialPageName: 'course_info',
                                                                                        parameterData: {
                                                                                          'courseid': columnExtraActsRecord!.actID,
                                                                                        },
                                                                                      );
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
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'تم إلغاء تسجيلك بنجاح!',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: Color(0xE15BD85B),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                  }
                                                                                },
                                                                                text: 'إلغاء التسجيل',
                                                                                options: FFButtonOptions(
                                                                                  width: 130,
                                                                                  height: 30,
                                                                                  color: Color(0xE1FF2323),
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'Poppins',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (getCurrentTimestamp >=
                                                                          columnExtraActsRecord!
                                                                              .edate!)
                                                                        Expanded(
                                                                          child:
                                                                              FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              await showModalBottomSheet(
                                                                                isScrollControlled: true,
                                                                                context: context,
                                                                                builder: (context) {
                                                                                  return Padding(
                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                    child: Container(
                                                                                      height: 500,
                                                                                      child: RatecollectionWidget(
                                                                                        ratingactID: columnExtraActsRecord!.actID,
                                                                                        ratingtype: columnExtraActsRecord!.actType,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => setState(() {}));
                                                                            },
                                                                            text:
                                                                                'قيمي النشاط',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 130,
                                                                              height: 30,
                                                                              color: Color(0xFF1C8EC1),
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Colors.white,
                                                                                  ),
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
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
                                                width: 50,
                                                height: 50,
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
                                                    .fromSTEB(16, 12, 16, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        color:
                                                            Color(0x25000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 16, 12),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              listViewExtraActsRecord
                                                                  .actName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Color(
                                                                        0xFF101213),
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                currentUserEmail,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewExtraActsRecord
                                                                    .status!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF4B39EF),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    0, 0),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            if (Navigator.of(
                                                                    context)
                                                                .canPop()) {
                                                              context.pop();
                                                            }
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
                                                                .arrow_forward_ios_rounded,
                                                            color: Colors.black,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
