class ResponsiveBreakpoints {
  final double mobile;
  final double tablet;
  final double desktop;

  const ResponsiveBreakpoints({
    this.mobile = 300,
    this.tablet = 600,
    this.desktop = 1024,
  });

  static const defaults = ResponsiveBreakpoints();
}
