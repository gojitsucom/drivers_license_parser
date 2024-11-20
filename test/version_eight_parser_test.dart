// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:test/test.dart';

void main() {
  group(
      "Parsing Data Adhereing to the 2013 AAMVA DL/ID Card Design Standard (aka version 8)",
      () {
    group("Parsing the AAMVA Document Standard", () {
      group("when the version is present", () {
        test("should reveal the correct version number", () {
          final result = LicenseParser.parse(
              "ANSI 636026080102DL00410288ZA03290015DLDAQD12345678\n");

          expect(result.version, "08");
        });
      });
    });

    group("Parsing the Name Suffix", () {
      group("when the suffix is present", () {
        group("when the suffix is JR", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUJR\n");

            expect(result.suffix, NameSuffix.junior);
          });
        });
        group("when the suffix is senior", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUSR\n");

            expect(result.suffix, NameSuffix.senior);
          });
        });
        group("when the suffix is 1ST", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU1ST\n");

            expect(result.suffix, NameSuffix.first);
          });
        });
        group("when the suffix is 2ND", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU2ND\n");

            expect(result.suffix, NameSuffix.second);
          });
        });
        group("when the suffix is 3RD", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU3RD\n");

            expect(result.suffix, NameSuffix.third);
          });
        });
        group("when the suffix is 4TH", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU4TH\n");

            expect(result.suffix, NameSuffix.fourth);
          });
        });
        group("when the suffix is 5TH", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU5TH\n");

            expect(result.suffix, NameSuffix.fifth);
          });
        });
        group("when the suffix is 6TH", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU6TH\n");

            expect(result.suffix, NameSuffix.sixth);
          });
        });
        group("when the suffix is 7TH", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU7TH\n");

            expect(result.suffix, NameSuffix.seventh);
          });
        });
        group("when the suffix is 8TH", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU8TH\n");

            expect(result.suffix, NameSuffix.eighth);
          });
        });
        group("when the suffix is 9TH", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCU9TH\n");

            expect(result.suffix, NameSuffix.ninth);
          });
        });
        group("when the suffix is I", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUI\n");

            expect(result.suffix, NameSuffix.first);
          });
        });
        group("when the suffix is II", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUII\n");

            expect(result.suffix, NameSuffix.second);
          });
        });
        group("when the suffix is III", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUIII\n");

            expect(result.suffix, NameSuffix.third);
          });
        });
        group("when the suffix is IV", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUIV\n");

            expect(result.suffix, NameSuffix.fourth);
          });
        });
        group("when the suffix is V", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUV\n");

            expect(result.suffix, NameSuffix.fifth);
          });
        });
        group("when the suffix is VI", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUVI\n");

            expect(result.suffix, NameSuffix.sixth);
          });
        });
        group("when the suffix is VII", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUVII\n");

            expect(result.suffix, NameSuffix.seventh);
          });
        });
        group("when the suffix is VIII", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUVIII\n");

            expect(result.suffix, NameSuffix.eighth);
          });
        });
        group("when the suffix is IX", () {
          test("should reveal the correct suffix", () {
            final result = LicenseParser.parse("DCUIX\n");

            expect(result.suffix, NameSuffix.ninth);
          });
        });
      });
    });

    group("Parsing the suffix alias", () {
      group("when the suffix alias is present", () {
        test("should reveal the suffix alias", () {
          final result = LicenseParser.parse("DBSJR\n");

          expect(result.suffixAlias, "JR");
        });
      });
    });

    group("Parsing the first name alias", () {
      group("when the first name alias is present", () {
        test("should reveal the first name alias", () {
          final result = LicenseParser.parse("DBGJOHNALIAS\n");

          expect(result.firstNameAlias, "JOHNALIAS");
        });
      });
    });

    group("Parsing the last name alias", () {
      group("when the last name alias is present", () {
        test("should reveal the last name alias", () {
          final result = LicenseParser.parse("DBNPUBLICALIAS\n");

          expect(result.lastNameAlias, "PUBLICALIAS");
        });
      });
    });

    group("Parsing the Inventory Control Number", () {
      group("when the inventory control number is present", () {
        test("should reveal the inventory control number", () {
          final result = LicenseParser.parse("DCK12345678900000000000\n");

          expect(result.inventoryControlNumber, "12345678900000000000");
        });
      });
    });

    group("Parsing the Audit Information", () {
      group("when the audit information is present", () {
        test("should reveal the audit information", () {
          final result = LicenseParser.parse("DCJCA1234BBB\n");

          expect(result.auditInformation, "CA1234BBB");
        });
      });
    });

    group("Parsing the place of birth", () {
      group("when the place of birth is present", () {
        test("should reveal the place of birth", () {
          final result = LicenseParser.parse("DCICALIFORNIA, USA\n");

          expect(result.placeOfBirth, "CALIFORNIA, USA");
        });
      });
    });

    group("Parsing the Hair Color", () {
      group("when the hair color is present", () {
        group("when the hair color is Bald", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZBAL\n");

            expect(result.hairColor, HairColor.bald);
          });
        });
        group("when the hair color is Black", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZBLK\n");

            expect(result.hairColor, HairColor.black);
          });
        });
        group("when the hair color is Blond", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZBLN\n");

            expect(result.hairColor, HairColor.blond);
          });
        });
        group("when the hair color is Brown", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZBRO\n");

            expect(result.hairColor, HairColor.brown);
          });
        });
        group("when the hair color is Grey", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZGRY\n");

            expect(result.hairColor, HairColor.grey);
          });
        });
        group("when the hair color is Red/Auburn", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZRED\n");

            expect(result.hairColor, HairColor.red);
          });
        });
        group("when the hair color is Sandy", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZSDY\n");

            expect(result.hairColor, HairColor.sandy);
          });
        });
        group("when the hair color is White ", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZWHI\n");

            expect(result.hairColor, HairColor.white);
          });
        });
        group("when the hair color is Unknown", () {
          test("should reveal the correct hair color", () {
            final result = LicenseParser.parse("DAZFFF\n");

            expect(result.hairColor, HairColor.unknown);
          });
        });
      });
    });

    group("Parsing the Second Street Address Line", () {
      group("when the street address supplement is present", () {
        test("should reveal the supplemental street address", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.streetAddressSupplement, "APT #4A");
        });
      });
    });

    group("Parsing the Issuing Country", () {
      group("when the country is present", () {
        group("when issued in the United States of America", () {
          test("should reveal the correct issuing country", () {
            final result = LicenseParser.parse(validLicenseData());

            expect(result.country, IssuingCountry.unitedStates);
          });
        });
        group("when issued in Canada", () {
          test("should reveal the correct issuing country", () {
            final result = LicenseParser.parse("DCGCAN\n");

            expect(result.country, IssuingCountry.canada);
          });
        });
      });
    });

    group("Parsing the Document Identifier", () {
      group("when the document id is present", () {
        test("should reveal the document id", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.documentId, "83D9BN217QO983B1");
        });
      });
    });

    group("Parsing the Customer Id Number", () {
      group("when the customer id number is present", () {
        test("should reveal the customer id number", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.customerId, "D12345678");
        });
      });
    });

    group("Parsing the Postal Code", () {
      group("when the postal code is present", () {
        test("should reveal the postal code", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(
              result.postalCode,
              PostalCode(
                postalCode: "90223",
                extension: "0000",
              )); //"902230000"
        });
      });
    });

    group("Parsing the State", () {
      group("when the state is present", () {
        test("should reveal the state", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.state, "CA");
        });
      });
    });

    group("Parsing the City", () {
      group("when the city is present", () {
        test("should reveal the city", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.city, "ANYTOWN");
        });
      });
    });

    group("Parsing the Street Address", () {
      group("when the street address is present", () {
        test("should reveal the street address", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.streetAddress, "789 E OAK ST");
        });
      });
    });

    group("Parsing Height", () {
      group("when the height is present", () {
        test("should reveal the height in inches", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.height, 69);
        });
      });
    });

    group("Parsing Eye Color", () {
      group("when the eye color is present", () {
        group("when the eye color is Black", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYBLK\n");

            expect(result.eyeColor, EyeColor.black);
          });
        });
        group("when the eye color is Blue", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYBLU\n");

            expect(result.eyeColor, EyeColor.blue);
          });
        });
        group("when the eye color is Brown", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYBRO\n");

            expect(result.eyeColor, EyeColor.brown);
          });
        });
        group("when the eye color is Gray", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYGRY\n");

            expect(result.eyeColor, EyeColor.gray);
          });
        });
        group("when the eye color is Green", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYGRN\n");

            expect(result.eyeColor, EyeColor.green);
          });
        });
        group("when the eye color is Hazel", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYHAZ\n");

            expect(result.eyeColor, EyeColor.hazel);
          });
        });
        group("when the eye color is Maroon ", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYMAR\n");

            expect(result.eyeColor, EyeColor.maroon);
          });
        });
        group("when the eye color is Pink", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYPNK\n");

            expect(result.eyeColor, EyeColor.pink);
          });
        });
        group("when the eye color is Dichromatic", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYDIC\n");

            expect(result.eyeColor, EyeColor.dichromatic);
          });
        });
        group("when the eye color is Unknown", () {
          test("should reveal the correct eye color", () {
            final result = LicenseParser.parse("DAYUNK\n");

            expect(result.eyeColor, EyeColor.unknown);
          });
        });
      });
    });

    group("Parsing the gender", () {
      group("when the gender is present", () {
        group("when the gender is male", () {
          test("should reveal the gender as Male", () {
            final result = LicenseParser.parse("DBC1\n");

            expect(result.gender, Gender.male);
          });
        });
        group("when the gender is female", () {
          test("should reveal the gender as Female", () {
            final result = LicenseParser.parse("DBC2\n");

            expect(result.gender, Gender.female);
          });
        });
        group("when the gender is neither male or female", () {
          test("should reveal the gender as Other", () {
            final result = LicenseParser.parse("DBC3\n");

            expect(result.gender, Gender.other);
          });
        });
      });
    });

    group("Parsing the first name", () {
      group("when the first name is present", () {
        test("should reveal the first name", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.firstName, "JOHN");
        });

        group("when the first name was truncated", () {
          test("should reveal the correct truncation status", () {
            final result = LicenseParser.parse("DDFT\n");

            expect(result.firstNameTruncation, Truncation.truncated);
          });
        });
        group("when the first name was not truncated", () {
          test("should reveal the correct truncation status", () {
            final result = LicenseParser.parse("DDFN\n");

            expect(result.firstNameTruncation, Truncation.none);
          });
        });
        group("when the truncation of the first name is unknown", () {
          test("should reveal the correct truncation status", () {
            final result = LicenseParser.parse("DDFU\n");

            expect(result.firstNameTruncation, Truncation.unknown);
          });
        });
      });
    });

    group("Parsing the last name", () {
      group("when the last name is present", () {
        test("should reveal the last name", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.lastName, "PUBLIC");
        });
      });
    });

    group("Parsing the middle name", () {
      group("when the middle name is present", () {
        test("should reveal the middle name", () {
          final result = LicenseParser.parse(validLicenseData());

          expect(result.middleName, "QUINCY");
        });

        group("when the middle name was truncated", () {
          test("should reveal the correct truncation status", () {
            final result = LicenseParser.parse("DDGT\n");

            expect(result.middleNameTruncation, Truncation.truncated);
          });
        });
        group("when the middle name was not truncated", () {
          test("should reveal the correct truncation status", () {
            final result = LicenseParser.parse("DDGN\n");

            expect(result.middleNameTruncation, Truncation.none);
          });
        });
        group("when the truncation of the middle name is unknown", () {
          test("should reveal the correct truncation status", () {
            final result = LicenseParser.parse("DDGU\n");

            expect(result.middleNameTruncation, Truncation.unknown);
          });
        });
      });
    });

    group("Parsing the expiration date", () {
      group("when the expiration date is present", () {
        test("should reveal the expiration date", () {
          final result = LicenseParser.parse(validLicenseData());

          //"01312035"
          final expectedDate = DateTime(2035, 1, 31);

          expect(result.expirationDate, expectedDate);
        });

        group("when the expiration date is in the past", () {
          test("should be expired", () {
            final result = LicenseParser.parse("DBA05052005\n");

            expect(result.isExpired(), isTrue);
          });
        });
        group("when the expiration date is in the future", () {
          test("should not be expired", () {
            final result = LicenseParser.parse(validLicenseData());

            expect(result.isExpired(), isFalse);
          });
        });
      });
    });

    group("Parsing the issue date", () {
      group("when the issue date is present", () {
        test("should reveal the issue date", () {
          final result = LicenseParser.parse(validLicenseData());

          //"08242015"
          final expectedDate = DateTime(2015, 8, 24);

          expect(result.issueDate, expectedDate);
        });

        group("when the issue date is in the past", () {
          test("should have been issued", () {
            final result = LicenseParser.parse("DBD05052005\n");

            expect(result.hasBeenIssued(), isTrue);
          });
        });
        group("when the issue date is in the future", () {
          test("should not yet have been issued", () {
            final result = LicenseParser.parse("DBD05053000\n");

            expect(result.hasBeenIssued(), isFalse);
          });
        });
      });
    });

    group("Parsing the date of birth", () {
      group("when the date of birth is present", () {
        test("should reveal the date of birth", () {
          final result = LicenseParser.parse(validLicenseData());

          //"01151970"
          final expectedDate = DateTime(1970, 1, 15);

          expect(result.dateOfBirth, expectedDate);
        });
      });
    });
  });
}

String validLicenseData() {
  final rawData = "@\n" +
      "\n" +
      "ANSI 636026080102DL00410288ZA03290015DLDAQD12345678\n" +
      "DCSPUBLIC\n" +
      "DDEN\n" +
      "DACJOHN\n" +
      "DDFN\n" +
      "DADQUINCY\n" +
      "DDGN\n" +
      "DCAD\n" +
      "DCBNONE\n" +
      "DCDNONE\n" +
      "DBD08242015\n" +
      "DBB01151970\n" +
      "DBA01312035\n" +
      "DBC1\n" +
      "DAU069 in\n" +
      "DAYGRN\n" +
      "DAG789 E OAK ST\n" +
      "DAHAPT #4A\n" +
      "DAIANYTOWN\n" +
      "DAJCA\n" +
      "DAK902230000  \n" +
      "DCF83D9BN217QO983B1\n" +
      "DCGUSA\n" +
      "DAW180\n" +
      "DAZBRO\n" +
      "DCK12345678900000000000\n" +
      "DDB02142014\n" +
      "DDK1\n" +
      "ZAZAAN\n" +
      "ZAB\n" +
      "ZAC";
  return rawData;
}

String emptyLicenseData() {
  final rawData = "@\n" +
      "\n" +
      "ANSI 636026080102DL00410288ZA03290015DLDAQD12345678\n" +
      "DCS\n" +
      "DDE\n" +
      "DAC\n" +
      "DDF\n" +
      "DAD\n" +
      "DDG\n" +
      "DCA\n" +
      "DCB\n" +
      "DCD\n" +
      "DBD\n" +
      "DBB\n" +
      "DBA\n" +
      "DBC\n" +
      "DAU\n" +
      "DAY\n" +
      "DAG\n" +
      "DAI\n" +
      "DAJ\n" +
      "DAK\n" +
      "DCF\n" +
      "DCG\n" +
      "DAW\n" +
      "DAZ\n" +
      "DCK\n" +
      "DDB\n" +
      "DDK\n" +
      "ZAZ\n" +
      "ZAB\n" +
      "ZAC";
  return rawData;
}
