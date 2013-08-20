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

### Examples: ###

- TODO: From angular.dart [demo](https://github.com/angular/angular.dart/tree/master/demo "angular dart demo")
- Simple Echo
- Simple Controller

