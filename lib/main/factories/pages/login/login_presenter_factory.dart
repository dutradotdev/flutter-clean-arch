import 'package:enquete_dev/data/usecases/remote_authentication.dart';
import 'package:enquete_dev/main/factories/factories.dart';
import 'package:enquete_dev/presentation/presenters/stream_login_presenter.dart';
import 'package:enquete_dev/ui/pages/login/login_presenter.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
      authentication: makeRemoteAuthentication(),
      validation: makeLoginValidation());
}
