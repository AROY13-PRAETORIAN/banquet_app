import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vivanta_banquet/models/gallery.dart';
import 'package:vivanta_banquet/models/logo.dart';
import 'package:vivanta_banquet/models/banquet_data.dart';
import 'package:vivanta_banquet/models/banquet_data1.dart';
import 'package:vivanta_banquet/screens/storage1.dart';
import 'package:vivanta_banquet/models/banquet_data2.dart';
import 'package:vivanta_banquet/models/banquet_data3.dart';
import 'package:vivanta_banquet/screens/navigated_screen1.dart';
import 'package:vivanta_banquet/screens/navigated_screen2.dart';
import 'package:vivanta_banquet/screens/navigated_screen3.dart';
import 'package:vivanta_banquet/screens/navigated_screen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  final RoomModel roomModel;
  final RoomModel1 roomModel1;
  final RoomModel2 roomModel2;
  final RoomModel3 roomModel3;
  HomeScreen(
      {Key key,
      @required this.roomModel,
      this.roomModel1,
      this.roomModel2,
      this.roomModel3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF7),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 33.6, left: width * 0.3),
                    height: 65.6,
                    child: ListView.builder(
                      itemCount: logos.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(right: 9.6),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 19.2),
                          height: 45.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: Color(logos[index].color),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                logos[index].image,
                                height: height * 0.125,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.058),
                    child: Text(
                      'Banquet\nRoom',
                      style: TextStyle(
                        fontFamily: 'GlacialIndifference-Regular',
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0),
                    child: CarouselSlider(
                      items: [
                        Container(
                          height: height * 0.325,
                          width: width * 0.825,
                          margin: EdgeInsets.only(
                              top: height * 0.031,
                              left: width * 0.0,
                              right: width * 0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SelectedPlaceScreen(
                                      roomModel: rooms[0])));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 0),
                              width: 333.6,
                              height: 218.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      rooms[0].image),
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    bottom: height * 0.023,
                                    left: height * 0.023,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 59.2, sigmaX: 19.2),
                                        child: Container(
                                          height: height * 0.0564,
                                          width: width * 0.33,
                                          padding: EdgeInsets.only(
                                              left: 14.72, right: 14.72),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                rooms[0].name,
                                                style: TextStyle(
                                                  fontFamily:
                                                      'GlacialIndifference-Regular',
                                                  fontSize: width * 0.043,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //2nd Image of Slider
                        Container(
                          height: height * 0.325,
                          width: width * 0.825,
                          margin: EdgeInsets.only(
                              top: height * 0.031,
                              left: width * 0.0,
                              right: width * 0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SelectedPlaceScreen1(
                                      roomModel1: rooms1[0])));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 0),
                              width: 333.6,
                              height: 218.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      rooms1[0].image),
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    bottom: height * 0.023,
                                    left: height * 0.023,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 59.2, sigmaX: 19.2),
                                        child: Container(
                                          height: height * 0.0564,
                                          width: width * 0.33,
                                          padding: EdgeInsets.only(
                                              left: 14.72, right: 14.72),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                rooms1[0].name,
                                                style: TextStyle(
                                                  fontFamily:
                                                      'GlacialIndifference-Regular',
                                                  fontSize: width * 0.043,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //3rd Image of Slider

                        //4th Image of Slider

                        Container(
                          height: height * 0.325,
                          width: width * 0.825,
                          margin: EdgeInsets.only(
                              top: height * 0.031,
                              left: width * 0.0,
                              right: width * 0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SelectedPlaceScreen2(
                                      roomModel2: rooms2[0])));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 0),
                              width: 333.6,
                              height: 218.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      rooms2[0].image),
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    bottom: height * 0.023,
                                    left: height * 0.023,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 59.2, sigmaX: 19.2),
                                        child: Container(
                                          height: height * 0.0564,
                                          width: width * 0.33,
                                          padding: EdgeInsets.only(
                                              left: 14.72, right: 14.72),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                rooms2[0].name,
                                                style: TextStyle(
                                                  fontFamily:
                                                      'GlacialIndifference-Regular',
                                                  fontSize: width * 0.043,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: height * 0.325,
                          width: width * 0.825,
                          margin: EdgeInsets.only(
                              top: height * 0.031,
                              left: width * 0.0,
                              right: width * 0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SelectedPlaceScreen3(
                                      roomModel3: rooms3[0])));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 0),
                              width: 333.6,
                              height: 218.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      rooms3[0].image),
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    bottom: height * 0.023,
                                    left: height * 0.023,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(28),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaY: 59.2, sigmaX: 19.2),
                                        child: Container(
                                          height: height * 0.0564,
                                          width: width * 0.33,
                                          padding: EdgeInsets.only(
                                              left: 14.72, right: 14.72),
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                rooms3[0].name,
                                                style: TextStyle(
                                                  fontFamily:
                                                      'GlacialIndifference-Regular',
                                                  fontSize: width * 0.043,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        //5th Image of Slider
                      ],

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 620.0,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        aspectRatio: 2.0,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.75,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * 0.058, top: 18.8),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'GlacialIndifference-Regular',
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 22.8, bottom: 16.8, left: width * 0.027),
                    height: height * 0.325,
                    child: ListView.builder(
                      itemCount: gallery.length,
                      padding: EdgeInsets.only(left: 28.8, right: 12),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          height: height * 0.25,
                          width: width * 0.75,
                          margin: EdgeInsets.only(right: 36.8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  gallery[index].image),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30.6, bottom: 30.6),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Storenew()));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Color(0xFF0D0C10),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: -10,
                        blurRadius: 60,
                        color: Colors.black.withOpacity(.4),
                        offset: Offset(0, 25),
                      )
                    ],
                  ),
                  child: Icon(
                    Ionicons.bookmarks,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
