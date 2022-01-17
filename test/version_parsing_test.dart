import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:test/test.dart';

void main() {
  group("Parsing the License Version", () {
    group("when adhering to the standard", () {
      test("should correctly parse the version number", () {
        final data =
            "@\nANSI 6360260502DL00390246ZA02850010DLDAQD00113824\nDAANEUMAN,ALFRED,E\nDABNEUMAN\nDACALFRED\nDADEHH\nDAG15169 NORTH SCOTTSDALE ROAD\nDAISCOTTSDALE\nDAJAZ\nDAK85254\nDBB19770416\nDBA20370416\nDAU509\nDAW200\nDAZBR\nDAYBLU\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81";

        final result = LicenseParser.parse(data);
        expect(result.version, "05");
      });
    });
    group("when the file type does not follow the standard", () {
      test("should correctly parse the version number", () {
        final data =
            "@\nAAMVA 6360260702DL00390246ZA02850010DLDAQD00113824\nDAANEUMAN,ALFRED,E\nDABNEUMAN\nDACALFRED\nDADEHH\nDAG15169 NORTH SCOTTSDALE ROAD\nDAISCOTTSDALE\nDAJAZ\nDAK85254\nDBB19770416\nDBA20370416\nDAU509\nDAW200\nDAZBR\nDAYBLU\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81";

        final result = LicenseParser.parse(data);
        expect(result.version, "07");
      });
    });
    group("when the file type does not have a trailing space", () {
      test("should correctly parse the version number", () {
        final data =
            "@\nANSI6360260302DL00390246ZA02850010DLDAQD00113824\nDAANEUMAN,ALFRED,E\nDABNEUMAN\nDACALFRED\nDADEHH\nDAG15169 NORTH SCOTTSDALE ROAD\nDAISCOTTSDALE\nDAJAZ\nDAK85254\nDBB19770416\nDBA20370416\nDAU509\nDAW200\nDAZBR\nDAYBLU\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81";

        final result = LicenseParser.parse(data);
        expect(result.version, "03");
      });
    });
  });
}
