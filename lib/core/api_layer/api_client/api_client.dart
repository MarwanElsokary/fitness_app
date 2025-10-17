import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'endpoints.dart';

part 'api_client.g.dart';

@singleton
@RestApi(baseUrl: Endpoints.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;
}
