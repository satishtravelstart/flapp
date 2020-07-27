
import 'dart:async';

import 'package:flapp/resource/values/app_strings.dart';

/// Signup Form Observer Abstract Class - A contract class for Signup Form Observer
abstract class SignUpFormObserverContract{

  //------------------------------------------------------------ Static Constants ------------------------------------------------------------------
  static const int USER_NAME_VALID_LENGTH = 3;
  static const int USER_PASSWORD_VALID_LENGTH = 8;

  // ---------------------------------------------------------- Contract Variables ---------------------------------------------------------------

  // SINK Variables
  /// First Name variable -> Sink
  /// @usage -> sink for first name value
  Sink get firstName;

  /// Last Name variable -> Sink
  /// @usage -> sink for last name value
  Sink get lastName;

  /// Password variable -> Sink
  /// @usage -> sink for password value
  Sink get password;

  /// Confirm Password vaiable -> Sink
  /// @usage -> sink for confirm Password value
  Sink get confirmPassword;


  // STREAM Variables
  /// Is Valid First Name Variable -> Stream<bool>
  /// @usage -> Stream of type bool for streaming validation result of first name
  Stream<bool> get _isValidFirstName;

  /// Is Valid Password Variable -> Stream<bool>
  /// @usage -> Stream of type bool for streaming validation result of password
  Stream<bool> get _isValidUserPassword;

  /// First Name Error Text Variable -> Stream<String>
  /// @usage -> Stream of type String for streaming first name error
  Stream<String> get firstNameErrorText;

  /// Last Name Error Text Variable -> Stream<String>
  /// @usage -> Stream of type String for streaming last name error
  Stream<String> get lastNameErrorText;

  /// User Password Error Text Variable -> Stream<String>
  /// @usage -> Stream of type String for streaming user password error
  Stream<String> get userPasswordErrorText;


  //------------------------------------------------------------- Contract Constructor -------------------------------------------------------------
  SignUpFormObserverContract(){
    _init();
  }


  //-------------------------------------------------------- Contract Methods -------------------------------------------------------------------------

  //Receiver Methods
  /// Dispose Method -> void
  /// @param -> _
  /// @usage -> Dispose the state of LoginFormObserver
  void dispose();
  /// Invalid Credentials Method -> void
  /// @param -> _
  /// @usage -> Initiate process for invalid credentials
  void invalidCredentials();


  //Observer Methods
  /// Init Method -> void
  /// @param -> _
  /// @usage -> Initiate all listeners of observers
  void _init(){
    _handleSignUpEnableProcess();
  }

  /// Handle SignUp Enable Process Method -> void
  /// @param -> _
  /// @usage -> Handle process of enabling signup
  void _handleSignUpEnableProcess();


  //Validation Methods

  /// Check Valid First Name Method -> bool
  /// @param -> first name -> String
  /// @usage -> Validating first name
  bool _checkValidFirstName(String firstName);

  /// Check Valid First Name Method -> bool
  /// @param -> first name -> String
  /// @usage -> Validating first name
  bool _checkValidLastName(String lastName);

  /// Check Valid Password Method -> bool
  /// @param -> password -> String
  /// @usage -> Validating password
  bool _checkValidPassword(String password);

  /// Check Valid Password Method -> bool
  /// @param -> password -> String
  /// @usage -> Validating password
  bool _checkValidConfirmPassword(String confirmPassword);

}


/// Signup Form Observer Class - Observer class implementing SignUpFormObserverContract
class SignUpFormObserver extends SignUpFormObserverContract{

  //------------------------------------------------------------ Observer variables -----------------------------------------------------------------

  // STREAM CONTROLLERS
  /// First Name StreamController -> String
  /// @usage -> Control stream of user name by adding sink from 'firstName sink' and providing stream of first name
  var _firstNameController =   StreamController<String>.broadcast();
  /// Last Name StreamController -> String
  /// @usage -> Control stream of user name by adding sink from 'lastName sink' and providing stream of last name
  var _lastNameController =   StreamController<String>.broadcast();
  /// Password StreamController -> String
  /// @usage -> Control stream of password by adding sink from 'userPassword sink' and providing stream of password
  var _passwordController = StreamController<String>.broadcast();
  /// Confirm Password StreamController -> String
  /// @usage -> Control stream of confirm password by adding sink from 'userPassword sink' and providing stream of confirm password
  var _confirmPasswordController = StreamController<String>.broadcast();
  /// First Name Error Message StreamController -> String
  /// @usage -> Control stream of first name error msg
  var _firstNameErrorMsgController = StreamController<String>.broadcast();
  /// Last Name Error Message StreamController -> String
  /// @usage -> Control stream of last name error msg
  var _lastNameErrorMsgController = StreamController<String>.broadcast();
  /// Password Error Message StreamController -> String
  /// @usage -> Control stream of password error msg
  var _passwordErrorMsgController = StreamController<String>.broadcast();
  /// Confirm Password Error Message StreamController -> String
  /// @usage -> Control stream of confirm password error msg
  var _confirmPasswordErrorMsgController = StreamController<String>.broadcast();
  /// Is SignUp Valid Toggle StreamController -> bool
  /// @usage -> Control stream of valid signup toggle
  var _isSignUpValidToggleController = StreamController<bool>.broadcast();

  // bool variable to temporarily store result of username and password validation
  bool _tempValidFirstName, _tempValidLastName, _tempValidPassword, _tempValidConfirmPassword;

  //------------------------------------------------------------- Constructor -----------------------------------------------------------------------

  SignUpFormObserver():super();

  //------------------------------------------------------------- Contract Observer Methods ---------------------------------------------------------

  @override
  void _init() {
    // Make call to super class _init() method
    super._init();
    // Initially invalidate temporary user name and password
    _tempValidFirstName = _tempValidLastName = _tempValidPassword = _tempValidConfirmPassword = false;
  }

  @override
  void _handleSignUpEnableProcess() {
    // Listen to _isValidFirstName stream
    _isValidFirstName.listen(
            (isValidFirstName){
          if(isValidFirstName){ // Valid first name
            // Set temporary valid first name to TRUE i.e. set it valid
            _tempValidFirstName = true;
            // Now check whether temporary user password is Valid
            _tempValidLastName
                ? // Conditional operator
            // VALID
            // Add TRUE event to isLoginValidToggle stream
            _isSignUpValidToggleController.add(true)
                :
            // INVALID
            // Do nothing
            null;

            _tempValidPassword
                ? // Conditional operator
            // VALID
            // Add TRUE event to isLoginValidToggle stream
            _isSignUpValidToggleController.add(true)
                :
            // INVALID
            // Do nothing
            null;

            _tempValidConfirmPassword
                ? // Conditional operator
            // VALID
            // Add TRUE event to isLoginValidToggle stream
            _isSignUpValidToggleController.add(true)
                :
            // INVALID
            // Do nothing
            null;


            // ADD NULL event to userNameErrorMsg stream
            _firstNameErrorMsgController.add(null);
          }else{ // Invalid User Name
            // Set temporary valid user name to FALSE i.e. set it invalid
            _tempValidFirstName = false;
            // Add FALSE event to isLoginValidToggle stream
            _isSignUpValidToggleController.add(false);
            // ADD user name error string event to userNameErrorMsg stream
            _firstNameErrorMsgController.add(AppStrings.LOGIN_USER_NAME_ERROR_MSG);
          }
        });
  }

  @override
  bool _checkValidConfirmPassword(String confirmPassword) {
    // TODO: implement _checkValidConfirmPassword
    throw UnimplementedError();
  }

  @override
  bool _checkValidFirstName(String firstName) {
    // TODO: implement _checkValidFirstName
    throw UnimplementedError();
  }

  @override
  bool _checkValidLastName(String lastName) {
    // TODO: implement _checkValidLastName
    throw UnimplementedError();
  }

  @override
  bool _checkValidPassword(String password) {
    // TODO: implement _checkValidPassword
    throw UnimplementedError();
  }



  @override
  // TODO: implement _isValidFirstName
  Stream<bool> get _isValidFirstName => throw UnimplementedError();

  @override
  // TODO: implement _isValidUserPassword
  Stream<bool> get _isValidUserPassword => throw UnimplementedError();

  @override
  // TODO: implement confirmPassword
  Sink get confirmPassword => throw UnimplementedError();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  // TODO: implement firstName
  Sink get firstName => throw UnimplementedError();

  @override
  // TODO: implement firstNameErrorText
  Stream<String> get firstNameErrorText => throw UnimplementedError();

  @override
  void invalidCredentials() {
    // TODO: implement invalidCredentials
  }

  @override
  // TODO: implement lastName
  Sink get lastName => throw UnimplementedError();

  @override
  // TODO: implement lastNameErrorText
  Stream<String> get lastNameErrorText => throw UnimplementedError();

  @override
  // TODO: implement password
  Sink get password => throw UnimplementedError();

  @override
  // TODO: implement userPasswordErrorText
  Stream<String> get userPasswordErrorText => throw UnimplementedError();

}