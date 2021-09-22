import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:vivanta_banquet/models/banquet_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:vivanta_banquet/bloc/bloc_provider.dart';
import 'package:vivanta_banquet/data/db/room_db.dart';
import 'package:vivanta_banquet/ui/addroom/add_room.dart';
import 'package:vivanta_banquet/ui/addroom/add_room_bloc.dart';

class SelectedPlaceScreen extends StatelessWidget {
  final RoomModel roomModel;
  SelectedPlaceScreen({Key key, @required this.roomModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: roomModel.image,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(roomModel.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.45),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// Custom Button
            SafeArea(
              child: Container(
                height: height * 0.08,
                margin: EdgeInsets.only(top: 28.8, left: 12.8, right: 28.8),
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
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Colors.transparent,
                          ),
                          child: Icon(
                            Ionicons.arrow_back,
                            size: 68,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Content
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFEAF8E8),
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40), bottom: Radius.circular(40)),
                  ),
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.55,
                      maxHeight: MediaQuery.of(context).size.height * 0.55),
                  padding: EdgeInsets.only(left: 14.8, bottom: 48, right: 14.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 60, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              roomModel.name,
                              style: GoogleFonts.josefinSans(
                                  fontSize: width * 0.125,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            right: 25,
                            left: 25,
                            bottom: 14,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                buildFeature(Icons.grid_on, roomModel.capacity1,
                                    width * 0.035, width * 0.035),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                buildFeature(
                                    Icons.blur_circular,
                                    roomModel.capacity2,
                                    width * 0.035,
                                    width * 0.035),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                buildFeature(
                                    Icons.format_underline_rounded,
                                    roomModel.capacity3,
                                    width * 0.035,
                                    width * 0.035),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                buildFeature(
                                    Icons.drag_indicator_rounded,
                                    roomModel.capacity4,
                                    width * 0.035,
                                    width * 0.035),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                buildFeature(
                                    Icons.groups_rounded,
                                    roomModel.capacity5,
                                    width * 0.035,
                                    width * 0.035),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                buildFeature(
                                    Icons.grain_rounded,
                                    roomModel.capacity6,
                                    width * 0.035,
                                    width * 0.035),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ///cooler elevated button
                          Container(
                            width: width * 0.35,
                            height: height * 0.052,
                            margin: EdgeInsets.symmetric(
                                horizontal: 58, vertical: 30),
                            decoration: BoxDecoration(
                              color: Color(0xFF0D0C10),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 60,
                                  color: Colors.black.withOpacity(.4),
                                  offset: Offset(0, 25),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 3),
                              child: ElevatedButton(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 11, top: 2),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                Ionicons.information_outline,
                                                size: 42,
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "  Information",
                                              style: GoogleFonts.josefinSans(
                                                fontSize: width * 0.039,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.6)),
                                        backgroundColor: Colors.transparent,
                                        elevation: 16,
                                        child: Container(
                                          color: Colors.transparent,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.6),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                                sigmaY: 19.2,
                                                                sigmaX: 19.2),
                                                        child: Container(
                                                          color: Colors
                                                              .transparent,
                                                          child: Column(
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            10,
                                                                            10,
                                                                            10,
                                                                            10),
                                                                child: Text(
                                                                  roomModel
                                                                      .tagLine,
                                                                  maxLines: 10,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .fade,
                                                                  style: GoogleFonts.lato(
                                                                      fontSize:
                                                                          height *
                                                                              0.045,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              Column(
                                                                children: <
                                                                    Widget>[
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      color: Colors
                                                                          .transparent,
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              10,
                                                                              10,
                                                                              10),
                                                                      child:
                                                                          Text(
                                                                        roomModel
                                                                            .description,
                                                                        maxLines:
                                                                            30,
                                                                        overflow:
                                                                            TextOverflow.fade,
                                                                        style: GoogleFonts.lato(
                                                                            fontSize: height *
                                                                                0.025,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 48,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                          Container(
                            width: width * 0.35,
                            height: height * 0.052,
                            margin: EdgeInsets.symmetric(
                                horizontal: 58, vertical: 30),
                            decoration: BoxDecoration(
                              color: Color(0xFF0D0C10),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 60,
                                  color: Colors.black.withOpacity(.4),
                                  offset: Offset(0, 25),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0, vertical: 3),
                              child: ElevatedButton(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 11, top: 2),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                Ionicons.image,
                                                size: 42,
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "     Gallery",
                                              style: GoogleFonts.josefinSans(
                                                fontSize: width * 0.039,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(9.6)),
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02),
                                        backgroundColor: Colors.transparent,
                                        elevation: 16,
                                        child: Container(
                                          color: Colors.transparent,
                                          child: ListView(
                                            shrinkWrap: true,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9.6),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                                sigmaY: 19.2,
                                                                sigmaX: 19.2),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child: Container(
                                                            color: Colors
                                                                .transparent,
                                                            child: Column(
                                                              children: buildPhotos(
                                                                  roomModel
                                                                      .images2),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: width * 0.826,
                            height: height * 0.052,
                            margin: EdgeInsets.symmetric(
                                horizontal: 58, vertical: 30),
                            decoration: BoxDecoration(
                              color: Color(0xFF0D0C10),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: -10,
                                  blurRadius: 60,
                                  color: Colors.black.withOpacity(.4),
                                  offset: Offset(0, 25),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 33.0, vertical: 3),
                              child: ElevatedButton(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: Icon(
                                                Ionicons.bookmark,
                                                size: 42,
                                                color: Colors.white,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "   Book",
                                              style: GoogleFonts.josefinSans(
                                                fontSize: width * 0.039,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                onPressed: () {
                                  var blocProviderAddTask = BlocProvider(
                                    bloc: AddTaskBloc(
                                      RoomDB.get(),
                                    ),
                                    child: AddTaskScreen(),
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute<bool>(
                                          builder: (context) =>
                                              blocProviderAddTask));
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
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> buildPhotos(List<String> images) {
  List<Widget> list = [];
  list.add(SizedBox(
    width: 14,
  ));
  for (var i = 0; i < images.length; i++) {
    list.add(buildPhoto(images[i]));
  }
  return list;
}

Widget buildPhoto(String url) {
  return AspectRatio(
    aspectRatio: 3 / 2,
    child: Container(
      margin: EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget buildFeature(IconData iconData, String text, iconSize, textSize) {
  return Column(
    children: [
      Container(
        height: 90,
        width: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Icon(
            iconData,
            color: Colors.black,
            size: iconSize,
          ),
          SizedBox(
            width: 18,
          ),
          Text(
            text,
            style: GoogleFonts.josefinSans(
              fontSize: textSize,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    ],
  );
}
