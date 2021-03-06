import 'package:dartz/dartz.dart';

import '../../../../core/shared/errors/i_app_exception.dart';
import '../dtos/get_weather_dto.dart';
import '../entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<Either<IAppException, WeatherEntity>> getWeatherInfo(GetWeatherDTO params);
}
