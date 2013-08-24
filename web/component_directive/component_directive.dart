library hello;

import 'package:angular/angular.dart';

class HelloController {
  HelloController();
  attach(Scope scope) {
    print("ah, i'm being attached!");
  }
}

@NgComponent(
    templateUrl: 'hello.html',
    selector: 'hello'
)
class HelloComponent {
//  Scope scope;
//  HelloController controller;
//  static String $templateUrl = 'hello.html';
//
//
//  Hello(HelloController this.controller, Scope this.scope) {
//    controller.attach(scope);
//    //template = '<div>Hello readers, thank you for coming</div>';
//  }
}

main() {
  var module = new AngularModule()
    ..directive(HelloComponent);

  bootstrapAngular([module]);
}