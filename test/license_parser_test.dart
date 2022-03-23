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

      test("parses my license", () {
        final rawData = "@\n" +
        "\n" +
        "ANSI 636001030302DL00410279ZN03200070DLDCAD\n" +
        "DCBNONE\n" +
        "DCDNONE\n" +
        "DBA10262023\n" +
        "DCSMUNOZ\n" +
        "DCTROSALIA\n" +
        "DBD11032018\n" +
        "DBB10261992\n" +
        "DBC2\n" +
        "DAYBRO\n" +
        "DAU502\n" +
        "DAG2400 PACIFIC ST 1\n" +
        "DAIBROOKLYN\n" +
        "DAJNY\n" +
        "DAK112330000\n" +
        "DAQ762877257\n" +
        "DCFZ6CYT5M618\n" +
        "DCGUSA\n" +
        "DDAN\n" +
        "DDB09282017\n" +
        "DDD0\n" +
        "ZNZNAMUNOZ@ROSALIA\n" +
        "ZNBb6Fj:%5VgcG<Z2<>cfn6H'p+th./8g@e!99!:e\h";

        final result = LicenseParser.parse(rawData);
        expect(result.pdf417, rawData);
      });
    });
  });
}
