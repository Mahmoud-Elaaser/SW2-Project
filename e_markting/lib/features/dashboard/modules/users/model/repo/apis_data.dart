



import 'package:e_markting/features/dashboard/modules/users/model/repo/parent_data.dart';

import '../user_model.dart';

class APIsRepo extends ParentRepo {
  @override
  Future<void> delete({required num id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetch() {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> insert({required String name, required String email, required int age, required String address,required String pass}) {
    // TODO: implement insert
    throw UnimplementedError();
  }
}
