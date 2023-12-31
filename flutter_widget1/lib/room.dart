import 'package:flutter/material.dart';
import 'package:flutter_widget1/booking.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  bool isLiked = false; // Track the liked state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Mission 1",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.blue.shade200, Colors.white],
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      width: double.infinity,
                      child: ClipRRect(
                        child: Image.asset(
                          'images/img.jpeg',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  width: double.infinity,
                  margin: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (String imageAsset in [
                        'images/img2.jpeg',
                        'images/img3.jpeg',
                        'images/img4.jpeg',
                        'images/img5.jpeg',
                      ])
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imageAsset,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                Text(
                  "Welcome to Golden Tulip Holland Batu",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text(
                          "Situated in the city of Batu, 200 metres from Jatim Park 2, Golden Tulip Holland Resort Batu boasts children's playground and an outdoor pool with water slides. Guests can enjoy a meal at the restaurant and free WiFi can be accessed in all rooms. Free private parking is available on site. Every air-conditioned room comes with a private balcony overlooking the city, Mount Arjuna or Mount Panderman. The private bathroom is stocked with bathrobes and slippers. There is a 24-hour front desk and concierge service at the property. The staff can also assist with banquet and meeting arrangements. Jatim Park 1 is 700 metres from Golden Tulip Holland Resort Batu, while Batu Night Spectacular is 1.1 km from the property. The nearest airport is Abdul Rachman Saleh Airport, 21 km from the property. Couples particularly like the location — they rated it 8.4 for a two-person trip.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade300, Colors.white],
                  ),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BookingPage();
                    }));
                  },
                  child: Text(
                    "Book Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 2,
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                    primary: Color.fromARGB(
                        0, 255, 255, 255), // Make the button transparent
                    textStyle: TextStyle(fontSize: 20),
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
