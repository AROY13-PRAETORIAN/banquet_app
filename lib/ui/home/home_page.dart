import 'package:flutter/material.dart';
import 'package:vivanta_banquet/bloc/bloc_provider.dart';
import 'package:vivanta_banquet/data/db/room_db.dart';
import 'package:vivanta_banquet/ui/addroom/add_room.dart';
import 'package:vivanta_banquet/ui/addroom/add_room_bloc.dart';
import 'package:vivanta_banquet/ui/home/home_bloc.dart';
import 'package:vivanta_banquet/ui/home/side_drawer.dart';
import 'package:vivanta_banquet/ui/tasks/room_bloc.dart';
import 'package:vivanta_banquet/ui/tasks/rooms_booking_page.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatelessWidget {
  final TaskBloc _taskBloc = TaskBloc(RoomDB.get());

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of(context);
    homeBloc.filter.listen((filter) {
      _taskBloc.updateFilters(filter);
    });
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: StreamBuilder<String>(
              initialData: "Today",
              stream: homeBloc.title,
              builder: (context, snapshot) {
                return Text(snapshot.data);
              })),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Ionicons.bookmark,
          color: Colors.white,
        ),
        onPressed: () {
          var blocProviderAddTask = BlocProvider(
            bloc: AddTaskBloc(RoomDB.get()),
            child: AddTaskScreen(),
          );
          Navigator.push(
              context,
              MaterialPageRoute<bool>(
                  builder: (context) => blocProviderAddTask));
        },
      ),
      drawer: SideDrawer(),
      body: BlocProvider(
        bloc: _taskBloc,
        child: TasksPage(),
      ),
    );
  }
}
