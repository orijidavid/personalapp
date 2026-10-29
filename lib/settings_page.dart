import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Settings"),
      ),


      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
        
            Padding(padding: EdgeInsets.symmetric(horizontal: 60, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Theme", style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
                Text("Change the theme", style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                )),
        
                SizedBox(height: 30,),
        
                Text("Font Size", style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
                Text("100%", style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                )),
        
                SizedBox(height: 30,),
        
                Text("Only Uppercase", style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
                Text("Yes / No", style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                )),
        
                SizedBox(height: 30,),
        
                Text("Line Spacing", style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
                Text("Standard", style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                )),
        
                SizedBox(height: 30,),
        
                Text("Note position", style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
                Text("Footer", style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                )),
        
                SizedBox(height: 30,),
        
        
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}
