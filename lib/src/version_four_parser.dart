import 'field_mapper.dart';
import 'field_parser.dart';

class VersionFourFieldMapper extends FieldMapper {}

class VersionFourFieldParser extends FieldParser {
  VersionFourFieldParser(String data)
      : super(
          data: data,
          fieldMapper: VersionFourFieldMapper(),
        );
}
