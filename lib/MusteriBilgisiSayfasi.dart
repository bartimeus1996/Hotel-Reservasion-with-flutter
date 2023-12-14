import 'package:flutter/material.dart';

class MusteriBilgisiSayfasi extends StatelessWidget {
  final String adi;
  final String eposta;
  final String telefonNum;
  final String pasaportNum;
  final String checkIn;
  final String checkOut;

  MusteriBilgisiSayfasi({
    required this.adi,
    required this.eposta,
    required this.telefonNum,
    required this.pasaportNum,
    required this.checkIn,
    required this.checkOut,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Musteri Bilgisi'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/musteri_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    'Müşteri Belgisi',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'cursive',
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'images/applogo.jpg',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Otelemiz hoş geldiniz',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 350,
                    child: Card(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Adı : ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  adi,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Eposta : ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  eposta,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Telefon Numara : ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  telefonNum,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Pasaport Numara : ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  pasaportNum,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Check-In : ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  checkIn,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  'Check-Out : ',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  checkOut,
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
