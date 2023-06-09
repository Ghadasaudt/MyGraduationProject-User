import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'events_model.dart';
export 'events_model.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({Key? key}) : super(key: key);

  @override
  _EventsWidgetState createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  late EventsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventsModel());

    _model.fieldSearchController1 ??= TextEditingController();
    _model.fieldSearchController2 ??= TextEditingController();
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
        appBar: AppBar(
          backgroundColor: Color(0xFFF4F3F0),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: Color(0xFF7EAEBD),
              size: 30.0,
            ),
            onPressed: () async {
              if (Navigator.of(context).canPop()) {
                context.pop();
              }
              context.pushNamed(
                'HomePage',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.rightToLeft,
                  ),
                },
              );
            },
          ),
          title: Text(
            'الفعاليات',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF7EAEBD),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 5.0, 20.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterFlowChoiceChips(
                        options: [
                          ChipData('الفعاليات المقترحة'),
                          ChipData('جميع الفعاليات')
                        ],
                        onChanged: (val) => setState(
                            () => _model.choiceChipsValue = val?.first),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF7EAEBD),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 18.0,
                          elevation: 4.0,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF7EAEBD),
                                  ),
                          iconColor: Color(0xFF7EAEBD),
                          iconSize: 18.0,
                          elevation: 4.0,
                        ),
                        chipSpacing: 20.0,
                        multiselect: false,
                        initialized: _model.choiceChipsValue != null,
                        alignment: WrapAlignment.start,
                        controller: _model.choiceChipsValueController ??=
                            FormFieldController<List<String>>(
                          ['الفعاليات المقترحة'],
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.choiceChipsValue == 'الفعاليات المقترحة')
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF777373),
                                  size: 20.0,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 140.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Autocomplete<String>(
                                      initialValue: TextEditingValue(),
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return <String>[].where((option) {
                                          final lowercaseOption =
                                              option.toLowerCase();
                                          return lowercaseOption.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      optionsViewBuilder:
                                          (context, onSelected, options) {
                                        return AutocompleteOptionsList(
                                          textFieldKey: _model.fieldSearchKey1,
                                          textController:
                                              _model.fieldSearchController1!,
                                          options: options.toList(),
                                          onSelected: onSelected,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textHighlightStyle: TextStyle(),
                                          elevation: 4.0,
                                          optionBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          optionHighlightColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          maxHeight: 200.0,
                                        );
                                      },
                                      onSelected: (String selection) {
                                        setState(() =>
                                            _model.fieldSearchSelectedOption1 =
                                                selection);
                                        FocusScope.of(context).unfocus();
                                      },
                                      fieldViewBuilder: (
                                        context,
                                        textEditingController,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        _model.fieldSearchController1 =
                                            textEditingController;
                                        return TextFormField(
                                          key: _model.fieldSearchKey1,
                                          controller: textEditingController,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.fieldSearchController1',
                                            Duration(milliseconds: 500),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'أبحث هنا',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF777373),
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF7EAEBD),
                                              ),
                                          textAlign: TextAlign.start,
                                          validator: _model
                                              .fieldSearchController1Validator
                                              .asValidator(context),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder<ApiCallResponse>(
                          future: EventMBCall.call(
                            userID: currentUserEmail,
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
                            final listViewEventMBResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final eventMBdata = getJsonField(
                                  listViewEventMBResponse.jsonBody,
                                  r'''$.data[?(@.status=='موافق عليها')]''',
                                ).toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: eventMBdata.length,
                                  itemBuilder: (context, eventMBdataIndex) {
                                    final eventMBdataItem =
                                        eventMBdata[eventMBdataIndex];
                                    return Visibility(
                                      visible: functions.showSearchResult(
                                          _model.fieldSearchController1.text,
                                          getJsonField(
                                            eventMBdataItem,
                                            r'''$.Act_name''',
                                          ).toString()),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 15.0),
                                            child: StreamBuilder<
                                                List<UserHistoryRecord>>(
                                              stream: queryUserHistoryRecord(
                                                queryBuilder:
                                                    (userHistoryRecord) =>
                                                        userHistoryRecord.where(
                                                            'user_email',
                                                            isEqualTo:
                                                                currentUserEmail),
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
                                                List<UserHistoryRecord>
                                                    containerUserHistoryRecordList =
                                                    snapshot.data!;
                                                final containerUserHistoryRecord =
                                                    containerUserHistoryRecordList
                                                            .isNotEmpty
                                                        ? containerUserHistoryRecordList
                                                            .first
                                                        : null;
                                                return InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'event_info',
                                                      queryParams: {
                                                        'eventID':
                                                            serializeParam(
                                                          getJsonField(
                                                            eventMBdataItem,
                                                            r'''$.Act_ID''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .leftToRight,
                                                        ),
                                                      },
                                                    );

                                                    if (containerUserHistoryRecord !=
                                                        null) {
                                                      final userHistoryUpdateData =
                                                          createUserHistoryRecordData(
                                                        extraActivityID:
                                                            getJsonField(
                                                          eventMBdataItem,
                                                          r'''$.Act_ID''',
                                                        ).toString(),
                                                        aCTType: 'فعالية',
                                                      );
                                                      await containerUserHistoryRecord!
                                                          .reference
                                                          .update(
                                                              userHistoryUpdateData);
                                                    } else {
                                                      final userHistoryCreateData =
                                                          createUserHistoryRecordData(
                                                        userEmail:
                                                            currentUserEmail,
                                                        extraActivityID:
                                                            getJsonField(
                                                          eventMBdataItem,
                                                          r'''$.Act_ID''',
                                                        ).toString(),
                                                        aCTType: 'فعالية',
                                                      );
                                                      await UserHistoryRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              userHistoryCreateData);
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
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
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                              child:
                                                                  Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  getJsonField(
                                                                    eventMBdataItem,
                                                                    r'''$.Act_pic''',
                                                                  ),
                                                                  'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                                                ),
                                                                width: double
                                                                    .infinity,
                                                                height: 110.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child: Text(
                                                                      getJsonField(
                                                                        eventMBdataItem,
                                                                        r'''$.Act_name''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Color(0xFF565656),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'الموقع',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: Color(
                                                                            0xFF777373),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    getJsonField(
                                                                      eventMBdataItem,
                                                                      r'''$.Act_loc''',
                                                                    ).toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto Mono',
                                                                          color:
                                                                              Color(0xFF1C8EC1),
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        UserHistoryRecord>>(
                                                                  stream:
                                                                      queryUserHistoryRecord(
                                                                    queryBuilder: (userHistoryRecord) => userHistoryRecord.where(
                                                                        'user_email',
                                                                        isEqualTo:
                                                                            currentUserEmail),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                Color(0xFF0184BD),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserHistoryRecord>
                                                                        textUserHistoryRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final textUserHistoryRecord = textUserHistoryRecordList
                                                                            .isNotEmpty
                                                                        ? textUserHistoryRecordList
                                                                            .first
                                                                        : null;
                                                                    return InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'event_info',
                                                                          queryParams:
                                                                              {
                                                                            'eventID':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                eventMBdataItem,
                                                                                r'''$.Act_ID''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );

                                                                        if (textUserHistoryRecord !=
                                                                            null) {
                                                                          final userHistoryUpdateData =
                                                                              createUserHistoryRecordData(
                                                                            extraActivityID:
                                                                                getJsonField(
                                                                              eventMBdataItem,
                                                                              r'''$.Act_ID''',
                                                                            ).toString(),
                                                                            aCTType:
                                                                                'فعالية',
                                                                          );
                                                                          await textUserHistoryRecord!
                                                                              .reference
                                                                              .update(userHistoryUpdateData);
                                                                        } else {
                                                                          final userHistoryCreateData =
                                                                              createUserHistoryRecordData(
                                                                            userEmail:
                                                                                currentUserEmail,
                                                                            extraActivityID:
                                                                                getJsonField(
                                                                              eventMBdataItem,
                                                                              r'''$.Act_ID''',
                                                                            ).toString(),
                                                                            aCTType:
                                                                                'فعالية',
                                                                          );
                                                                          await UserHistoryRecord
                                                                              .collection
                                                                              .doc()
                                                                              .set(userHistoryCreateData);
                                                                        }
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'للمزيد',
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF777373),
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .chevron_right_rounded,
                                                                  color: Color(
                                                                      0xFF777373),
                                                                  size: 24.0,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                if (_model.choiceChipsValue == 'جميع الفعاليات')
                  SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 15.0, 20.0, 15.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF777373),
                                  size: 20.0,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: 140.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Autocomplete<String>(
                                      initialValue: TextEditingValue(),
                                      optionsBuilder: (textEditingValue) {
                                        if (textEditingValue.text == '') {
                                          return const Iterable<String>.empty();
                                        }
                                        return <String>[].where((option) {
                                          final lowercaseOption =
                                              option.toLowerCase();
                                          return lowercaseOption.contains(
                                              textEditingValue.text
                                                  .toLowerCase());
                                        });
                                      },
                                      optionsViewBuilder:
                                          (context, onSelected, options) {
                                        return AutocompleteOptionsList(
                                          textFieldKey: _model.fieldSearchKey2,
                                          textController:
                                              _model.fieldSearchController2!,
                                          options: options.toList(),
                                          onSelected: onSelected,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                          textHighlightStyle: TextStyle(),
                                          elevation: 4.0,
                                          optionBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          optionHighlightColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          maxHeight: 200.0,
                                        );
                                      },
                                      onSelected: (String selection) {
                                        setState(() =>
                                            _model.fieldSearchSelectedOption2 =
                                                selection);
                                        FocusScope.of(context).unfocus();
                                      },
                                      fieldViewBuilder: (
                                        context,
                                        textEditingController,
                                        focusNode,
                                        onEditingComplete,
                                      ) {
                                        _model.fieldSearchController2 =
                                            textEditingController;
                                        return TextFormField(
                                          key: _model.fieldSearchKey2,
                                          controller: textEditingController,
                                          focusNode: focusNode,
                                          onEditingComplete: onEditingComplete,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.fieldSearchController2',
                                            Duration(milliseconds: 500),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'أبحث هنا',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF777373),
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF7EAEBD),
                                              ),
                                          textAlign: TextAlign.start,
                                          validator: _model
                                              .fieldSearchController2Validator
                                              .asValidator(context),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        StreamBuilder<List<ExtraActsRecord>>(
                          stream: queryExtraActsRecord(
                            queryBuilder: (extraActsRecord) => extraActsRecord
                                .where('Act_type', isEqualTo: 'فعالية')
                                .where('status', isEqualTo: 'موافق عليها')
                                .orderBy('LastD2enroll', descending: true),
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
                            List<ExtraActsRecord> listViewExtraActsRecordList =
                                snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewExtraActsRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewExtraActsRecord =
                                    listViewExtraActsRecordList[listViewIndex];
                                return Visibility(
                                  visible: functions.showSearchResult(
                                      _model.fieldSearchController2.text,
                                      listViewExtraActsRecord.actName!),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 15.0),
                                        child: StreamBuilder<
                                            List<UserHistoryRecord>>(
                                          stream: queryUserHistoryRecord(
                                            queryBuilder: (userHistoryRecord) =>
                                                userHistoryRecord.where(
                                                    'user_email',
                                                    isEqualTo:
                                                        currentUserEmail),
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
                                                    color: Color(0xFF0184BD),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UserHistoryRecord>
                                                containerUserHistoryRecordList =
                                                snapshot.data!;
                                            final containerUserHistoryRecord =
                                                containerUserHistoryRecordList
                                                        .isNotEmpty
                                                    ? containerUserHistoryRecordList
                                                        .first
                                                    : null;
                                            return InkWell(
                                              onTap: () async {
                                                context.pushNamed(
                                                  'event_info',
                                                  queryParams: {
                                                    'eventID': serializeParam(
                                                      listViewExtraActsRecord
                                                          .actID,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );

                                                if (containerUserHistoryRecord !=
                                                    null) {
                                                  final userHistoryUpdateData =
                                                      createUserHistoryRecordData(
                                                    extraActivityID:
                                                        listViewExtraActsRecord
                                                            .actID,
                                                    aCTType: 'فعالية',
                                                  );
                                                  await containerUserHistoryRecord!
                                                      .reference
                                                      .update(
                                                          userHistoryUpdateData);
                                                } else {
                                                  final userHistoryCreateData =
                                                      createUserHistoryRecordData(
                                                    userEmail: currentUserEmail,
                                                    extraActivityID:
                                                        listViewExtraActsRecord
                                                            .actID,
                                                    aCTType: 'فعالية',
                                                  );
                                                  await UserHistoryRecord
                                                      .collection
                                                      .doc()
                                                      .set(
                                                          userHistoryCreateData);
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15.0, 15.0,
                                                          15.0, 15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              listViewExtraActsRecord
                                                                  .actPic,
                                                              'https://identity.ksu.edu.sa/themes/custom/gavias_enzio/logo.png',
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height: 110.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  listViewExtraActsRecord
                                                                      .actName!,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF565656),
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      if (getCurrentTimestamp <=
                                                          listViewExtraActsRecord
                                                              .lastD2enroll!)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    'متاحة',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).success,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      if (getCurrentTimestamp >
                                                          listViewExtraActsRecord
                                                              .lastD2enroll!)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Text(
                                                                    'غير متاحة',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFFB72F31),
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
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
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'الموقع',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: Color(
                                                                        0xFF777373),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                listViewExtraActsRecord
                                                                    .actLoc!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto Mono',
                                                                      color: Color(
                                                                          0xFF1C8EC1),
                                                                      fontSize:
                                                                          16.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    UserHistoryRecord>>(
                                                              stream:
                                                                  queryUserHistoryRecord(
                                                                queryBuilder: (userHistoryRecord) =>
                                                                    userHistoryRecord.where(
                                                                        'user_email',
                                                                        isEqualTo:
                                                                            currentUserEmail),
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: Color(
                                                                            0xFF0184BD),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UserHistoryRecord>
                                                                    textUserHistoryRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final textUserHistoryRecord =
                                                                    textUserHistoryRecordList
                                                                            .isNotEmpty
                                                                        ? textUserHistoryRecordList
                                                                            .first
                                                                        : null;
                                                                return InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'event_info',
                                                                      queryParams:
                                                                          {
                                                                        'eventID':
                                                                            serializeParam(
                                                                          listViewExtraActsRecord
                                                                              .actID,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );

                                                                    if (textUserHistoryRecord !=
                                                                        null) {
                                                                      final userHistoryUpdateData =
                                                                          createUserHistoryRecordData(
                                                                        extraActivityID:
                                                                            listViewExtraActsRecord.actID,
                                                                        aCTType:
                                                                            'فعالية',
                                                                      );
                                                                      await textUserHistoryRecord!
                                                                          .reference
                                                                          .update(
                                                                              userHistoryUpdateData);
                                                                    } else {
                                                                      final userHistoryCreateData =
                                                                          createUserHistoryRecordData(
                                                                        userEmail:
                                                                            currentUserEmail,
                                                                        extraActivityID:
                                                                            listViewExtraActsRecord.actID,
                                                                        aCTType:
                                                                            'فعالية',
                                                                      );
                                                                      await UserHistoryRecord
                                                                          .collection
                                                                          .doc()
                                                                          .set(
                                                                              userHistoryCreateData);
                                                                    }
                                                                  },
                                                                  child: Text(
                                                                    'للمزيد',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF777373),
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .chevron_right_rounded,
                                                              color: Color(
                                                                  0xFF777373),
                                                              size: 24.0,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
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
        ),
      ),
    );
  }
}
