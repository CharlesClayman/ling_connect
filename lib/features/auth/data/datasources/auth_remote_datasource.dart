import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> signIn() async {
    // Mock network delay
    await Future.delayed(const Duration(seconds: 1));
    return const UserModel(id: '1', name: 'John Doe');
  }
}
