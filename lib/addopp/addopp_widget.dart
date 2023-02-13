import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addopp_model.dart';
export 'addopp_model.dart';

class AddoppWidget extends StatefulWidget {
  const AddoppWidget({Key? key}) : super(key: key);

  @override
  _AddoppWidgetState createState() => _AddoppWidgetState();
}

class _AddoppWidgetState extends State<AddoppWidget> {
  late AddoppModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddoppModel());

    _model.oppNameController = TextEditingController();
    _model.oppskill1Controller = TextEditingController();
    _model.oppskill2Controller = TextEditingController();
    _model.oppskill3Controller = TextEditingController();
    _model.oppskill4Controller = TextEditingController();
    _model.oppskill5Controller = TextEditingController();
    _model.oppdesController = TextEditingController();
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            child: FlutterFlowIconButton(
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
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('HomePage');

                FFAppState().numskills = 1;
                FFAppState().Skilllist = [];
              },
            ),
          ),
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Text(
              'طلب إضافة فرصة جديدة',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF777373),
                    fontSize: 22,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
        child: Container(
          width: double.infinity,
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBtnText,
                borderRadius: BorderRadius.circular(9),
              ),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 15),
                      child: Container(
                        width: 400,
                        child: TextFormField(
                          controller: _model.oppNameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'اسم الفرصة',
                            labelStyle: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF0283BC),
                              fontWeight: FontWeight.normal,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF0F0F0),
                          ),
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            color: Color(0xFF565656),
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                          validator: _model.oppNameControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.oppskill1Controller,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.oppskill1Controller',
                            Duration(milliseconds: 2000),
                            () async {
                              FFAppState().addToSkilllist(
                                  _model.oppskill1Controller.text);
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'المهارة المطلوبة',
                            labelStyle: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF0283BC),
                              fontWeight: FontWeight.normal,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF0F0F0),
                          ),
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            color: Color(0xFF565656),
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          validator: _model.oppskill1ControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    if (FFAppState().numskills >= 2)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.oppskill2Controller,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.oppskill2Controller',
                              Duration(milliseconds: 2000),
                              () async {
                                FFAppState().addToSkilllist(
                                    _model.oppskill2Controller.text);
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'المهارة المطلوبة',
                              labelStyle: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF0283BC),
                                fontWeight: FontWeight.normal,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF0F0F0),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF565656),
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            validator: _model.oppskill2ControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    if (FFAppState().numskills >= 3)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.oppskill3Controller,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.oppskill3Controller',
                              Duration(milliseconds: 2000),
                              () async {
                                FFAppState().addToSkilllist(
                                    _model.oppskill3Controller.text);
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'المهارة المطلوبة',
                              labelStyle: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF0283BC),
                                fontWeight: FontWeight.normal,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF0F0F0),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF565656),
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            validator: _model.oppskill3ControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    if (FFAppState().numskills >= 4)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.oppskill4Controller,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.oppskill4Controller',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'المهارة المطلوبة',
                              labelStyle: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF0283BC),
                                fontWeight: FontWeight.normal,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF0F0F0),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF565656),
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            validator: _model.oppskill4ControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    if (FFAppState().numskills >= 5)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 5),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.oppskill5Controller,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.oppskill5Controller',
                              Duration(milliseconds: 2000),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'المهارة المطلوبة',
                              labelStyle: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF0283BC),
                                fontWeight: FontWeight.normal,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0283BC),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Color(0xFFF0F0F0),
                            ),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF565656),
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            validator: _model.oppskill5ControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 25,
                            borderWidth: 0,
                            buttonSize: 35,
                            disabledColor: Color(0xFF57636C),
                            icon: Icon(
                              Icons.add_circle_outline_rounded,
                              color: Color(0xFF0283BC),
                              size: 25,
                            ),
                            onPressed: FFAppState().numskills == 5
                                ? null
                                : () async {
                                    FFAppState().update(() {
                                      FFAppState().numskills =
                                          FFAppState().numskills + 1;
                                    });
                                  },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                            child: Text(
                              'إضافة حقل',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: Color(0xFF0283BC),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: Container(
                        width: 400,
                        child: TextFormField(
                          controller: _model.oppdesController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'وصف الفرصة',
                            labelStyle: GoogleFonts.getFont(
                              'Open Sans',
                              color: Color(0xFF0283BC),
                              fontWeight: FontWeight.normal,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyText2
                                .override(
                                  fontFamily: 'Outfit',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Color(0xFFF0F0F0),
                          ),
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            color: Color(0xFF565656),
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          keyboardType: TextInputType.multiline,
                          validator: _model.oppdesControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 15),
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F0F0),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFF0283BC),
                            width: 2,
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              setState(() => _model.isMediaUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'يتم رفع الملفات...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isMediaUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                                showUploadMessage(
                                    context, 'تم رفع الملفات بنجاح!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'فشل في رفع الملفات');
                                return;
                              }
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                color: Color(0xFF57636C),
                                size: 24,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: Text(
                                  'شعار الجهة المقدمة للفرصة',
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: Color(0xFF0283BC),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                final _datePicked1Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: getCurrentTimestamp,
                                  lastDate: DateTime(2050),
                                );

                                TimeOfDay? _datePicked1Time;
                                if (_datePicked1Date != null) {
                                  _datePicked1Time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        getCurrentTimestamp),
                                  );
                                }

                                if (_datePicked1Date != null &&
                                    _datePicked1Time != null) {
                                  setState(() {
                                    _model.datePicked1 = DateTime(
                                      _datePicked1Date.year,
                                      _datePicked1Date.month,
                                      _datePicked1Date.day,
                                      _datePicked1Time!.hour,
                                      _datePicked1Time.minute,
                                    );
                                  });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: Color(0xFF57636C),
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      'بداية الفرصة',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF0283BC),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF0F0F0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Color(0xFF0283BC),
                                width: 2,
                              ),
                            ),
                            child: InkWell(
                              onTap: () async {
                                final _datePicked2Date = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: getCurrentTimestamp,
                                  lastDate: DateTime(2050),
                                );

                                TimeOfDay? _datePicked2Time;
                                if (_datePicked2Date != null) {
                                  _datePicked2Time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        getCurrentTimestamp),
                                  );
                                }

                                if (_datePicked2Date != null &&
                                    _datePicked2Time != null) {
                                  setState(() {
                                    _model.datePicked2 = DateTime(
                                      _datePicked2Date.year,
                                      _datePicked2Date.month,
                                      _datePicked2Date.day,
                                      _datePicked2Time!.hour,
                                      _datePicked2Time.minute,
                                    );
                                  });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: Color(0xFF57636C),
                                    size: 24,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: Text(
                                      'نهاية الفرصة',
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                        color: Color(0xFF0283BC),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        final opportunitiesCreateData = {
                          ...createOpportunitiesRecordData(
                            opDesc: _model.oppdesController.text,
                            sdate: _model.datePicked1,
                            edate: _model.datePicked2,
                            opProvider: currentUserDisplayName,
                            opProviderLogo: _model.uploadedFileUrl,
                            oppName: _model.oppNameController.text,
                            status: 'موافق عليها',
                            opID: random_data.randomString(
                              20,
                              20,
                              true,
                              true,
                              true,
                            ),
                            opProviderEmail: currentUserEmail,
                          ),
                          'OpSkills': FFAppState().Skilllist,
                        };
                        await OpportunitiesRecord.collection
                            .doc()
                            .set(opportunitiesCreateData);
                        FFAppState().numskills = 1;
                        FFAppState().Skilllist = [];
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'تم إضافة النشاط بنجاح',
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFF22C11C),
                          ),
                        );
                      },
                      text: 'إرسال طلب الإضافة',
                      options: FFButtonOptions(
                        width: 270,
                        height: 50,
                        color: Color(0xFF1C8EC1),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle1.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
