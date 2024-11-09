// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:drivers_license_parser/drivers_license_parser.dart';
import 'package:test/test.dart';

void main() {
  group("Field Parsing", () {
    group("when the version is missing", () {
      test("should reveal an empty version number", () {
        final result = LicenseParser.parse("");

        expect(result.version, isNull);
      });
    });
    group("when the version is empty", () {
      test("should reveal an empty version number", () {
        final result = LicenseParser.parse("ANSI \n");

        expect(result.version, isNull);
      });
    });
  });

  group("Parsing the Name Suffix", () {
    group("when the suffix is empty", () {
      test("should reveal an unknown suffix", () {
        final result = LicenseParser.parse("DCU\n");

        expect(result.suffix, NameSuffix.unknown);
      });
    });
    group("when the suffix is missing", () {
      test("should reveal an unknown suffix", () {
        final result = LicenseParser.parse("");

        expect(result.suffix, NameSuffix.unknown);
      });
    });
  });

  group("Parsing the suffix alias", () {
    group("when the suffix alias is empty", () {
      test("should reveal an empty suffix alias", () {
        final result = LicenseParser.parse("DBS\n");

        expect(result.suffixAlias, isNull);
      });
    });
    group("when the suffix alias is missing", () {
      test("should reveal an empty suffix alias", () {
        final result = LicenseParser.parse("");

        expect(result.suffixAlias, isNull);
      });
    });
  });

  group("Parsing the first name alias", () {
    group("when the first name alias is empty", () {
      test("should reveal an empty first name alias", () {
        final result = LicenseParser.parse("DBG\n");

        expect(result.firstNameAlias, isNull);
      });
    });
    group("when the first name alias is missing", () {
      test("should reveal an empty first name alias", () {
        final result = LicenseParser.parse("");

        expect(result.firstNameAlias, isNull);
      });
    });
  });

  group("Parsing the last name alias", () {
    group("when the last name alias is empty", () {
      test("should reveal an empty last name alias", () {
        final result = LicenseParser.parse("DBN\n");

        expect(result.lastNameAlias, isNull);
      });
    });
    group("when the last name alias is missing", () {
      test("should reveal an empty last name alias", () {
        final result = LicenseParser.parse("");

        expect(result.lastNameAlias, isNull);
      });
    });
  });

  group("Parsing the Inventory Control Number", () {
    group("when the inventory control number is empty", () {
      test("should reveal an empty inventory control number", () {
        final result = LicenseParser.parse("DCK\n");

        expect(result.inventoryControlNumber, isNull);
      });
    });
    group("when the inventory control number is missing", () {
      test("should reveal an empty inventory control number", () {
        final result = LicenseParser.parse("");

        expect(result.inventoryControlNumber, isNull);
      });
    });
  });

  group("Parsing the Audit Information", () {
    group("when the audit information is empty", () {
      test("should reveal an empty audit information", () {
        final result = LicenseParser.parse("DCJ\n");

        expect(result.auditInformation, isNull);
      });
    });
    group("when the audit information is missing", () {
      test("should reveal an empty audit information", () {
        final result = LicenseParser.parse("");

        expect(result.auditInformation, isNull);
      });
    });
  });

  group("Parsing the place of birth", () {
    group("when the place of birth is empty", () {
      test("should reveal an empty place of birth", () {
        final result = LicenseParser.parse("DCI\n");

        expect(result.placeOfBirth, isNull);
      });
    });
    group("when the place of birth is missing", () {
      test("should reveal an empty place of birth", () {
        final result = LicenseParser.parse("");

        expect(result.placeOfBirth, isNull);
      });
    });
  });

  group("Parsing the Hair Color", () {
    group("when the hair color is empty", () {
      test("should reveal an unknown hair color", () {
        final result = LicenseParser.parse("DAZ\n");

        expect(result.hairColor, HairColor.unknown);
      });
    });
    group("when the hair color is missing", () {
      test("should reveal an unknown hair color", () {
        final result = LicenseParser.parse("");

        expect(result.hairColor, HairColor.unknown);
      });
    });
  });

  group("Parsing the Second Street Address Line", () {
    group("when the street address supplament is empty", () {
      test("should reveal nothing for the supplemental address", () {
        final result = LicenseParser.parse("DAH\n");

        expect(result.streetAddressSupplement, isNull);
      });
    });
    group("when the street address supplament is missing", () {
      test("should reveal nothing for the supplemental address", () {
        final result = LicenseParser.parse("");

        expect(result.streetAddressSupplement, isNull);
      });
    });
  });

  group("Parsing the Issuing Country", () {
    group("when the country is empty", () {
      test("should reveal an unknown issuing country", () {
        final result = LicenseParser.parse("DCG\n");

        expect(result.country, IssuingCountry.unknown);
      });
    });
    group("when the country is missing", () {
      test("should reveal nothing for the country", () {
        final result = LicenseParser.parse("DCF\n");

        expect(result.country, IssuingCountry.unknown);
      });
    });
  });

  group("Parsing the Document Identifier", () {
    group("when the document id is empty", () {
      test("should reveal nothing for the document id", () {
        final result = LicenseParser.parse("DCF\n");

        expect(result.documentId, isNull);
      });
    });
    group("when the document id is missing", () {
      test("should reveal nothing for the document id", () {
        final result = LicenseParser.parse("DCF\n");

        expect(result.documentId, isNull);
      });
    });
  });

  group("Parsing the Customer Id Number", () {
    group("when the customer id number is empty", () {
      test("should reveal nothing for the customer id number", () {
        final result = LicenseParser.parse("DAQ\n");

        expect(result.customerId, isNull);
      });
    });
    group("when the customer id number is missing", () {
      test("should reveal nothing for the customer id number", () {
        final result = LicenseParser.parse("DAQ\n");

        expect(result.customerId, isNull);
      });
    });
  });

  group("Parsing the Postal Code", () {
    group("when the postal code is empty", () {
      test("should reveal nothing for the postal code", () {
        final result = LicenseParser.parse("DAK\n");

        expect(result.postalCode, isNull);
      });
    });
    group("when the postal code is missing", () {
      test("should reveal nothing for the postal code", () {
        final result = LicenseParser.parse("DAK\n");

        expect(result.postalCode, isNull);
      });
    });
  });

  group("Parsing the State", () {
    group("when the state is empty", () {
      test("should reveal nothing for the state", () {
        final result = LicenseParser.parse("DAJ\n");

        expect(result.state, isNull);
      });
    });
    group("when the state is missing", () {
      test("should reveal nothing for the state", () {
        final result = LicenseParser.parse("DAJ\n");

        expect(result.state, isNull);
      });
    });
  });

  group("Parsing the City", () {
    group("when the city is empty", () {
      test("should reveal nothing for the city", () {
        final result = LicenseParser.parse("DAI\n");

        expect(result.city, isNull);
      });
    });
    group("when the city is missing", () {
      test("should reveal nothing for the city", () {
        final result = LicenseParser.parse("DAI\n");

        expect(result.city, isNull);
      });
    });
  });

  group("Parsing the Street Address", () {
    group("when the street address is empty", () {
      test("should reveal nothing for the street address", () {
        final result = LicenseParser.parse("DAG\n");

        expect(result.streetAddress, isNull);
      });
    });
    group("when the street address is missing", () {
      test("should reveal nothing for the street address", () {
        final result = LicenseParser.parse("DAG\n");

        expect(result.streetAddress, isNull);
      });
    });
  });

  group("Parsing Height", () {
    group("when the height is empty", () {
      test("should reveal nothing for the height ", () {
        final result = LicenseParser.parse("DAU\n");

        expect(result.height, isNull);
      });
    });
    group("when the height is missing", () {
      test("should reveal nothing for the height", () {
        final result = LicenseParser.parse("DAU\n");

        expect(result.height, isNull);
      });
    });
  });

  group("Parsing Eye Color", () {
    group("when the eye color is empty", () {
      test("should reveal an unknown eye color", () {
        final result = LicenseParser.parse("DAY\n");

        expect(result.eyeColor, EyeColor.unknown);
      });
    });
    group("when the eye color is missing", () {
      test("should reveal an unknown eye color", () {
        final result = LicenseParser.parse("");

        expect(result.eyeColor, EyeColor.unknown);
      });
    });
  });

  group("Parsing the gender", () {
    group("when the gender is empty", () {
      test("should reveal the gender as unknown", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.gender, Gender.unknown);
      });
    });
    group("when the gender field is missing", () {
      test("should reveal the gender as unknown", () {
        final result = LicenseParser.parse("");

        expect(result.gender, Gender.unknown);
      });
    });
  });

  group("Parsing the first name", () {
    group("when the first name is empty", () {
      test("should reveal nothing for the first name", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.firstName, isNull);
      });

      test("should reveal the correct truncation status", () {
        final result = LicenseParser.parse("DDFU\n");

        expect(result.firstNameTruncation, Truncation.unknown);
      });
    });
    group("when the first name field is missing", () {
      test("should reveal nothing for the first name", () {
        final result = LicenseParser.parse("");

        expect(result.firstName, isNull);
      });

      test("should reveal the correct truncation status", () {
        final result = LicenseParser.parse("DDFU\n");

        expect(result.firstNameTruncation, Truncation.unknown);
      });
    });
  });

  group("Parsing the last name", () {
    group("when the last name is empty", () {
      test("should reveal nothing for the last name", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.lastName, isNull);
      });
    });
    group("when the last name field is missing", () {
      test("should reveal nothing for the last name", () {
        final result = LicenseParser.parse("");

        expect(result.lastName, isNull);
      });
    });
  });

  group("Parsing the middle name", () {
    group("when the middle name is empty", () {
      test("should reveal nothing for the middle name", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.middleName, isNull);
      });
      test("should reveal the correct truncation status", () {
        final result = LicenseParser.parse("DDGU\n");

        expect(result.middleNameTruncation, Truncation.unknown);
      });
    });
    group("when the middle name field is missing", () {
      test("should reveal nothing for the middle name", () {
        final result = LicenseParser.parse("");

        expect(result.middleName, isNull);
      });
      test("should reveal the correct truncation status", () {
        final result = LicenseParser.parse("DDGU\n");

        expect(result.middleNameTruncation, Truncation.unknown);
      });
    });
  });

  group("Parsing the expiration date", () {
    group("when the expiration date is missing", () {
      test("should reveal an empty optional date", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.expirationDate, isNull);
      });
      test("should not be expired", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.expirationDate, isNull);
      });
    });
    group("when the expiration date field is missing", () {
      test("should reveal an empty optional date", () {
        final result = LicenseParser.parse("");

        expect(result.expirationDate, isNull);
      });
    });
  });

  group("Parsing the issue date", () {
    group("when the issue date is missing", () {
      test("should reveal an empty optional date", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.issueDate, isNull);
      });
      test("should not be expired", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.issueDate, isNull);
      });
    });
    group("when the issue date field is missing", () {
      test("should reveal an empty optional date", () {
        final result = LicenseParser.parse("");

        expect(result.issueDate, isNull);
      });
    });
  });

  group("Parsing the date of birth", () {
    group("when the date of birth is missing", () {
      test("should reveal an empty optional date", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.dateOfBirth, isNull);
      });
      test("should not be expired", () {
        final result = LicenseParser.parse(emptyLicenseData());

        expect(result.dateOfBirth, isNull);
      });
    });
    group("when the date of birth field is missing", () {
      test("should reveal an empty optional date", () {
        final result = LicenseParser.parse("");

        expect(result.dateOfBirth, isNull);
      });
    });
  });
}

String emptyLicenseData() {
  final rawData =
      "@\n\nANSI 636026080102DL00410288ZA03290015DLDAQ\nDCS\nDDE\nDAC\nDDF\nDAD\nDDG\nDCA\nDCB\nDCD\nDBD\nDBB\nDBA\nDBC\nDAU\nDAY\nDAG\nDAI\nDAJ\nDAK\nDCF\nDCG\nDAW\nDAZ\nDCK\nDDB\nDDK\nZAZ\nZAB\nZAC";
  return rawData;
}
