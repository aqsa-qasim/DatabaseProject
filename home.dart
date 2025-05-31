import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aqsaqasim8579/services/database.dart';
import 'package:aqsaqasim8579/person.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Stream? PersonStream;

  getpersonload() async {
    PersonStream = await DatabaseMethods().getPersonData();
    setState(() {});
  }

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
  void initState() {
    getpersonload();
    super.initState();
  }

  Widget AllPersonDetails() {
    return StreamBuilder(
        stream: PersonStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Name : " + ds["Name"],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.pink),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      NameController.text = ds["Name"];
                                      FatherNameController.text = ds["FatherName"];
                                      AgeController.text = ds["Age"];
                                      LocationController.text = ds["Location"];
                                      CountryController.text = ds["Country"];
                                      SchoolController.text = ds["School"];
                                      CollegeController.text = ds["College"];
                                      UniveristyController.text = ds["Univeristy"];
                                      PhoneController.text = ds["Phone"];
                                      ColorController.text = ds["Color"];
                                      EditPersonDetails(ds["id"]);
                                    },
                                    child: Icon(Icons.edit, color: Colors.black),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      await DatabaseMethods().DeleteUserInfo(ds["id"]);
                                    },
                                    child: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text("FatherName :  " + ds["FatherName"]),
                          Text("Age :  " + ds["Age"]),
                          Text("Location : " + ds["Location"]),
                          Text("Country :  " + ds["Country"]),
                          Text("School :  " + ds["School"]),
                          Text("College :  " + ds["College"]),
                          Text("Univeristy :  " + ds["Univeristy"]),
                          Text("Phone :  " + ds["Phone"]),
                          Text("Color :  " + ds["Color"]),
                        ],
                      ),
                    ),
                  ),
                );
              })
              : Center(child: CircularProgressIndicator());
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Person()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                "Database",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Record",
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Column(
            children: [Expanded(child: AllPersonDetails())],
          ),
        ),
      ),
    );
  }

  Future EditPersonDetails(String id) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.cancel),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10),
                Text("Edit Details",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ],
            ),
            SizedBox(height: 10),
            buildTextField("Name", NameController),
            buildTextField("Father Name", FatherNameController),
            buildTextField("Age", AgeController),
            buildTextField("Location", LocationController),
            buildTextField("Country", CountryController),
            buildTextField("School", SchoolController),
            buildTextField("College", CollegeController),
            buildTextField("University", UniveristyController),
            buildTextField("Phone", PhoneController),
            buildTextField("Color", ColorController),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent),
              onPressed: () async {
                Map<String, dynamic> PersonUpdatedMap = {
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
                  "id": id,
                };
                await DatabaseMethods()
                    .UpdataUserInfo(id, PersonUpdatedMap)
                    .then((value) => Navigator.pop(context));
              },
              child: Text(
                "Update",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );

  Widget buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange)),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            controller: controller,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            decoration: InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.all(8)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
