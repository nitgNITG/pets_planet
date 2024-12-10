import 'dart:async';

import 'serialization_util.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/splash2.gif',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LoginPage': ParameterData.none(),
  'HomePage': ParameterData.none(),
  'SelectLanguage': ParameterData.none(),
  'RegisterPage': ParameterData.none(),
  'RegisterOTP': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'ForgetPassword': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'FavPage': ParameterData.none(),
  'MyOrder': ParameterData.none(),
  'AboutUs': ParameterData.none(),
  'ProductsDetalis': (data) async => ParameterData(
        allParams: {
          'proId': getParameter<int>(data, 'proId'),
          'pricewithdiscount': getParameter<double>(data, 'pricewithdiscount'),
        },
      ),
  'Cart': ParameterData.none(),
  'ProductsCategory': ParameterData.none(),
  'PetCategory': ParameterData.none(),
  'PetsList': (data) async => ParameterData(
        allParams: {
          'petCatName': getParameter<String>(data, 'petCatName'),
        },
      ),
  'ProductsList': (data) async => ParameterData(
        allParams: {
          'proCatName': getParameter<String>(data, 'proCatName'),
          'proId': getParameter<int>(data, 'proId'),
        },
      ),
  'PetDetalis': (data) async => ParameterData(
        allParams: {
          'petId': getParameter<int>(data, 'petId'),
          'petswithdiscount': getParameter<double>(data, 'petswithdiscount'),
        },
      ),
  'Profile': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'ChangePassword': ParameterData.none(),
  'OfferPage': ParameterData.none(),
  'OnBoarding': ParameterData.none(),
  'Checkout': ParameterData.none(),
  'Address': (data) async => ParameterData(
        allParams: {
          'pricewith': getParameter<double>(data, 'pricewith'),
        },
      ),
  'OrderDetails': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'createtime': getParameter<String>(data, 'createtime'),
          'statues': getParameter<String>(data, 'statues'),
          'name': getParameter<String>(data, 'name'),
          'phone': getParameter<String>(data, 'phone'),
          'address': getParameter<String>(data, 'address'),
        },
      ),
  'Articles': ParameterData.none(),
  'ContactUs': ParameterData.none(),
  'MissionVision': ParameterData.none(),
  'TermsConditions': ParameterData.none(),
  'PrivacyPolices': ParameterData.none(),
  'Settings': ParameterData.none(),
  'FAQ': ParameterData.none(),
  'coupons': ParameterData.none(),
  'Test': ParameterData.none(),
  'RegisterSupplier': ParameterData.none(),
  'RegisterSupplierOTP': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'RegisterStore': ParameterData.none(),
  'SupplierHomePage': ParameterData.none(),
  'AddProduct': ParameterData.none(),
  'SelectAdd': ParameterData.none(),
  'AddPet': ParameterData.none(),
  'SupplierProductDetails': (data) async => ParameterData(
        allParams: {
          'proId': getParameter<int>(data, 'proId'),
        },
      ),
  'SupplierPetDetails': (data) async => ParameterData(
        allParams: {
          'petId': getParameter<int>(data, 'petId'),
        },
      ),
  'EditStoreData': (data) async => ParameterData(
        allParams: {
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'SupplierProfile': ParameterData.none(),
  'SupplierStoreData': (data) async => ParameterData(
        allParams: {
          'id': getParameter<String>(data, 'id'),
        },
      ),
  'EditProduct': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'nameAr': getParameter<String>(data, 'nameAr'),
          'cat': getParameter<int>(data, 'cat'),
          'price': getParameter<double>(data, 'price'),
          'description': getParameter<String>(data, 'description'),
          'descriptionAr': getParameter<String>(data, 'descriptionAr'),
          'stock': getParameter<int>(data, 'stock'),
          'discount': getParameter<int>(data, 'discount'),
          'isoffer': getParameter<bool>(data, 'isoffer'),
          'startDate': getParameter<String>(data, 'startDate'),
          'endtDate': getParameter<String>(data, 'endtDate'),
          'image': getParameter<String>(data, 'image'),
          'proId': getParameter<int>(data, 'proId'),
        },
      ),
  'SupplierMyOrder': ParameterData.none(),
  'SupplierOrderDetails': (data) async => ParameterData(
        allParams: {
          'id': getParameter<int>(data, 'id'),
          'createtime': getParameter<String>(data, 'createtime'),
          'statues': getParameter<String>(data, 'statues'),
          'name': getParameter<String>(data, 'name'),
          'phone': getParameter<String>(data, 'phone'),
          'address': getParameter<String>(data, 'address'),
          'userid': getParameter<String>(data, 'userid'),
        },
      ),
  'EditPets': (data) async => ParameterData(
        allParams: {
          'name': getParameter<String>(data, 'name'),
          'nameAr': getParameter<String>(data, 'nameAr'),
          'cat': getParameter<int>(data, 'cat'),
          'price': getParameter<double>(data, 'price'),
          'description': getParameter<String>(data, 'description'),
          'descriptionAr': getParameter<String>(data, 'descriptionAr'),
          'stock': getParameter<int>(data, 'stock'),
          'discount': getParameter<int>(data, 'discount'),
          'isoffer': getParameter<bool>(data, 'isoffer'),
          'startDate': getParameter<String>(data, 'startDate'),
          'endtDate': getParameter<String>(data, 'endtDate'),
          'image': getParameter<String>(data, 'image'),
          'proId': getParameter<int>(data, 'proId'),
          'age': getParameter<int>(data, 'age'),
        },
      ),
  'TestMap': ParameterData.none(),
  'Paymob': (data) async => ParameterData(
        allParams: {
          'statues': getParameter<String>(data, 'statues'),
        },
      ),
  'WebView': (data) async => ParameterData(
        allParams: {
          'text': getParameter<String>(data, 'text'),
        },
      ),
  'Notification': ParameterData.none(),
  'NotificationSupplier': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
