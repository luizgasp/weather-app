// ignore_for_file: unnecessary_lambdas

import '../../domain/entities/forecast_entity.dart';
import '../../domain/entities/weather_entity.dart';

import '../errors/infra_errors.dart';
import 'forecast_mapper.dart';

class WeatherMapper extends WeatherEntity {
  const WeatherMapper({
    required super.temperature,
    required super.wind,
    required super.description,
    required super.forecasts,
  });

  factory WeatherMapper.fromMap(Map<String, dynamic> map) {
    try {
      return WeatherMapper(
        temperature: map['temperature'] ?? '',
        wind: map['wind'] ?? '',
        description: map['description'] ?? '',
        forecasts: List<ForecastEntity>.from(map['forecast']?.map((e) => ForecastMapper.fromMap(e))),
      );
    } on InfraWeatherError catch (e) {
      throw WeatherMapperException(message: e.message, stackTrace: e.stackTrace);
    }
  }
}
