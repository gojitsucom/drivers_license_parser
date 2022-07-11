import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("when license data key clashes with user data", () {
    test("DAJ appears in the value for DAD", () {
      // this was a result of an actual support case. most fields should only be read if they appear on their own line
      const data = """
@

ANSI 636015090002DL00410278ZT03190007DLDCAC
DCBA
DCDNONE
DBA12262028
DCSDOE
DDEN
DACJOHN
DDFN
DADDAJUAN
DDGN
DBD10292020
DBB10041964
DBC1
DAYBRO
DAU075 in
DAG1234 FAKE ST APT 123
DAIPLANO
DAJTX
DAK750230000
DAQ68142925
DCF47812829150102425629
DCGUSA
DAZBLK
DCK30473829165
DCLBK
DDAF
DDB02232020
DAW180

ZTZTAN
""";
      final parsedData = LicenseParser.parse(data);
      expect(parsedData.state, "TX");
    });
  });
}
