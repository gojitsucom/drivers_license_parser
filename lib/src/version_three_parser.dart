import 'field_mapper.dart';
import 'field_parser.dart';
import 'license_date_parser.dart';

class VersionThreeFieldMapper extends FieldMapper {
  static const versionThreeFieldMapperOverrides = {
    "firstName": "DCT",
  };

  VersionThreeFieldMapper()
      : super(fields: {
          ...FieldMapper.standardFieldMappings,
          ...versionThreeFieldMapperOverrides,
        });
}

class VersionThreeFieldParser extends FieldParser {
  VersionThreeFieldParser(String data)
      : super(data: data, fieldMapper: VersionThreeFieldMapper());

  @override
  LicenseDateParser licenseDateParser = LicenseDateParser.yearMonthDay;
}
