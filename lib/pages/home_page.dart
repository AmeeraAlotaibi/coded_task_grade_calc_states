import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // stateful varibale
  String grade = "";
  
  // function to calc grade
  String getGrade(double contDouble) {
    if (contDouble > 100) {
      return grade = "N/A";
    } else if (contDouble == 100) {
      return grade = "S";
    } else if (contDouble < 100 && contDouble >= 90) {
      return grade = "A";
    } else if (contDouble < 90 && contDouble >= 80) {
      return grade = "B";
    } else if (contDouble < 80 && contDouble >= 70) {
      return grade = "C";
    } else if (contDouble < 70 && contDouble >= 60) {
      return grade = "D";
    } else if (contDouble < 60 && contDouble >= 0) {
      return grade = "F";
    } else {
      return grade = "Invalid";
    }
  }
  // function to change color based on the output from getGrade function
  Color getColor(grade) {
    if (grade == "S") {
      return Color.fromARGB(255, 11, 145, 60);
    } else if (grade == "A") {
      return Color.fromARGB(255, 27, 201, 59);
    } else if (grade == "B") {
      return Color.fromARGB(255, 123, 255, 86);
    } else if (grade == "C") {
      return Color.fromARGB(255, 255, 165, 86);
    } else if (grade == "D") {
      return Color.fromARGB(255, 255, 98, 74);
    } else if (grade == "F") {
      return Color.fromARGB(255, 254, 33, 33);
    } else {
      return Colors.black;
    }
  }

  // build start
  @override
  Widget build(BuildContext context) {
    
    // editing controller variable
    var userController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Center(
          child: Text("Grade Calculator", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
           )
          ),
      
      
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                // text field
                Center(
                  child: Container(
                    width: 250,
                    child: TextField(
                      controller: userController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlignVertical: TextAlignVertical.center,
                      // decoration 
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.percent_rounded, color: Colors.pinkAccent, size: 35),
                        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
                        filled: true,
                        fillColor: Color.fromARGB(184, 220, 219, 219),
                        hintText: "Type your score",
                        hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      ), 
                      ),
                  ),
                ),

                // button
                Container(
                  width: 125,
                  height: 55,
                  margin: EdgeInsets.only(top: 20, bottom: 100),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // on Pressed function
                    onPressed: () {
                       setState(() {
                          double contDouble = double.parse(userController.text);
                          grade = getGrade(contDouble);
                          Color color = getColor(grade);
                         });
                        }, // on pressed function end
                    // text inside the button
                    child: Text("Calculate", style: TextStyle(fontSize: 20),)),
                ),

                // text output
                Container(
                  child: Text(grade,  
                    style: TextStyle(color: getColor(grade), fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                ),
        ],
      )),
    );
  }
}
