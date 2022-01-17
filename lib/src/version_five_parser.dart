import 'field_mapper.dart';
import 'field_parser.dart';

class VersionFiveFieldMapper extends FieldMapper {}

class VersionFiveFieldParser extends FieldParser {
  VersionFiveFieldParser(String data)
      : super(
          data: data,
          fieldMapper: VersionFiveFieldMapper(),
        );
}
