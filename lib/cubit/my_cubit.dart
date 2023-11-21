import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restapi/cubit/my_state.dart';
import 'package:restapi/my_repo.dart';
import 'package:restapi/user.dart';

class AppCubit extends Cubit<AppStates> {
  final MyRepo myRepo;

  AppCubit(this.myRepo) : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  User? user;
  void emitGetAllUsers() async {
    await myRepo.getAllUsers().then((usersList) {
      emit(GetAllUsers(usersList));
    });
  }

  void emitGetUserDetails(String userId) {
    myRepo.getUserById(userId).then((userDetails) {
      emit(GetUserDetails(userDetails));
    });
  }

  void emitCreateNewUser(User newUser) async {
    myRepo.createNewUser(newUser).then((newUser) {
      emit(GreateNewUser(newUser));
    });
  }

  void emitDeleteUser(String id) async {
    myRepo.deleteUser(id).then((date) {
      emit(DeleteUser(date));
    });
  }
}
