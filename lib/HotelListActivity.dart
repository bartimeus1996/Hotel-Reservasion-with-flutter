import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reserv_app/ReservasyonSayfas%C4%B1.dart';
import 'dart:convert';
import 'data/HotelSearchResponse.dart';

class HotelListActivity extends StatefulWidget {
  final int destinationId;

  HotelListActivity({required this.destinationId});

  @override
  _HotelListActivityState createState() => _HotelListActivityState();
}

class _HotelListActivityState extends State<HotelListActivity> {
  List<Hotel> hotelList = [];

  @override
  void initState() {
    super.initState();
    fetchHotelList();
  }

  Future<void> fetchHotelList() async {
    final Uri uri = Uri.https(
      "booking-com.p.rapidapi.com",
      "/v2/hotels/search",
      {
        'order_by': "popularity",
        'adults_number': "2",
        'checkin_date': "2023-12-12",
        'filter_by_currency': "AED",
        'dest_id': widget.destinationId.toString(),
        'locale': "en-gb",
        'checkout_date': "2023-12-29",
        'units': "metric",
        'room_number': "1",
        'dest_type': "city",
      },
    );

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "9f36b2640amsh4da896e1a1b169ep1aa97djsn04eef59ee7fe",
      "X-RapidAPI-Host": "booking-com.p.rapidapi.com",
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);

      final HotelSearchResponse hotelSearchResponse =
          HotelSearchResponse.fromJson(responseBody);

      setState(() {
        hotelList = hotelSearchResponse.results;
      });

      print("Response count: ${hotelSearchResponse.count}");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error fetching hotel list"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hotel List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Oteller Listesi',
              style: TextStyle(
                fontFamily: 'cursive',
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hotelList.length,
              itemBuilder: (context, index) {
                final hotel = hotelList[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        hotel.photoMainUrl,
                        width: double.infinity,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                hotel.reviewScoreWord,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 33, 243, 170),
                            fixedSize: Size(150, 40),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReservasyonSayfasi()));
                          },
                          child: Text(
                            'Select',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
