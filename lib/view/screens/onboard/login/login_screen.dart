import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:northern_border_university/controller/app_theme.dart';
import 'custom_route.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _loginUser() {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _signupUser() {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _signupConfirm(String error) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'N B U',
      theme: LoginTheme(
        pageColorLight: AppTheme.background,
        primaryColor: AppTheme.green,
      ),
      logo: const AssetImage('assets/images/logo/logo.png'),
      logoTag: 'NBU-Logo',
      titleTag: 'title'.tr,
      navigateBackAfterRecovery: true,
      onConfirmRecover: ((p0, p1) => _signupConfirm('Error')),
      onConfirmSignup: ((p0, p1) => _signupConfirm('Error')),
      loginAfterSignUp: false,
      messages: LoginMessages(
        userHint: 'user_hint'.tr,
        passwordHint: 'password_hint'.tr,
        confirmPasswordHint: 'confirm_hint'.tr,
        forgotPasswordButton: 'forgot_password'.tr,
        loginButton: 'login'.tr,
        signupButton: 'register'.tr,
        providersTitleFirst: 'or'.tr,
        providersTitleSecond: 'or_login_with'.tr,
      ),
      loginProviders: [
        LoginProvider(
          button: Buttons.apple,
          animated: true,
          label: 'apple_sign'.tr,
          callback: () async {
            //return null meaning user signedIN else user can't signIn
            return null;
          },
          providerNeedsSignUpCallback: () {
            // put here your logic to conditionally show the additional fields
            return Future.value(true);
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.google,
          callback: () async {
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],

      termsOfService: [
        TermOfService(id: 'notifications', mandatory: false, text: 'الإشعارات'),
        TermOfService(
          id: 'general-term',
          mandatory: true,
          text: 'سياسة الإستخدام',
        ),
      ],
      additionalSignupFields: [
        const UserFormField(
            keyName: 'إسم المستخدم', icon: Icon(FontAwesomeIcons.userLarge)),
        const UserFormField(keyName: 'الإسم بالكامل'),
        UserFormField(
          keyName: 'phone_number',
          displayName: 'رقم الهاتف',
          userType: LoginUserType.phone,
          fieldValidator: (value) {
            var phoneRegExp = RegExp(
                '^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$');
            if (value != null &&
                value.length < 7 &&
                !phoneRegExp.hasMatch(value)) {
              return "رقم الهاتف غير صحيح";
            }
            return null;
          },
        ),
      ],
      initialAuthMode: key == Key('Sign UP') ? AuthMode.signup : AuthMode.login,
      userValidator: (value) {
        if (!GetUtils.isEmail(value!)) {
          return "البريد الإلكتروني غير صحيح";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'يجب إدخال كلمة المرور';
        }
        return null;
      },
      onLogin: (loginData) {
        debugPrint('Login info');
        debugPrint('Name: ${loginData.name}');
        debugPrint('Password: ${loginData.password}');
        return _loginUser();
      },
      onSignup: (signupData) {
        debugPrint('Signup info');
        debugPrint('Name: ${signupData.name}');
        debugPrint('Password: ${signupData.password}');

        signupData.additionalSignupData?.forEach((key, value) {
          debugPrint('$key: $value');
        });
        if (signupData.termsOfService.isNotEmpty) {
          debugPrint('Terms of service: ');
          for (var element in signupData.termsOfService) {
            debugPrint(
                ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
          }
        }
        return _signupUser();
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(
          FadePageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      },
      onRecoverPassword: (name) {
        debugPrint('Recover password info');
        debugPrint('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      //showDebugButtons: true,
    );
  }
}
