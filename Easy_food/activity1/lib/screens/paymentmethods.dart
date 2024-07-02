import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  var selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(
            "Payment",
            style: TextStyle(color: Colors.black),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.money),
                SizedBox(width: 5),
                Text("Cash"),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: SizedBox()),
                Radio(
                    activeColor: Colors.black,
                    value: "cash",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    })
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 2.0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.payment),
                SizedBox(
                  width: 5,
                ),
                Text("....1223"),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: SizedBox()),
                Radio(
                    activeColor: Colors.black,
                    value: "card",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    }),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 2.0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.paypal),
                SizedBox(width: 5),
                Text("PayPal"),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: SizedBox()),
                Radio(
                    activeColor: Colors.black,
                    
                    value: "paypal",
                    groupValue: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    }),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 2.0,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 5),
                Text("Other Payment"),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
