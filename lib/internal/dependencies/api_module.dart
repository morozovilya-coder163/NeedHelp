

import 'package:need_help/data/api/service/service.dart';

import '../../data/api/api_util.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    return _apiUtil ?? ApiUtil(FirebaseService());
  }
}