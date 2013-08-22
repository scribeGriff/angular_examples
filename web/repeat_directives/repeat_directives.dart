library repeat;

import 'package:angular/angular.dart';

class Developer {
  final name, country;

  Developer(this.name, this.country);
}

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

main() {
  bootstrapAngular([new AngularModule()]);
}