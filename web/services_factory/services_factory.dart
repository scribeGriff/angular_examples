library services;

import 'package:angular/angular.dart';

/* this does not work.  still investigating why not */

@NgController(
    selector: '[main-controller]',
    publishAs: 'mcntl')
class MainController {
  User user;
  MainController(UserInformation userInfo) {
    user = userInfo.initInfo;
  }
}

@NgController(
    selector: '[second-controller]',
    publishAs: 'scntl')
class SecondController {
  User user;
  SecondController(UserInformation userInfo) {
    user = userInfo.initInfo;
  }
}

class User {
  String name;

  User([this.name = '']);
}

class UserInformation {
  User get initInfo => new User('Angular.dart');
}

class MyAppModule extends Module {
  MyAppModule() {
    type(MainController);
    type(SecondController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}