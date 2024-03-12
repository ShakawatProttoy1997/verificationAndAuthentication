
import 'package:rxdart/rxdart.dart';

import 'login_validators.dart';

class SignInBloc with LoginValidators{
  final _signInEmail = BehaviorSubject<String>();
  final _signInPassword = BehaviorSubject<String>();

  Stream<String> get signInEmail => _signInEmail.stream.transform(emailValidtr);
  Stream<String> get signInPasskey => _signInPassword.stream.transform(loginPasswordValidtr);

  Stream<bool> get validItem => Rx.combineLatest2(signInEmail, signInPasskey, (a, b) => true);
  Function(String)get newSignInEmail => _signInEmail.sink.add;
  Function(String)get newSignInPasskey => _signInPassword.sink.add;
  void submit(){
    print("Log in...");
  }
  void closeEdit(){
    _signInEmail.close();
    _signInPassword.close();
  }
}