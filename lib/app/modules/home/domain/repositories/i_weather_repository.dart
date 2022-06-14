import 'package:dartz/dartz.dart';

import '../../../../core/shared/exceptions/i_app_exception.dart';
import '../dtos/get_weather_dto.dart';
import '../entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<Either<IAppException, WeatherEntity>> getWeather(GetWeatherDTO params);
}