
import 'package:flutter_projects/bloc/login_validators.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc with LoginValidators{
  final _signUpName = BehaviorSubject<String>();
  final _signUpPhone  = BehaviorSubject<String>();
  final _signUpEmail = BehaviorSubject<String>();
  final _signUpPassword = BehaviorSubject<String>();

  Stream<String> get signUpEmail => _signUpEmail.stream.transform(emailValidtr);
  Stream<String> get signUpPassword => _signUpPassword.stream.transform(SignUpPasswordValidtr);
  Stream<String> get signUpName => _signUpName.stream;
  Stream<String> get signUpPhone => _signUpPhone.stream;

  Stream<bool> get validItems => Rx.combineLatest4(signUpEmail, signUpPassword, signUpName, signUpPhone, (a, b, c, d) => true);
  void submit(){
    print("sign up...");
  }

  Function(String)get newSignUpEmail => _signUpEmail.sink.add;
  Function(String)get newSignUpPassword => _signUpPassword.sink.add;
  Function(String)get newSignUpName => _signUpName.sink.add;
  Function(String)get newSignUpPhone => _signUpPhone.sink.add;


  void closeEdit(){
    _signUpName.close();
    _signUpPhone.close();
    _signUpEmail.close();
    _signUpPassword.close();
 }

}