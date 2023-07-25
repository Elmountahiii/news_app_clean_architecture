import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article_model.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: BaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/latest_headlines")
  @Headers(<String, dynamic>{'x-api-key': API_KEY})
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("countries") String? countries,
  });
}
