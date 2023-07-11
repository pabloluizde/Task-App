import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/models/tasks_model.dart';

class TaskInfos extends StatelessWidget {
  final Size size;
  final TaksModel movies;
  const TaskInfos({required this.size, required this.movies, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.13,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.04,
            width: size.width * 0.6,
            child: Text(
              "• ${movies.task.toString()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  overflow: TextOverflow.fade),
            ),
          ),
        ],
      ),
    );
  }
}
