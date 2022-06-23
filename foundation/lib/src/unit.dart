class Unit {
  const Unit._();

  static const instance = Unit._();

  @override
  String toString() {
    return "foundation.Unit";
  }
}

Unit get unit => Unit.instance;
