library controller;

import 'package:angular/angular.dart';

class SimpleController {
  final String message = 'World';
}

main() {
  bootstrapAngular([new AngularModule()]);
}