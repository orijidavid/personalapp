import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("My Test App"),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Welcome to The App", style: TextStyle(
              color: Colors.pink,
              fontSize: 27,
              fontWeight: FontWeight.w700,
              fontFamily: "Times New Roman",
              backgroundColor: Colors.black,
            ),),

            SizedBox(height: 20,),

            Image.asset("assets/images/21635.jpg", height: 100, width: 160, fit: BoxFit.cover,),

            SizedBox(height: 20,),

            ElevatedButton.icon(
                onPressed: (){},
                icon: Icon(Icons.add),
                label: Text("Press me"),)
          ],
        ),
      ),
    );
  }
}
