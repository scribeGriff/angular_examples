library greetings;

import 'package:angular/angular.dart';

class Person {
  String name;

  Person([this.name = '']);
}

class PersonController {
  Person user;
  String message;

  PersonController() {
    user = new Person();
  }
  greet() {
    message = "Hello, " + user.name + "!";
  }
}

main() {
  bootstrapAngular([new AngularModule()]);
}