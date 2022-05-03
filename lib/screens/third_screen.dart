import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdScreen extends StatelessWidget {
  static const routeName = '/third-screen';
  const ThirdScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          "Third Screen",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.orange,
                //padding: EdgeInsets.symmetric(horizontal: 8.0),
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
                  child: SvgPicture.asset(
                    'images/mail.svg',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Text(
                  "Thank you for your response",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 16.0, left: 8.0, right: 8.0),
                child: Text(
                  "Our team will contact you soon.",
                  textAlign: TextAlign.center,
                ),
              ),
              
              
                RaisedButton(
                color: Colors.orange,
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ]
    ),
        )
    )
    );
  }
}