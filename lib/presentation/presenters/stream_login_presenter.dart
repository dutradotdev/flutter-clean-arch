import 'dart:async';
import 'package:enquete_dev/domain/helpers/domain_error.dart';
import 'package:enquete_dev/domain/usecases/usecases.dart';
import 'package:meta/meta.dart';
import 'package:enquete_dev/presentation/protocols/validation.dart';

class LoginState {
  String email;
  String password;
  String emailError;
  String passwordError;
  String mainError;
  bool isLoading = false;
  bool get isFormValid =>
      emailError == null &&
      passwordError == null &&
      email != null &&
      password != null;
}

class StreamLoginPresenter {
  final Validation validation;
  final Authentication authentication;
  // com o broadcast vc tem mais de um listener ouvindo nesse controller. É pra emitir mais de uma stream
  var _controller = StreamController<LoginState>.broadcast();
  var _state = LoginState();

  Stream<String> get emailErrorStream =>
      _controller?.stream?.map((state) => state.emailError)?.distinct();

  Stream<String> get passwordErrorStream =>
      _controller?.stream?.map((state) => state.passwordError)?.distinct();

  Stream<bool> get isFormValidStream =>
      _controller?.stream?.map((state) => state.isFormValid)?.distinct();

  Stream<bool> get isLoadingStream =>
      _controller?.stream?.map((state) => state.isLoading)?.distinct();

  Stream<String> get mainErrorStream =>
      _controller?.stream?.map((state) => state.mainError)?.distinct();

  StreamLoginPresenter(
      {@required this.validation, @required this.authentication});

  void _update() => _controller?.add(_state);

  void validateEmail(String email) {
    _state.email = email;
    _state.emailError = validation.validate(field: 'email', value: email);
    _update();
  }

  void validatePassword(String password) {
    _state.password = password;
    _state.passwordError =
        validation.validate(field: 'password', value: password);
    _update();
  }

  Future<void> auth() async {
    _state.isLoading = true;
    _update();

    try {
      await authentication.auth(
          AuthenticationParams(email: _state.email, secret: _state.password));
    } on DomainError catch (error) {
      _state.mainError = error.description;
    }

    _state.isLoading = false;
    _update();
  }

  void dispose() {
    _controller?.close();
    _controller = null;
  }
}
