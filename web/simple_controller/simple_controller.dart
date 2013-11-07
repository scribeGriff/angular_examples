library controller;

import 'package:angular/angular.dart';

@NgController(
    selector: '[simple-controller]',
    publishAs: 'cntl')
class SimpleController {
  final String message = 'World';
}

class MyAppModule extends Module {
  MyAppModule() {
    type(SimpleController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}