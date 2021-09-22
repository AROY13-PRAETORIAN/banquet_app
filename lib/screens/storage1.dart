import 'package:flutter/material.dart';
import 'package:vivanta_banquet/bloc/bloc_provider.dart';
import 'package:vivanta_banquet/ui/home/home_page.dart';
import 'package:vivanta_banquet/ui/home/home_bloc.dart';

class Storenew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          accentColor: Colors.blue,
          primaryColor: Colors.black,
        ),
        home: BlocProvider(bloc: HomeBloc(), child: HomePage()));
  }
}
