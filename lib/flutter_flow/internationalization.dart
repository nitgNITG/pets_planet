import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    '19mve972': {
      'en': 'Welcome Back !',
      'ar': 'مرحبًا بعودتك !',
    },
    'zxu2sj6q': {
      'en': 'Log In Your Account',
      'ar': 'تسجيل الدخول إلى حسابك',
    },
    '4qfpf8z9': {
      'en': 'Email *',
      'ar': 'بريد إلكتروني *',
    },
    'bqvj9bue': {
      'en': 'Petplanet@GMAIL.COM',
      'ar': 'Petplanet@GMAIL.COM',
    },
    'mwpub3zw': {
      'en': 'Password *',
      'ar': 'كلمة المرور *',
    },
    'ef7c9zbt': {
      'en': '*******************',
      'ar': '*******************',
    },
    '3yym6y23': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    '9vaw96xa': {
      'en': 'LOGIN',
      'ar': 'تسجيل الدخول',
    },
    '3f9wxlqx': {
      'en': 'New Member?',
      'ar': 'عضو جديد؟',
    },
    'ed8bd3pz': {
      'en': ' Register',
      'ar': 'يسجل',
    },
    '7bwdwlvb': {
      'en': 'New Supplier?',
      'ar': 'مورد جديد؟',
    },
    'a4wny07c': {
      'en': ' Register',
      'ar': 'يسجل',
    },
    'giojkbqt': {
      'en': 'Field is required',
      'ar': '',
    },
    'gk5a63dl': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ta4996qj': {
      'en': 'Field is required',
      'ar': '',
    },
    '1999mzj0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'e8917uhw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // HomePage
  {
    'em9lggz1': {
      'en': 'Search here...',
      'ar': 'ابحث هنا...',
    },
    'snpbhy5m': {
      'en': 'Search products',
      'ar': 'نتيجة البحث عن المنتجات',
    },
    'swcvzfpz': {
      'en': 'Search pets',
      'ar': 'نتيجة البحث عن الحيوانات الأليفة',
    },
    '8hnfd057': {
      'en': 'Pet Category',
      'ar': 'فئة الحيوانات الأليفة',
    },
    'oh29jx55': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    'f2hjkp8s': {
      'en': 'Products Category',
      'ar': 'فئة المنتجات',
    },
    '5hzto6at': {
      'en': 'View All',
      'ar': 'عرض الكل',
    },
    'ma1ueswe': {
      'en': 'Most Selling',
      'ar': 'الأكثر مبيعا',
    },
    'c96s0slc': {
      'en':
          'Your Account Is Not Active Yet Please Contact With Support On contact@gmail.com',
      'ar': 'حسابك غير نشط بعد، يرجى الاتصال بالدعم على contact@gmail.com',
    },
    '07l1t4xz': {
      'en': 'LOGOUT',
      'ar': 'تسجيل الخروج',
    },
    'ngsf9164': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    '6t5rm6vn': {
      'en': 'Pets',
      'ar': 'حيوانات أليفة',
    },
    '1gpndqnf': {
      'en': 'Offers',
      'ar': 'العروض',
    },
    'qrzmr8as': {
      'en': 'FAQ',
      'ar': 'التعليمات',
    },
    'njft22hy': {
      'en': 'About US',
      'ar': 'معلومات عنا',
    },
    'fyoom9wx': {
      'en': 'Mission & Vision',
      'ar': 'الرسالة والرؤية',
    },
    'tlc8r6qg': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    'wif5bi4h': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'zo83atxn': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    '0xm5a65v': {
      'en': 'Delet Account ',
      'ar': 'حذف الحساب',
    },
    'pliu2kzz': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'bmoo18p6': {
      'en': 'LOGOUT',
      'ar': 'تسجيل الخروج',
    },
    '8d31fenc': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SelectLanguage
  {
    'lz4jrvq3': {
      'en': 'Select Your Languag',
      'ar': 'اختر لغتك',
    },
    'xd7zunr1': {
      'en': 'English',
      'ar': 'إنجليزي',
    },
    'shdhy2y5': {
      'en': 'العربية',
      'ar': 'العربية',
    },
    'aih7rwut': {
      'en': 'CONTINUE',
      'ar': 'يكمل',
    },
    'yc884neg': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // RegisterPage
  {
    'h719x3ma': {
      'en': 'Register As User',
      'ar': 'تسجيل كمستخدم',
    },
    'pkcl61bl': {
      'en': 'Full Name *',
      'ar': 'الاسم الكامل *',
    },
    'n9g7auwg': {
      'en': 'Username',
      'ar': 'Username',
    },
    '0dvzbueq': {
      'en': 'Email *',
      'ar': 'بريد إلكتروني *',
    },
    'jk5cm1oj': {
      'en': 'Petplanet@GMAIL.COM',
      'ar': 'Petplanet@GMAIL.COM',
    },
    'p4fp3mbi': {
      'en': 'Phone *',
      'ar': 'الموبايل*',
    },
    'm8lpwn16': {
      'en': '0225 126 5000',
      'ar': '0225 126 5000',
    },
    'gw59t1wy': {
      'en': 'Password *',
      'ar': 'كلمة المرور *',
    },
    'fji4slmo': {
      'en': '*******************',
      'ar': '*******************',
    },
    'b1j5yflp': {
      'en': 'Confirm Password *',
      'ar': 'تأكيد كلمة المرور *',
    },
    'heb68bnn': {
      'en': '*******************',
      'ar': '*******************',
    },
    'z3g10nll': {
      'en': 'By  Signing Up, You Agree To\n ',
      'ar': 'من خلال التسجيل، فإنك توافق على\n',
    },
    'lxrvb59r': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    '3wezrjps': {
      'en': ' & ',
      'ar': '&',
    },
    'mg3ynmlu': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    '4f5opoke': {
      'en': 'Already Have An Account ?',
      'ar': 'هل لديك حساب بالفعل؟',
    },
    'x1onuic0': {
      'en': ' Login',
      'ar': 'تسجيل الدخول',
    },
    '0a87lbxp': {
      'en': 'REGISTER',
      'ar': 'يسجل',
    },
    'uovloyhu': {
      'en': 'Field is required',
      'ar': '',
    },
    'wwfjyo6w': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1cqn9i2o': {
      'en': 'Field is required',
      'ar': '',
    },
    'vizvyy6u': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '6x20uvht': {
      'en': 'Field is required',
      'ar': '',
    },
    '3whyzaej': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5n7dr004': {
      'en': 'Field is required',
      'ar': '',
    },
    'g2d4xuny': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'sjbvo7xp': {
      'en': 'Field is required',
      'ar': '',
    },
    'a0k6ir7x': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'u4xygf1d': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // RegisterOTP
  {
    '7h2rczjz': {
      'en': 'Register As User',
      'ar': 'تسجيل كمستخدم',
    },
    'zb6l7a14': {
      'en': 'Please enter the verification code you received at ',
      'ar': 'الرجاء إدخال رمز التحقق الذي تلقيته في',
    },
    'jvf5bhdu': {
      'en':
          'Please enter the verification code you received at Eldorasho@GMAIL.COM',
      'ar': 'الرجاء إدخال رمز التحقق الذي تلقيته على Eldorasho@GMAIL.COM',
    },
    's4eflxxi': {
      'en': 'Code *',
      'ar': 'شفرة *',
    },
    '7toe6ypw': {
      'en': '256825',
      'ar': '256825',
    },
    '3kgbsy2b': {
      'en': 'Resend Will Be Avaliable In ',
      'ar': 'ستكون إعادة الإرسال متاحة في',
    },
    'h2wh7i3t': {
      'en': 'Resend Code',
      'ar': 'إعادة إرسال الرمز',
    },
    '8mqpgcub': {
      'en': 'SUBMIT',
      'ar': 'يُقدِّم',
    },
    'o9km3vj7': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ForgetPassword
  {
    'qb9uig16': {
      'en': 'Register As User',
      'ar': 'تسجيل كمستخدم',
    },
    'k7perpkg': {
      'en': 'Please enter the verification code you received at ',
      'ar': 'الرجاء إدخال رمز التحقق الذي تلقيته في',
    },
    'm9sowd1g': {
      'en':
          'Please enter the verification code you received at Eldorasho@GMAIL.COM',
      'ar': 'الرجاء إدخال رمز التحقق الذي تلقيته على Eldorasho@GMAIL.COM',
    },
    'rqden54c': {
      'en': 'Code *',
      'ar': 'كود *',
    },
    '2ro6gl7t': {
      'en': '256825',
      'ar': '256825',
    },
    'i44sk2ix': {
      'en': 'Resend Will Be Avaliable In ',
      'ar': 'ستكون إعادة الإرسال متاحة في',
    },
    'wueznvxq': {
      'en': 'Resend Code',
      'ar': 'إعادة إرسال الرمز',
    },
    'ji28rtn3': {
      'en': 'New Password *',
      'ar': 'كلمة المرور الجديدة *',
    },
    'toyi39fd': {
      'en': '*******************',
      'ar': '*******************',
    },
    '96kh44rb': {
      'en': 'Confirm Password *',
      'ar': 'تأكيد كلمة المرور *',
    },
    '1a7cdcjl': {
      'en': '*******************',
      'ar': '*******************',
    },
    '778gpxda': {
      'en': 'SUBMIT',
      'ar': 'تأكيد',
    },
    'sn4z6okk': {
      'en': 'Field is required',
      'ar': '',
    },
    '2c6h4uq6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'c1oovox3': {
      'en': 'Field is required',
      'ar': '',
    },
    'nwvuil57': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '93adplno': {
      'en': 'Field is required',
      'ar': '',
    },
    'zjmm1zni': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uv53g2cp': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // FavPage
  {
    'j7g3zdin': {
      'en': 'Products Favorites',
      'ar': 'المنتجات المفضلة',
    },
    'si2vwu93': {
      'en': 'Pets Favorites',
      'ar': 'الحيوانات الأليفة المفضلة',
    },
    'uyrwjwaz': {
      'en': 'Offers',
      'ar': 'العروض',
    },
    'ori8ji4z': {
      'en': 'FAQ',
      'ar': 'التعليمات',
    },
    'gtykov3n': {
      'en': 'About US',
      'ar': 'معلومات عنا',
    },
    '7eesmqu4': {
      'en': 'Mission & Vision',
      'ar': 'الرسالة والرؤية',
    },
    '84kcjq2y': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    '8n1fqbzs': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'fcrynrsv': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    'egtua6nc': {
      'en': 'Delet Account ',
      'ar': 'حذف الحساب',
    },
    '5ekew2gf': {
      'en': 'Settings',
      'ar': 'الإعدادات',
    },
    'y72y886g': {
      'en': 'LOGOUT',
      'ar': 'تسجيل الخروج',
    },
    'hqsa2dzq': {
      'en': 'LOGIN',
      'ar': 'تسجيل الدخول',
    },
    '3oyv4hms': {
      'en': 'Favs',
      'ar': 'بيت',
    },
  },
  // MyOrder
  {
    'n7pzp25i': {
      'en': 'Total:  ',
      'ar': 'المجموع:',
    },
    '4aps7hf0': {
      'en': 'Order Time: ',
      'ar': 'وقت الطلب:',
    },
    '7jq44z9w': {
      'en': 'Status: ',
      'ar': 'حالة:',
    },
    'fajao3te': {
      'en': 'Offers',
      'ar': 'العروض',
    },
    'szk6me6f': {
      'en': 'FAQ',
      'ar': 'التعليمات',
    },
    '4ybcs2nl': {
      'en': 'About US',
      'ar': 'معلومات عنا',
    },
    'rcr4pawu': {
      'en': 'Mission & Vision',
      'ar': 'الرسالة والرؤية',
    },
    'bkp1fjzm': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    'zmbu9kh4': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'varqqc83': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    '97wwwuta': {
      'en': 'Delet Account ',
      'ar': 'حذف الحساب',
    },
    '3pal935x': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'jnaid7hj': {
      'en': 'LOGOUT',
      'ar': 'تسجيل الخروج',
    },
    'eg3lhcp5': {
      'en': 'LOGIN',
      'ar': 'تسجيل الدخول',
    },
    'y465o8i4': {
      'en': 'My Order',
      'ar': 'بيت',
    },
  },
  // AboutUs
  {
    '4mj8rxnc': {
      'en': 'About Us',
      'ar': 'معلومات عنا',
    },
    'e9aiaoxy': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ProductsDetalis
  {
    'v1w4jnfo': {
      'en': 'About Product',
      'ar': 'عن المنتج',
    },
    '4k2sxpuo': {
      'en': 'ADD TO CART',
      'ar': 'أضف إلى السلة',
    },
    'vnkbp82s': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Cart
  {
    'm5nvitfn': {
      'en': 'Cart',
      'ar': 'العربة',
    },
    '0qc78sz7': {
      'en': 'Delete Cart',
      'ar': 'حذف عربة التسوق',
    },
    '16e9lnlg': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    'j4s6lmbh': {
      'en': 'Pets',
      'ar': 'حيوانات أليفة',
    },
    'avw4yo6x': {
      'en': 'VAT',
      'ar': 'ضريبة القيمة المضافة',
    },
    'ejmcsx27': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'd2zoe3w5': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    '0vgtt92r': {
      'en': 'VAT Total',
      'ar': 'إجمالي ضريبة القيمة المضافة',
    },
    '5jh966se': {
      'en': 'VAT Total',
      'ar': 'إجمالي ضريبة القيمة المضافة',
    },
    '1v07iqwc': {
      'en': 'Subtotal',
      'ar': 'المجموع الفرعي',
    },
    '7rk8akof': {
      'en': 'Subtotal',
      'ar': 'المجموع الفرعي',
    },
    'aq8y4uf3': {
      'en': 'Continue to checkout',
      'ar': 'متابعة الدفع',
    },
    'wb31eslp': {
      'en': 'Cart Is Empty',
      'ar': 'العربة فارغة',
    },
    'lks2z4nx': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ProductsCategory
  {
    '2sr5t6lc': {
      'en': 'Products Categories',
      'ar': 'فئات المنتجات',
    },
    'zpan1ade': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // PetCategory
  {
    'y1nx70u8': {
      'en': 'Categories',
      'ar': 'فئات',
    },
    'ygblxfks': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // PetsList
  {
    'xp4ho3wl': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ProductsList
  {
    'v6bb25lw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // PetDetalis
  {
    'ezyhxbu3': {
      'en': 'About Pet',
      'ar': 'عن الحيوان',
    },
    'kq8bvraj': {
      'en': 'ADD TO CART',
      'ar': 'أضف إلى السلة',
    },
    'htoopw6w': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Profile
  {
    'ib6uwdta': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'x7nkiqkj': {
      'en': 'Name:',
      'ar': 'اسم:',
    },
    'o1vh02st': {
      'en': 'Email:',
      'ar': 'بريد إلكتروني:',
    },
    '11hll54u': {
      'en': 'Phone:',
      'ar': 'هاتف:',
    },
    '92z4mpjx': {
      'en': 'Edit profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'gorcvimg': {
      'en': 'Edit Store Data',
      'ar': 'تعديل الملف الشخصي',
    },
    '1pmct2q4': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'iu3utqdi': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // EditProfile
  {
    'f6btduoo': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'ceh2ra91': {
      'en': 'Full Name *',
      'ar': 'الاسم الكامل *',
    },
    '0njgr3gk': {
      'en': 'Eldorasho Eldorasho',
      'ar': '',
    },
    'ryrw7gpc': {
      'en': 'Email *',
      'ar': 'بريد إلكتروني *',
    },
    'ag9n507w': {
      'en': 'Petplanet@GMAIL.COM',
      'ar': '',
    },
    '718ida72': {
      'en': 'Phone *',
      'ar': 'الهاتف',
    },
    '9qtvjvxr': {
      'en': '0225 126 5000',
      'ar': '',
    },
    'c18hw50s': {
      'en': 'Display Picture',
      'ar': 'صورة العرض',
    },
    '3nc2su07': {
      'en': 'SUBMIT',
      'ar': 'تأكيد',
    },
    'iszoh2ky': {
      'en': 'Field is required',
      'ar': '',
    },
    'rybmlt5z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'o0c6uiul': {
      'en': 'Field is required',
      'ar': '',
    },
    'glfx87zv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lyrsc5qs': {
      'en': 'Field is required',
      'ar': '',
    },
    'dfrbb7k0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'xsif81pj': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ChangePassword
  {
    'kul9dc22': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'zm0648w9': {
      'en': 'Current Password*',
      'ar': 'كلمة المرور الحالية*',
    },
    'rgxl8lr8': {
      'en': '***********',
      'ar': '',
    },
    'cx6m9mn7': {
      'en': 'New Password*',
      'ar': 'كلمة المرور الجديدة*',
    },
    '0f9rc798': {
      'en': '***********',
      'ar': '',
    },
    '3292nhwo': {
      'en': 'Confirm New Password*',
      'ar': 'تأكيد كلمة المرور الجديدة*',
    },
    'hksihle7': {
      'en': '***********',
      'ar': '',
    },
    'zbysg6j8': {
      'en': 'CHANGE',
      'ar': 'تغير',
    },
    'g70wjoy9': {
      'en': 'Field is required',
      'ar': '',
    },
    'o78j3ymx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qcyxytsl': {
      'en': 'Field is required',
      'ar': '',
    },
    '919hbw64': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'flxc47d4': {
      'en': 'Field is required',
      'ar': '',
    },
    '588v1goo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0qv1jkal': {
      'en': 'Field is required',
      'ar': '',
    },
    'am6d1xum': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0q5pjj1r': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OfferPage
  {
    'nzvi7r8c': {
      'en': 'Offers Products ',
      'ar': 'عروض المنتجات',
    },
    'o3ydka3q': {
      'en': 'Offers Pets ',
      'ar': 'عروض الحيوانات الأليفة',
    },
    'faqnvq98': {
      'en': 'Offers',
      'ar': 'العروض',
    },
    '94yomn7d': {
      'en': 'Home',
      'ar': '',
    },
  },
  // OnBoarding
  {
    '2jldn85i': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'u1lbti6o': {
      'en': 'Next',
      'ar': 'تخطي',
    },
    'pw8q83ks': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Checkout
  {
    'j76zolum': {
      'en': 'Checkout',
      'ar': 'الدفع',
    },
    '7bjazwme': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
    },
    'z4wfng3m': {
      'en': 'Add Address',
      'ar': 'إضافة عنوان',
    },
    'bwfo7xy8': {
      'en': 'Name: ',
      'ar': 'الاسم:',
    },
    'w2bh50c0': {
      'en': 'Phone: ',
      'ar': 'الهاتف:',
    },
    'mzbx4sik': {
      'en': 'Address: ',
      'ar': 'العنوان:',
    },
    'wmrvmny2': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
    },
    'lcgge3gz': {
      'en': 'Cash on delivery ',
      'ar': 'الدفع عند التسليم',
    },
    '3h7w6u9w': {
      'en': 'Creadit Card',
      'ar': 'بطاقة الائتمان',
    },
    'v6l64si9': {
      'en': 'Product List',
      'ar': 'قائمة المنتجات',
    },
    'uyna6mq4': {
      'en': 'Qty:01',
      'ar': '',
    },
    'l65jsfgg': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    'ub3pvi8c': {
      'en': 'VAT',
      'ar': 'قسيمة',
    },
    'jjyu8uly': {
      'en': 'VAT Total',
      'ar': 'إجمالي الضريبة',
    },
    'm46h9tf3': {
      'en': 'Subtotal',
      'ar': 'المجموع الفرعي',
    },
    'sko90gcb': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    '9zsvbc2d': {
      'en': 'After Offer',
      'ar': 'بعد الخصم',
    },
    'pkl82jhx': {
      'en': 'Choose a coupon',
      'ar': 'اختر قسيمة',
    },
    '2uvz4uje': {
      'en': 'Remove a Coupon',
      'ar': 'إزالة قسيمة',
    },
    'sjy8zqac': {
      'en': 'Place Order',
      'ar': 'وضع الطلب',
    },
    '1cdrzm4v': {
      'en': 'Pay With Visa',
      'ar': 'الدفع باستخدام فيزا',
    },
    '5n0lj25v': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Address
  {
    '3gfbuq71': {
      'en': 'Addresses',
      'ar': 'العناوين',
    },
    'fdogrkku': {
      'en': 'Address',
      'ar': 'عنوان',
    },
    '6jzbjt4k': {
      'en': 'Add New Address',
      'ar': 'إضافة عنوان جديد',
    },
    '1ths11sw': {
      'en': 'Continue',
      'ar': 'يكمل',
    },
    'g8akjn5m': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // OrderDetails
  {
    'piw5a8pl': {
      'en': 'Total:  ',
      'ar': 'المجموع:',
    },
    '51lg0pvg': {
      'en': 'Order Time: ',
      'ar': 'وقت الطلب:',
    },
    'vkzs7cjk': {
      'en': 'Order#123456789',
      'ar': '',
    },
    'ij176nje': {
      'en': 'Status: ',
      'ar': 'حالة:',
    },
    'nr5xi8f7': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
    },
    'vy6929di': {
      'en': ' Name:  ',
      'ar': 'اسم:',
    },
    'xlppq4b1': {
      'en': 'Order#123456789',
      'ar': '',
    },
    'sxku5p9f': {
      'en': ' Phone:  ',
      'ar': 'هاتف:',
    },
    'sghjuvws': {
      'en': 'Order#123456789',
      'ar': '',
    },
    '0bqps06r': {
      'en': ' Address: ',
      'ar': 'عنوان:',
    },
    '9x4it1rg': {
      'en': 'Order#123456789',
      'ar': '',
    },
    'badc5jkd': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
    },
    'w338hpyj': {
      'en': 'Order#123456789',
      'ar': '',
    },
    'e3hi7mo1': {
      'en': 'Product List',
      'ar': 'قائمة المنتجات',
    },
    'p098zcft': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    '4kjlrdov': {
      'en': 'Items Price',
      'ar': 'سعر العناصر',
    },
    'mokck9lb': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'q1e1fws8': {
      'en': 'My Orders',
      'ar': 'طلبياتي',
    },
    '5b2ajygh': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Articles
  {
    'o5lnp3fx': {
      'en': 'Articles',
      'ar': 'المقالات',
    },
    '64bzssc9': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    '4qp5ijec': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    'gxsi4nkc': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    'r9qp2h6l': {
      'en': 'Hello World',
      'ar': 'مرحبا بالعالم',
    },
    '1ixjt4p7': {
      'en': 'Read More',
      'ar': 'اقرأ المزيد',
    },
    'hnpjq4vi': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ContactUs
  {
    'axwr5btj': {
      'en': 'App Feedback',
      'ar': 'تعليقات حول التطبيق',
    },
    '5adzq9cp': {
      'en': 'Search for an item...',
      'ar': '',
    },
    't3ob15x3': {
      'en': 'Subject*',
      'ar': '',
    },
    '9r6p9ds0': {
      'en': 'Email*',
      'ar': 'بريد إلكتروني*',
    },
    '6kpawl1c': {
      'en': 'Pets@gmail.com',
      'ar': '',
    },
    'yehky1ud': {
      'en': 'FullName*',
      'ar': 'الاسم الكامل*',
    },
    'wivo7k42': {
      'en': 'Eldorasho',
      'ar': '',
    },
    '6bejh82i': {
      'en': 'Your Comment',
      'ar': 'تعليقك',
    },
    'b2sj04q5': {
      'en': 'Write Here',
      'ar': '',
    },
    'zuvnek8v': {
      'en': 'SUBMIT',
      'ar': 'يُقدِّم',
    },
    'qxen8h1q': {
      'en': 'Field is required',
      'ar': '',
    },
    'i9aqev9i': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '67vwq276': {
      'en': 'Field is required',
      'ar': '',
    },
    '2myvcq3u': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'pidibu0d': {
      'en': 'Field is required',
      'ar': '',
    },
    '9hffwmfq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '5fesw5yp': {
      'en': 'ContactUs',
      'ar': 'اتصل بنا',
    },
    '02ri2vcl': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // MissionVision
  {
    'lw3fa8v6': {
      'en': 'Mission & Vision',
      'ar': 'الرسالة والرؤية',
    },
    '03dq27ex': {
      'en': 'Home',
      'ar': '',
    },
  },
  // TermsConditions
  {
    'n2ibdmbf': {
      'en': 'Terms Conditions',
      'ar': 'معلومات عنا',
    },
    'mi1z153u': {
      'en': 'Home',
      'ar': '',
    },
  },
  // PrivacyPolices
  {
    '03r3rnq6': {
      'en': 'PrivacyPolices',
      'ar': 'معلومات عنا',
    },
    'ryn29pse': {
      'en': 'Home',
      'ar': '',
    },
  },
  // Settings
  {
    'anuyl123': {
      'en': 'Change Language',
      'ar': 'تغيير اللغة',
    },
    'p5ofacpn': {
      'en': 'English',
      'ar': 'إنجليزي',
    },
    'u29ikax3': {
      'en': 'العربيه',
      'ar': 'العربيه',
    },
    'i7bm1fsz': {
      'en': 'UPDATE',
      'ar': 'تحديث',
    },
    '3fvz888c': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    'kyfomqli': {
      'en': 'Home',
      'ar': '',
    },
  },
  // FAQ
  {
    '1n6dmcib': {
      'en': 'FAQ',
      'ar': 'التعليمات',
    },
    'xfsombss': {
      'en': 'Home',
      'ar': '',
    },
  },
  // coupons
  {
    '0x64s3sd': {
      'en': 'Choose a coupon',
      'ar': 'اختر قسيمة',
    },
    'jb4ohmpj': {
      'en': 'Select',
      'ar': 'اختار',
    },
    '6r1tb4s2': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Test
  {
    'p3v0sasp': {
      'en': 'Home',
      'ar': '',
    },
  },
  // RegisterSupplier
  {
    'g0iwqgkw': {
      'en': 'Register As Supplier',
      'ar': 'التسجيل كمورد',
    },
    'njezw4vu': {
      'en': 'Full Name *',
      'ar': 'الاسم الكامل *',
    },
    'qv5twpjj': {
      'en': 'Username',
      'ar': 'Username',
    },
    'kelenk4z': {
      'en': 'Email *',
      'ar': 'بريد إلكتروني *',
    },
    '14mvabe0': {
      'en': 'Petplanet@GMAIL.COM',
      'ar': 'Petplanet@GMAIL.COM',
    },
    'er4qfw1r': {
      'en': 'Phone *',
      'ar': 'الموبايل*',
    },
    'upu0vjuo': {
      'en': '0225 126 5000',
      'ar': '0225 126 5000',
    },
    '6h67z0sx': {
      'en': 'Password *',
      'ar': 'كلمة المرور *',
    },
    '1971xyny': {
      'en': '*******************',
      'ar': '*******************',
    },
    '0azkdof8': {
      'en': 'Confirm Password *',
      'ar': 'تأكيد كلمة المرور *',
    },
    '0u28zuoa': {
      'en': '*******************',
      'ar': '*******************',
    },
    '5zqs0h5q': {
      'en': 'By  Signing Up, You Agree To\n ',
      'ar': 'من خلال التسجيل، فإنك توافق على\n',
    },
    '3n4vacqv': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    'qlugll7q': {
      'en': ' & ',
      'ar': '&',
    },
    'v9pr0k6m': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'lud1x56w': {
      'en': 'Already Have An Account ?',
      'ar': 'هل لديك حساب بالفعل؟',
    },
    '8rmthfmo': {
      'en': ' Login',
      'ar': 'تسجيل الدخول',
    },
    'ilagomhe': {
      'en': 'REGISTER',
      'ar': 'يسجل',
    },
    '3axanmr7': {
      'en': 'Field is required',
      'ar': '',
    },
    'jw9mqecd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'rsczucjk': {
      'en': 'Field is required',
      'ar': '',
    },
    '7l48ficx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7a6fs6e4': {
      'en': 'Field is required',
      'ar': '',
    },
    '7x8s767u': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'i5me5663': {
      'en': 'Field is required',
      'ar': '',
    },
    'f5nknu8t': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'u2bks7s0': {
      'en': 'Field is required',
      'ar': '',
    },
    'nvzwd9pv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1r75obgt': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // RegisterSupplierOTP
  {
    'tykelfxr': {
      'en': 'Register As Supplier',
      'ar': 'التسجيل كمورد',
    },
    'it1naotd': {
      'en': 'Please enter the verification code you received at ',
      'ar': 'الرجاء إدخال رمز التحقق الذي تلقيته في',
    },
    '1j69bk8s': {
      'en':
          'Please enter the verification code you received at Eldorasho@GMAIL.COM',
      'ar': 'الرجاء إدخال رمز التحقق الذي تلقيته على Eldorasho@GMAIL.COM',
    },
    'nz9g99j6': {
      'en': 'Code *',
      'ar': 'شفرة *',
    },
    'h1ta6o3p': {
      'en': '256825',
      'ar': '256825',
    },
    'uolurdxb': {
      'en': 'Resend Will Be Avaliable In ',
      'ar': 'ستكون إعادة الإرسال متاحة في',
    },
    'rw7ww5vs': {
      'en': 'Resend Code',
      'ar': 'إعادة إرسال الرمز',
    },
    'r2a2dtel': {
      'en': 'SUBMIT',
      'ar': 'يُقدِّم',
    },
    'nftjdmvs': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // RegisterStore
  {
    'w7cpmqgs': {
      'en': 'Register As Supplier',
      'ar': 'التسجيل كمورد',
    },
    'xgt55pvq': {
      'en': 'Store Name *',
      'ar': 'اسم المتجر *',
    },
    'd6yle5z5': {
      'en': 'Store Name',
      'ar': 'Store Name',
    },
    'bg470wvc': {
      'en': 'Add Address',
      'ar': 'إضافة عنوان',
    },
    'fgx7acw0': {
      'en': 'Display PDF',
      'ar': 'عرض ملف PDF',
    },
    'yq9cosh8': {
      'en': 'File is Uploaded',
      'ar': 'عرض ملف PDF',
    },
    'p8zi5bvx': {
      'en': 'REGISTER',
      'ar': 'يسجل',
    },
    '12qsidea': {
      'en': 'Field is required',
      'ar': '',
    },
    'vyg3t9fe': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'uhoowhz9': {
      'en': 'Field is required',
      'ar': '',
    },
    '9ymu22gt': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'hq7gtrxf': {
      'en': 'Field is required',
      'ar': '',
    },
    'c4tfxctp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'chmoep2a': {
      'en': 'Field is required',
      'ar': '',
    },
    'jqij684y': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'top2qo7w': {
      'en': 'Field is required',
      'ar': '',
    },
    '0h4cuy6d': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'sgiebhfz': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SupplierHomePage
  {
    'u3m5z1zf': {
      'en':
          'Your Account Is Not Active Yet Please Contact With Support On contact@gmail.com',
      'ar': 'حسابك غير نشط بعد، يرجى الاتصال بالدعم على contact@gmail.com',
    },
    'zwqosk5k': {
      'en': 'LOGOUT',
      'ar': 'تسجيل الخروج',
    },
    'dvsej649': {
      'en': 'Products',
      'ar': 'منتجات',
    },
    'mrse3fzb': {
      'en': 'Pets',
      'ar': 'حيوانات أليفة',
    },
    'sbjzucf6': {
      'en': 'Offers',
      'ar': 'العروض',
    },
    'xcrz25v8': {
      'en': 'FAQ',
      'ar': 'التعليمات',
    },
    '2gtw8p1z': {
      'en': 'About US',
      'ar': 'معلومات عنا',
    },
    'bj6aapgz': {
      'en': 'Mission & Vision',
      'ar': 'الرسالة والرؤية',
    },
    '231gcxh1': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    'zt2mm22u': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    '6r3qskq8': {
      'en': 'Terms & Conditions',
      'ar': 'الشروط والأحكام',
    },
    'r82rz166': {
      'en': 'Delet Account ',
      'ar': 'حذف الحساب',
    },
    '2qfbp4s7': {
      'en': 'Settings',
      'ar': 'إعدادات',
    },
    '0814dyex': {
      'en': 'LOGOUT',
      'ar': 'تسجيل الخروج',
    },
    'rc2la1bp': {
      'en': 'LOGIN',
      'ar': 'تسجيل الدخول',
    },
    'rmttwufg': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AddProduct
  {
    '476afdrf': {
      'en': 'Add Product',
      'ar': 'إضافة المنتج',
    },
    'sbphohfo': {
      'en': 'Name *',
      'ar': 'اسم *',
    },
    'yv8ws4lm': {
      'en': 'Product',
      'ar': 'Product',
    },
    'jd13wozi': {
      'en': 'Name Arabic *',
      'ar': 'الاسم عربي *',
    },
    'zt9d6zt9': {
      'en': 'منتج',
      'ar': 'Username',
    },
    'u80diend': {
      'en': 'Option 1',
      'ar': '',
    },
    'ycannpmk': {
      'en': 'Option 2',
      'ar': '',
    },
    '3d7ze2yf': {
      'en': 'Option 3',
      'ar': '',
    },
    'p886k9xa': {
      'en': 'Category..',
      'ar': 'فئة..',
    },
    'dhuyq075': {
      'en': 'Search...',
      'ar': '',
    },
    'iumaj3kk': {
      'en': 'Price *',
      'ar': 'سعر *',
    },
    'yx2k2ibs': {
      'en': '50',
      'ar': '50',
    },
    '6t9syw20': {
      'en': 'Descreption *',
      'ar': 'الوصف *',
    },
    'cwhuy4kr': {
      'en': 'Descrption',
      'ar': 'الوصف',
    },
    'ska33dsv': {
      'en': 'Descrption Arabic*',
      'ar': 'الوصف عربي*',
    },
    '7lv6b729': {
      'en': 'شرح',
      'ar': 'شرح',
    },
    '8clwrsjl': {
      'en': 'Stock *',
      'ar': 'مخزون *',
    },
    'bhc0clqz': {
      'en': '10',
      'ar': '10',
    },
    'ug0nb745': {
      'en': 'Discount Percentage *',
      'ar': 'نسبة الخصم*',
    },
    '4p2petao': {
      'en': '10%',
      'ar': '10%',
    },
    'u42cozdg': {
      'en': 'Start Date: ',
      'ar': 'تاريخ البدء:',
    },
    'e5llxqxw': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    '7bt89sw4': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    '3a1tkatd': {
      'en': 'End Date: ',
      'ar': 'تاريخ النهاية:',
    },
    'pg635r7r': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    'yzyibxwy': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'lwosgfny': {
      'en': 'Display Picture',
      'ar': 'صورة العرض',
    },
    'w0infhg6': {
      'en': 'Is Offer',
      'ar': 'العرض',
    },
    '6aka4sp9': {
      'en': 'ADD',
      'ar': 'يضيف',
    },
    'appbk424': {
      'en': 'Field is required',
      'ar': '',
    },
    '2ggcguwx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qcrqp4kw': {
      'en': 'Field is required',
      'ar': '',
    },
    'x39upxcv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    't9xlix9i': {
      'en': 'Field is required',
      'ar': '',
    },
    'dcve3blx': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '0igjomya': {
      'en': 'Field is required',
      'ar': '',
    },
    '569dxiej': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'd2vwwwjm': {
      'en': 'Field is required',
      'ar': '',
    },
    's4i7r1n7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '13421qxr': {
      'en': 'Field is required',
      'ar': '',
    },
    'l2a4x858': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'w3xgdowe': {
      'en': 'Field is required',
      'ar': '',
    },
    'jrf324g0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '7mhq960a': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SelectAdd
  {
    'xsym7776': {
      'en': 'Select Type',
      'ar': 'حدد النوع',
    },
    'b5pwq3qe': {
      'en': 'Product',
      'ar': 'منتج',
    },
    'o1qwxt8x': {
      'en': 'Pet',
      'ar': 'حيوان أليف',
    },
    'hxj9m7kq': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AddPet
  {
    'k6giq4vw': {
      'en': 'Add Pet',
      'ar': 'أضف حيوان أليف',
    },
    'glg9jjfc': {
      'en': 'Name *',
      'ar': 'اسم *',
    },
    'si2bh8td': {
      'en': 'Product',
      'ar': 'Username',
    },
    'g1fselfv': {
      'en': 'Name Arabic *',
      'ar': 'الاسم عربي *',
    },
    'vypp9q6i': {
      'en': 'منتج',
      'ar': 'منتج',
    },
    'bsuzxl4g': {
      'en': 'Option 1',
      'ar': '',
    },
    'hb78p111': {
      'en': 'Option 2',
      'ar': '',
    },
    'jrgqc3up': {
      'en': 'Option 3',
      'ar': '',
    },
    'adfcmey5': {
      'en': 'Category..',
      'ar': 'فئة..',
    },
    'js1h9tym': {
      'en': 'Search...',
      'ar': '',
    },
    'tq1wnn0b': {
      'en': 'Price *',
      'ar': 'سعر *',
    },
    'l48haghs': {
      'en': '50',
      'ar': '50',
    },
    'amwpaayd': {
      'en': 'Age *',
      'ar': 'عمر *',
    },
    'fu82q7cy': {
      'en': '5',
      'ar': '5',
    },
    '5rc3hki7': {
      'en': 'Descreption *',
      'ar': 'الوصف *',
    },
    'bbuo4car': {
      'en': 'Descrption',
      'ar': 'الوصف',
    },
    'n8u8zxbn': {
      'en': 'Descrption Arabic*',
      'ar': 'الوصف عربي*',
    },
    'r0eqmh7f': {
      'en': 'شرح',
      'ar': 'شرح',
    },
    '6zpumj8g': {
      'en': 'Stock *',
      'ar': 'مخزون *',
    },
    't6qjkg52': {
      'en': '10',
      'ar': '10',
    },
    'fck5y3to': {
      'en': 'Discount Percentage *',
      'ar': 'نسبة الخصم*',
    },
    'kqehp5yr': {
      'en': '10%',
      'ar': '10%',
    },
    'j2tel5ng': {
      'en': 'Start Date: ',
      'ar': 'تاريخ البدء:',
    },
    'c92c5cnc': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    'lxwwm1uw': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'n19cw5ro': {
      'en': 'End Date: ',
      'ar': 'تاريخ النهاية:',
    },
    '0jyh5thw': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    'ritki807': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'cpbko89m': {
      'en': 'Display Picture',
      'ar': 'صورة العرض',
    },
    'c4o2hyw0': {
      'en': 'Is Offer',
      'ar': 'العرض',
    },
    '9yoq4yqt': {
      'en': 'ADD',
      'ar': 'يضيف',
    },
    'qdqxpjxd': {
      'en': 'Field is required',
      'ar': '',
    },
    '0xpkpsgv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'izks6isd': {
      'en': 'Field is required',
      'ar': '',
    },
    'usmusn62': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1l0gfm80': {
      'en': 'Field is required',
      'ar': '',
    },
    'ync5yg8q': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'y0zxmkkx': {
      'en': 'Field is required',
      'ar': '',
    },
    'siua4ta0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ku5mq9t8': {
      'en': 'Field is required',
      'ar': '',
    },
    'em8w8w7r': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'z6uo4cu7': {
      'en': 'Field is required',
      'ar': '',
    },
    'as84xxw7': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fltfd80k': {
      'en': 'Field is required',
      'ar': '',
    },
    'daw7pf2m': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'j2ja5b4m': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SupplierProductDetails
  {
    'k2wfv6zg': {
      'en': 'About Product',
      'ar': 'عن المنتج',
    },
    'fzc0tuga': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SupplierPetDetails
  {
    'fh52dorh': {
      'en': 'About Pet',
      'ar': 'عن الحيوان',
    },
    'y51apk8j': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // EditStoreData
  {
    'cv4jll43': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    '9ngweoea': {
      'en': 'Full Name *',
      'ar': 'الاسم الكامل *',
    },
    'cfgo26ae': {
      'en': 'Eldorasho Eldorasho',
      'ar': '',
    },
    '05qa6r97': {
      'en': 'Display Picture',
      'ar': 'صورة العرض',
    },
    'q1gqwh77': {
      'en': 'Display Picture',
      'ar': 'صورة العرض',
    },
    'ryigzrrt': {
      'en': 'SUBMIT',
      'ar': 'تأكيد',
    },
    'l70i8er3': {
      'en': 'Field is required',
      'ar': '',
    },
    '1ikhkzop': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'wzvtfsh8': {
      'en': 'Field is required',
      'ar': '',
    },
    'lx7077ma': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'lvxyj0ta': {
      'en': 'Field is required',
      'ar': '',
    },
    'z32nnmo9': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '1ntc3kjs': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SupplierProfile
  {
    'saqzk6dd': {
      'en': 'Name:',
      'ar': 'اسم:',
    },
    'y002my91': {
      'en': 'Email:',
      'ar': 'بريد إلكتروني:',
    },
    'f5lmj2zn': {
      'en': 'Phone:',
      'ar': 'هاتف:',
    },
    '794gaacz': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
    },
    'yyaoog19': {
      'en': 'Store Data',
      'ar': 'تعديل الملف الشخصي',
    },
    '19619jlc': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
    },
    'wko8i5dk': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    '7olf9lsm': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SupplierStoreData
  {
    '25vmzjnd': {
      'en': 'Store Name: ',
      'ar': 'اسم:',
    },
    'dedfxjus': {
      'en': 'User ID: ',
      'ar': 'بريد إلكتروني:',
    },
    'q85ksdwv': {
      'en': 'Cover Image',
      'ar': '',
    },
    'kx5ywhjw': {
      'en': 'Edit Store Data',
      'ar': 'تعديل الملف الشخصي',
    },
    'qujg4tni': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
    'm1m67tk5': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // EditProduct
  {
    'lfx5kr6x': {
      'en': 'Edit Product',
      'ar': 'تعديل المنتج',
    },
    'nfl5uot7': {
      'en': 'Name *',
      'ar': 'اسم *',
    },
    '8bkr4ex1': {
      'en': 'Product',
      'ar': 'Username',
    },
    'rxnnmsjp': {
      'en': 'Option 1',
      'ar': '',
    },
    'zjmlv7rn': {
      'en': 'Option 2',
      'ar': '',
    },
    'zuuvc71i': {
      'en': 'Option 3',
      'ar': '',
    },
    'a2p6y7fc': {
      'en': 'Category..',
      'ar': 'فئة..',
    },
    'ecne463g': {
      'en': 'Search...',
      'ar': '',
    },
    'owgz3zag': {
      'en': 'Price *',
      'ar': 'سعر *',
    },
    'ke2ffilw': {
      'en': '50',
      'ar': 'Username',
    },
    'sdare4p2': {
      'en': 'Descreption *',
      'ar': 'الوصف *',
    },
    'rg9jb0g3': {
      'en': 'Descrption',
      'ar': '',
    },
    'rgwuacad': {
      'en': 'Stock *',
      'ar': 'مخزون *',
    },
    '2h3cbem3': {
      'en': '10',
      'ar': 'Petplanet@GMAIL.COM',
    },
    '392xmjdg': {
      'en': 'Discount Percentage *',
      'ar': 'نسبة الخصم*',
    },
    '3phaffv9': {
      'en': '10%',
      'ar': 'Petplanet@GMAIL.COM',
    },
    'lr3ad2h8': {
      'en': 'Start Date: ',
      'ar': 'تاريخ البدء:',
    },
    'kn17qtcf': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    'fckwgto1': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'dk69hzbu': {
      'en': 'End Date: ',
      'ar': 'تاريخ النهاية:',
    },
    '2scw4r3z': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    '6wmy2y9w': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'ryec6ssy': {
      'en': 'Display Picture',
      'ar': 'صورة العرض',
    },
    'jisvatf5': {
      'en': 'Is Offer',
      'ar': 'العرض',
    },
    'sup40i2i': {
      'en': 'Edit',
      'ar': 'تعديل ',
    },
    '46jj7hgu': {
      'en': 'Field is required',
      'ar': '',
    },
    '8mj7p80r': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bp7cmbz6': {
      'en': 'Field is required',
      'ar': '',
    },
    'by3ohagv': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '32bf6zqk': {
      'en': 'Field is required',
      'ar': '',
    },
    'dcyryw2z': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '79hw8tp1': {
      'en': 'Field is required',
      'ar': '',
    },
    'xnu98fz8': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bhtxuacz': {
      'en': 'Field is required',
      'ar': '',
    },
    'gotjhebp': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bmygxwjm': {
      'en': 'Field is required',
      'ar': '',
    },
    'rsbpp3bo': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9y9p91tg': {
      'en': 'Field is required',
      'ar': '',
    },
    'jjtv7xc4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '01slt1i1': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SupplierMyOrder
  {
    '9965ahm1': {
      'en': 'Total:  ',
      'ar': 'المجموع:',
    },
    '2xqvh363': {
      'en': 'Order Time: ',
      'ar': 'وقت الطلب:',
    },
    'oy59b8zh': {
      'en': 'Status: ',
      'ar': 'حالة:',
    },
    'w7h92bgf': {
      'en': 'My Order',
      'ar': 'طلبي',
    },
    '1un2yjyy': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SupplierOrderDetails
  {
    'zr7ayfng': {
      'en': 'Total:  ',
      'ar': 'المجموع:',
    },
    '5udfdeyj': {
      'en': 'Order Time: ',
      'ar': 'وقت الطلب:',
    },
    'fn9f9tjc': {
      'en': 'Order#123456789',
      'ar': '',
    },
    '0p4jui4p': {
      'en': 'Status: ',
      'ar': 'حالة:',
    },
    'ya2tqdcd': {
      'en': 'Shipping Address',
      'ar': 'عنوان الشحن',
    },
    'h5fzrnp3': {
      'en': ' Name:  ',
      'ar': 'اسم:',
    },
    'udgi7eog': {
      'en': 'Order#123456789',
      'ar': '',
    },
    'lspd0c6c': {
      'en': ' Phone:  ',
      'ar': 'هاتف:',
    },
    'gduxtbfq': {
      'en': 'Order#123456789',
      'ar': '',
    },
    'ngx3zld1': {
      'en': ' Address: ',
      'ar': 'عنوان:',
    },
    'ru6rdtru': {
      'en': 'Order#123456789',
      'ar': '',
    },
    't3fg00v5': {
      'en': 'Payment Method',
      'ar': 'طريقة الدفع',
    },
    'jdq2nptx': {
      'en': 'Order#123456789',
      'ar': '',
    },
    'erv8t3tq': {
      'en': 'Product List',
      'ar': 'قائمة المنتجات',
    },
    'k6op7409': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    '4up89xcf': {
      'en': 'Items Price',
      'ar': 'سعر العناصر',
    },
    'a99e1jm0': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'qs0zs7tr': {
      'en': 'Accept Order',
      'ar': '',
    },
    'tqqykffb': {
      'en': 'Cancel Order',
      'ar': '',
    },
    'oktj4pyv': {
      'en': 'Complated Order',
      'ar': '',
    },
    'yexxefnp': {
      'en': 'My Orders',
      'ar': 'طلبياتي',
    },
    'qaxz6g99': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // EditPets
  {
    'mwy338x8': {
      'en': 'Edit Pets',
      'ar': 'تعديل الحيوانات الأليفة',
    },
    'udrgefcf': {
      'en': 'Name *',
      'ar': 'اسم *',
    },
    'mw4ocq9o': {
      'en': 'Product',
      'ar': 'Username',
    },
    'rr87lk4r': {
      'en': 'Option 1',
      'ar': '',
    },
    'zfs5ppyh': {
      'en': 'Option 2',
      'ar': '',
    },
    'wkoy4yzc': {
      'en': 'Option 3',
      'ar': '',
    },
    '2zvqsr6x': {
      'en': 'Category..',
      'ar': 'فئة..',
    },
    'fi61ld1j': {
      'en': 'Search...',
      'ar': '',
    },
    'u3vfvdxk': {
      'en': 'Price *',
      'ar': 'سعر *',
    },
    '7h3ko7fm': {
      'en': '50',
      'ar': 'Username',
    },
    'cycxg8mo': {
      'en': 'Descreption *',
      'ar': 'الوصف *',
    },
    'yk97c10p': {
      'en': 'Descrption',
      'ar': '',
    },
    'av1qugeo': {
      'en': 'Stock *',
      'ar': 'مخزون *',
    },
    'aq4oa3s4': {
      'en': '10',
      'ar': 'Petplanet@GMAIL.COM',
    },
    'kpim6zsb': {
      'en': 'Age *',
      'ar': 'عمر *',
    },
    'kftogupy': {
      'en': '10',
      'ar': 'Petplanet@GMAIL.COM',
    },
    '9jrn7d64': {
      'en': 'Discount Percentage *',
      'ar': 'نسبة الخصم*',
    },
    'j7r9zkbx': {
      'en': '10%',
      'ar': 'Petplanet@GMAIL.COM',
    },
    '0ogh0qr6': {
      'en': 'Start Date: ',
      'ar': 'تاريخ البدء:',
    },
    '3s991xlh': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    'h64vbk4b': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'uyd8g0h5': {
      'en': 'End Date: ',
      'ar': 'تاريخ النهاية:',
    },
    '1gev3go2': {
      'en': 'Offer Expiration *',
      'ar': '',
    },
    '5h63ea90': {
      'en': 'Add',
      'ar': 'يضيف',
    },
    'hfhwxrz9': {
      'en': 'Display Picture',
      'ar': 'صورة العرض',
    },
    'ammsb0de': {
      'en': 'Is Offer',
      'ar': ' العرض',
    },
    '0bmhh23v': {
      'en': 'Edit',
      'ar': 'تعديل',
    },
    'uy2lz7vk': {
      'en': 'Field is required',
      'ar': '',
    },
    'soaeljqe': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'yivytx8t': {
      'en': 'Field is required',
      'ar': '',
    },
    'pao8soxw': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '65p0zyzz': {
      'en': 'Field is required',
      'ar': '',
    },
    'vwpnapet': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'a3u9cp6b': {
      'en': 'Field is required',
      'ar': '',
    },
    '4b1egdwd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '03h88zcy': {
      'en': 'Field is required',
      'ar': '',
    },
    'uzw6zraq': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'vd35cuam': {
      'en': 'Field is required',
      'ar': '',
    },
    '8bnkefrd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '2j9hqy5r': {
      'en': 'Field is required',
      'ar': '',
    },
    'faipjyoy': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'nomyb9bx': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // TestMap
  {
    '501v3jrq': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
    },
    '6e8x6s02': {
      'en': 'Add Your New Addres',
      'ar': 'أضف عنوانك الجديد',
    },
    't2llvyb4': {
      'en': 'SELECT',
      'ar': 'يختار',
    },
    '6t2qutfl': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Paymob
  {
    '6gfpe798': {
      'en': 'Pets Payment',
      'ar': 'Pets Payment',
    },
    '9ymkbrux': {
      'en': 'Your Order Has Been Confirmed',
      'ar': 'لقد تم تأكيد طلبك',
    },
    'ln5f0mjv': {
      'en': 'Your Order Has Been Failed',
      'ar': 'لقد فشل طلبك',
    },
    't66z85me': {
      'en': 'Your Items Has Been Placed And Is On It’s Way To Being Processed',
      'ar': 'لقد تم وضع العناصر الخاصة بك وهي في طريقها إلى المعالجة',
    },
    '5f2h6xtt': {
      'en': 'Payment Failed, Please Pay Again',
      'ar': 'فشل الدفع، يرجى الدفع مرة أخرى',
    },
    'bfqqge6g': {
      'en': 'Back To My Orders',
      'ar': 'العودة إلى طلبياتي',
    },
    '2zjjyvgm': {
      'en': 'Please Click The Button To Complete Your Order',
      'ar': 'الرجاء الضغط على الزر لإكمال طلبك',
    },
    'yp7fziq2': {
      'en': 'Try Again',
      'ar': 'حاول ثانية',
    },
    '2xx8fdax': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // WebView
  {
    'y7vxgp37': {
      'en': 'Payment',
      'ar': 'معلومات عنا',
    },
    '5w1abq1g': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // Notification
  {
    's14htsb5': {
      'en': 'Notifications',
      'ar': 'إشعارات',
    },
    'dk7esntb': {
      'en': 'Notifications are empty',
      'ar': 'الإشعارات فارغة',
    },
    'uz2lorcr': {
      'en': 'Home',
      'ar': '',
    },
  },
  // NotificationSupplier
  {
    'a47jk1zg': {
      'en': 'Notifications',
      'ar': 'إشعارات',
    },
    '16j64b1f': {
      'en': 'Notifications are empty',
      'ar': 'الإشعارات فارغة',
    },
    'qw7j3x3k': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CustomNavBar
  {
    'sb5cknwx': {
      'en': 'Fav',
      'ar': 'مفضل',
    },
    '6nz8qh1q': {
      'en': 'Home',
      'ar': 'بيت',
    },
    'x47uvmmm': {
      'en': 'Orders',
      'ar': 'طلبات',
    },
  },
  // Addresses
  {
    'ij42xytp': {
      'en': 'Add Address',
      'ar': 'إضافة عنوان',
    },
    'ivfbv3i0': {
      'en': 'ADD',
      'ar': 'يضيف',
    },
    'zy4rj16i': {
      'en': 'Field is required',
      'ar': '',
    },
    'odp562eu': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'fl92bfwa': {
      'en': 'Field is required',
      'ar': '',
    },
    'bk39qa0t': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '925fw4px': {
      'en': 'Field is required',
      'ar': '',
    },
    'p32fc7d0': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
  },
  // DeleteUser
  {
    'xk8s0yb9': {
      'en': 'Delete  Acoount ',
      'ar': 'حذف الحساب',
    },
    '16yq18ju': {
      'en': 'Do you really want to Delete Your Account ?',
      'ar': 'هل تريد حقًا حذف حسابك؟',
    },
    'n2lv80wm': {
      'en': 'NO',
      'ar': 'لا',
    },
    '3jbfhviw': {
      'en': 'YES',
      'ar': 'نعم',
    },
  },
  // DeleteProducts
  {
    'y96fzr7a': {
      'en': 'Delete Product',
      'ar': 'حذف المنتج',
    },
    'rw4k6234': {
      'en': 'Are you sure you want to delete this Products?',
      'ar': 'هل أنت متأكد أنك تريد حذف هذا المنتج؟',
    },
    'jryb2yw5': {
      'en': 'NO',
      'ar': 'لا',
    },
    'zy6v06o5': {
      'en': 'YES',
      'ar': 'نعم',
    },
  },
  // DeletePets
  {
    'kq4u0p6p': {
      'en': 'Delete  Pet ',
      'ar': 'حذف الحيوان الأليف',
    },
    'jqtoegdn': {
      'en': 'Are you sure you want to delete this pet?',
      'ar': 'هل أنت متأكد أنك تريد حذف هذا الحيوان الأليف؟',
    },
    'rubfeq8l': {
      'en': 'NO',
      'ar': 'لا',
    },
    '722yp1am': {
      'en': 'YES',
      'ar': 'نعم',
    },
  },
  // AddressMap
  {
    'j8dpi9z9': {
      'en': 'Select Location',
      'ar': 'حدد الموقع',
    },
    '4m2a38md': {
      'en': 'Add Your New Addres',
      'ar': 'أضف عنوانك الجديد',
    },
    's61yp2h8': {
      'en': 'SELECT',
      'ar': 'يختار',
    },
  },
  // Miscellaneous
  {
    'lzhheyg1': {
      'en': '',
      'ar': '',
    },
    '007tgndw': {
      'en': '',
      'ar': '',
    },
    '6kjsulvz': {
      'en': '',
      'ar': '',
    },
    '9zpckque': {
      'en': '',
      'ar': '',
    },
    '4ptm5grl': {
      'en': '',
      'ar': '',
    },
    '83oi55h2': {
      'en': '',
      'ar': '',
    },
    '6enhrave': {
      'en': '',
      'ar': '',
    },
    'zvtvtred': {
      'en': '',
      'ar': '',
    },
    '29j7aogv': {
      'en': '',
      'ar': '',
    },
    'zb1eu6x2': {
      'en': '',
      'ar': '',
    },
    'qq12t5ld': {
      'en': '',
      'ar': '',
    },
    'zvghf1q2': {
      'en': '',
      'ar': '',
    },
    's2h6urh9': {
      'en': '',
      'ar': '',
    },
    'e8pish0k': {
      'en': '',
      'ar': '',
    },
    '8q659sx6': {
      'en': '',
      'ar': '',
    },
    'ys7wj42n': {
      'en': '',
      'ar': '',
    },
    'x4xvmll8': {
      'en': '',
      'ar': '',
    },
    'gkb8ov53': {
      'en': '',
      'ar': '',
    },
    '0f7ywfl1': {
      'en': '',
      'ar': '',
    },
    'x1i3iqxk': {
      'en': '',
      'ar': '',
    },
    'cvlx5svp': {
      'en': '',
      'ar': '',
    },
    'h1jlgily': {
      'en': '',
      'ar': '',
    },
    'z7gtzsww': {
      'en': '',
      'ar': '',
    },
    'mxcmfxbz': {
      'en': '',
      'ar': '',
    },
    'hdwohomd': {
      'en': '',
      'ar': '',
    },
    'g1svff88': {
      'en': '',
      'ar': '',
    },
    '3vacmz5n': {
      'en': '',
      'ar': '',
    },
    'q0w5i9wt': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
