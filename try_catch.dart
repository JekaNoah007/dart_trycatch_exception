import 'dart:io';

void main() {
  try {
    final correct = email("example@gmail.com", "qwe1", "qwe1");
  } catch (e) {
    print(e);
  }
}

email(String login, String password, String confirmPassword) {
  stdout.write("Введите логин\n");
  String login = stdin.readLineSync()!;
  String pattern = r'^(?=.*?[a-z])(?=.*?[@]).{0,20}$';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(login)) {
    print("правильный логин");
  } else {
    print("не правильный логин");
  }
  stdout.write("Введите пароль\n");
  String password = stdin.readLineSync()!;
  String pattern2 = r'^(?=.*?[a-z])(?=.*?[0-9]).{1,20}$';
  RegExp regExp2 = RegExp(pattern2);
  if (regExp2.hasMatch(password)) {
    print("правильный пароль");
  } else {
    print("не правильный пароль");
  }

  if (!regExp.hasMatch(login)) {
    print('зашел в логин');
    throw ExaminationLogin();
  } else if (!regExp2.hasMatch(password)) {
    print('зашел в пароль');
    throw ExaminationPassword();
  } else if (confirmPassword != password) {
    print('зашел в подтверждение');
    throw ExaminationConfirmPassword();
  } else {
    print("все правильно!!!!");
  }
}

class ExaminationLogin {
  @override
  String toString() {
    return "Вы ввели неверный логин";
  }
}

class ExaminationPassword {
  @override
  String toString() {
    return "Вы ввели неверный пароль";
  }
}

class ExaminationConfirmPassword {
  @override
  String toString() {
    return "Вы ввели неверный проверочный пароль";
  }
}
