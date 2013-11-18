library iresponse;

import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:math' show Random;
import 'package:simplot/simplot.dart';
import 'package:convolab/convolab.dart';

@NgController(
    selector: '[impulse-response]',
    publishAs: 'cntl'
)
class ImpulseResponseController {
  static final Random indexGen = new Random();
  String color = '#0082C8';

  String nextColor() {
    var letters = '0123456789ABCDEF'.split('');
    color = '#';
    for (var i = 0; i < 6; i++ ) {
      color += letters[indexGen.nextInt(15)];
    }
    return color;
  }
}

@NgDirective(
    selector: '[simplot]',
    map: const {
      "color": '=>color'
    }
)
class ImpulseResponseDirective {
  final Element element;
  int seqLength, seqZero;
  String title, ilength, izero, ycoeff, xcoeff;
  Plot2D impulsePlot;
  Sequence x, n, b, a;
  FilterResults h;
  int range, index;

  ImpulseResponseDirective(this.element) {
    // Set the range and index for the plot from a list of
    // instantiated elements.
    range = querySelectorAll("${element.toString()}").length;
    index = querySelectorAll("${element.toString()}").indexOf(element);

    // Grab the attributes.
    title = element.attributes["title"];
    ilength = element.attributes["imp-length"];
    izero = element.attributes["imp-zero"];
    ycoeff = element.attributes["y-coeffs"];
    xcoeff = element.attributes["x-coeffs"];

    // Check for valid attributes and parse as required.
    title = title == null ? 'Impulse Response for 1D Direct Form Digital Filter'
        : title;
    seqLength = ilength == null ? 51 : int.parse(ilength);
    seqZero = izero == null ? 10 : int.parse(izero);
    a = ycoeff == null ? sequence([1, -0.5, 0.25]) : parseList(ycoeff);
    b = xcoeff == null ? sequence([1, 2, 1]) : parseList(xcoeff);

    // Generate an impulse sequence.
    x = impseq(seqLength, seqZero);
    n = x.position(seqZero);

    // Calculate the impulse response of the filter.
    h = filter(b, a, x);
  }

  // Sets the color and listens for changes to the controller's color field.
  set color(String color) {
    createPlot(color);
  }

  // Parse the string of coefficients to a list.
  Sequence parseList(String list) {
    return sequence(list.split(",")
        .where((element) => element.trim().isNotEmpty)
          .map((element)=> double.parse(element)));
  }

  // Create the plot.  Need to remove existing plot if there is one.
  createPlot(String color) {
    if (element.childNodes.isNotEmpty) element.firstChild.remove();
    impulsePlot = plot(h.x.toList(), xdata:n.toList(), shadow:element,
        style1:'data', color1:color, range:range, index:index);
    impulsePlot
        ..grid()
        ..title(title)
        ..ymarker(0, width:2);
  }
}

class MyAppModule extends Module {
  MyAppModule() {
    type(ImpulseResponseController);
    type(ImpulseResponseDirective);
  }
}

main() {
  ngBootstrap(module: new MyAppModule());
}