import 'package:cleaningservice/models/layanan_model.dart';
import 'package:cleaningservice/pages/detail_layanan.dart';
import 'package:cleaningservice/pages/login_page.dart';
import 'package:cleaningservice/pages/profile_user.dart';
import 'package:cleaningservice/services/layanan_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final screens = [Home(), Text('Layanan'), Text(''), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: screens.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepPurpleAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "Explore"),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket), label: "Ticket"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile')
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future data;
  List<Layanan> layanans = [];

  loadLayanans() {
    data = LayananServices().getLayanans();
    data.then((value) {
      setState(() {
        layanans = value;
      });
    });
  }

  @override
  void initState() {
    loadLayanans();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (layanans.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return SafeArea(
          child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 300,
                      width: double.maxFinite,
                      color: Colors.green,
                    ),
                  ),
                  Center(
                    child: Image.network(
                      'https://www.pngkey.com/png/full/945-9452110_powered-by-arforms-cleaning-services.png',
                      height: 200,
                    ),
                  ),
                  const Positioned(
                    bottom: 60,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "sjfkjsekfjeskfjeskfjeskfjeskfjeskjfsekjfeskfkesjfksejfsekjfesk",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              Text('All Layanan'),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 210,
                  child: Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: layanans.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8, left: 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailLayanan(layanans: layanans[i]);
                                }));
                              },
                              child: Container(
                                width: 250,
                                height: 60,
                                child: Card(
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(layanans[i].name),
                                    ),
                                    subtitle: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                          'http://ilkom03.mhs.rey1024.com/images/' +
                                              layanans[i].image),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    }
  }
}
