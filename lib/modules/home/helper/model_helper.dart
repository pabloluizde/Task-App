import 'package:teste_eclipse/core/models/tasks_model.dart';

class TaskModelHelper {
  static TaksModel emptyEntity() {
    return TaksModel(
      dateCreate: DateTime.now(),
      id: -1,
      description: '',
      task: '',
    );
  }
}
