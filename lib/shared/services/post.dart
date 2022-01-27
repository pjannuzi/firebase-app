import 'package:dio/dio.dart';
import 'package:fbaseapp/shared/util/constants.dart';

class SignupRepository {
  Future<int> signup(String email, String cpf, String password) async {
    int result = 0;
    try {
      Dio dio = Dio();
      var response = await dio.post(
        '${Constants().baseUrlAPi}',
        data: {'email': email, 'cpf': cpf, 'password': password},
      );
      print(response.statusCode);
      return response.statusCode!;
    } catch (e) {
      result = 1;
    }
    return result;
  }
}
