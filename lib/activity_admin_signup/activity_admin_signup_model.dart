import '/auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ActivityAdminSignupModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'الرجاء تعبئة الحقل';
    }

    if (!RegExp('^([0-9]{9})+@student\\.ksu\\.edu\\.sa\$').hasMatch(val)) {
      return 'الرجاء التأكد من صيغة البريد الجامعي';
    }
    return null;
  }

  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    if (val.length < 8) {
      return 'يجب أن تكون كلمة المرور ٨ خانات على الأقل';
    }

    if (!RegExp(
            '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@\$!%*?&/><.,~`\':;{}[+=_#^*()±§|-])[A-Za-z\\d@\$!%*?&/><.,~`\':;{}[+=_#^*()±§|-]{8,}\$')
        .hasMatch(val)) {
      return 'الرجاء التحقق من جميع المتطلبات';
    }
    return null;
  }

  // State field(s) for Confirmpassword widget.
  TextEditingController? confirmpasswordController;
  late bool confirmpasswordVisibility;
  String? Function(BuildContext, String?)? confirmpasswordControllerValidator;
  String? _confirmpasswordControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'يجب تعبئة الحقل';
    }

    if (val.length < 8) {
      return 'الرجاء تأكيد كلمة المرور';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
    confirmpasswordVisibility = false;
    confirmpasswordControllerValidator = _confirmpasswordControllerValidator;
  }

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    confirmpasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}