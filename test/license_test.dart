import 'package:drivers_license_parser/src/license.dart';
import 'package:drivers_license_parser/src/postal_code.dart';
import 'package:test/test.dart';

void main() {
  group("License", () {
    group("Acceptability", () {
      group("when the license has yet to be issued", () {
        test("should not be acceptable", () {
          var sut = License(
            issueDate: DateTime(2900, 1, 1),
            driversLicenseNumber: "any",
          );
          expect(sut.isAcceptable(), isFalse);
        });
      });
      group("when the license is expired", () {
        test("should not be acceptable", () {
          var sut = License(
            expirationDate: DateTime(1900, 1, 1),
            driversLicenseNumber: "any",
          );
          expect(sut.isAcceptable(), isFalse);
        });
      });
      group("when all essential fields are present", () {
        test("should be acceptable", () {
          var sut = License(
            driversLicenseNumber: "any",
            expirationDate: DateTime(3000, 1, 1),
            lastName: "SOMETHING",
            firstName: "SOMETHING",
            middleName: "SOMETHING",
            issueDate: DateTime(2000, 1, 1),
            dateOfBirth: DateTime(1970, 1, 1),
            height: 65.0,
            streetAddress: "SOMETHING",
            city: "SOMETHING",
            state: "CA",
            postalCode: PostalCode(postalCode: "12345", extension: "6789"),
            documentId: "SOMETHING",
          );
          expect(sut.isAcceptable(), isTrue);
        });
      });
    });
  });
}
