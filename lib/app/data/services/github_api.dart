import 'package:github_profile/app/data/dio_client.dart';
import 'package:github_profile/app/data/endpoints.dart';
import 'package:github_profile/app/data/models/repos.dart';
import 'package:github_profile/app/data/models/user_profile.dart';

class GithubApi {
  DioClient _client = DioClient();

  Future<UserProfile> getUserProfile({String username}) async {
    try {
      final response = await _client.get('${Endpoints.usersProfile}/$username');
      return UserProfile.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Repos>> getRepos({String username}) async {
    try {
      final List response = await _client
          .get('${Endpoints.usersProfile}/$username/${Endpoints.repos}');

      return response.map((item) => Repos.fromMap(item)).toList();
    } catch (e) {
      throw e;
    }
  }
}
