import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_eclipse/core/models/tasks_model.dart';

class PrefsServices {
  static const String _key = "key";

  Future<List<TaksModel>> getAllTaskPending() async {
    try {
      return await getInCache();
    } catch (e) {
      return [];
    }
  }

  Future<List<TaksModel>> getAllTaskDone() async {
    try {
      return await getInCacheDone();
    } catch (e) {
      return [];
    }
  }

  saveInCache(List<TaksModel> task) async {
    var prefs = await SharedPreferences.getInstance();
    List jsonTask = task.map((e) => e.toJson()).toList();
    var json = jsonEncode(jsonTask);
    prefs.setString('tasks_list_pending', json);
  }

  Future<List<TaksModel>> getInCache() async {
    var list = <TaksModel>[];
    var prefs = await SharedPreferences.getInstance();
    var jsonTask = prefs.getString('tasks_list_pending');
    var newList = jsonDecode(jsonTask!);
    for (var i in newList) {
      list.add(TaksModel.fromJson(i));
    }
    return list;
  }

  static updateListPeding(List<TaksModel> task) async {
    var prefs = await SharedPreferences.getInstance();
    List jsonTask = task.map((e) => e.toJson()).toList();
    var json = jsonEncode(jsonTask);
    prefs.setString('tasks_list_pending', json);
  }

  saveInCacheDone(List<TaksModel> task) async {
    var prefs = await SharedPreferences.getInstance();
    List jsonTask = task.map((e) => e.toJson()).toList();
    var json = jsonEncode(jsonTask);
    prefs.setString('tasks_list_done', json);
  }

  Future<List<TaksModel>> getInCacheDone() async {
    var list = <TaksModel>[];
    var prefs = await SharedPreferences.getInstance();
    var jsonTask = prefs.getString('tasks_list_done');
    var newList = jsonDecode(jsonTask!);
    for (var i in newList) {
      list.add(TaksModel.fromJson(i));
    }
    return list;
  }

  static updateListDone(List<TaksModel> task) async {
    var prefs = await SharedPreferences.getInstance();
    List jsonTask = task.map((e) => e.toJson()).toList();
    var json = jsonEncode(jsonTask);
    prefs.setString('tasks_list_done', json);
  }
}
