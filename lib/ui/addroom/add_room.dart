import 'package:flutter/material.dart';
import 'package:vivanta_banquet/bloc/bloc_provider.dart';
import 'package:vivanta_banquet/ui/addroom/add_room_bloc.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:vivanta_banquet/utils/date_util.dart';
import 'package:ionicons/ionicons.dart';

class AddTaskScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final GlobalKey<FormState> _formStateprice = GlobalKey<FormState>();
  final GlobalKey<FormState> _formStateclient = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<AddTaskScreen> {
  static List _selecteCategorys = [];
  var _currencies = [
    "Tango 1,2",
    "Tango 3",
    "Agenda",
    "Agenda",
  ];

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {
        "category_id": "5",
        "category_name": "Chicken",
        "subtitle": "food again"
      },
      {"category_id": "3", "category_name": "Fish", "subtitle": "food again"},
      {"category_id": "7", "category_name": "Eggs", "subtitle": "food again"},
      {"category_id": "9", "category_name": "Paneer", "subtitle": "food again"},
      {"category_id": "1", "category_name": "Roll", "subtitle": "food again"},
      {
        "category_id": "11",
        "category_name": "Noodles",
        "subtitle": "food again"
      },
      {
        "category_id": "13",
        "category_name": "Fried Rice",
        "subtitle": "food again"
      },
      {"category_id": "15", "category_name": "Rice", "subtitle": "food again"},
      {"category_id": "17", "category_name": "Curry", "subtitle": "food again"}
    ],
    "responseTotalResult": 9
  };

  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selecteCategorys.add(category_id);
      });
    } else {
      setState(() {
        _selecteCategorys.remove(category_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    AddTaskBloc createTaskBloc = BlocProvider.of(context);
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF7),
      key: widget._scaffoldState,
      //appBar: AppBar(
      // backgroundColor: Colors.black,
      // title: Text("Book Room"),
      //),
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: height * 0.08,
              margin: EdgeInsets.only(top: 0.8, left: 0.8, right: 528.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: height * 0.08,
                        width: width * 0.14,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.6),
                          color: Colors.transparent,
                        ),
                        child: Icon(
                          Ionicons.arrow_back,
                          size: 68,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 80,
            height: 890,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ), //BoxDecoration

                  child: Form(
                    key: widget._formKey,
                    child: ListView.builder(
                        itemCount: _categories['responseTotalResult'],
                        itemBuilder: (BuildContext context, int index) {
                          return CheckboxListTile(
                            value: _selecteCategorys.contains(
                                _categories['responseBody'][index]
                                    ['category_name']),
                            onChanged: (bool selected) {
                              _onCategorySelected(
                                  selected,
                                  _categories['responseBody'][index]
                                      ['category_name']);
                            },
                            title: Text(
                              _categories['responseBody'][index]
                                  ['category_name'],
                              style: TextStyle(
                                fontFamily: 'GlacialIndifference-Regular',
                                fontSize: 85,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              _categories['responseBody'][index]['subtitle'],
                              style: GoogleFonts.montserrat(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45),
                            ),
                          );
                        }),
                  ),
                  //CheckboxListTile
                ), //Container
              ), //Padding
            ), //Center
          ),
          Form(
            key: widget._formState,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Name Of Banquet Room",
                  hintStyle: TextStyle(
                    fontFamily: 'GlacialIndifference-Regular',
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                validator: (value) {
                  return value.isEmpty
                      ? "Banquet Room Name Cannot be Empty"
                      : null;
                },
                onSaved: (value) {
                  createTaskBloc.updateRoom = value;
                },
              ),
            ),
          ),
          Form(
            key: widget._formStateprice,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Booking Price",
                  hintStyle: TextStyle(
                    fontFamily: 'GlacialIndifference-Regular',
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                validator: (value) {
                  return value.isEmpty ? "Please enter a price" : null;
                },
                onSaved: (value) {
                  createTaskBloc.updatePrice = value;
                },
              ),
            ),
          ),
          Form(
            key: widget._formStateclient,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Client Name",
                  hintStyle: TextStyle(
                    fontFamily: 'GlacialIndifference-Regular',
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
                validator: (value) {
                  return value.isEmpty ? "Please Enter Client Name" : null;
                },
                onSaved: (value) {
                  createTaskBloc.updateClient = value;
                },
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Ionicons.calendar_clear_outline,
              size: 90,
              color: Colors.black,
            ),
            title: Text(
              "Event Date",
              style: TextStyle(
                fontFamily: 'GlacialIndifference-Regular',
                fontSize: 65,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            subtitle: StreamBuilder(
              stream: createTaskBloc.dueDateSelected,
              initialData: DateTime.now().millisecondsSinceEpoch,
              builder: (context, snapshot) => Text(
                getFormattedDate(snapshot.data),
                style: TextStyle(
                  fontFamily: 'GlacialIndifference-Regular',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
            onTap: () {
              _selectDate(context);
            },
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    height: height * 0.045,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                      color: Color(0xFF0D0C10),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.425,
                      child: ElevatedButton(
                        child: Text(
                          'Save Menu',
                          style: GoogleFonts.josefinSans(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          if (widget._formKey.currentState.validate()) {
                            widget._formKey.currentState.save();
                          }
                          createTaskBloc.updateTitle =
                              _selecteCategorys.toString();
                          if (widget._formState.currentState.validate()) {
                            widget._formState.currentState.save();
                          }
                          if (widget._formStateprice.currentState.validate()) {
                            widget._formStateprice.currentState.save();
                          }
                          if (widget._formStateclient.currentState.validate()) {
                            widget._formStateclient.currentState.save();
                            createTaskBloc.createTask().listen((value) {
                              Navigator.pop(context, true);
                            });
                            _selecteCategorys.clear();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Container(
                    height: height * 0.045,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                      color: Color(0xFF0D0C10),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.425,
                      child: ElevatedButton(
                        child: Text(
                          'Food Items',
                          style: GoogleFonts.josefinSans(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.6)),
                                insetPadding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                    vertical:
                                        MediaQuery.of(context).size.width *
                                            0.2),
                                backgroundColor: Colors.transparent,
                                elevation: 16,
                                child: Container(
                                  color: Colors.transparent,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(9.6),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaY: 19.2, sigmaX: 19.2),
                                            child: ListView.builder(
                                              itemCount:
                                                  _selecteCategorys.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Text(
                                                  _selecteCategorys[index],
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'GlacialIndifference-Regular',
                                                    fontSize: 75,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    AddTaskBloc createTaskBloc = BlocProvider.of(context);
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                height: 1050,
                width: 6300,
                child: child,
              ),
            ),
          ],
        );
      },
    );
    if (picked != null) {
      createTaskBloc.updateDueDate(picked.millisecondsSinceEpoch);
    }
  }
}
