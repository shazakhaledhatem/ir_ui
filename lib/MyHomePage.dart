import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ir/controller.dart';
import 'package:ir/documentsPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController queryController = TextEditingController();
  String _selectedOption = 'First Data Set(antique/train)';
  CallApi callApi = CallApi();

  List<String> _dropdownOptions = [
    'First Data Set(antique/train)',
    'Second Data Set(web tech2020)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IR project",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 50),
                child: Image(
                  image: AssetImage('images/ir.PNG'),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _selectedOption,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedOption = newValue!;
                          });
                        },
                        items: _dropdownOptions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      width: 230,
                      child: TextField(
                        controller: queryController,
                        decoration: InputDecoration(
                          hintText: 'Write your query',
                        ),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 250, top: 100),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green,
                    child: IconButton(
                      color: Colors.black,
                      onPressed: () {
                        callApi.chooseDataSet(
                            _selectedOption, queryController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DocumentsPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.done),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
