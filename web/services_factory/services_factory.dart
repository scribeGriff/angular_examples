library services;

import 'package:angular/angular.dart';

/* This does not work correctly.  Possible bug or perhaps not implemented yet. */

@NgController(
    selector: '[main-controller]',
    publishAs: 'cntl')
class MainController {
  var user;
  MainController(UserInformation userInfo) {
    user = userInfo.initInfo;
  }
}

@NgController(
    selector: '[second-controller]',
    publishAs: 'cntl')
class SecondController {
  var user;
  SecondController(UserInformation userInfo) {
    user = userInfo.initInfo;
  }
}

class UserInformation {
  get initInfo => {
    'name': 'Angular.dart'
  };
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