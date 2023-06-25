import 'package:need_help/data/api/api_util.dart';
import 'package:need_help/domain/model/user.dart';
import 'package:need_help/domain/repository/user_repo.dart';

class UserDataRepository extends UserRepository {
  final ApiUtil _apiUtil;

  UserDataRepository(
    this._apiUtil,
  );

  @override
  Future<RealUser?> getUser(String id) async {
    return _apiUtil.getUser(id);
  }

  @override
  Future<void> updateUser(RealUser user) async {
    _apiUtil.updateUser(user);
  }
}
