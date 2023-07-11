import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';
import 'package:teste_eclipse/modules/home/widgets/pending/list_pending_builder.dart';

class TasksPendingView extends StatelessWidget {
  const TasksPendingView({super.key});

  static const route = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0, right: 8.0),
                ),
              ),
              Text(
                "TASK APP",
                style: TextStyle(
                  color: AppColors.defaultBlue,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListPendingBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
