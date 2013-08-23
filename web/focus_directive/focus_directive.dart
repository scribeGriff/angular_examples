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
    // This updates the dom but doesn't render - how to force a render?
    //element.focus();
    // sSeen this used in angular but throws when used here - $digest already
    // in progress.
    scope.$apply(() => element.focus());
    // This just helps make the dom update more obvious - remove when
    // rendering is working.
    //element.text = 'found this element: $element';
  }
}

main() {
  var module = new AngularModule()
    ..directive(FocusDirective);

  bootstrapAngular([module]);
}