import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:reserv_app/data/location_response.dart';
part 'LocationApi.g.dart';

@RestApi(baseUrl: "https://booking-com.p.rapidapi.com/v1/")
abstract class LocationApi {
  factory LocationApi(Dio dio, {String baseUrl}) = _LocationApi;

  @GET("hotels/locations")
  Future<LocationResponse> getLocations(
    @Header("X-RapidAPI-Key") String apiKey,
    @Header("X-RapidAPI-Host") String apiHost,
    @Query("name") String cityName,
    @Query("locale") String locale,
  );
}
