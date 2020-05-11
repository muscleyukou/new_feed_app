import 'package:chopper/chopper.dart';
part 'api_services.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static const BASE_URL = "http://newsapi.org/v2";
  static const API_KEY = '765be0211378448c9a65f423ed0596f3';

  @Get(path: "/top-headlines")
  Future<Response> getHeadLines(
      {@Query("country") String country = 'jp',
      @Query('pageSize') int pageSize = 10,
      @Query('apiKey') String apiKey = ApiService.API_KEY});

  @Get(path: "/top-headlines")
  Future<Response> getKeywordNews({
    @Query('country') String country = 'jp',
    @Query('pageSize') int pageSize = 30,
    @Query('q') String keyword,
    @Query('apiKey') String apiKey = ApiService.API_KEY
  });
  @Get(path: "/top-headlines")
  Future<Response> getCategoryNews({
    @Query('country') String country = 'jp',
    @Query('pageSize') int pageSize = 30,
    @Query('category') String category,
    @Query('apiKey') String apiKey = ApiService.API_KEY

  });

}
