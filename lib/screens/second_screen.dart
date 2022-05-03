// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/third_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SecondScreen extends StatelessWidget {
  static const routeName = '/second-screen';
  SecondScreen({
    Key? key,
    this.name ,
    this.email,
    this.phone,
    this.address,
    this.state,
    this.image1,
    this.image2,
    this.dateOfBirth,
    this.panName,
    this.panNumber,
    this.gender
  }) : super(key: key);

  File? image1;
  File? image2;
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? state;
  final String? gender;
  final String? panName;
  final String? panNumber;
  final String? dateOfBirth;
 @override
  Widget build(BuildContext context) {
    print(name);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Screen",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Text(
                "Your Details!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            
            Container(
              height: 200,
                width: 200,
                 margin: EdgeInsets.all(8),
                 child:image1 != null ? Image.file(
                 image1!,
                 width: 100,
                 height: 100,
                 fit: BoxFit.cover,): FlutterLogo(size: 100,),
            ),
          
            //Center(child: Text("Your Picture",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            
            // Container(
            //   height: 200,
            //     width: 200,
            //      margin: EdgeInsets.all(8),
            //      child:image1 != null ? Image.file(
            //      image1!,
            //      width: 100,
            //      height: 100,
            //      fit: BoxFit.cover,): FlutterLogo(size: 100,),
            // ),
            // Center(child: Text("Your Aadhar",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),

            //card_widget(),
            //   Container(
              //   height: 250,
              //   width: 350,
              //    margin: EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.white,
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.white,
              //         offset: Offset(0, 2),
              //         blurRadius: 6,
              //       ),
              //     ],
              //   ),
              //  child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //     image1 != null ? ClipOval(
              //     child: Image.file(
              //     image1!,
              //     width: 160,
              //     height: 160,
              //     fit: BoxFit.cover,),
              //   ): FlutterLogo(size: 150,),
            
            card_widget(text: name.toString(),icon: Icons.person,),
            card_widget(text: phone.toString(),icon: Icons.phone,),
            card_widget(text: email.toString(),icon: Icons.mail,),
            card_widget(text: dateOfBirth.toString(),icon: Icons.calendar_view_day_rounded,),
            card_widget(text: gender.toString(),icon: Icons.people,),

          Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Text(
                "PAN details!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              height: 200,
                width: 200,
                 margin: EdgeInsets.all(8),
                 child:image1 != null ? Image.file(
                 image1!,
                 width: 100,
                 height: 100,
                 fit: BoxFit.cover,): FlutterLogo(size: 100,),
            ),
           // Center(child: Text("Your Aadhar",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          SizedBox(height: 20,),
            card_widget(text: panName.toString(), icon: Icons.person,),
            card_widget(text: panNumber.toString(), icon: Icons.note,),
            card_widget(text: address.toString(),icon: Icons.location_city,),
            card_widget(text: state.toString(),icon: Icons.location_on,),

             SizedBox(
              height: 40,
            ),
           
            
            
              RaisedButton(
              color: Colors.orange,
              child: Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(ThirdScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}

class card_widget extends StatelessWidget {
   card_widget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text ;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.teal.shade900,
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
            ),
          ),
        ));
  }
}
