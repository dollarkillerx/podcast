import '../../../../common/library/base_provider.dart';

class RecommendProvider extends BaseProvider {
  homePage(String pageClass) => gQuery(graphSQL: homePageSQL, variables: {
        "class": pageClass,
      });
}

var homePageSQL = '''
query homePage(\$class: HomePageClass!) {
  homePage(class: \$class) {
    carousel {
      img
      title
      ad
      jumpType
      jumpUrl
    }
    boxs{
      title
      books{
        id
        title
        subTitle
        img
        score
        end
        episode
        views
        author{
          id
          name
          avatar
        }
      }
      arrangement
    }
  }
}
''';
