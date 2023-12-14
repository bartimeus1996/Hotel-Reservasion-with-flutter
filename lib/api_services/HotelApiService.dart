import 'package:http/http.dart' as http;

class HotelApiService {
  static const String baseUrl = "https://booking-com.p.rapidapi.com/v2/hotels/search";

  static Map<String, String> headers = {
    "X-RapidAPI-Key": "01ec004f7emsh53d81c13d336483p137f2ejsndb904c5e22eb",
    "X-RapidAPI-Host": "booking-com.p.rapidapi.com",
  };

  Future<http.Response> getHotelSearch({
    required String orderBy,
    required int adultsNumber,
    required String checkinDate,
    required String filterByCurrency,
    required int destId,
    required String locale,
    required String checkoutDate,
    required String units,
    required int roomNumber,
    required String destType,
  }) async {
    final Uri uri = Uri.https(baseUrl, '', {
      'order_by': orderBy,
      'adults_number': adultsNumber.toString(),
      'checkin_date': checkinDate,
      'filter_by_currency': filterByCurrency,
      'dest_id': destId.toString(),
      'locale': locale,
      'checkout_date': checkoutDate,
      'units': units,
      'room_number': roomNumber.toString(),
      'dest_type': destType,
    });

    final response = await http.get(uri, headers: headers);
    return response;
  }
}
