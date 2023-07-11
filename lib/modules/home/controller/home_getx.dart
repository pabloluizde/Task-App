import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:teste_eclipse/core/models/tasks_model.dart';
import 'package:teste_eclipse/core/services/prefs_services.dart';
import 'package:teste_eclipse/core/services/snacks_bar.dart';

class HomeGetx extends GetxController {
  final formKey = GlobalKey<FormState>();
  Rx<String> task = ''.obs;
  Rx<bool> animation = Rx<bool>(false);
  setTask(String value) => task.value = value;

  Rx<String> description = "".obs;
  setDescription(String value) => description.value = value;

  Rx<int> selectIndex = 0.obs;
  Rx<int> id = 0.obs;

  Rx<List<TaksModel>>? taskPendings = Rx<List<TaksModel>>([]);
  Rx<List<TaksModel>>? taskDone = Rx<List<TaksModel>>([]);
  Rx<List<TaksModel>>? taskAll = Rx<List<TaksModel>>([]);

  addAllPending() {
    var tasks = TaksModel(
        dateCreate: DateTime.now(),
        task: task.value,
        description: description.value,
        id: id.value);
    taskPendings!.value.add(tasks);
    PrefsServices().saveInCache(taskPendings!.value);
    update();
  }

  changeValue(bool value) {
    value = true;
    update();
  }

  addInDone() {
    taskDone?.value.add(
        taskPendings!.value.where((element) => element.isDone == true).first);
    update();
  }

  Future getListPending() async {
    var taks = await PrefsServices().getAllTaskPending();

    taskPendings!.value = taks;

    update();
  }

  String? validatorTask() {
    if (!RegExp(r"^[a-zA-Za-zA-Z0-9]+(?:\s[a-zA-Za-zA-Z0-9]+)?")
            .hasMatch(task.value) ||
        !RegExp(r"^[a-zA-Za-zA-Z0-9]?").hasMatch(task.value)) {
      return 'O titulo não pode ficar vazia!';
    }
    return null;
  }

  String? validatorDesc() {
    if (description.value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/\\{}=?^_`<>{|}~]")
            .hasMatch(description.value)) {
      return 'A descrição não pode ficar vazia!';
    }
    return null;
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    final formState = formKey.currentState;

    if (formState == null) {
      return false;
    }

    if (!formState.validate()) {
      return false;
    }

    return true;
  }

  Future<bool> addTask(BuildContext context) async {
    if (validateForm(formKey)) {
      setId();
      addAllPending();
      getAllTasks().then((value) =>
          SnackBarServices.showSucessSnackbar(context, 'Criado com sucesso!'));
      description.value = '';
      task.value = '';
      return true;
    }

    SnackBarServices.showErrorSnackbar(
        context, 'Deu ruim ao criar a sua Task!');
    return false;
  }

  Future getAllTasks() async {
    taskPendings!.value = await PrefsServices().getAllTaskPending();
    taskDone!.value = await PrefsServices().getAllTaskDone();

    var lists = taskPendings!.value + taskDone!.value;
    taskAll?.value = lists;
  }

  Future getListDone() async {
    var taks = await PrefsServices().getAllTaskDone();

    for (var item in taks) {
      var existtaskPendings = taskDone!.value
          .where(
            (element) => element.task == item.task,
          )
          .where(
            (element) => element.id == item.id,
          );
      if (item.isDone == true && existtaskPendings.isEmpty) {
        taskDone!.value.add(item);
        update();
      }
    }
    update();
  }

  updateIndex(index) {
    selectIndex.value = index;
    update();
  }

  removeItem(TaksModel value, BuildContext context) {
    var existInDone = taskDone!.value
        .where(
          (element) => element.task == value.task,
        )
        .where(
          (element) => element.id == value.id,
        );

    var existtaskPendings = taskPendings!.value
        .where(
          (element) => element.task == value.task,
        )
        .where(
          (element) => element.id == value.id,
        );
    var existAll = taskAll!.value
        .where(
          (element) => element.task == value.task,
        )
        .where(
          (element) => element.id == value.id,
        );

    if (existtaskPendings.isNotEmpty && existAll.isNotEmpty) {
      taskPendings?.value.remove(value);
      taskAll?.value.remove(value);
      PrefsServices.updateListPeding(taskPendings!.value);
      update();
    }
    if (existInDone.isNotEmpty && existAll.isNotEmpty) {
      taskDone?.value.remove(value);
      taskAll?.value.remove(value);
      PrefsServices.updateListDone(taskDone!.value);
      update();
    }
    SnackBarServices.showSucessSnackbar(context, 'Excluido com sucesso!');
    update();
  }

  doneState(TaksModel value) {
    value.isDone = !value.isDone;
    var exist = taskDone!.value
        .where(
          (element) => element.task == value.task,
        )
        .where(
          (element) => element.id == value.id,
        );

    if (value.isDone == true && exist.isEmpty) {
      taskDone!.value.add(value);
      taskPendings!.value.remove(value);
      PrefsServices.updateListPeding(taskPendings!.value);
      PrefsServices().saveInCacheDone(taskDone!.value);
      update();
    }
    if (value.isDone == false && exist.isNotEmpty) {
      taskDone!.value.remove(value);
      taskPendings!.value.add(value);
      PrefsServices.updateListPeding(taskPendings!.value);
      PrefsServices().saveInCacheDone(taskDone!.value);
      update();
    }
    update();
  }

  setId() {
    var nwId = taskPendings?.value == null ? 1 : taskPendings?.value.length;
    id.value = nwId! + 1;
    update();
  }
}
