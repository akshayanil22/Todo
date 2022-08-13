import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo_manager/todo_controller.dart';
import 'package:todo_manager/todo_model.dart';

import 'custom_listtile.dart';

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  final TodoController todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();
    todoController.getTaskNotToday(
        0, DateFormat('dd-MMMM-yyyy').format(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.fromLTRB(20,20,20,0),
      child: todoController.notTodayTodoList.isEmpty
          ? const Center(child: Text('No Data'))
          : ListView.builder(
              itemCount: todoController.notTodayTodoList.length,
              itemBuilder: (context, index) {
                List<String> date =
                    todoController.notTodayTodoList[index].date.split(" ");
                TodoModel task = todoController.notTodayTodoList[index];
                return GestureDetector(
                  onLongPress: () async {
                    await todoController.deleteTask(task.id!);
                    todoController.getTaskNotToday(
                        0, DateFormat('dd-MMMM-yyyy').format(DateTime.now()));
                  },
                  child: CustomListTile(
                    title: task.title!,
                    date: task.date!.split(" ")[0],
                    time: '${date[1]}${date[2]} ${date[3]}',
                    id: task.id,
                    isComplete: false,
                  ),
                );
              },
            ),
    ),);
  }
}
