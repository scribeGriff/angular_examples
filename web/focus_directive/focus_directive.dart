library focus;

import 'dart:html';
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

@NgDirective(
    selector: '[focus]'
)
class FocusDirective {
  Element element;
  Scope scope;

  FocusDirective(Element this.element, Scope this.scope) {
    scope.$evalAsync(() => element.focus());
    // The above now works but the following does not.  Needs val
    // attribute not text.
    scope.$evalAsync(() => element.text = 'found this element: $element');
  }
}

main() {
  var module = new AngularModule()
    ..directive(FocusDirective);

  bootstrapAngular([module]);
}