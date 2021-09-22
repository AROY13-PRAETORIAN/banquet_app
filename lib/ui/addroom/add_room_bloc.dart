import 'package:vivanta_banquet/bloc/bloc_provider.dart';
import 'package:vivanta_banquet/data/db/room_db.dart';
import 'package:vivanta_banquet/data/model/label.dart';
import 'package:vivanta_banquet/data/model/priority.dart';
import 'package:vivanta_banquet/data/model/project.dart';
import 'package:vivanta_banquet/data/model/room.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class AddTaskBloc extends BlocBase {
  final RoomDB _taskDB;
  Status lastPrioritySelection = Status.PRIORITY_4;

  AddTaskBloc(this._taskDB) {
    updateDueDate(DateTime.now().millisecondsSinceEpoch);
    _projectSelection.add(Project.getInbox());
    _prioritySelected.add(lastPrioritySelection);
  }

  BehaviorSubject<List<Project>> _projectController =
      BehaviorSubject<List<Project>>();

  Stream<List<Project>> get projects => _projectController.stream;

  BehaviorSubject<List<Label>> _labelController =
      BehaviorSubject<List<Label>>();

  Stream<List<Label>> get labels => _labelController.stream;

  BehaviorSubject<Project> _projectSelection = BehaviorSubject<Project>();

  Stream<Project> get selectedProject => _projectSelection.stream;

  BehaviorSubject<String> _labelSelected = BehaviorSubject<String>();

  Stream<String> get labelSelection => _labelSelected.stream;

  List<Label> _selectedLabelList = List();

  List<Label> get selectedLabels => _selectedLabelList;

  BehaviorSubject<Status> _prioritySelected = BehaviorSubject<Status>();

  Stream<Status> get prioritySelected => _prioritySelected.stream;

  BehaviorSubject<int> _dueDateSelected = BehaviorSubject<int>();

  Stream<int> get dueDateSelected => _dueDateSelected.stream;

  String updateTitle = "";

  String updateRoom = "";

  String updatePrice = "";

  String updateClient = "";

  @override
  void dispose() {
    _projectController.close();
    _labelController.close();
    _projectSelection.close();
    _labelSelected.close();
    _prioritySelected.close();
    _dueDateSelected.close();
  }

  void labelAddOrRemove(Label label) {
    if (_selectedLabelList.contains(label)) {
      _selectedLabelList.remove(label);
    } else {
      _selectedLabelList.add(label);
    }
    _buildLabelsString();
  }

  void _buildLabelsString() {
    List<String> selectedLabelNameList = List();
    _selectedLabelList.forEach((label) {
      selectedLabelNameList.add("@${label.name}");
    });
    String labelJoinString = selectedLabelNameList.join("  ");
    String displayLabels =
        labelJoinString.length == 0 ? "No Labels" : labelJoinString;
    _labelSelected.add(displayLabels);
  }

  void updatePriority(Status priority) {
    _prioritySelected.add(priority);
    lastPrioritySelection = priority;
  }

  void updateDueDate(int millisecondsSinceEpoch) {
    _dueDateSelected.add(millisecondsSinceEpoch);
  }

  Stream<String> createTask() {
    return ZipStream.zip3(selectedProject, dueDateSelected, prioritySelected,
        (Project project, int dueDateSelected, Status status) {
      List<int> labelIds = List();
      _selectedLabelList.forEach((label) {
        labelIds.add(label.id);
      });

      var task = Tasks.create(
        title: updateTitle,
        room: updateRoom,
        price: updatePrice,
        client: updateClient,
        dueDate: dueDateSelected,
        priority: status,
        projectId: project.id,
      );
      _taskDB.updateTask(task, labelIDs: labelIds).then((task) {
        Notification.onDone();
      });
    });
  }
}
