library search;

import 'package:angular/angular.dart';

@NgDirective(
    selector: '[developers-search]',
    publishAs: 'cntl')
class DevelopersSearch {
  final List developers = [
                           {'name': 'Seth', 'country': 'USA'},
                           {'name': 'Kasper', 'country': 'Denmark'},
                           {'name': 'Claudio', 'country': 'Italy'},
                           {'name': 'Matthew', 'country': 'Canada'},
                           {'name': 'Anders', 'country': 'Sweden'}
                           ];
}

main() {
  ngBootstrap(module: new AngularModule()..type(DevelopersSearch));
}