enum TransitRegion {
  dhakaMetro('DHAKA METRO'),
  ctgMetro('CTG METRO');

  final String value;
  const TransitRegion(this.value);

  static TransitRegion fromValue(String? val) {
    if (val == null) return TransitRegion.dhakaMetro;
    return TransitRegion.values.firstWhere(
      (e) => e.value.toUpperCase() == val.toUpperCase(),
      orElse: () => TransitRegion.dhakaMetro,
    );
  }
}
