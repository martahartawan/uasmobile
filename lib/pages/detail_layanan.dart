import 'package:cleaningservice/models/layanan_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailLayanan extends StatelessWidget {
  final Layanan layanans;
  const DetailLayanan({required this.layanans});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('Order Layanan'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                        'http://ilkom03.mhs.rey1024.com/images/' +
                            layanans.image),
                  ),
                  Text(
                    layanans.name,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    layanans.description,
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.check_box,
                          size: 40,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green))),
                  )
                ],
              ),
            )));
  }

  Future<void> orderLayanan() async {
    final response = await http.post(
      Uri.parse('http://ilkom03.mhs.rey1024.com/api/order'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer',
      },
    );
  }
}
