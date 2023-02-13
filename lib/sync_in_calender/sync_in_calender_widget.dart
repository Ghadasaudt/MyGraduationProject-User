import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sync_in_calender_model.dart';
export 'sync_in_calender_model.dart';

class SyncInCalenderWidget extends StatefulWidget {
  const SyncInCalenderWidget({Key? key}) : super(key: key);

  @override
  _SyncInCalenderWidgetState createState() => _SyncInCalenderWidgetState();
}

class _SyncInCalenderWidgetState extends State<SyncInCalenderWidget> {
  late SyncInCalenderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SyncInCalenderModel());
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.chevron_left,
            color: Color(0xFF777373),
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'التقويم',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF777373),
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlutterFlowCalendar(
                color: Color(0xFFFF5757),
                weekFormat: false,
                weekStartsMonday: false,
                initialDate: getCurrentTimestamp,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => _model.calendarSelectedDay = newSelectedDate);
                },
                titleStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).backgroundComponents,
                ),
                dayOfWeekStyle: TextStyle(),
                dateStyle: TextStyle(),
                selectedDateStyle: TextStyle(
                  color: FlutterFlowTheme.of(context).backgroundComponents,
                ),
                inactiveDateStyle: TextStyle(),
                locale: FFLocalizations.of(context).languageCode,
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: StreamBuilder<List<ExtraActsRecord>>(
                  stream: queryExtraActsRecord(
                    queryBuilder: (extraActsRecord) => extraActsRecord.where(
                        'Sdate',
                        isEqualTo: _model.calendarSelectedDay?.start),
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
                    List<ExtraActsRecord> listViewExtraActsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewExtraActsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewExtraActsRecord =
                            listViewExtraActsRecordList[listViewIndex];
                        return AuthUserStreamWidget(
                          builder: (context) => Text(
                            (currentUserDocument?.usersActs?.toList() ?? [])
                                .contains(listViewExtraActsRecord.actName)
                                .toString(),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
