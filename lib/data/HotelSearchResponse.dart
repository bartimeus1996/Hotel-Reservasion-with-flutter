class Hotel {
  final String name;
  final String reviewScoreWord;
  final String photoMainUrl;

  Hotel(
      {required this.name,
      required this.reviewScoreWord,
      required this.photoMainUrl});

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      reviewScoreWord: json['reviewScoreWord'],
      photoMainUrl: json['photoMainUrl'],
    );
  }
}

class HotelSearchResponse {
  final int count;
  final List<Hotel> results;

  HotelSearchResponse({required this.count, required this.results});

  factory HotelSearchResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> results = json['results'];
    List<Hotel> hotelList =
        results.map((data) => Hotel.fromJson(data)).toList();

    return HotelSearchResponse(
      count: json['count'],
      results: hotelList,
    );
  }
}
