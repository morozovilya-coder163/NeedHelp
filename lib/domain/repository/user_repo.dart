import '../model/user.dart';

//провайдится посредством BlocProvider
abstract class UserRepository {
  Future<RealUser?> getUser(String id);
  Future<void> updateUser(RealUser user);
}