import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';

import 'package:teste_eclipse/modules/home/view/home_page.dart';
import 'package:teste_eclipse/modules/home/view/home_view_list.dart';
import 'package:teste_eclipse/modules/home/view/tasks_done.dart';
import 'package:teste_eclipse/modules/home/view/tasks_pending_view.dart';

class HomeModule extends Module {
  static const moduleRoute = '/home/';
  static const doneTask = '/done-task';
  static const list = '/home-list';
  static const pendingTask = '/task-pending';

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomePage.route,
            child: (_, __) => HomePage(
                  controller: HomeGetx(),
                ),
            transition: TransitionType.fadeIn,
            children: [
              ChildRoute(
                list,
                child: (_, __) => const TasksAllView(),
                transition: TransitionType.fadeIn,
              ),
              ChildRoute(
                pendingTask,
                child: (_, __) => const TasksPendingView(),
                transition: TransitionType.fadeIn,
              ),
              ChildRoute(
                doneTask,
                child: (_, __) => const TasksDone(),
                transition: TransitionType.fadeIn,
              ),
            ]),
      ];
}
