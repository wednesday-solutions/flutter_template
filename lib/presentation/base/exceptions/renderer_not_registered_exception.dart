class RendererNotRegisteredForTypeException implements Exception {
  final Type type;

  RendererNotRegisteredForTypeException(this.type);

  @override
  String toString() {
    return "Renderer not registered for type $type";
  }
}
