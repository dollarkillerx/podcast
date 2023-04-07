import '../../common/library/base_provider.dart';

class MusicDetailsProvider extends BaseProvider {
  chapter(String id, bool asc, int offset) => gQuery(graphSQL: chapterSQL, variables: {
    "id": id,
    "asc": asc,
    "offset": offset,
  });
}

var chapterSQL = '''
query chapter(\$id: String!, \$asc: Boolean!, \$offset: Int64!) {
  chapter(id: \$id, asc: \$asc, offset: \$offset) {
    total
    chapters{
      index
      title
      views
      playUrl
    }
  }
}
''';
