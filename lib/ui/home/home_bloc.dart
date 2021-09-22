import 'dart:async';

import 'package:vivanta_banquet/bloc/bloc_provider.dart';
import 'package:vivanta_banquet/data/model/filter.dart';

class HomeBloc extends BlocBase {
  StreamController<String> _tittleController =
      StreamController<String>.broadcast();

  StreamController<String> _roomController =
      StreamController<String>.broadcast();

  StreamController<Filter> _filterController =
      StreamController<Filter>.broadcast();

  Stream<String> get title => _tittleController.stream;

  Stream<String> get room => _roomController.stream;

  Stream<Filter> get filter => _filterController.stream;

  @override
  void dispose() {
    _tittleController.close();
    _filterController.close();
  }

  void updateTitle(String title) {
    _tittleController.sink.add(title);
  }

  void updateRoom(String room) {
    _roomController.sink.add(room);
  }

  void applyFilter(String title, Filter filter) {
    _filterController.sink.add(filter);
    updateTitle(title);
  }
}
