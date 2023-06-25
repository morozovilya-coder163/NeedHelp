import 'package:need_help/data/api/model/api_user.dart';
import 'package:need_help/domain/model/user.dart';

class UserMapper {
  static RealUser fromApi(ApiRealUser user) {
    return RealUser(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      avatarUrl: user.avatarUrl,
    );
  }

  static ApiRealUser toApi(RealUser user) {
    final json = {
      'id': user.id,
      'firstName': user.firstName,
      'lastName': user.lastName,
      'avatarUrl': user.avatarUrl,
    };

    return ApiRealUser.fromApi(json);
  }
}
