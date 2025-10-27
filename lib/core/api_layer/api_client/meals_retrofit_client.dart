import 'package:dio/dio.dart';
import 'package:fitness_app/core/api_layer/api_client/endpoints.dart';
import 'package:fitness_app/features/home/data/models/recommendation_meals_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'meals_retrofit_client.g.dart';

@injectable
@RestApi(baseUrl: Endpoints.mealsBaseUrl)
abstract class MealsRetrofitClient {
  @factoryMethod
  factory MealsRetrofitClient(Dio dio) = _MealsRetrofitClient;
  @GET(Endpoints.mealsCategories)
  Future<RecommendationMealsDto> getFoodRecommendation();
}
