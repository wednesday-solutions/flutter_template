enum Flavor {
  dev,
  qa,
  prod;

  static Flavor fromString({required String flavor}) {
    switch (flavor) {
      case "prod":
        return Flavor.prod;
      case "qa":
        return Flavor.qa;
      default:
        return Flavor.dev;
    }
  }
}
