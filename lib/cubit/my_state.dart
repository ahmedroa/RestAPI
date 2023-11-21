import 'package:restapi/user.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class GetAllUsers extends AppStates {
  final List<User> allUsersLiset;

  GetAllUsers(this.allUsersLiset);
}

class GetUserDetails extends AppStates {
  final User details;

  GetUserDetails(this.details);
}

class GreateNewUser extends AppStates {
  final User newUser;

  GreateNewUser(this.newUser);
}

class DeleteUser extends AppStates {
  final dynamic date;

  DeleteUser(this.date);
}
