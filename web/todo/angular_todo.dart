library todo;

class Item {
  String text;
  bool done;

  // Optional positional parameters text and done.
  Item([String this.text = '', bool this.done = false]);

  bool get isEmpty => text.isEmpty;

  clone() => new Item(text, done);

  clear() {
    text = '';
    done = false;
  }
}

class TodoController {
  List<Item> items;
  Item newItem;

  TodoController() {
    newItem = new Item();
    items = [
      new Item('Write Angular in Dart', true),
      new Item('Write Dart in Angular'),
      new Item('Do something useful')
    ];
  }

  // workaround for https://github.com/angular/angular.dart/issues/37
  // is this still necessary since issue 37 was closed?
  dynamic operator [](String key) {
    if (key == 'newItem') {
      return newItem;
    }
  }

  void add() {
    if (newItem.isEmpty) return;

    items.add(newItem.clone());
    newItem.clear();
  }

  void markAllDone() {
    items.forEach((item) => item.done = true);
  }

  void archiveDone() {
    items.removeWhere((item) => item.done);
  }

  // I don't see this being applied.
  classFor(Item item) {
    item.done ? 'done' : '';
  }

  int remaining() {
    var remaining = 0;

    items.forEach((item) {
      if (!item.done) remaining++;
    });

    return remaining;
  }
}