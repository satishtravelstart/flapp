import 'package:flapp/models/user_model.dart';
import 'package:flapp/network/network_config.dart';
import 'package:flapp/network/network_endpoints.dart';
import 'package:flapp/utils/network_util.dart';
import 'package:meta/meta.dart';

/// Login Network Access Object Class -> Network Access Object class for handling network requests of Login process
class LoginNAO {

  /// STATIC Is Authentic User Method -> Future<UserModel>
  /// @param -> @required userName -> String
  ///        -> @required userPassword -> String
  /// @usage -> Makes a HTTP-POST request to REST api on server.
  static Future<UserModel> isAuthenticUser(
  {@required String userName, @required String userPassword}) =>
      NetworkUtil().post( // HTTP-POST request
          url: NetworkEndpoints.LOGIN_API, // REST api URL
          body: { // Request body
            NetworkConfig.API_KEY_USER_NAME: userName,
            NetworkConfig.API_KEY_USER_PASSWORD: userPassword
          }).then((dynamic response) { // On response received
            print(response);
            return UserModel.fromJson(response);// Map json response to UserModel object
          });

  /// STATIC Is Signup User Method -> Future<UserModel>
  /// @param -> @required firstName -> String
  ///        -> @required lastName -> String
  ///        -> @required password -> String
  ///        -> @required confirmPassword -> String
  /// @usage -> Makes a HTTP-POST request to REST api on server.
  static Future<UserModel> signupUser(
      {@required String firstName, @required String lastName, @required String password, @required String confirmPassword}) =>
      NetworkUtil().post( // HTTP-POST request
          url: NetworkEndpoints.LOGIN_API, // REST api URL
          body: { // Request body
            NetworkConfig.API_KEY_FIRSTNAME: firstName,
            NetworkConfig.API_KEY_LASTNAME: lastName,
            NetworkConfig.API_KEY_PASSWORD: password,
            NetworkConfig.API_KEY_CONFIRM_PASSWORD: confirmPassword
          }).then((dynamic response) { // On response received
        print(response);
        return UserModel.fromJson(response);// Map json response to UserModel object
      });
}
