// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:test/test.dart';

void main() {
  group("Parsing Versions of the AAMVA DL/ID Card Design Standard", () {
    group("Parsed License", () {
      test("should expose the raw pdf417 data", () {
        final rawData = "@\n" +
            "\n" +
            "ANSI 636026010102DL00410288ZA03290015DLDBJD12345678\n" +
            "DAAPUBLIC,JOHN,Q\n" +
            "DABPUBLIC\n" +
            "DACJOHN\n" +
            "DADQUINCY\n" +
            "DAG789 E OAK ST\n" +
            "DAIANYTOWN\n" +
            "DAHAPT #4A\n" +
            "DAJCA\n" +
            "DAK90223\n" +
            "DBB19700115\n" +
            "DBA20350131\n" +
            "DAU509\n" +
            "DAW180\n" +
            "DAZBR\n" +
            "DAYGRN\n" +
            "DBC1\n" +
            "DBHN\n" +
            "DARD\n" +
            "DBD20131003\n" +
            "DBE2013-10-03 00.00.00.000000\n" +
            "DBIN\n" +
            "ZAZAA7V81\n";

        final result = LicenseParser.parse(rawData);
        expect(result.pdf417, rawData);
      });
    });
  });
}
