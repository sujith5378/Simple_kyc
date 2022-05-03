import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/screens/second_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
// import 'dart:html' as html;

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  File? image1;
  File? image2;

  Future pickImage1(ImageSource source,) async {
    try {
    final image = await ImagePicker().pickImage(source: source);
    if(image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image1 = imageTemporary,) ;
    } on PlatformException catch (e) {
      print(e);
    }
  }
  Future pickImage2(ImageSource source,) async {
    try {
    final image = await ImagePicker().pickImage(source: source);
    if(image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image2 = imageTemporary,) ;
    } on PlatformException catch (e) {
      print(e);
    }
  }



  final _formGlobalKey = GlobalKey<FormState>();
 
  List<String> _stateSelection = [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal"
  ];

  List<String> _genderSelection = [
    "Male",
    "Female",
    ] ;
    
  late FocusNode _phoneFocusNode, _emailFocusNode, _nameFocusNode, _addressFocusNode ,_dateFocusNode,_genderFocusNode,_pancardNumber,_pancardName;

  String _name = "";
  String _email = "";
  String _phone = "";
  String _address = "";
  String _selectedState = "" ;
  String _date = "";
  String _gender = "";
  String _panNumber = "";
  String _panName = "";
  final dateController = TextEditingController();


  // Initialize Focus Node Objects in initState
  @override
  void initState() {
    super.initState();

    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    _addressFocusNode = FocusNode();
    _dateFocusNode = FocusNode();
    _genderFocusNode = FocusNode();
    _pancardName = FocusNode();
    _pancardNumber = FocusNode();
  }

  // Focus nodes are long living objects, so dispose it
  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _nameFocusNode.dispose();
    _addressFocusNode = FocusNode();
    _dateFocusNode = FocusNode();
    dateController.dispose();
    _genderFocusNode = FocusNode();
    _pancardName = FocusNode();
    _pancardNumber = FocusNode();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formGlobalKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text("Your Details", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
//photo upload container
              Container(
                height: 250,
                width: 350,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.white,
                  //     offset: Offset(0, 2),
                  //     blurRadius: 6,
                  //   ),
                  // ],
                ),
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  InkWell(
                    onTap: () => pickImage1(ImageSource.gallery),
                    onDoubleTap: () => pickImage1(ImageSource.camera),
                    child: image1 != null ? ClipOval(
                    child: Image.file(
                    image1!,
                    width: 160,
                    height: 160,
                    fit: BoxFit.cover,),
                                  ): FlutterLogo(size: 150,),
                  ),
                  
                  Text("Upload your image",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 
                   FlatButton(
                     child: Text("Camera",style: TextStyle(fontWeight: FontWeight.bold),),
                     onPressed: () => pickImage1(ImageSource.camera,),
                     
                   ),
        
                   FlatButton(
                     child: Text("Gallery",style: TextStyle(fontWeight: FontWeight.bold),),
                     onPressed: () => pickImage1(ImageSource.gallery,),
                   ),            
                  ],
                 ),
                 
                 ],
      
                ),
              ),

//name text field
              TextFormField(
                  //autofocus: true,
                  focusNode: _nameFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_phoneFocusNode);
                  },
                  onChanged: (context){
                    _name = context;
                  },
                  decoration: InputDecoration(
                    hintText: "Name",
                    icon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (inputText) {
                    if (inputText!.isEmpty) return "Please Enter your name";
                    return null;
                  },
                ),
                SizedBox(height: 20,),
//phone text field               
              TextFormField(
                  focusNode: _phoneFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                   
                  },
                  onChanged: (context){
                    setState(() {
                      _phone = context;
                    });
                  
                  },
                  decoration: InputDecoration(
                    hintText: "Phone",
                    icon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (inputText) {
                    if (inputText!.isEmpty)
                      return "Please Enter your phone number";
                    return null;
                  },
                ),
                SizedBox(height: 20,),
//email text field            
              TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: _emailFocusNode,
                  onFieldSubmitted: (_) {
                    _emailFocusNode.unfocus();
                  },
                onChanged: (context){
                  _email=context;
                },
                  decoration: InputDecoration(
                    hintText: "Email",
                    icon: Icon(Icons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (inputText) {
                    if (inputText!.isEmpty)
                      return "Please Enter your email";
                    else if (!inputText.contains('@'))
                      return "Not a valid email address";
                    return null;
                  },
                ),
                SizedBox(height: 20,),
//date field
                TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: _dateFocusNode,
                  controller: dateController,
                  onFieldSubmitted: (_) {
                    _dateFocusNode.unfocus();
                  },
                  onTap: () async{
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                    dateController.text = date.toString().substring(0,10);
                    _date = date.toString().substring(0,10);
                  },
                  // onChanged: (context){

                  //   _date=context;
                  // },
                  decoration: InputDecoration(
                    hintText: "Date of Birth",
                    icon: Icon(Icons.calendar_today),
                  ),
                  //keyboardType: TextInputType.datetime,
                  validator: (inputText) {
                    if (inputText!.isEmpty)
                      return "Please Enter your date of birth";
                    return null;
                  },
                ),
                SizedBox(height: 20,),
//create dropdownbutton to get gender
                DropdownButtonFormField(
                  focusNode: _genderFocusNode,
                  decoration: InputDecoration(
                    icon: Icon(Icons.people),
                  ),
                  hint: _selectedState == ""
                      ? Text("Select Gender.")
                      : Text(_gender),
                  items: _genderSelection
                      .map((eachItem) => DropdownMenuItem(
                            value: eachItem,
                            child: Text(eachItem),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _gender = value.toString();
                      
                    });

                   
                  },
                  validator: (value) {
                    if (value == null) return "Select an option";
                    return null;
                  },
                ),
                SizedBox(height: 20,), 
                Text("Pan Details",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
//pan photo upload container              
              Container(
                height: 300,
                width: 350,
                 margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.white,
                  //     offset: Offset(0, 2),
                  //     blurRadius: 6,
                  //   ),
                  // ],
                ),
               child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  InkWell(
                    onTap: () => pickImage2(ImageSource.gallery),
                    onDoubleTap: () => pickImage2(ImageSource.camera),
                    child: image2 != null ? Image.file(
                    image2!,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,): FlutterLogo(size: 150,),
                  ),
                     Text("Upload your pan Card",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                    FlatButton(
                     child: Text("Camera",style: TextStyle(fontWeight: FontWeight.bold),),
                     onPressed: () => pickImage2(ImageSource.camera,),
                      ),
                   FlatButton(
                     child: Text("Gallery",style: TextStyle(fontWeight: FontWeight.bold),),
                     onPressed: () => pickImage2(ImageSource.gallery,),
                   ),            
                  ],
                 ),
                 ],
                ),
              ),
                SizedBox(height: 20,),
//pancard name text field
                TextFormField(
                  //autofocus: true,
                  focusNode: _pancardName,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    _pancardName.unfocus();
                  },
                  onChanged: (context){
                    _panName = context;
                  },
                  decoration: InputDecoration(
                    hintText: "Pan Card Name",
                    icon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (inputText) {
                    if (inputText!.isEmpty) return "Please Enter your Name";
                    return null;
                  },
                ),
                SizedBox(height: 20,),
//pancard number text field              
              TextFormField(
                  //autofocus: true,
                  focusNode: _pancardNumber,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    _pancardNumber.unfocus();
                  },
                  onChanged: (context){
                    _panNumber = context;
                  },
                  decoration: InputDecoration(
                    hintText: "Pan Card Number",
                    icon: Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (inputText) {
                    if (inputText!.isEmpty) return "Please Enter your Number";
                    return null;
                  },
                ),
                SizedBox(height: 20,),

//address text field
                TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: _addressFocusNode,
                  onFieldSubmitted: (_) {
                    _addressFocusNode.unfocus();
                  },
                onChanged: (context){
                  _address=context;
                },
                  decoration: InputDecoration(
                    hintText: "Address",
                    icon: Icon(Icons.location_city),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (inputText) {
                    if (inputText!.isEmpty)
                      return "Please Enter your address";
                    return null;
                  },
                ),
                SizedBox(height: 20,),
//state dropdown             
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_on),
                  ),
                  hint: _selectedState == ""
                      ? Text("Select State.")
                      : Text(_selectedState),
                  items: _stateSelection
                      .map((eachItem) => DropdownMenuItem(
                            value: eachItem,
                            child: Text(eachItem),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _selectedState = value.toString();
                      
                    });

                   
                  },
                  validator: (value) {
                    if (value == null) return "Select an option";
                    return null;
                  },
                ),
                SizedBox(height: 20,),
// Container(
              //   height: 210,
              //   width: 350,
              //    margin: EdgeInsets.all(8),
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.grey[300],
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
              //     image != null ? ClipOval(
              //     child: Image.file(
              //     image!,
              //     width: 100,
              //     height: 100,
              //     fit: BoxFit.cover,),
              //   ): FlutterLogo(size: 100,),
              //      Text("Upload your aadhar card",style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20),),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //    children: [
               //      FlatButton(
              //        child: Text("Camera",style: TextStyle(fontWeight: FontWeight.bold),),
              //        onPressed: () => pickImage(ImageSource.camera),
              //      ),
              //      FlatButton(
              //        child: Text("Gallery",style: TextStyle(fontWeight: FontWeight.bold),),
              //        onPressed: () => pickImage(ImageSource.gallery),
              //      ),            
              //     ],
              //    ),
              //    ],
              //   ),
              // ),

                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () {
                      if (_formGlobalKey.currentState!.validate()) {
                        //TODO: do some http action on submission
                        // print('$_name');

                      //Navigator.of(context).pushNamed(SecondScreen(name: _name,address: _address,phone: _phone,email: _email,state: _selectedState,).routeName);
                      // Navigator.of(context).pushNamed(SecondScreen.routeName,arguments: {
                      //   'name':_name,
                      //   'address':_address,
                      //   'phone':_phone,
                      //   'email':_email,
                      //   'state':_selectedState,
                      //   'image1':image1,
                      //   'image2':image2,
                      // });
                     
                      Navigator.push( context, MaterialPageRoute( builder: (context) => SecondScreen(
                        name: _name,
                        address: _address,
                        phone: _phone,
                        email: _email,
                        state: _selectedState,
                        panName: _panName,
                        panNumber: _panNumber,
                        dateOfBirth: _date,
                        gender: _gender,
                        image1: image1,
                        image2: image2,
                      )));
                      }
                    },
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
