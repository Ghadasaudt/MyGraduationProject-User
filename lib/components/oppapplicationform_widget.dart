import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'oppapplicationform_model.dart';
export 'oppapplicationform_model.dart';

class OppapplicationformWidget extends StatefulWidget {
  const OppapplicationformWidget({
    Key? key,
    this.oppappform,
    this.oppappemail,
  }) : super(key: key);

  final String? oppappform;
  final String? oppappemail;

  @override
  _OppapplicationformWidgetState createState() =>
      _OppapplicationformWidgetState();
}

class _OppapplicationformWidgetState extends State<OppapplicationformWidget> {
  late OppapplicationformModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OppapplicationformModel());

    _model.userEmailController = TextEditingController(text: currentUserEmail);
    _model.shortbioController = TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OpportunitiesRecord>>(
      stream: queryOpportunitiesRecord(
        queryBuilder: (opportunitiesRecord) =>
            opportunitiesRecord.where('OpID', isEqualTo: widget.oppappform),
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
        List<OpportunitiesRecord> containerOpportunitiesRecordList =
            snapshot.data!;
        final containerOpportunitiesRecord =
            containerOpportunitiesRecordList.isNotEmpty
                ? containerOpportunitiesRecordList.first
                : null;
        return Material(
          color: Colors.transparent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Container(
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Container(
                          width: 50,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Color(0xFFE0E3E7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                        child: Text(
                          'الرجاء تعبئة نموذج التقديم أدناه',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).alternate,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord
                            .where('email', isEqualTo: currentUserEmail),
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
                        List<UsersRecord> columnUsersRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final columnUsersRecord =
                            columnUsersRecordList.isNotEmpty
                                ? columnUsersRecordList.first
                                : null;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 15, 4, 15),
                              child: Container(
                                width: 300,
                                child: TextFormField(
                                  controller: _model.userEmailController,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'بريدك الإلكتروني',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF565656),
                                        ),
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE0E0E0),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.start,
                                  validator: _model.userEmailControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 15),
                                child: FlutterFlowDropDown<String>(
                                  options: containerOpportunitiesRecord!
                                      .opSkills!
                                      .toList()
                                      .toList(),
                                  onChanged: (val) =>
                                      setState(() => _model.skillValue = val),
                                  width: 300,
                                  height: 50,
                                  textStyle: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                  ),
                                  hintText: 'حددي مهارتك',
                                  fillColor: Color(0xFFE0E0E0),
                                  elevation: 2,
                                  borderColor: Colors.transparent,
                                  borderWidth: 0,
                                  borderRadius: 25,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 4, 12, 4),
                                  hidesUnderline: true,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 4, 15),
                              child: Container(
                                width: 300,
                                child: TextFormField(
                                  controller: _model.shortbioController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: ' نبذة عنك',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    hintText: ' نبذة بسيطة عنك )٢٨٠ حرف(',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xE1FF2323),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xE1FF2323),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFE0E0E0),
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF565656),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.start,
                                  maxLines: 10,
                                  validator: _model.shortbioControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.skillValue == null) {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('يجب تحديد مهارتك'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('تم'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  }

                                  final oppApplicationsCreateData =
                                      createOppApplicationsRecordData(
                                    appEmail: _model.userEmailController.text,
                                    appSkills: _model.skillValue,
                                    appBio: _model.shortbioController.text,
                                    oppName:
                                        containerOpportunitiesRecord!.oppName,
                                    status: 'معلق',
                                    oppproviderEmail: widget.oppappemail,
                                    oppIDDD: widget.oppappform,
                                  );
                                  await OppApplicationsRecord.collection
                                      .doc()
                                      .set(oppApplicationsCreateData);

                                  final usersUpdateData = {
                                    'users_opp': FieldValue.arrayUnion(
                                        [containerOpportunitiesRecord!.opID]),
                                  };
                                  await columnUsersRecord!.reference
                                      .update(usersUpdateData);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'لقد تم تقديمك على هذه الفرصة بنجاح!',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor: Color(0xE15BD85B),
                                    ),
                                  );
                                  Navigator.pop(context);
                                },
                                text: 'إرسال',
                                options: FFButtonOptions(
                                  width: 270,
                                  height: 50,
                                  color: Color(0xFF1C8EC1),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
