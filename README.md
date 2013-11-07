## Working with Angular in Dart ##
[Reference: Angular Dart](https://github.com/angular/angular.dart)  
See also: [angular-tips.com](http://angular-tips.com/ "angular tips")

Looking at examples of using Dart with Angular.  

Most examples updated to beta (v. 0.9.0) release 11/5/2013 9:38:06 PM 

### Dart Equivalent Examples from [Why Does Angular.js Rock](http://angular-tips.com/blog/2013/08/why-does-angular-dot-js-rock/ "Why Does Angular.js Rock?"): ###

- [Todo](https://github.com/scribeGriff/angular_examples/tree/master/web/todo "Todo"): From angular.dart [demo](https://github.com/angular/angular.dart/tree/master/demo "angular dart demo") - not yet updated to version 0.9.0.
- [Simple Echo](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_echo "Simple Echo")
- [Simple Controller](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_controller "Simple Controller")
- [Simple Filter](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_filter "Simple Filter")
- [Binding a function to a scope](https://github.com/scribeGriff/angular_examples/tree/master/web/bind_functions "bind function scope") 
- [Simple Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_directives "Simple Directives")
- [Repeating Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/repeat_directives "Repeating Directives")
- [Repeating Directive with Filter](https://github.com/scribeGriff/angular_examples/tree/master/web/repeat_directives_filter "Repeating Directive with Filter")
- [Custom Directives - focus()](https://github.com/scribeGriff/angular_examples/tree/master/web/focus_directive)
- [Component Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/component_directive "Component Directive"): Rendering HTML in a custom component

### Issues, Notes and Questions: ###

- Doesn't seem the `filter:search` is working yet.
- To use the ng-show or ng-hide directives, include the following in your project's css file:

````css
.ng-hide, 
.ng-show {
  display: none !important;
}
````

The show/hide example is included in the next section. 

### Examples ###

- A typical template for a controller in Dart would be like the following:

````dart
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
````

- A simple show/hide directive can be implemented as follows:

````dart
<body ng-app>
  <div class="border well">
    <button ng-click="show = !show" class="btn btn-primary">Show</button>
    <div ng-show="!show">
      <p>I am only visible when show is true.</p>
    </div>
  </div>
  <div class="border well">
    <button ng-click="hide = !hide" class="btn btn-primary">Hide</button>
    <div ng-hide="hide">
      <p>I am only visible when hide is false.</p>
    </div>
  </div>
  </body>
````
