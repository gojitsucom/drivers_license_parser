// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:test/test.dart';

void main() {
  group("Line Endings", () {
    group("when the lines are terminated with CR and LF", () {
      test("should correctly parse the document", () {
        final rawData = "@\r\n" +
            "\r\n" +
            "ANSI 636026080102DL00410288ZA03290095DLDAQD12345678\r\n" +
            "DCSPUBLIC\r\n" +
            "DDEN\r\n" +
            "DACJOHN\r\n" +
            "DDFN\r\n" +
            "DADQUINCY\r\n" +
            "DDGN\r\n" +
            "DCAD\r\n" +
            "DCBNONE\r\n" +
            "DCDNONE\r\n" +
            "DBD08242095\r\n" +
            "DBB09151970\r\n" +
            "DBA09312035\r\n" +
            "DBC1\r\n" +
            "DAU069 in\r\n" +
            "DAYGRN\r\n" +
            "DAG789 E OAK ST\r\n" +
            "DAHAPT #4A\r\n" +
            "DAIANYTOWN\r\n" +
            "DAJCA\r\n" +
            "DAK902230000  \r\n" +
            "DCF83D9BN217QO983B1\r\n" +
            "DCGUSA\r\n" +
            "DAW180\r\n" +
            "DAZBRO\r\n" +
            "DCK12345678900000000000\r\n" +
            "DDB02142094\r\n" +
            "DDK1\r\n" +
            "ZAZAAN\r\n" +
            "ZAB\r\n" +
            "ZAC";

        final result = LicenseParser.parse(rawData);

        expect(result.version, "08");
        expect(result.lastName, "PUBLIC");
        expect(result.middleName, "QUINCY");
        expect(result.firstName, "JOHN");
        expect(result.eyeColor, EyeColor.green);
        expect(result.streetAddress, "789 E OAK ST");
        expect(result.streetAddressSupplement, "APT #4A");
        expect(result.height, 69);
        expect(result.city, "ANYTOWN");
        expect(result.state, "CA");
        expect(result.postalCode, PostalCode(postalCode: "90223", extension: "0000"));//"902230000"
        expect(result.hairColor, HairColor.brown);
        expect(result.country, IssuingCountry.unitedStates);
        expect(result.customerId, "D12345678");
      });
    });
  });
}
