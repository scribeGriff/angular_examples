## Working with Angular in Dart ##
[Reference: Angular Dart](https://github.com/angular/angular.dart)  
See also: [angular-tips.com](http://angular-tips.com/ "angular tips")

Looking at examples of using Dart with Angular.

### Issues, Notes and Questions: ###

- I don't see the 'done' class being applied in TODO example.
- Calling a constructor function for the controller uses the following syntax:
    
    `<div ng-controller="controller.Simple as ctrl">`

where controller is the Dart library name and Simple is the first part of the class name (or constructor function name if one exists).  For example:

    library controller;
    
    import 'package:angular/angular.dart';
    
    class SimpleController {
      final String message = 'World';
    }
    
    main() {
      bootstrapAngular([new AngularModule()]);
    } 

- Not sure how to use $scope with Dart

### Examples: ###

- [Todo](https://github.com/scribeGriff/angular_examples/tree/master/web/todo "Todo"): From angular.dart [demo](https://github.com/angular/angular.dart/tree/master/demo "angular dart demo")
- [Simple Echo](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_echo "Simple Echo")
- [Simple Controller](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_controller "Simple Controller")
- [Binding a function to a scope](https://github.com/scribeGriff/angular_examples/tree/master/web/bind_functions "bind function scope") 
- [Simple Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/simple_directives "Simple Directives")
- [Repeating Directive](https://github.com/scribeGriff/angular_examples/tree/master/web/repeat_directives "Repeating Directives")

