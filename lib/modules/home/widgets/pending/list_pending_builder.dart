import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';
import 'package:teste_eclipse/modules/home/widgets/card_task.dart';

class ListPendingBuilder extends StatelessWidget {
  const ListPendingBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final yourController = Get.find<HomeGetx>();
    return FutureBuilder(
        future: yourController.getListPending(),
        builder: (context, snap) {
          return GetBuilder<HomeGetx>(
            init: HomeGetx(),
            builder: (_c) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _c.taskPendings!.value.length,
                  itemBuilder: (_, index) {
                    return CardList(
                      controller: yourController,
                      movies: _c.taskPendings!.value[index],
                      index: index,
                    );
                  },
                ),
              );
            },
          );
        });
  }
}
