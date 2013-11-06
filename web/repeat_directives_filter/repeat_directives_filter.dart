library repeat;

import 'package:angular/angular.dart';

class Developer {
  final name, country;

  Developer(this.name, this.country);
}

@NgDirective(
    selector:'[developers-controller]',
    publishAs: 'cntl')
class DevelopersController {
  List developers;

  DevelopersController() {
    developers = [new Developer("Jesus", "Spain"),
                  new Developer("Dave", "Canada"),
                  new Developer("Wesley", "USA"),
                  new Developer("Krzysztof", "Poland")
                 ];
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    type(DevelopersController);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}