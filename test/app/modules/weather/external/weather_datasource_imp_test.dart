import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/app/core/shared/helpers/value_objects/place.dart';
import 'package:weather_app/app/core/shared/services/clients/i_client_service.dart';
import 'package:weather_app/app/modules/weather/domain/dtos/get_weather_dto.dart';

import 'package:weather_app/app/modules/weather/external/datasources/weather_datasource_imp.dart';
import 'package:weather_app/app/modules/weather/external/errors/datasource_errors.dart';
import 'package:weather_app/app/modules/weather/infra/datasources/i_weather_datasource.dart';

class DioClientMock extends Mock implements IClientService {}

void main() {
  group('Weather Datasource | ', () {
    late final IClientService dioClient;
    late final IWeatherDatasource sut;
    late final Place defaultPlace;

    setUpAll(() {
      dioClient = DioClientMock();
      sut = WeatherDatasourceImp(dioClient);
      defaultPlace = Place('Test Place');
    });

    final response = ResponseService(
      data: 'xxxxxxx',
      requestOptions: RequestOptions(
        path: 'test.url',
      ),
    );

    test('should be able to get a ResponseService instace with data', () async {
      when(() => dioClient.get(any())).thenAnswer((_) async => response);

      final result = await sut.getWeather(GetWeatherDTO(place: defaultPlace));

      expect(result, isA<ResponseService>());
      expect(result.data, isNotEmpty);
    });

    test('should throw a DatasourceLoadedError when calls datasource', () async {
      when(() => dioClient.get(any())).thenThrow(DatasourceLoadedError(message: 'Test Error'));

      final result = sut.getWeather(GetWeatherDTO(place: defaultPlace));

      expect(result, throwsA(isA<DatasourceLoadedError>()));
    });
  });
}
