import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_manager/todo_controller.dart';
import 'package:todo_manager/todo_model.dart';

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
    todoController.getTask(0);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.all(20),
      child: todoController.todoList.isEmpty?const Center(child: Text('No Data')) :ListView.builder(itemCount: todoController.todoList.length,
      itemBuilder: (context,index){
        List<String> date = todoController.todoList[index].date.split(" ");
        TodoModel task = todoController.todoList[index];
        return GestureDetector(
          onLongPress: () async{
            await todoController.deleteTask(task.id!);
            todoController.getTask(0);
          },
          child: CustomListTile(
            title: task.title!,
            date: task.date!.split(" ")[0],
            time: '${date[1]}${date[2]} ${date[3]}',
            id: task.id,
            isComplete: false,
          ),
        );
      },),
    ),);
  }
}

