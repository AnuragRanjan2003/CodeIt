import 'package:codeit/models/github/GitUser.dart';
import 'package:get/get.dart';

import '../repo/github_api_repo.dart';
import '../utils/resource.dart';

class GitController extends GetxController{
  final Rx<GitUser> gitUser = GitUser.empty().obs;
  final github = GithubApiRepo();

  getGitUser(String name){

    github.getUserData(name).then((value) {
      if(value is Success<GitUser>){
        gitUser.value = value.data;
      }else{
        gitUser.value = GitUser.empty();
      }
    });

  }

}