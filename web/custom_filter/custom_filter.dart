library capitalize;

import 'package:angular/angular.dart';

// Capitalize first letter of a string.
@NgFilter(name: 'capitalize')
class Capitalize {
  String call(String input, [String punctuation = '']) {
    return input.substring(0,1).toUpperCase() + input.substring(1) + punctuation;
  }
}

main() {
  ngBootstrap(module: new AngularModule()..type(Capitalize));
}