///
///  AAMVA Issuing Countries
///
///  - UnitedStates: The USA
///  - Canda: Canada, eh?
///  - Unknown: When the issuing country is not available
///
enum IssuingCountry {
  unitedStates,
  canada,
  unknown,
}

///
///  AAMVA Genders
///
///  - Male: Male
///  - Female: Female
///  - Other: Not yet part of the AAMVA spec
///  - Unknown: When the gender cannot be determined
///
enum Gender {
  male,
  female,
  other,
  unknown,
}

///
///  AAMVA Eye Colors
///
///  - Black: Black eyes
///  - Blue: Blue eyes
///  - Brown: Brown eyes
///  - Gray: Gray eyes
///  - Green: Green eyes
///  - Hazel: Hazel eyes
///  - Maroon: Maroon eyes
///  - Pink: Pink eyes
///  - Dichromatic: Dichromatic eyes
///  - Unknown: Unknown eye color
///
enum EyeColor {
  black,
  blue,
  brown,
  gray,
  green,
  hazel,
  maroon,
  pink,
  dichromatic,
  unknown,
}

///
///  AAMVA hair colors
///
///  - Bald: Bald hair
///  - Black: Black hair
///  - Blond: Blond hair
///  - Brown: Brown hair
///  - Grey: Grey hair
///  - Red: Red hair
///  - Sandy: Sandy hair
///  - White: White hair
///  - Unknown: Unknown hair color
///
enum HairColor {
  bald,
  black,
  blond,
  brown,
  grey,
  red,
  sandy,
  white,
  unknown,
}

///
///  AAMVA Name Truncations
///
///  - Truncated: The name was truncated
///  - None: The name was not truncated
///  - Unknown: When the truncation cannot be determined
///
enum Truncation {
  truncated,
  none,
  unknown,
}

///
///  AAMVA Name Suffixes
///
///  - Junior: Junior, Jr.
///  - Senior: Senior, Sr.
///  - First: First, I, 1st
///  - Second: Second, II, 2nd
///  - Third: Third, III, 3rd
///  - Fourth: Fourth, IV, 4th
///  - Fifth: Fifth, V, 5th
///  - Sixth: Sixth, VI, 6th
///  - Seventh: Seventh, VII, 7th
///  - Eighth: Eighth, VIII, 8th
///  - Ninth: Ninth, IX, 9th
///  - Unknown: When the name suffix is unknown
///
enum NameSuffix {
  junior,
  senior,
  first,
  second,
  third,
  fourth,
  fifth,
  sixth,
  seventh,
  eighth,
  ninth,
  unknown,
}
