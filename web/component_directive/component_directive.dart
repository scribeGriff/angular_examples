import 'package:angular/angular.dart';

// The following is an example of direct injection of the template
// rather than the example which injects from a file.
// template: "<div>Hello from template, thank you for coming!</div>"

@NgComponent(
    selector: "hello",
    templateUrl: "hello.html"
)
class HelloComponent {
}

class MyAppModule extends Module {
  MyAppModule() {
    type(HelloComponent);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}