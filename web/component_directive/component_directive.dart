import 'package:angular/angular.dart';

// There is a bug that prevents the html from rendering if selector
// is used.  Without a selector, component name is derived from
// the class name.

@NgComponent(
    //selector: "hello",
    template: "<div>Hello readers, thank you for coming!</div>"
)
class HelloComponent {
}

main() {
  var module = new AngularModule()
    ..directive(HelloComponent);

  bootstrapAngular([module]);
}