import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:todo_manager/Controller/todo_controller.dart';

import '../../Model/todo_model.dart';
import '../Widget/custom_listtile.dart';

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
    todoController.getTaskToday(0,DateFormat('dd-MMMM-yyyy').format(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.fromLTRB(20,20,20,0),
      child: todoController.todayTodoList.isEmpty?const Center(child: Text('No Data')) :ListView.builder(itemCount: todoController.todayTodoList.length,
      itemBuilder: (context,index){
        List<String> date = todoController.todayTodoList[index].date.split(" ");
        TodoModel task = todoController.todayTodoList[index];
        return GestureDetector(
          onLongPress: () async{
            await todoController.deleteTask(task.id!);
            todoController.getTaskToday(0,DateFormat('dd-MMMM-yyyy').format(DateTime.now()));
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

