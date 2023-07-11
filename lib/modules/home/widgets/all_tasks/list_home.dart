import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';
import 'package:teste_eclipse/modules/home/widgets/card_task.dart';

class ListBuilderAllTasks extends StatefulWidget {
  final HomeGetx controller;
  const ListBuilderAllTasks({
    required this.controller,
    super.key,
  });

  @override
  State<ListBuilderAllTasks> createState() => _ListBuilderAllTasksState();
}

class _ListBuilderAllTasksState extends State<ListBuilderAllTasks> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.controller.getAllTasks(),
        builder: (context, snap) {
          return GetBuilder<HomeGetx>(
            init: HomeGetx(),
            builder: (_c) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _c.taskAll!.value.length,
                  itemBuilder: (_, index) {
                    return CardList(
                      index: index,
                      controller: widget.controller,
                      movies: _c.taskAll!.value[index],
                    );
                  },
                ),
              );
            },
          );
        });
  }
}
