library repeat;

import 'package:angular/angular.dart';

class Developer {
  final String name, country;

  Developer(this.name, this.country);
}

@NgController(
    selector:'[developers-controller]',
    publishAs: 'cntl')
class DevelopersController {
  final List developers= [
                          new Developer("Seth", "USA"),
                          new Developer("Kasper", "Denmark"),
                          new Developer("Claudio", "Italy"),
                          new Developer("Matthew", "Canada"),
                          new Developer("Anders", "Sweden")
                         ];
}

class MyAppModule extends Module {
  MyAppModule() {
    type(DevelopersController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}