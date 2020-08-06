import './models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception('A user with this email already exists');
    }
  }

  User registerUserByEmail(String fullName, String email) {
    User user = User(name: fullName, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
      return user;
    } else {
      throw Exception('A user with this email already exists');
    }
  }

  User registerUserByPhone(String fullName, String phone) {
    User user = User(name: fullName, phone: phone);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
      return user;
    } else {
      throw Exception('A user with this phone already exists');
    }
  }

  User getUserByLogin(String login) {
    return users[login];
  }

  void setFriends(String login, List<User> friends) {
    User user = getUserByLogin(login);
    user.friends.addAll(friends);
  }

  User findUserInFriends(String login, User friend) {
    User user = getUserByLogin(login);
    if (user.friends.contains(friend)) {
      return friend;
    } else {
      throw Exception("${user.login} is not a friend of the login");
    }
  }

  List<User> importUsers(List<String> stringList) {
    List<User> userList = List();
    if (stringList.isNotEmpty) {
      stringList.forEach((str) {
        userList.add(_parseUserString(str));
      });
    }
    return userList;
  }

  User _parseUserString(String userString) {
    List<String> splintedList = userString.split(";\n");
    String name = splintedList[0].trim();
    String phone = splintedList[2].trim();
    String email = splintedList[1].trim();
    return User(name: name, phone: phone, email: email);
  }
}
