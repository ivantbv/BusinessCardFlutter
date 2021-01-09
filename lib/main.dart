//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade400,
        body: ScaffoldBody(),
      ),
    );
  }
}

//just the scaffold in a separate statelesswidget
class ScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //the void function is called in the onTap property in the cards. It copies a text to the clipboard
    void copyToClip(String text) {
      Clipboard.setData(new ClipboardData(text: text)).then((result) {
        final snackBar = SnackBar(
          content: Text('Copied to Clipboard'),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {},
          ),
        );
        // ignore: deprecated_member_use
        Scaffold.of(context).showSnackBar(snackBar);
      });
    }

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/ivan.jpg'),
          ),
          Text(
            'Ivan Georgiev',
            style: TextStyle(
              fontFamily: 'JimNightshade',
              fontSize: 40.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'Flutter & JS Developer'.toUpperCase(),
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 20.0,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(
            width: 160.0,
            height: 15.0,
            child: Divider(
              thickness: 2.0,
              color: Colors.teal.shade50,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 30.0,
            ),
            // decoration: BoxDecoration(
            //   color: Colors.teal.shade50,
            //   border: Border.all(color: Colors.blueGrey, width: 3.0),
            //   borderRadius: BorderRadius.circular(8.0),
            // ),
            child: ListTile(
              onTap: () {
                copyToClip('+79021234567');
              },
              title: Text(
                '+7 902 123-45-67',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 22.0,
                  color: Colors.teal,
                ),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.teal,
              ),
              subtitle: Text('Copy phone number'),
            ),
          ),
          SizedBox(
            height: 1.0,
          ),
          Card(
            margin: EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 30.0,
            ),
            // decoration: BoxDecoration(
            //   color: Colors.teal.shade50,
            //   border: Border.all(color: Colors.blueGrey, width: 3.0),
            //   borderRadius: BorderRadius.circular(8.0),
            // ),
            child: ListTile(
              onTap: () {
                copyToClip('ivantbv@gmail');
                // Clipboard.setData(new ClipboardData(text: 'ivantbv@gmail.com'))
                //     .then((result) {
                //   final snackBar = SnackBar(
                //     content: Text('Copied to Clipboard'),
                //     action: SnackBarAction(
                //       label: 'Undo',
                //       onPressed: () {},
                //     ),
                //   );
                //   // ignore: deprecated_member_use
                //   Scaffold.of(context).showSnackBar(snackBar);
                // });
              },
              title: Text(
                'ivantbv@gmail.com',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 22.0,
                  color: Colors.teal,
                ),
              ),
              leading: Icon(Icons.email, color: Colors.teal),
              subtitle: Text('Copy email'),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            child: ListTile(
              onTap: () {
                copyToClip('https://github.com/ivantbv');
              },
              title: Text(
                'Github profile',
                style: TextStyle(
                  color: Colors.teal,
                  fontFamily: 'SourceSansPro',
                  fontSize: 22.0,
                ),
              ),
              leading: Icon(Icons.code, color: Colors.teal),
              subtitle: Text('Tap to copy URL'),
            ),
          )
        ],
      ),
    );
  }
}
