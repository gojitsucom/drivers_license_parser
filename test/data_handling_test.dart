import 'package:drivers_license_parser/src/enum.dart';
import 'package:drivers_license_parser/src/license_parser.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("when the name is stored as the drive's license name (DAA)", () {
    test("it should parse the name", () {
      final result = LicenseParser.parse(
          "AAMVA6360060101DL12345678DAAPUBLIC,JOHN,QUINCY,2ND\n");

      expect(result.firstName, "JOHN");
      expect(result.middleName, "QUINCY");
      expect(result.lastName, "PUBLIC");
      expect(result.suffix, NameSuffix.second);
    });
  });

  group("when the postal code is stored", () {
    test("it should provide the short code", () {
      final result = LicenseParser.parse("DAK123456789\n");
      expect(
          result.postalCode,
          PostalCode(
            postalCode: "12345",
            extension: "6789",
          ));
    });
  });
}
