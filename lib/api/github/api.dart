import 'package:codeit/models/github/GitUser.dart';
import 'package:codeit/utils/resource.dart';
import 'package:dio/dio.dart';

class GithubApi {
  static const _accessToken = "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";
  late Dio _dio;

  GithubApi() {
    final BaseOptions options = BaseOptions(
      baseUrl: "https://api.github.com/",
      headers: {'Authorization': 'token $_accessToken'},
    );

    _dio = Dio(options);
  }

  Future<Resource<GitUser>> getUserData(String name) async {
    try {
      final res = await _dio.get("users/$name");
      if (res.statusCode == 200) {
        return Success(GitUser.fromJson(res.data));
      } else {
        return Failure(res.statusMessage.toString());
      }
    } on DioException catch (e) {
      return Failure(e.message.toString());
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
