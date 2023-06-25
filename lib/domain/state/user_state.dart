import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:need_help/domain/model/user.dart';
import 'package:need_help/domain/repository/user_repo.dart';

class UserCubit extends Cubit<UserCubitState?> {
  UserCubit({
    required this.userId,
    required this.userRepository,
  }) : super(null) {
    _getUser();
  }

  final UserRepository userRepository;
  final String userId;

  void _getUser() async {
    final state = UserCubitState(user: await userRepository.getUser(userId));
    emit(state);
  }

  
}

class UserCubitState {
  final RealUser? user;

  const UserCubitState({
    required this.user,
  });
}
