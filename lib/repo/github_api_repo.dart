

import 'package:codeit/api/github/api.dart';
import 'package:codeit/models/github/GitUser.dart';
import 'package:codeit/utils/resource.dart';

class GithubApiRepo {
  final github = GithubApi();

  Future<Resource<GitUser>> getUserData(String name) async => await github.getUserData(name);

}