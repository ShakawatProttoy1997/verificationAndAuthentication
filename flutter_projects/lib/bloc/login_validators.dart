
import 'dart:async';

mixin LoginValidators{
  var emailValidtr = StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
   if(email.isEmpty)
     return sink.addError("please fill it");
   else sink.add(email);
  }
  );
  var loginPasswordValidtr = StreamTransformer<String, String>.fromHandlers(handleData: (SignInPassword, sink) {
    if(SignInPassword.isEmpty)
      return sink.addError("please fill it");
    else sink.add(SignInPassword);
  }
  );
  var SignUpPasswordValidtr = StreamTransformer<String, String>.fromHandlers(handleData: (SignUpPassword, sink) {
    if(SignUpPassword.isEmpty)
      return sink.addError("please fill it");
    else sink.add(SignUpPassword);
  }
  );
}