library services;

import 'package:angular/angular.dart';

@NgController(
    selector: '[main-controller]',
    publishAs: 'mcntl')
class MainController {
  var user;
  MainController(UserInformation userInfo) {
    user = userInfo.initInfo;
  }
}

@NgController(
    selector: '[second-controller]',
    publishAs: 'scntl')
class SecondController {
  var user;
  SecondController(UserInformation userInfo) {
    user = userInfo.initInfo;
  }
}

class UserInformation {
  var _user = {
               'name': 'Angular.dart'
  };

  get initInfo => _user;
}

class MyAppModule extends Module {
  MyAppModule() {
    type(MainController);
    type(SecondController);
    type(UserInformation);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}