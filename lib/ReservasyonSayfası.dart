import 'package:flutter/material.dart';
import 'package:reserv_app/MusteriBilgisiSayfasi.dart';

class ReservasyonSayfasi extends StatefulWidget {
  @override
  _ReservasyonPageState createState() => _ReservasyonPageState();
}

class _ReservasyonPageState extends State<ReservasyonSayfasi> {
  final TextEditingController adiController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefonNumController = TextEditingController();
  final TextEditingController pasaportNumController = TextEditingController();
  final TextEditingController checkinTarihiController = TextEditingController();
  final TextEditingController checkoutTarihiController =
      TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now())
      controller.text = "${picked.day}-${picked.month}-${picked.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Image.asset(
            'images/applogo.jpg',
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.black),
              ),
              child: TextField(
                controller: adiController,
                decoration: InputDecoration(
                  hintText: 'Adınızı Giriniz',
                  contentPadding: EdgeInsets.all(5),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Eposta Adresinizi Giriniz',
                contentPadding: EdgeInsets.all(5),
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: telefonNumController,
              decoration: InputDecoration(
                hintText: 'Telefon Numaranızı Giriniz',
                contentPadding: EdgeInsets.all(5),
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: pasaportNumController,
              decoration: InputDecoration(
                hintText: 'Pasaport Numaranızı Giriniz',
                contentPadding: EdgeInsets.all(5),
                prefixIcon: Icon(Icons.contact_phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: checkinTarihiController,
                  decoration: InputDecoration(
                    hintText: 'Check-In Tarihi',
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  onTap: () => _selectDate(context, checkinTarihiController),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: checkoutTarihiController,
                  decoration: InputDecoration(
                    labelText: 'Check-Out Date',
                    hintText: 'Check-Out Tarihi',
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  onTap: () => _selectDate(context, checkoutTarihiController),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                    builder: (context) => MusteriBilgisiSayfasi(
                      adi: adiController.text,
                      eposta: emailController.text,
                      telefonNum: telefonNumController.text,
                      pasaportNum: pasaportNumController.text,
                      checkIn: checkinTarihiController.text,
                      checkOut: checkoutTarihiController.text,
                    ),
                  ),
                );
              },
              child: Text(
                'Kaydet',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
