import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:test/test.dart';

void main() {
  group("parsing heights", () {
    group("when height is in inches", () {
      test("should parse the height as inches", () {
        final result = LicenseParser.parse("DAU060 in");
        expect(result.height, 60);
      });
    });

    group("when height is in feet and inches", () {
      test("should parse the height as inches", () {
        final result = LicenseParser.parse(
            "ANSI 636026010102DL00410288ZA03290015DLDAQD12345678\nDAU 500\n");
        expect(result.height, 60);
      });
    });

    group("when height is in centimeters", () {
      test("should parse the height as inches, rounded", () {
        final result = LicenseParser.parse("DAU170 cm");
        expect(result.height, 67);
      });
    });
  });
}
