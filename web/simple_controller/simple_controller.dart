library controller;

import 'package:angular/angular.dart';

@NgController(
    selector: '[simple-controller]',
    publishAs: 'cntl')
class SimpleController {
  final String message = 'World';
}

main() {
  ngBootstrap(module: new AngularModule()..type(SimpleController));
}