import 'package:need_help/data/repository/phone_auth_data_repository.dart';
import 'package:need_help/domain/repository/phone_auth_repo.dart';

import '../../data/repository/user_data_repository.dart';
import '../../domain/repository/user_repo.dart';
import 'api_module.dart';

class RepositoryModule {
  static UserRepository? _userRepository;
  static PhoneAuthRepository? _phoneAuthRepository;

  static UserRepository userRepository() {
    return _userRepository ?? UserDataRepository(ApiModule.apiUtil());
  }

  static PhoneAuthRepository phoneAuthRepository() {
    return _phoneAuthRepository ?? PhoneAuthDataRepository(ApiModule.apiUtil());
  }
}
