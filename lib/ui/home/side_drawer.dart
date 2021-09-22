import 'package:flutter/material.dart';
import 'package:vivanta_banquet/bloc/bloc_provider.dart';
import 'package:vivanta_banquet/data/model/filter.dart';
import 'package:vivanta_banquet/data/model/project.dart';
import 'package:vivanta_banquet/ui/home/home_bloc.dart';
import 'package:vivanta_banquet/utils/app_constant.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of(context);
    return Drawer(
        child: ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        ListTile(
            title: Text(
              "All Rooms Booked",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              Icons.inbox,
              size: 30,
            ),
            onTap: () {
              var project = Project.getInbox();
              homeBloc.applyFilter(project.name, Filter.byProject(project.id));
              Navigator.pop(context);
            }),
        ListTile(
            title: Text(
              "Bookings Due Today",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              Icons.calendar_today,
              size: 30,
            ),
            onTap: () {
              homeBloc.applyFilter("Today", Filter.byToday());
              Navigator.pop(context);
            }),
        ListTile(
            title: Text(
              "Bookings Due Next 7 days",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              Icons.calendar_today,
              size: 30,
            ),
            onTap: () {
              homeBloc.applyFilter("Next 7 Days", Filter.byNextWeek());
              Navigator.pop(context);
            }),
      ],
    ));
  }
}
