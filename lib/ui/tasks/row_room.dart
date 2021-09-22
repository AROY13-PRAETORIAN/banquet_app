import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vivanta_banquet/data/model/room.dart';
import 'package:vivanta_banquet/utils/app_constant.dart';
import 'package:vivanta_banquet/utils/color_util.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:vivanta_banquet/utils/date_util.dart';

class TaskRow extends StatelessWidget {
  final Tasks tasks;
  static final date_label = "Date";
  final List<String> labelNames = List();

  TaskRow(this.tasks);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.6)),
              insetPadding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                  vertical: MediaQuery.of(context).size.width * 0.2),
              backgroundColor: Colors.transparent,
              elevation: 16,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9.6),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 19.2, sigmaX: 19.2),
                          child: Text(
                            tasks.title,
                            style: TextStyle(
                              fontFamily: 'GlacialIndifference-Regular',
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
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
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: PADDING_TINY),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 4.0,
                  color: priorityColor[tasks.priority.index],
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(PADDING_SMALL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: PADDING_SMALL, bottom: PADDING_VERY_SMALL),
                    child: Text(
                      tasks.room,
                      style: TextStyle(
                        fontFamily: 'GlacialIndifference-Regular',
                        fontSize: 85,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  getLabels(tasks.labelList),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: PADDING_SMALL, bottom: PADDING_VERY_SMALL),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Client Name: ${tasks.client}",
                                    style: TextStyle(
                                      fontFamily: 'GlacialIndifference-Regular',
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    width: 8.0,
                                    height: 8.0,
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: PADDING_SMALL, bottom: PADDING_VERY_SMALL),
                    child: Row(
                      children: <Widget>[
                        Text(
                          getFormattedDate(tasks.dueDate),
                          style: TextStyle(
                            fontFamily: 'GlacialIndifference-Regular',
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          key: Key(date_label),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Rs. ${tasks.price}",
                                    style: TextStyle(
                                      fontFamily: 'GlacialIndifference-Regular',
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    width: 8.0,
                                    height: 8.0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3.5,
                color: Color(0xFFEAF8E8),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget getLabels(List<String> labelList) {
    if (labelList.isEmpty) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(
            left: PADDING_SMALL, bottom: PADDING_VERY_SMALL),
        child: Text(tasks.labelList.join("  "),
            style: TextStyle(fontSize: FONT_SIZE_LABEL)),
      );
    }
  }
}
