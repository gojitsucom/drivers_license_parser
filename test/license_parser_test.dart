// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:test/test.dart';

void main() {
  group("Parsing Versions of the AAMVA DL/ID Card Design Standard", () {
    group("Parsed License", () {
      test("should expose the raw pdf417 data", () {
        final rawData =
            "@\n\nANSI 636026010102DL00410288ZA03290015DLDBJD12345678\nDAAPUBLIC,JOHN,Q\nDABPUBLIC\nDACJOHN\nDADQUINCY\nDAG789 E OAK ST\nDAIANYTOWN\nDAHAPT #4A\nDAJCA\nDAK90223\nDBB19700115\nDBA20350131\nDAU509\nDAW180\nDAZBR\nDAYGRN\nDBC1\nDBHN\nDARD\nDBD20131003\nDBE2013-10-03 00.00.00.000000\nDBIN\nZAZAA7V81\n";

        final result = LicenseParser.parse(rawData);
        expect(result.pdf417, rawData);
      });

      test("parses my license", () {
        final rawData =
            "@\n\nANSI 636001030302DL00410279ZN03200070DLDCAD\nDCBNONE\nDCDNONE\nDBA10262023\nDCSMUNOZ\nDCTROSALIA\nDBD11032018\nDBB10261992\nDBC2\nDAYBRO\nDAU502\nDAG2400 PACIFIC ST 1\nDAIBROOKLYN\nDAJNY\nDAK112330000\nDAQ762877257\nDCFZ6CYT5M618\nDCGUSA\nDDAN\nDDB09282017\nDDD0\nZNZNAMUNOZ@ROSALIA\nZNBb6Fj:%5VgcG<Z2<>cfn6H'p+th./8g@e!99!:eh";

        final result = LicenseParser.parse(rawData);
        expect(result.pdf417, rawData);
      });
    });
  });
}
