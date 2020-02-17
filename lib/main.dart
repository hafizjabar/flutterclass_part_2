import 'package:flutter/material.dart';
import 'package:my_form/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyFormPage(),
    );
  }
}

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Form"),
      ),
      body: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    "Form app",
                  ),
                  Image.network(
                      "https://cdn.vox-cdn.com/thumbor/yVXDIBH1YlnRXPn7TKWARkqHn8M=/0x0:2040x1360/1200x800/filters:focal(857x517:1183x843)/cdn.vox-cdn.com/uploads/chorus_image/image/66246003/acastro_191014_1777_google_pixel_0005.0.0.jpg"),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter your name'),
                    controller: namecontroller,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter your email'),
                    controller: emailcontroller,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter phone number'),
                    controller: phonecontroller,
                  ),
                  FlatButton(
                    child: Text("Send data"),
                    onPressed: () {
                      showAlertDialog();
                    },
                  ),
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () => showSnackBar(context),
      ),
    );
  }

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text("Are you sure want to send the info"),
              actions: <Widget>[
                new FlatButton(
                    child: new Text('Cancel'),
                    onPressed: () {
                      print("Cancel is pressed");
                      Navigator.pop(context);
                    }),
                new FlatButton(
                  child: new Text('Okay!'),
                  onPressed: () {
                    print("Okay is pressed");
                    print(
                        "Name: ${namecontroller.text} Email: ${emailcontroller.text} Phone: ${phonecontroller.text}");
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                namecontroller.text,
                                emailcontroller.text,
                                phonecontroller.text)));
                  },
                )
              ]);
        });
  }

  showSnackBar(context) {
    final snackBar = SnackBar(content: Text("This is a snackbar"));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}