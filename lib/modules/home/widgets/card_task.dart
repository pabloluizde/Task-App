import 'package:flutter/material.dart';
import 'package:teste_eclipse/core/models/tasks_model.dart';
import 'package:teste_eclipse/core/services/modal_service.dart';
import 'package:teste_eclipse/core/themes/app_colors.dart';
import 'package:teste_eclipse/modules/home/controller/home_getx.dart';
import 'package:teste_eclipse/modules/home/widgets/card_buttons.dart';
import 'package:teste_eclipse/modules/home/widgets/status_task.dart';
import 'package:teste_eclipse/modules/home/widgets/task_infos.dart';

class CardList extends StatefulWidget {
  final HomeGetx controller;
  final int index;
  final TaksModel movies;
  const CardList({
    required this.movies,
    required this.index,
    required this.controller,
    super.key,
  });

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        ModalServices.detailsModal(context, size, "${widget.movies.task}",
            "${widget.movies.description}");
      },
      child: AnimatedContainer(
        width: screenWidth,
        height: size.height * 0.24,
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300 + (widget.index * 200)),
        transform:
            Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.defaultGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 5.0),
                        child: TaskInfos(
                          size: size,
                          movies: widget.movies,
                        ),
                      ),
                    ],
                  ),
                  ButtonsCard(
                      controller: widget.controller, movies: widget.movies),
                ],
              ),
              StatusTask(
                size: size,
                movies: widget.movies,
                controller: widget.controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
