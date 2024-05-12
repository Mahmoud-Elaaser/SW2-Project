



import 'package:e_markting/features/dashboard/modules/users/model/user_model.dart';

abstract class ParentRepo {
  Future<void> insert({required String name, required String email, required int age, required String address,required String pass});
  Future<List<UserModel>> fetch();
  Future<void> delete({required int id});
}
