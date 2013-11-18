## Working with Angular in Dart ##
![](http://1.bp.blogspot.com/-3y7twYcEV-I/Unk5VPpTMdI/AAAAAAAACiM/SRuk0bHMS20/s1600/Screen+Shot+2013-11-05+at+10.29.34+AM.png)   
**References**     
[Angular Dart on Github](https://github.com/angular/angular.dart)  
[Angular Dart Tutorial](https://github.com/angular/angular.dart.tutorial "AngularDart Tutorial")    
[Angular Dart Tutorial Wiki ](https://github.com/angular/angular.dart.tutorial/wiki "Wiki for Tutorial")  
See also: [angular-tips.com](http://angular-tips.com/ "angular tips")

Looking at examples of using Dart with Angular.  

Most examples updated to beta (v. 0.9.0) release 11/17/2013 9:47:35 PM     

### Dart Equivalent Examples from [Why Does Angular.js Rock](http://angular-tips.com/blog/2013/08/why-does-angular-dot-js-rock/ "Why Does Angular.js Rock?"): ###

- [Simple Echo](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_echo "Simple Echo")
- [Simple Controller](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_controller "Simple Controller")
- [Simple Filter](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_filter "Simple Filter")
- [Binding a function to a scope](https://github.com/scribeGriff/angular_examples/tree/master/web/bind_functions "bind function scope") 
- [Simple Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_directives "Simple Directives")
- [Repeating Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/repeat_directives "Repeating Directives")
- [Repeating Directive with Filter](https://github.com/scribeGriff/angular_examples/tree/master/web/repeat_directives_filter "Repeating Directive with Filter")
- [Custom Directives - focus()](https://github.com/scribeGriff/angular_examples/tree/master/web/focus_directive)
- [Component Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/component_directive "Component Directive"): Rendering HTML in a custom component
- [Filters for search](https://github.com/scribeGriff/angular_examples/tree/master/web/filter_search "Filters for search")
- [Custom filter - capitalize](https://github.com/scribeGriff/angular_examples/tree/master/web/custom_filter "Custom filter - capitalize")
- [Simple Services](https://github.com/scribeGriff/angular_examples/tree/master/web/services_factory "Simple Services") - Strange cursor/focus behavior although seems to work otherwise.  Opened [issue #264](https://github.com/angular/angular.dart/issues/264 "Issue 264").
- [Custom Directive with Attributes](https://github.com/scribeGriff/angular_examples/tree/master/web/custom_directive_attributes "Custom Directive with Attributes") - my variation of the "pie chart" example
- Todo: see the angular.dart [demo](https://github.com/angular/angular.dart/tree/master/demo/todo "angular dart demo")

### Issues, Notes and Questions: ###

- Search text implementing `ng-model="searchText"` or `ng-model="search.fieldName"` works.  See this [example](https://github.com/scribeGriff/angular_examples/tree/master/web/filter_search "Filter Search").
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

````html
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
