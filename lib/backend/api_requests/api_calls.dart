import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Authentication Group Code

class AuthenticationGroup {
  static String getBaseUrl() => 'https://pets.nitg-eg.com';
  static Map<String, String> headers = {};
  static SignInCall signInCall = SignInCall();
  static SignUpCall signUpCall = SignUpCall();
  static SignUpSupplierFirstCall signUpSupplierFirstCall =
      SignUpSupplierFirstCall();
  static SignUpSupplierSecondCall signUpSupplierSecondCall =
      SignUpSupplierSecondCall();
}

class SignInCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? lang = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sign In',
      apiUrl: '$baseUrl/api/auth/login?lang=$lang',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? role(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.role''',
      ));
}

class SignUpCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? fullname = '',
    String? phone = '',
    String? password = '',
    String? role = '',
    String? lang = '',
    String? uid = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "$email",
  "fullname": "$fullname",
  "phone": "$phone",
  "password": "$password",
  "uid": "$uid"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sign Up',
      apiUrl: '$baseUrl/api/auth/register?lang=$lang',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SignUpSupplierFirstCall {
  Future<ApiCallResponse> call({
    String? lang = '',
    String? email = '',
    String? fullname = '',
    String? phone = '',
    String? password = '',
    String? uid = '',
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "fullname": "${escapeStringForJson(fullname)}",
  "phone": "${escapeStringForJson(phone)}",
  "password": "${escapeStringForJson(password)}",
  "uid": "${escapeStringForJson(uid)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Sign Up Supplier First',
      apiUrl: '$baseUrl/api/auth/register-supplier?lang=$lang',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  int? userId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.userId''',
      ));
}

class SignUpSupplierSecondCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? lang = '',
    String? lat = '',
    String? long = '',
    String? storeName = '',
    FFUploadedFile? tradingLicence,
  }) async {
    final baseUrl = AuthenticationGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Sign Up Supplier Second',
      apiUrl: '$baseUrl/api/auth/register-supplier/$id?lang=$lang',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'lat': lat,
        'long': long,
        'storeName': storeName,
        'tradingLicence': tradingLicence,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Authentication Group Code

/// Start User Group Code

class UserGroup {
  static String getBaseUrl({
    String? token = '',
    String? lang = '',
  }) =>
      'https://pets.nitg-eg.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static UserDataCall userDataCall = UserDataCall();
  static EditProfileCall editProfileCall = EditProfileCall();
  static ChangePasswordCall changePasswordCall = ChangePasswordCall();
  static DeleteUserCall deleteUserCall = DeleteUserCall();
  static ConfirmOTPCall confirmOTPCall = ConfirmOTPCall();
  static ResendOTPCall resendOTPCall = ResendOTPCall();
  static ForgetPasswordOTPCall forgetPasswordOTPCall = ForgetPasswordOTPCall();
  static ForgetPasswordChanegCall forgetPasswordChanegCall =
      ForgetPasswordChanegCall();
  static ForgetPasswordResendOTPCall forgetPasswordResendOTPCall =
      ForgetPasswordResendOTPCall();
}

class UserDataCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'User Data',
      apiUrl: '$baseUrl/api/verify-me?lang=$lang',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? useremail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  String? userfullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.fullname''',
      ));
  String? userphone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.phone''',
      ));
  String? useruuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.uuid''',
      ));
  bool? userisConfirmed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.user.isConfirmed''',
      ));
  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.id''',
      ));
  String? userstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.status''',
      ));
  String? userlang(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.lang''',
      ));
  bool? userisDelete(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.user.isDelete''',
      ));
  String? userrole(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.role''',
      ));
}

class EditProfileCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? email = '',
    String? fullname = '',
    String? phone = '',
    FFUploadedFile? imageUrl,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Edit Profile',
      apiUrl: '$baseUrl/api/user/$id?lang=$lang',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'phone': phone,
        'email': email,
        'imageUrl': imageUrl,
        'fullname': fullname,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ChangePasswordCall {
  Future<ApiCallResponse> call({
    String? currentPassword = '',
    String? newPassword = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "currentPassword": "$currentPassword",
  "newPassword": "$newPassword"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Change Password',
      apiUrl: '$baseUrl/api/change-password?lang=$lang',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteUserCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete User',
      apiUrl: '$baseUrl/api/user/$id?lang=$lang',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConfirmOTPCall {
  Future<ApiCallResponse> call({
    String? code = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "code": "$code"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Confirm OTP',
      apiUrl: '$baseUrl/api/user-confirm?lang=$lang',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? isConfirmed(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.isConfirmed''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class ResendOTPCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Resend OTP',
      apiUrl: '$baseUrl/api/resend?lang=$lang',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgetPasswordOTPCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forget Password OTP',
      apiUrl: '$baseUrl/api/forgot-password-otp?lang=$lang',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgetPasswordChanegCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? code = '',
    String? pass = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "email": "$email",
  "code": "$code",
  "password": "$pass"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forget Password Chaneg',
      apiUrl: '$baseUrl/api/forget-password-reset-code?lang=$lang',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ForgetPasswordResendOTPCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = UserGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "email": "$email"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Forget Password Resend OTP',
      apiUrl: '$baseUrl/api/forget-password-resend-code',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End User Group Code

/// Start Cart Group Code

class CartGroup {
  static String getBaseUrl({
    String? token = '',
    String? lang = '',
  }) =>
      'https://pets.nitg-eg.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FetchCartsCall fetchCartsCall = FetchCartsCall();
  static CountCartCall countCartCall = CountCartCall();
  static UpdateCartProductCall updateCartProductCall = UpdateCartProductCall();
  static UpdateCartPetsCall updateCartPetsCall = UpdateCartPetsCall();
  static DeleteItemCartCall deleteItemCartCall = DeleteItemCartCall();
  static DeleteCartCall deleteCartCall = DeleteCartCall();
  static UpdateQuantityInCartCall updateQuantityInCartCall =
      UpdateQuantityInCartCall();
}

class FetchCartsCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = CartGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Carts',
      apiUrl: '$baseUrl/api/cart?lang=$lang',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? cartId(dynamic response) => (getJsonField(
        response,
        r'''$.cartId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
  List? pets(dynamic response) => getJsonField(
        response,
        r'''$.pets''',
        true,
      ) as List?;
  int? totalProduct(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalProduct''',
      ));
  double? totalWithDiscount(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.totalWithDiscount''',
      ));
  String? petsname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pets[:].name''',
      ));
  List<String>? petsimageurl(dynamic response) => (getJsonField(
        response,
        r'''$.pets[:].image.url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? productsquantity(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].quantity''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? productsprice(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<double>? productspriceWithDiscount(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].priceWithDiscount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<double>(x))
          .withoutNulls
          .toList();
  List<int>? petsprice(dynamic response) => (getJsonField(
        response,
        r'''$.pets[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? petspriceWithDiscount(dynamic response) => (getJsonField(
        response,
        r'''$.pets[:].priceWithDiscount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  String? supplierId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.supplierId''',
      ));
}

class CountCartCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = CartGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Count Cart',
      apiUrl: '$baseUrl/api/cart-count?lang=$lang',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class UpdateCartProductCall {
  Future<ApiCallResponse> call({
    int? productId,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = CartGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "productId": $productId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Cart Product',
      apiUrl: '$baseUrl/api/cart?lang=$lang',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateCartPetsCall {
  Future<ApiCallResponse> call({
    int? petId,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = CartGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "petId": $petId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Cart Pets',
      apiUrl: '$baseUrl/api/cart?lang=$lang',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteItemCartCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = CartGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Item Cart',
      apiUrl: '$baseUrl/api/cart-item/$id?lang=$lang',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteCartCall {
  Future<ApiCallResponse> call({
    int? cartId,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = CartGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Cart',
      apiUrl: '$baseUrl/api/cart/$cartId?lang=$lang',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateQuantityInCartCall {
  Future<ApiCallResponse> call({
    int? cartItemId,
    int? quantity,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = CartGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "quantity": $quantity
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Quantity In Cart',
      apiUrl: '$baseUrl/api/cart-update-quantity/$cartItemId?lang=$lang',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Cart Group Code

/// Start Address Group Code

class AddressGroup {
  static String getBaseUrl({
    String? token = '',
    String? lang = '',
  }) =>
      'https://pets.nitg-eg.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static CreateAddressCall createAddressCall = CreateAddressCall();
  static FetchAddressCall fetchAddressCall = FetchAddressCall();
  static DeleteAddressCall deleteAddressCall = DeleteAddressCall();
}

class CreateAddressCall {
  Future<ApiCallResponse> call({
    String? address = '',
    String? lat = '',
    String? long = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = AddressGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "address": "$address",
  "lat": "$lat",
  "long": "$long"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Address',
      apiUrl: '$baseUrl/api/address?lang=$lang',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchAddressCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = AddressGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Address',
      apiUrl: '$baseUrl/api/address?lang=$lang',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? address(dynamic response) => getJsonField(
        response,
        r'''$.addresses''',
        true,
      ) as List?;
}

class DeleteAddressCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = AddressGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Address',
      apiUrl: '$baseUrl/api/address/$id?lang=$lang',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

/// End Address Group Code

/// Start Favourite Group Code

class FavouriteGroup {
  static String getBaseUrl({
    String? token = '',
    String? lang = '',
  }) =>
      'https://pets.nitg-eg.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FetchFavCall fetchFavCall = FetchFavCall();
  static FavUpdatePetsCall favUpdatePetsCall = FavUpdatePetsCall();
  static FavUpdateProductsCall favUpdateProductsCall = FavUpdateProductsCall();
}

class FetchFavCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = FavouriteGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Fav',
      apiUrl: '$baseUrl/api/fav?lang=$lang',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'fields': "id",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? petId(dynamic response) => (getJsonField(
        response,
        r'''$.favs[:].pet.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? proId(dynamic response) => (getJsonField(
        response,
        r'''$.favs[:].product.id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List? petsFav(dynamic response) => getJsonField(
        response,
        r'''$.favs[:].pet''',
        true,
      ) as List?;
  List? podFav(dynamic response) => getJsonField(
        response,
        r'''$.favs[:].product''',
        true,
      ) as List?;
  List? favspetdiscounts(dynamic response) => getJsonField(
        response,
        r'''$.favs[:].pet.discounts''',
        true,
      ) as List?;
  int? favspetprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.favs[:].pet.price''',
      ));
  int? favspetpriceWithDiscount(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.favs[:].pet.priceWithDiscount''',
      ));
  int? favsproductpriceWithDiscount(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.favs[:].product.priceWithDiscount''',
      ));
  int? favsproductprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.favs[:].product.price''',
      ));
  String? favspetname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.favs[:].pet.name''',
      ));
  List<String>? favsproductname(dynamic response) => (getJsonField(
        response,
        r'''$.favs[:].product.name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FavUpdatePetsCall {
  Future<ApiCallResponse> call({
    int? petId,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = FavouriteGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "petId": $petId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fav Update Pets',
      apiUrl: '$baseUrl/api/fav?lang=$lang',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class FavUpdateProductsCall {
  Future<ApiCallResponse> call({
    int? productId,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = FavouriteGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "productId": $productId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fav Update Products',
      apiUrl: '$baseUrl/api/fav?lang=$lang',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

/// End Favourite Group Code

/// Start Orders Group Code

class OrdersGroup {
  static String getBaseUrl({
    String? token = '',
    String? lang = '',
  }) =>
      'https://pets.nitg-eg.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static FetchOrderCall fetchOrderCall = FetchOrderCall();
  static CreateOrderCall createOrderCall = CreateOrderCall();
  static OrderDetailsCall orderDetailsCall = OrderDetailsCall();
  static ChangeOrderStautesCall changeOrderStautesCall =
      ChangeOrderStautesCall();
  static FetchCouponCall fetchCouponCall = FetchCouponCall();
}

class FetchOrderCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = OrdersGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Order',
      apiUrl: '$baseUrl/api/order?lang=$lang&sort=-createdAt',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? orderscreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orders[:].createdAt''',
      ));
  String? ordersstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orders[:].status''',
      ));
  int? orderstotalPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.orders[:].totalPrice''',
      ));
  int? ordersid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.orders[:].id''',
      ));
  List? orders(dynamic response) => getJsonField(
        response,
        r'''$.orders''',
        true,
      ) as List?;
  List<String>? ordersphone(dynamic response) => (getJsonField(
        response,
        r'''$.orders[:].phone''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ordersname(dynamic response) => (getJsonField(
        response,
        r'''$.orders[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ordersaddress(dynamic response) => (getJsonField(
        response,
        r'''$.orders[:].address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class CreateOrderCall {
  Future<ApiCallResponse> call({
    String? address = '',
    String? phone = '',
    String? name = '',
    int? addressId,
    double? total,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = OrdersGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    final ffApiRequestBody = '''
{
  "address": "$address",
  "phone": "$phone",
  "name": "$name",
  "addressId": $addressId,
  "total": $total
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Order',
      apiUrl: '$baseUrl/api/order?lang=$lang',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class OrderDetailsCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = OrdersGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Order Details',
      apiUrl: '$baseUrl/api/order-details/$id?lang=$lang',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
  String? productsaddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].address''',
      ));
  String? productsphone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].phone''',
      ));
  String? productsusername(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].username''',
      ));
  int? productsprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.products[:].price''',
      ));
  String? productsimageurl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].image.url''',
      ));
  String? productsname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.products[:].name''',
      ));
  List? pets(dynamic response) => getJsonField(
        response,
        r'''$.pets''',
        true,
      ) as List?;
  String? orderaddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.order.address''',
      ));
  String? ordername(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.order.name''',
      ));
  String? orderphone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.order.phone''',
      ));
  int? orderid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.order.id''',
      ));
  int? orderaddressId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.order.addressId''',
      ));
  int? ordertotalPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.order.totalPrice''',
      ));
  String? orderstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.order.status''',
      ));
  String? ordercreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.order.createdAt''',
      ));
  String? petsimageurl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.pets[:].image.url''',
      ));
  int? totalPirce(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.totalPirce''',
      ));
}

class ChangeOrderStautesCall {
  Future<ApiCallResponse> call({
    int? id,
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = OrdersGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Change Order Stautes',
      apiUrl: '$baseUrl/api/order-chage-status/$id?lang=$lang',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FetchCouponCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = OrdersGroup.getBaseUrl(
      token: token,
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch coupon',
      apiUrl: '$baseUrl/api/coupons',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? coupons(dynamic response) => getJsonField(
        response,
        r'''$.coupons''',
        true,
      ) as List?;
  List<String>? couponsstartDate(dynamic response) => (getJsonField(
        response,
        r'''$.coupons[:].startDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? couponsendDate(dynamic response) => (getJsonField(
        response,
        r'''$.coupons[:].endDate''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Orders Group Code

/// Start Home Group Code

class HomeGroup {
  static String getBaseUrl({
    String? lang = '',
  }) =>
      'https://pets.nitg-eg.com';
  static Map<String, String> headers = {};
  static FetchCategoryCall fetchCategoryCall = FetchCategoryCall();
  static FetchProductsCall fetchProductsCall = FetchProductsCall();
  static FetchPetsCall fetchPetsCall = FetchPetsCall();
  static FetchSpeciesCall fetchSpeciesCall = FetchSpeciesCall();
  static FetchOnboardingCall fetchOnboardingCall = FetchOnboardingCall();
  static FetchMosrtSellingCall fetchMosrtSellingCall = FetchMosrtSellingCall();
  static FetchOnlyProductCall fetchOnlyProductCall = FetchOnlyProductCall();
  static FetchOnlyPetCall fetchOnlyPetCall = FetchOnlyPetCall();
  static FetchOffersCall fetchOffersCall = FetchOffersCall();
  static SearchCall searchCall = SearchCall();
}

class FetchCategoryCall {
  Future<ApiCallResponse> call({
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Category',
      apiUrl: '$baseUrl/api/categories?lang=$lang',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? proCat(dynamic response) => getJsonField(
        response,
        r'''$.categories''',
        true,
      ) as List?;
  List<int>? categoriesid(dynamic response) => (getJsonField(
        response,
        r'''$.categories[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? categoriesname(dynamic response) => (getJsonField(
        response,
        r'''$.categories[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FetchProductsCall {
  Future<ApiCallResponse> call({
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Products',
      apiUrl: '$baseUrl/api/products?lang=$lang',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'fields':
            "id,name,description,price,stock,purchaseCount,available,images=id-url,discounts,categoryId,sellerId",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
  List? productsdiscounts(dynamic response) => getJsonField(
        response,
        r'''$.products[:].discounts''',
        true,
      ) as List?;
  List<int>? productsdiscountsdiscountPercentage(dynamic response) =>
      (getJsonField(
        response,
        r'''$.products[:].discounts[:].discountPercentage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? productsprice(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? productspriceWithDiscount(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].priceWithDiscount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? productssellerId(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].sellerId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class FetchPetsCall {
  Future<ApiCallResponse> call({
    int? id,
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Pets',
      apiUrl: '$baseUrl/api/pets?lang=$lang',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'fields':
            "name,id,images=url,speciesId,price,available,discounts,description,stock,age",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? pets(dynamic response) => getJsonField(
        response,
        r'''$.pets''',
        true,
      ) as List?;
  List<int>? petspriceWithDiscount(dynamic response) => (getJsonField(
        response,
        r'''$.pets[:].priceWithDiscount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? petsprice(dynamic response) => (getJsonField(
        response,
        r'''$.pets[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class FetchSpeciesCall {
  Future<ApiCallResponse> call({
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Species',
      apiUrl: '$baseUrl/api/species?lang=$lang',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? petCat(dynamic response) => getJsonField(
        response,
        r'''$.species''',
        true,
      ) as List?;
  List<int>? speciesid(dynamic response) => (getJsonField(
        response,
        r'''$.species[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? speciesname(dynamic response) => (getJsonField(
        response,
        r'''$.species[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FetchOnboardingCall {
  Future<ApiCallResponse> call({
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Onboarding',
      apiUrl: '$baseUrl/api/on-boarding?lang=$lang',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? onBoarding(dynamic response) => getJsonField(
        response,
        r'''$.onBoarding''',
        true,
      ) as List?;
}

class FetchMosrtSellingCall {
  Future<ApiCallResponse> call({
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'fetch Mosrt Selling',
      apiUrl:
          '$baseUrl/api/products?fields=id,name,description,price,stock,purchaseCount,available,images=id-url,discounts&lang=$lang&sort=purchaseCount',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
  List<int>? productspriceWithDiscount(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].priceWithDiscount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? productsprice(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class FetchOnlyProductCall {
  Future<ApiCallResponse> call({
    int? id,
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch only product',
      apiUrl: '$baseUrl/api/products/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'fields':
            "id,name,description,price,stock,purchaseCount,available,images=id-url,discounts,categoryId",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.product''',
      );
  int? productprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.product.price''',
      ));
  double? productpriceWithDiscount(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.product.priceWithDiscount''',
      ));
  List? productdiscounts(dynamic response) => getJsonField(
        response,
        r'''$.product.discounts''',
        true,
      ) as List?;
}

class FetchOnlyPetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Only Pet',
      apiUrl: '$baseUrl/api/pets/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'fields':
            "id,name,description,price,age,available,type,images=id-url,discounts,speciesId",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic petList(dynamic response) => getJsonField(
        response,
        r'''$.pet''',
      );
  int? petprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pet.price''',
      ));
  List? petdiscounts(dynamic response) => getJsonField(
        response,
        r'''$.pet.discounts''',
        true,
      ) as List?;
  int? petpriceWithDiscount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.pet.priceWithDiscount''',
      ));
}

class FetchOffersCall {
  Future<ApiCallResponse> call({
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Offers',
      apiUrl: '$baseUrl/api/discount',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'fields':
            "id,product=id-name-price-images,pet=id-name-price-age-images,discountPercentage,endDate",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? discountsproduct(dynamic response) => getJsonField(
        response,
        r'''$.discounts[:].product''',
        true,
      ) as List?;
  List? discountspet(dynamic response) => getJsonField(
        response,
        r'''$.discounts[:].pet''',
        true,
      ) as List?;
  List<int>? discountsproductprice(dynamic response) => (getJsonField(
        response,
        r'''$.discounts[:].product.price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? discountsdiscountPercentage(dynamic response) => (getJsonField(
        response,
        r'''$.discounts[:].discountPercentage''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? discountspetprice(dynamic response) => (getJsonField(
        response,
        r'''$.discounts[:].pet.price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class SearchCall {
  Future<ApiCallResponse> call({
    String? keyword = '',
    String? token = '',
    String? lang = '',
  }) async {
    final baseUrl = HomeGroup.getBaseUrl(
      lang: lang,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'search',
      apiUrl:
          '$baseUrl/api/search?keyword=$keyword&lang=$lang&fields=id,name,price,images,discounts',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? prodcuts(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
  List? pets(dynamic response) => getJsonField(
        response,
        r'''$.pets''',
        true,
      ) as List?;
  int? productsprice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.products[:].price''',
      ));
}

/// End Home Group Code

/// Start Ads  Group Code

class AdsGroup {
  static String getBaseUrl() => 'https://pets.nitg-eg.com';
  static Map<String, String> headers = {};
  static FerchAdsCall ferchAdsCall = FerchAdsCall();
}

class FerchAdsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AdsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ferch Ads',
      apiUrl: '$baseUrl/api/ads',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? ads(dynamic response) => getJsonField(
        response,
        r'''$.ads''',
        true,
      ) as List?;
}

/// End Ads  Group Code

/// Start About Group Code

class AboutGroup {
  static String getBaseUrl() => 'https://pets.nitg-eg.com';
  static Map<String, String> headers = {};
  static AboutAppCall aboutAppCall = AboutAppCall();
  static FaqCall faqCall = FaqCall();
}

class AboutAppCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AboutGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'AboutApp',
      apiUrl: '$baseUrl/api/about-app',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class FaqCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AboutGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'FAQ',
      apiUrl: '$baseUrl/api/faqs',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? faqs(dynamic response) => getJsonField(
        response,
        r'''$.faqs''',
        true,
      ) as List?;
}

/// End About Group Code

/// Start Supplier Group Code

class SupplierGroup {
  static String getBaseUrl({
    String? lang = '',
    String? token = '',
  }) =>
      'https://pets.nitg-eg.com';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static AddProductCall addProductCall = AddProductCall();
  static AddPetCall addPetCall = AddPetCall();
  static StoreDataCall storeDataCall = StoreDataCall();
  static UpdateStoreDataCall updateStoreDataCall = UpdateStoreDataCall();
  static DeleteProductCall deleteProductCall = DeleteProductCall();
  static DeletePetCall deletePetCall = DeletePetCall();
  static SupplierMyOrderCall supplierMyOrderCall = SupplierMyOrderCall();
  static SupplierChangeStatuesCall supplierChangeStatuesCall =
      SupplierChangeStatuesCall();
  static EditProductCall editProductCall = EditProductCall();
  static EditPetCall editPetCall = EditPetCall();
  static SupplierProductsCall supplierProductsCall = SupplierProductsCall();
  static SupplierPetsCall supplierPetsCall = SupplierPetsCall();
}

class AddProductCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? namear = '',
    double? price,
    int? stock,
    int? categoryid,
    String? descreption = '',
    String? descreptionar = '',
    List<FFUploadedFile>? imagesList,
    String? isOffer = '',
    int? disscount,
    String? startdate = '',
    String? enddate = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );
    final images = imagesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'AddProduct',
      apiUrl: '$baseUrl/api/products',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'name': name,
        'namear': namear,
        'price': price,
        'description': descreption,
        'descriptionar': descreptionar,
        'stock': stock,
        'categoryId': categoryid,
        'imageUrls': images,
        'offer': isOffer,
        'discountPercentage': disscount,
        'startDate': startdate,
        'endDate': enddate,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddPetCall {
  Future<ApiCallResponse> call({
    String? name = '',
    String? namear = '',
    double? price,
    int? stock,
    int? speciesId,
    String? descreption = '',
    String? descreptionar = '',
    List<FFUploadedFile>? imagesList,
    String? isOffer = '',
    int? disscount,
    String? startdate = '',
    String? enddate = '',
    String? age = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );
    final images = imagesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'AddPet',
      apiUrl: '$baseUrl/api/pets',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'name': name,
        'namear': namear,
        'price': price,
        'description': descreption,
        'descriptionar': descreptionar,
        'stock': stock,
        'speciesId': speciesId,
        'images': images,
        'offer': isOffer,
        'discountPercentage': disscount,
        'startDate': startdate,
        'endDate': enddate,
        'age': age,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StoreDataCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'StoreData',
      apiUrl: '$baseUrl/api/user-store/$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? storeid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.id''',
      ));
  int? storeuserId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.store.userId''',
      ));
  String? storelat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.lat''',
      ));
  String? storelong(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.long''',
      ));
  String? storetradingLicence(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.store.tradingLicence''',
      ));
  String? storestoreName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.storeName''',
      ));
  String? storestorePicture(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.store.storePicture''',
      ));
  String? storecoverImage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.coverImage''',
      ));
  String? storeupdatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.updatedAt''',
      ));
  String? storecreatedAt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.store.createdAt''',
      ));
}

class UpdateStoreDataCall {
  Future<ApiCallResponse> call({
    String? id = '',
    FFUploadedFile? storePicture,
    FFUploadedFile? coverImage,
    String? storeName = '',
    String? lat = '',
    String? long = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'UpdateStoreData',
      apiUrl: '$baseUrl/api/user-store/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'storePicture': storePicture,
        'coverImage': coverImage,
        'storeName': storeName,
        'lat': lat,
        'long': long,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteProductCall {
  Future<ApiCallResponse> call({
    int? id,
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Product',
      apiUrl: '$baseUrl/api/products/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeletePetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Delete Pet',
      apiUrl: '$baseUrl/api/pets/$id',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SupplierMyOrderCall {
  Future<ApiCallResponse> call({
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SupplierMyOrder',
      apiUrl:
          '$baseUrl/api/order-supplier-or-admin?lang=$lang&sort=-createdAt',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? orders(dynamic response) => getJsonField(
        response,
        r'''$.orders''',
        true,
      ) as List?;
  int? ordersid(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.orders[:].id''',
      ));
  int? ordersuserId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.orders[:].userId''',
      ));
  String? ordersaddress(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orders[:].address''',
      ));
  String? ordersname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orders[:].name''',
      ));
  String? ordersphone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orders[:].phone''',
      ));
  int? ordersaddressId(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.orders[:].addressId''',
      ));
  int? orderstotalPrice(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.orders[:].totalPrice''',
      ));
  String? ordersstatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.orders[:].status''',
      ));
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class SupplierChangeStatuesCall {
  Future<ApiCallResponse> call({
    int? id,
    String? status = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    final ffApiRequestBody = '''
{
  "status": "${escapeStringForJson(status)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SupplierChangeStatues',
      apiUrl: '$baseUrl/api/order-chage-status/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditProductCall {
  Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? description = '',
    double? price,
    int? stock,
    List<FFUploadedFile>? imageUrlsList,
    int? categoryId,
    String? offer = '',
    String? discountPercentage = '',
    String? startDate = '',
    String? endDate = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );
    final imageUrls = imageUrlsList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'Edit Product',
      apiUrl: '$baseUrl/api/products/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'price': price,
        'stock': stock,
        'categoryId': categoryId,
        'name': name,
        'description': description,
        'offer': offer,
        'discountPercentage': discountPercentage,
        'startDate': startDate,
        'endDate': endDate,
        'imageUrls': imageUrls,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditPetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? name = '',
    String? description = '',
    double? price,
    int? stock,
    List<FFUploadedFile>? imagesList,
    int? speciesId,
    bool? offer,
    String? discountPercentage = '',
    String? startDate = '',
    String? endDate = '',
    int? age,
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );
    final images = imagesList ?? [];

    return ApiManager.instance.makeApiCall(
      callName: 'Edit Pet',
      apiUrl: '$baseUrl/api/pets/$id',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'price': price,
        'stock': stock,
        'speciesId': speciesId,
        'name': name,
        'description': description,
        'offer': offer,
        'discountPercentage': discountPercentage,
        'startDate': startDate,
        'endDate': endDate,
        'images': images,
        'age': age,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SupplierProductsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SupplierProducts',
      apiUrl: '$baseUrl/api/products?lang=$lang&sellerId=$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'fields':
            "id,name,description,price,stock,purchaseCount,available,images=id-url,discounts,categoryId,sellerId",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? products(dynamic response) => getJsonField(
        response,
        r'''$.products''',
        true,
      ) as List?;
}

class SupplierPetsCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? lang = '',
    String? token = '',
  }) async {
    final baseUrl = SupplierGroup.getBaseUrl(
      lang: lang,
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SupplierPets',
      apiUrl: '$baseUrl/api/pets?lang=$lang&ownerId=$id',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {
        'fields':
            "name,id,images=url,speciesId,price,available,discounts,description,stock,age,ownerId",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? pets(dynamic response) => getJsonField(
        response,
        r'''$.pets''',
        true,
      ) as List?;
}

/// End Supplier Group Code

/// Start Paymob Group Code

class PaymobGroup {
  static String getBaseUrl() => 'https://accept.paymob.com';
  static Map<String, String> headers = {};
  static PayCall payCall = PayCall();
}

class PayCall {
  Future<ApiCallResponse> call({
    double? total,
    double? amoutninitems,
    String? name = '',
    int? quantity,
    String? firstName = '',
    String? lastName = '',
    String? phoneNumber = '',
    String? email = '',
    String? orderRefrence = '',
  }) async {
    final baseUrl = PaymobGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "amount": $total,
  "currency": "EGP",
  "payment_methods": [
    4628003
  ],
  "billing_data": {
    "apartment": "dumy",
    "first_name": "${escapeStringForJson(firstName)}",
    "last_name": "${escapeStringForJson(lastName)}",
    "street": "dumy",
    "building": "dumy",
    "phone_number": "${escapeStringForJson(phoneNumber)}",
    "city": "dumy",
    "country": "dumy",
    "email": "${escapeStringForJson(email)}",
    "floor": "dumy",
    "state": "dumy"
  },
  "extras": {
    "ee": 22
  },
  "special_reference": "${escapeStringForJson(orderRefrence)}",
  "notification_url": "https://webhook.site/f60597f3-97b9-4992-90e1-6f98a63fc32d",
  "redirection_url": "https://www.google.com"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pay',
      apiUrl: '$baseUrl/v1/intention/',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Token egy_sk_test_fd97d66abbe56a2dc2ee3cfa66780e65f043bed92e742600dc53d89e9498c725',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? clientsecret(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.client_secret''',
      ));
  List? intentiondetailitems(dynamic response) => getJsonField(
        response,
        r'''$.intention_detail.items''',
        true,
      ) as List?;
  int? intentiondetailitemsquantity(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.intention_detail.items[:].quantity''',
      ));
  int? intentiondetailitemsamount(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.intention_detail.items[:].amount''',
      ));
  String? intentiondetailitemsname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.intention_detail.items[:].name''',
      ));
}

/// End Paymob Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
