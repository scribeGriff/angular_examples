library greetings;

import 'package:angular/angular.dart';

class Person {
  String name;

  Person([this.name = '']);
}

@NgController(
    selector: '[person-greeter]',
    publishAs: 'person')
class PersonGreeterController {
  Person user;
  String message;

  PersonGreeterController() {
    user = new Person();
  }
  greet() {
    message = "Hello, " + user.name + "!";
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    type(PersonGreeterController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}