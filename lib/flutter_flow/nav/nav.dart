import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const OnBoardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'SelectLanguage',
          path: '/selectLanguage',
          builder: (context, params) => const SelectLanguageWidget(),
        ),
        FFRoute(
          name: 'RegisterPage',
          path: '/registerPage',
          builder: (context, params) => const RegisterPageWidget(),
        ),
        FFRoute(
          name: 'RegisterOTP',
          path: '/registerOTP',
          builder: (context, params) => RegisterOTPWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ForgetPassword',
          path: '/forgetPassword',
          builder: (context, params) => ForgetPasswordWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'FavPage',
          path: '/favPage',
          builder: (context, params) => const FavPageWidget(),
        ),
        FFRoute(
          name: 'MyOrder',
          path: '/myOrder',
          builder: (context, params) => const MyOrderWidget(),
        ),
        FFRoute(
          name: 'AboutUs',
          path: '/aboutUs',
          builder: (context, params) => const AboutUsWidget(),
        ),
        FFRoute(
          name: 'ProductsDetalis',
          path: '/productsDetalis',
          builder: (context, params) => ProductsDetalisWidget(
            proId: params.getParam(
              'proId',
              ParamType.int,
            ),
            pricewithdiscount: params.getParam(
              'pricewithdiscount',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'Cart',
          path: '/cart',
          builder: (context, params) => const CartWidget(),
        ),
        FFRoute(
          name: 'ProductsCategory',
          path: '/productsCategory',
          builder: (context, params) => const ProductsCategoryWidget(),
        ),
        FFRoute(
          name: 'PetCategory',
          path: '/petCategory',
          builder: (context, params) => const PetCategoryWidget(),
        ),
        FFRoute(
          name: 'PetsList',
          path: '/petsList',
          builder: (context, params) => PetsListWidget(
            petCatName: params.getParam(
              'petCatName',
              ParamType.String,
            ),
            petId: params.getParam(
              'petId',
              ParamType.JSON,
            ),
          ),
        ),
        FFRoute(
          name: 'ProductsList',
          path: '/productsList',
          builder: (context, params) => ProductsListWidget(
            proCatName: params.getParam(
              'proCatName',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.JSON,
            ),
            proId: params.getParam(
              'proId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'PetDetalis',
          path: '/petDetalis',
          builder: (context, params) => PetDetalisWidget(
            petId: params.getParam(
              'petId',
              ParamType.int,
            ),
            petswithdiscount: params.getParam(
              'petswithdiscount',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'ChangePassword',
          path: '/changePassword',
          builder: (context, params) => const ChangePasswordWidget(),
        ),
        FFRoute(
          name: 'OfferPage',
          path: '/offerPage',
          builder: (context, params) => const OfferPageWidget(),
        ),
        FFRoute(
          name: 'OnBoarding',
          path: '/onBoarding',
          builder: (context, params) => const OnBoardingWidget(),
        ),
        FFRoute(
          name: 'Checkout',
          path: '/checkout',
          builder: (context, params) => const CheckoutWidget(),
        ),
        FFRoute(
          name: 'Address',
          path: '/address',
          builder: (context, params) => AddressWidget(
            pricewith: params.getParam(
              'pricewith',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'OrderDetails',
          path: '/orderDetails',
          builder: (context, params) => OrderDetailsWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            createtime: params.getParam(
              'createtime',
              ParamType.String,
            ),
            statues: params.getParam(
              'statues',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
            address: params.getParam(
              'address',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Articles',
          path: '/articles',
          builder: (context, params) => const ArticlesWidget(),
        ),
        FFRoute(
          name: 'ContactUs',
          path: '/contactUs',
          builder: (context, params) => const ContactUsWidget(),
        ),
        FFRoute(
          name: 'MissionVision',
          path: '/missionVision',
          builder: (context, params) => const MissionVisionWidget(),
        ),
        FFRoute(
          name: 'TermsConditions',
          path: '/termsConditions',
          builder: (context, params) => const TermsConditionsWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolices',
          path: '/privacyPolices',
          builder: (context, params) => const PrivacyPolicesWidget(),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => const SettingsWidget(),
        ),
        FFRoute(
          name: 'FAQ',
          path: '/faq',
          builder: (context, params) => const FaqWidget(),
        ),
        FFRoute(
          name: 'coupons',
          path: '/coupons',
          builder: (context, params) => const CouponsWidget(),
        ),
        FFRoute(
          name: 'Test',
          path: '/test',
          builder: (context, params) => const TestWidget(),
        ),
        FFRoute(
          name: 'RegisterSupplier',
          path: '/registerSupplier',
          builder: (context, params) => const RegisterSupplierWidget(),
        ),
        FFRoute(
          name: 'RegisterSupplierOTP',
          path: '/registerSupplierOTP',
          builder: (context, params) => RegisterSupplierOTPWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'RegisterStore',
          path: '/registerStore',
          builder: (context, params) => const RegisterStoreWidget(),
        ),
        FFRoute(
          name: 'SupplierHomePage',
          path: '/supplierHomePage',
          builder: (context, params) => const SupplierHomePageWidget(),
        ),
        FFRoute(
          name: 'AddProduct',
          path: '/addProduct',
          builder: (context, params) => const AddProductWidget(),
        ),
        FFRoute(
          name: 'SelectAdd',
          path: '/selectAdd',
          builder: (context, params) => const SelectAddWidget(),
        ),
        FFRoute(
          name: 'AddPet',
          path: '/addPet',
          builder: (context, params) => const AddPetWidget(),
        ),
        FFRoute(
          name: 'SupplierProductDetails',
          path: '/supplierProductDetails',
          builder: (context, params) => SupplierProductDetailsWidget(
            proId: params.getParam(
              'proId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierPetDetails',
          path: '/supplierPetDetails',
          builder: (context, params) => SupplierPetDetailsWidget(
            petId: params.getParam(
              'petId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'EditStoreData',
          path: '/editStoreData',
          builder: (context, params) => EditStoreDataWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierProfile',
          path: '/supplierProfile',
          builder: (context, params) => const SupplierProfileWidget(),
        ),
        FFRoute(
          name: 'SupplierStoreData',
          path: '/supplierStoreData',
          builder: (context, params) => SupplierStoreDataWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditProduct',
          path: '/editProduct',
          builder: (context, params) => EditProductWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            nameAr: params.getParam(
              'nameAr',
              ParamType.String,
            ),
            cat: params.getParam(
              'cat',
              ParamType.int,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            descriptionAr: params.getParam(
              'descriptionAr',
              ParamType.String,
            ),
            stock: params.getParam(
              'stock',
              ParamType.int,
            ),
            discount: params.getParam(
              'discount',
              ParamType.int,
            ),
            isoffer: params.getParam(
              'isoffer',
              ParamType.bool,
            ),
            startDate: params.getParam(
              'startDate',
              ParamType.String,
            ),
            endtDate: params.getParam(
              'endtDate',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            proId: params.getParam(
              'proId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'SupplierMyOrder',
          path: '/supplierMyOrder',
          builder: (context, params) => const SupplierMyOrderWidget(),
        ),
        FFRoute(
          name: 'SupplierOrderDetails',
          path: '/supplierOrderDetails',
          builder: (context, params) => SupplierOrderDetailsWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            createtime: params.getParam(
              'createtime',
              ParamType.String,
            ),
            statues: params.getParam(
              'statues',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
            address: params.getParam(
              'address',
              ParamType.String,
            ),
            userid: params.getParam(
              'userid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditPets',
          path: '/editPets',
          builder: (context, params) => EditPetsWidget(
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            nameAr: params.getParam(
              'nameAr',
              ParamType.String,
            ),
            cat: params.getParam(
              'cat',
              ParamType.int,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            descriptionAr: params.getParam(
              'descriptionAr',
              ParamType.String,
            ),
            stock: params.getParam(
              'stock',
              ParamType.int,
            ),
            discount: params.getParam(
              'discount',
              ParamType.int,
            ),
            isoffer: params.getParam(
              'isoffer',
              ParamType.bool,
            ),
            startDate: params.getParam(
              'startDate',
              ParamType.String,
            ),
            endtDate: params.getParam(
              'endtDate',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            proId: params.getParam(
              'proId',
              ParamType.int,
            ),
            age: params.getParam(
              'age',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'TestMap',
          path: '/testMap',
          builder: (context, params) => const TestMapWidget(),
        ),
        FFRoute(
          name: 'Paymob',
          path: '/paymob',
          builder: (context, params) => PaymobWidget(
            statues: params.getParam(
              'statues',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'WebView',
          path: '/webView',
          builder: (context, params) => WebViewWidget(
            text: params.getParam(
              'text',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Notification',
          path: '/notification',
          builder: (context, params) => const NotificationWidget(),
        ),
        FFRoute(
          name: 'NotificationSupplier',
          path: '/notificationSupplier',
          builder: (context, params) => const NotificationSupplierWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onBoarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
