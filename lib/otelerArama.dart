import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'HotelListActivity.dart';

class SearchActivity extends StatefulWidget {
  @override
  _SearchActivityState createState() => _SearchActivityState();
}

class _SearchActivityState extends State<SearchActivity> {
  TextEditingController cityController = TextEditingController();
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Activity'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg2.jpg'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('images/applogo.jpg'),
              TextField(
                style: TextStyle(
                  fontSize: 22.0,
                ),
                controller: cityController,
                decoration: InputDecoration(
                  hintText: "Şehir Adı Geriniz",
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    final String name = cityController.text;
                    try {
                      final LocationApi = await dio.get(
                        'https://booking-com.p.rapidapi.com/v1/hotels/locations?name=$name&locale=en-gb',
                        options: Options(
                          headers: {
                            'X-RapidAPI-Host': 'booking-com.p.rapidapi.com',
                            'X-RapidAPI-Key':
                                '9f36b2640amsh4da896e1a1b169ep1aa97djsn04eef59ee7fe',
                          },
                        ),
                      );

                      if (LocationApi.statusCode == 200) {
                        final List<Map<String, dynamic>> LocationResponse =
                            List<Map<String, dynamic>>.from(LocationApi.data);
                        if (LocationResponse.isNotEmpty) {
                          final String destinationId =
                              LocationResponse[0]['dest_id'];
                          final int destinationIdInt =
                              int.tryParse(destinationId) ?? 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HotelListActivity(
                                  destinationId: destinationIdInt),
                            ),
                          );

                          print("dest id: $destinationId");
                        } else {
                          print("No destination ID found.");
                        }
                      } else {
                        print(
                            "Failed to get location data. Status Code: ${LocationApi.statusCode}");
                      }
                    } catch (e) {
                      print("Error: $e");
                    }
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 33, 243, 170),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: const Size(220, 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
