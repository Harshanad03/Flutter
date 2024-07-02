import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Center(child: Text("Order")),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        backgroundColor: Colors.white,
        title: Center(
          child: Center(
            child: Text(
              "Order",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Active"),
              Text(
                "Completed",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.orange.shade800),
              ),
              Text("Cancelled"),
            ],
          ),
          Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
          SizedBox(height: 40),
          ClipRRect(borderRadius: BorderRadius.circular(10)),
          Container(
            color: Color.fromARGB(255, 249, 207, 173),
            height: 140,
            width: 400,
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhvDiBjIOuh432wPncAabqDh5Okp3_qV6zzw&usqp=CAU",
                    height: 100,
                    width: 170),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Egg Biryani"),
                    Row(
                      children: [
                        Icon(Icons.delivery_dining,
                            color: Colors.orange.shade800),
                        Text("Free Delivery",
                            style: TextStyle(color: Colors.orange.shade800)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled_outlined),
                        Text("10 - 15min"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("\$12.00"),
                        SizedBox(
                          width: 70,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.all(14.0),
                              //maximumSize: Size(200, 50),
                              backgroundColor: Color.fromARGB(255, 239, 82, 34),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 1.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 237, 203, 6),
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            color: Color.fromARGB(255, 249, 207, 173),
            height: 140,
            width: 400,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg",
                    height: 100,
                    width: 150),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Farmhouse pizza"),
                    Row(
                      children: [
                        Icon(Icons.delivery_dining,
                            color: Colors.orange.shade800),
                        Text("Free Delivery",
                            style: TextStyle(color: Colors.orange.shade800)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled_outlined),
                        Text("10 - 15min"),
                      ],
                    ),
                    Row(
                      children: [
                        Text("\$10.00"),
                        SizedBox(
                          width: 70,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              // padding: EdgeInsets.all(14.0),
                              //maximumSize: Size(200, 50),
                              backgroundColor: Color.fromARGB(255, 239, 82, 34),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 1.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 237, 203, 6),
                                ),
                                Text(
                                  "4.4",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
