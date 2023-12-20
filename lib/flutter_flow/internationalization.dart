import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['th', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? thText = '',
    String? enText = '',
  }) =>
      [thText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'oibuzifg': {
      'th': 'Page Title',
      'en': '',
    },
    'oet5amrp': {
      'th': 'Home',
      'en': '',
    },
  },
  // WorkOrderManagement
  {
    '566w0xmc': {
      'th': 'Hello World',
      'en': '',
    },
    '7a1fu90b': {
      'th': 'Hello World',
      'en': '',
    },
    '7zpeb9cc': {
      'th': 'Work Order',
      'en': '',
    },
    'tovr8fcx': {
      'th': 'Plan',
      'en': '',
    },
    'p0ugwmtn': {
      'th': 'In Progres',
      'en': '',
    },
    'yf4pnvqq': {
      'th': 'taskName',
      'en': '',
    },
    'b333408f': {
      'th': 'Status',
      'en': '',
    },
    'q96djwxk': {
      'th': 'Hello World',
      'en': '',
    },
    'ngkc3ssu': {
      'th': 'Hello World',
      'en': '',
    },
    'qnu3j4v3': {
      'th': 'MMMEd',
      'en': '',
    },
    'tzwxwv9w': {
      'th': 'jm',
      'en': '',
    },
    '5am2pii4': {
      'th': 'taskName',
      'en': '',
    },
    'eseea7l5': {
      'th': 'Status',
      'en': '',
    },
    'u9q2my3c': {
      'th': 'Hello World',
      'en': '',
    },
    'iem5qm0j': {
      'th': 'Hello World',
      'en': '',
    },
    'tkybbymy': {
      'th': 'MMMEd',
      'en': '',
    },
    'grcw1sz0': {
      'th': 'jm',
      'en': '',
    },
    '0wgyub1q': {
      'th': 'Complete',
      'en': '',
    },
    'jm9kc814': {
      'th': 'taskName',
      'en': '',
    },
    'zxbb01ui': {
      'th': 'Status',
      'en': '',
    },
    'cwxfhk5e': {
      'th': 'Hello World',
      'en': '',
    },
    'f47xwlzn': {
      'th': 'Hello World',
      'en': '',
    },
    'ioefgtvs': {
      'th': 'MMMEd',
      'en': '',
    },
    '1qknhwfx': {
      'th': 'jm',
      'en': '',
    },
    'f41yr1pm': {
      'th': 'Work Order',
      'en': '',
    },
  },
  // createUser
  {
    'iq5op30d': {
      'th': 'User Management',
      'en': '',
    },
    't729ftiu': {
      'th': 'Create User',
      'en': '',
    },
    'fap7sbbf': {
      'th': 'Email',
      'en': '',
    },
    'dfe6k4zv': {
      'th': 'Password',
      'en': '',
    },
    'spd59n4v': {
      'th': 'Create Account',
      'en': '',
    },
    'kx4hvwwv': {
      'th': 'Or sign up with',
      'en': '',
    },
    'lt9dw3mx': {
      'th': 'Already have an account? ',
      'en': '',
    },
    'f27eiu0s': {
      'th': 'Sign in here',
      'en': '',
    },
    'aojnckl6': {
      'th': 'Home',
      'en': '',
    },
  },
  // login
  {
    '3w1etdc7': {
      'th': 'MBT \nWork Order Management',
      'en': '',
    },
    'lz78aqb3': {
      'th': 'Email',
      'en': '',
    },
    'cy16fg71': {
      'th': 'Password',
      'en': '',
    },
    '3oe97gl7': {
      'th': 'Sign In',
      'en': '',
    },
    'bav1wkqt': {
      'th': 'Don\'t have an account?  ',
      'en': '',
    },
    '5apblyde': {
      'th': 'Create Account',
      'en': '',
    },
    'c3qvm3p7': {
      'th': 'Forgot password?',
      'en': '',
    },
    '5xsmhpob': {
      'th': 'Home',
      'en': '',
    },
  },
  // forgetPassword
  {
    '24xra3pv': {
      'th': 'User Management',
      'en': '',
    },
    '1miqdxt5': {
      'th': 'Forgot Password',
      'en': '',
    },
    '9hsotx3a': {
      'th':
          'Please fill out your email belo in order to recieve a reset password link.',
      'en': '',
    },
    'kbj5vjo2': {
      'th': 'Email',
      'en': '',
    },
    'fwgwjlgl': {
      'th': 'Send Reset Link',
      'en': '',
    },
    'ax2ayn0v': {
      'th': 'Home',
      'en': '',
    },
  },
  // createProfile
  {
    'ognma3r6': {
      'th': 'User Management',
      'en': '',
    },
    '8a99ef5z': {
      'th': 'Home',
      'en': '',
    },
  },
  // userProfile
  {
    '3ji5a1uy': {
      'th': 'Andrew D.',
      'en': '',
    },
    'tvsdv1gx': {
      'th': 'andrew@domainname.com',
      'en': '',
    },
    'u98xr8tf': {
      'th': 'Your Account',
      'en': '',
    },
    '1289du02': {
      'th': 'Edit Profile',
      'en': '',
    },
    '54h0uczg': {
      'th': 'App Settings',
      'en': '',
    },
    'yxnxphsn': {
      'th': 'Support',
      'en': '',
    },
    'qpsx9v6u': {
      'th': 'Terms of Service',
      'en': '',
    },
    'd73dd6uj': {
      'th': 'Log Out',
      'en': '',
    },
    'fu1vy2r5': {
      'th': 'Home',
      'en': '',
    },
  },
  // editProfile
  {
    'ohrgcj65': {
      'th': 'Home',
      'en': '',
    },
  },
  // addMachine
  {
    'qsrhiccc': {
      'th': 'Add Machine',
      'en': '',
    },
    'x2e278e8': {
      'th': 'Find machine by searching below to add them to this task.',
      'en': '',
    },
    'w42y7ih2': {
      'th': 'Search machine...',
      'en': '',
    },
    'jn5eqa5r': {
      'th': 'Machine Name',
      'en': '',
    },
    '2po6bwhf': {
      'th': 'Location',
      'en': '',
    },
    'xb4cykca': {
      'th': 'View',
      'en': '',
    },
    'd0vs2tkj': {
      'th': 'user@domainname.com',
      'en': '',
    },
    'gha5de8r': {
      'th': 'View',
      'en': '',
    },
    'gt2zg7ji': {
      'th': 'Username',
      'en': '',
    },
    'yp1pjhfe': {
      'th': 'user@domainname.com',
      'en': '',
    },
    'r1oyppmk': {
      'th': 'View',
      'en': '',
    },
    'vm7b6bhx': {
      'th': 'Username',
      'en': '',
    },
    'l5eop1li': {
      'th': 'user@domainname.com',
      'en': '',
    },
    'kp5o1zlz': {
      'th': 'View',
      'en': '',
    },
    'v7sd9tj2': {
      'th': 'user@domainname.com',
      'en': '',
    },
    '2yl5qtq8': {
      'th': 'View',
      'en': '',
    },
  },
  // mainMenu
  {
    'a2ez48ad': {
      'th': 'Home',
      'en': '',
    },
    'ue0mjb34': {
      'th': 'Work Order Management',
      'en': '',
    },
    'b0xqs7fe': {
      'th': '',
      'en': '',
    },
    'g528pzgn': {
      'th': 'Machine',
      'en': '',
    },
    '40s4kwuy': {
      'th': 'User Management',
      'en': '',
    },
    'ufcnrxim': {
      'th': 'Andrew D.',
      'en': '',
    },
    'bev286v0': {
      'th': 'Admin',
      'en': '',
    },
  },
  // editProfileComponent
  {
    'n0cn9xwu': {
      'th': 'Adjust the content below to update your profile.',
      'en': '',
    },
    'h2n552zz': {
      'th': 'Change Photo',
      'en': '',
    },
    'rvfkzlbh': {
      'th': 'Full Name',
      'en': '',
    },
    '00h6ly0n': {
      'th': 'Your full name...',
      'en': '',
    },
    'j3dzznl9': {
      'th': '[display_name]',
      'en': '',
    },
    '0udbssa2': {
      'th': 'Owner/Founder',
      'en': '',
    },
    'v5lf9ofy': {
      'th': 'Director',
      'en': '',
    },
    'qqco0l3y': {
      'th': 'Manager',
      'en': '',
    },
    '6dovn15g': {
      'th': 'Mid-Manager',
      'en': '',
    },
    'hi6brjsu': {
      'th': 'Employee',
      'en': '',
    },
    'upuv6hrs': {
      'th': 'Your Role',
      'en': '',
    },
    'ffq6ha0j': {
      'th': 'Search for an item...',
      'en': '',
    },
    '2fc0gzon': {
      'th': 'Short Description',
      'en': '',
    },
    '324h9azf': {
      'th': 'A little about you...',
      'en': '',
    },
    '06doruz3': {
      'th': '[bio]',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'qj9kwv8h': {
      'th': '',
      'en': '',
    },
    '1v1pw3ov': {
      'th': '',
      'en': '',
    },
    '63liwozj': {
      'th': '',
      'en': '',
    },
    'b7191xme': {
      'th': '',
      'en': '',
    },
    '08oj4s4j': {
      'th': '',
      'en': '',
    },
    '851iybw6': {
      'th': '',
      'en': '',
    },
    'ochqnhyy': {
      'th': '',
      'en': '',
    },
    'gzs3o5ef': {
      'th': '',
      'en': '',
    },
    'ytbnfre9': {
      'th': '',
      'en': '',
    },
    '4ozlgbah': {
      'th': '',
      'en': '',
    },
    'v9g3r3z5': {
      'th': '',
      'en': '',
    },
    '9d63rtfc': {
      'th': '',
      'en': '',
    },
    'a8u98co7': {
      'th': '',
      'en': '',
    },
    'x6rb49i7': {
      'th': '',
      'en': '',
    },
    'xkga5gc4': {
      'th': '',
      'en': '',
    },
    'byj3g6mp': {
      'th': '',
      'en': '',
    },
    '0wh3lsul': {
      'th': '',
      'en': '',
    },
    'euy86rhn': {
      'th': '',
      'en': '',
    },
    'ummf3ltm': {
      'th': '',
      'en': '',
    },
    '6u3rorz1': {
      'th': '',
      'en': '',
    },
    'hjlrik3y': {
      'th': '',
      'en': '',
    },
    '4ktp4tnx': {
      'th': '',
      'en': '',
    },
    'wr1o8nj6': {
      'th': '',
      'en': '',
    },
    't16gar9y': {
      'th': '',
      'en': '',
    },
    'b9czgdpm': {
      'th': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
