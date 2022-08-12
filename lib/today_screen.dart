import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_manager/todo_controller.dart';

import 'custom_listtile.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final TodoController todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();
    todoController.getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(itemCount: todoController.todoList.length,
      itemBuilder: (context,index){
        List<String> date = todoController.todoList[index].date.split(" ");
        return CustomListTile(
          title: todoController.todoList[index].title,
          date: todoController.todoList[index].date.split(" ")[0],
          time: '${date[1]}${date[2]} ${date[3]}',
        );
      },),
    );
  }
}

