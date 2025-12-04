import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint
abstract class AppLocalizations {
  String get appName;

  String get appVersion;

  String get pleaseEnterName;

  String get nameMustBeMoreThan3Characters;

  String get passwordMustContainUpperLowerAndSpecialCharacter;

  String get passwordsDoNotMatch;

  String get pleaseEnterYourPassword;

  String get pleaseEnterYourEmail;

  String get emailMustBeLikeThisExampleGmailCom;

  String get pleaseEnterYourPhoneNumber;

  String get enterAValidEgyptianPhoneNumber;

  String get home;

  String get profile;

  String get login;

  String get version;

  String get enterYourEmail;

  String get email;

  String get password;

  String get enterYourPassword;

  String get rememberMe;

  String get forgotPassword;

  String get continueBtn;

  String get ok;

  String get thankYou;

  String get successfully;

  String get done;

  String get status;

  String get loading;

  String get success;

  String get resetPassword;

  String get pleaseEnterYourEmailToReceiveAVerificationCode;

  String get send;

  String get verificationCodeSentToYourEmail;

  String get emailNotFound;

  String get tryAgain;

  String get emailVerification;

  String get pleaseEnterThe6DigitCodeSentToYourEmail;

  String get didntReceiveTheCode;

  String get resend;

  String get pleaseEnterYourNewPassword;

  String get newPassword;

  String get enterYourNewPassword;

  String get confirmYourPassword;

  String get confirmPassword;

  String get passwordResetSuccessPleaseLoginAgainWithYourNewPassword;

  String get error;

  String get forgetPassword;

  String get firstName;

  String get lastName;

  String get enterFirstName;

  String get enterLastName;

  String get next;

  String get back;

  String get doIt;

  String get skip;

  String get title1oOnBarding;

  String get title2oOnBarding;

  String get title3oOnBarding;

  String get subtitle1OnBarding;

  String get subtitle2OnBarding;

  String get subtitle3OnBarding;

  String get hetThere;

  String get welcomBack;

  String get dontHaveAnAccountYet;

  String get register;

  String get noWorkoutsAvailableYet;

  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
