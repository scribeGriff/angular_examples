library search;

import 'package:angular/angular.dart';

@NgDirective(
    selector: '[developers-search]',
    publishAs: 'cntl')
class DevelopersSearch {
  List developers;

  DevelopersSearch() {
    developers = [
                  {'name': 'Jesus', 'country': 'Spain'},
                  {'name': 'Dave', 'country': 'Canada'},
                  {'name': 'Wesley', 'country': 'USA'},
                  {'name': 'Krzysztof', 'country': 'Poland'}
                 ];
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    type(DevelopersSearch);
  }
}

main() {
  //ngBootstrap(module: new MyAppModule());
  ngBootstrap(module: new AngularModule()..type(DevelopersSearch));
}