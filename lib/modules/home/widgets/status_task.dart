import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/models/tasks_model.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';

class StatusTask extends StatelessWidget {
  const StatusTask({
    super.key,
    required this.size,
    required this.movies,
    required this.controller,
  });

  final HomeGetx controller;

  final Size size;
  final TaksModel movies;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            child: movies.isDone == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Done",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.av_timer),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Pending",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        IconButton(
          onPressed: () {
            controller.doneState(movies);
          },
          icon: movies.isDone == true
              ? const Icon(Icons.check_box)
              : const Icon(Icons.check_box_outline_blank),
        ),
      ],
    );
  }
}
