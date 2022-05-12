import 'field_mapper.dart';
import 'field_parser.dart';

class VersionThreeFieldMapper extends FieldMapper {
  static const versionThreeFieldMapperOverrides = {
    FieldMapper.firstName: "DCT",
  };

  VersionThreeFieldMapper()
      : super(fields: {
          ...FieldMapper.standardFieldMappings,
          ...versionThreeFieldMapperOverrides,
        });
}

class VersionThreeFieldParser extends FieldParser {
  VersionThreeFieldParser(String data,
      {required DateFormatLocale dateFormatLocale})
      : super(
          data: data,
          fieldMapper: VersionThreeFieldMapper(),
          dateFormatLocale: dateFormatLocale,
        );
}
