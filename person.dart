import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aqsaqasim8579/services/database.dart';
import 'package:random_string/random_string.dart';

class Person extends StatefulWidget {
  const Person({super.key});

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  TextEditingController NameController = TextEditingController();
  TextEditingController FatherNameController = TextEditingController();
  TextEditingController AgeController = TextEditingController();
  TextEditingController LocationController = TextEditingController();
  TextEditingController CountryController = TextEditingController();
  TextEditingController SchoolController = TextEditingController();
  TextEditingController CollegeController = TextEditingController();
  TextEditingController UniveristyController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();
  TextEditingController ColorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                "Profile",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent),
              ),
              Text(
                "Details",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text("Name",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: NameController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purpleAccent),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("FatherName",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: FatherNameController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Age",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: AgeController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Location",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: LocationController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.pink),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Country",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pinkAccent)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: CountryController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.pinkAccent),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("School",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: SchoolController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueGrey),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("College",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: CollegeController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Univeristy",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: UniveristyController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.redAccent),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Phone",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: PhoneController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.indigo),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Color",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: ColorController,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.indigoAccent),
                    decoration: InputDecoration(border: InputBorder.none),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown),
                  onPressed: () async {
                    String Id = randomAlphaNumeric(5);
                    Map<String, dynamic> PersonInfoMap = {
                      "Name": NameController.text,
                      "FatherName": FatherNameController.text,
                      "Age": AgeController.text,
                      "Location": LocationController.text,
                      "Country": CountryController.text,
                      "School": SchoolController.text,
                      "College": CollegeController.text,
                      "Univeristy": UniveristyController.text,
                      "Phone": PhoneController.text,
                      "Color": ColorController.text,
                      "id": Id
                    };
                    await DatabaseMethods().addPersonRecord(PersonInfoMap, Id);
                    Fluttertoast.showToast(
                        msg: "Your Record Successfully Added");
                  },
                  child: Text("ADD RECORD",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
