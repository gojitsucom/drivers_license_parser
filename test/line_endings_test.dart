// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:test/test.dart';

void main() {
  group("Line Endings", () {
    group("when the lines are terminated with CR and LF", () {
      test("should correctly parse the document", () {
        final rawData =
            "@\r\n\r\nANSI 636026080102DL00410288ZA03290095DLDAQD12345678\r\nDCSPUBLIC\r\nDDEN\r\nDACJOHN\r\nDDFN\r\nDADNONE\r\nDDGN\r\nDCAD\r\nDCBNONE\r\nDCDNONE\r\nDBD08242095\r\nDBB09151970\r\nDBA09312035\r\nDBC1\r\nDAU069 in\r\nDAYGRN\r\nDAG789 E OAK ST\r\nDAHAPT #4A\r\nDAIANYTOWN\r\nDAJCA\r\nDAK902230000  \r\nDCF83D9BN217QO983B1\r\nDCGUSA\r\nDAW180\r\nDAZBRO\r\nDCK12345678900000000000\r\nDDB02142094\r\nDDK1\r\nZAZAAN\r\nZAB\r\nZAC";

        final result = LicenseParser.parse(rawData);

        expect(result.version, "08");
        expect(result.lastName, "PUBLIC");
        expect(result.middleName, null);
        expect(result.firstName, "JOHN");
        expect(result.eyeColor, EyeColor.green);
        expect(result.streetAddress, "789 E OAK ST");
        expect(result.streetAddressSupplement, "APT #4A");
        expect(result.height, 69);
        expect(result.city, "ANYTOWN");
        expect(result.state, "CA");
        expect(result.postalCode,
            PostalCode(postalCode: "90223", extension: "0000")); //"902230000"
        expect(result.hairColor, HairColor.brown);
        expect(result.country, IssuingCountry.unitedStates);
        expect(result.customerId, "D12345678");
      });
    });
  });
}
