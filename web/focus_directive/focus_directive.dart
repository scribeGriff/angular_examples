library focus;

import 'dart:html';
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

@NgDirective(
    selector: '[focus]'
)
class FocusDirective {
  Element element;

  FocusDirective(this.element) {
    element.focus();
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    type(PersonGreeterController);
    type(FocusDirective);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}