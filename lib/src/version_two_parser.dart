import 'field_mapper.dart';
import 'field_parser.dart';

class VersionTwoFieldMapper extends FieldMapper {
  static const versionTwoFieldMapperOverrides = {
    "firstName": "DCT",
  };

  VersionTwoFieldMapper()
      : super(fields: {
          ...FieldMapper.standardFieldMappings,
          ...versionTwoFieldMapperOverrides,
        });
}

class VersionTwoFieldParser extends FieldParser {
  VersionTwoFieldParser(String data, {required DateFormatLocale dateFormatLocale})
      : super(
          data: data,
          fieldMapper: VersionTwoFieldMapper(),
          dateFormatLocale: dateFormatLocale,
        );
}
