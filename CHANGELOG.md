## 1.2.1
- Fix an issue where user data contains key collisions and parser extracts the wrong info

## 1.2.0
- Fix V1 Driver's License Number parsing. In some cases the DBJ (unique customer ID) can be used but in others it is the more common DAQ field. I added a `driversLicenseNumber` field to the `License` class and the value of this field is mapped to the correct value which is usually `customerId`. This is less confusing to use and allows us to support both cases when it is either DBJ or DAQ.

## 1.1.0
- fix locale-sensitive date parsing. Add a US/Canadian parsing mode option.

## 1.0.0
- Initial version. Direct port of https://github.com/ksoftllc/license-parser. Thank you https://github.com/ksoftllc!
