import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_manager/Controller/todo_controller.dart';
import '../../Model/todo_model.dart';
import '../Widget/custom_listtile.dart';

class TaskDoneScreen extends StatefulWidget {
  const TaskDoneScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TaskDoneScreen> createState() => _TaskDoneScreenState();
}

class _TaskDoneScreenState extends State<TaskDoneScreen> {
  final TodoController todoController = Get.put(TodoController());

  @override
  void initState() {
    super.initState();
    todoController.getDoneTask(1);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: const EdgeInsets.fromLTRB(20,20,20,0),
      child:todoController.listIsDone.isEmpty ?Center(child: Text('No Data'),):ListView.builder(itemCount: todoController.listIsDone.length,
        itemBuilder: (context,index){
          List<String> date = todoController.listIsDone[index].date.split(" ");
          TodoModel task = todoController.listIsDone[index];
          return GestureDetector(
            onLongPress: () async{
              await todoController.deleteTask(task.id!);
              todoController.getDoneTask(1);
            },
            child: CustomListTile(
              title: task.title!,
              date: task.date!.split(" ")[0],
              time: '${date[1]}${date[2]} ${date[3]}',
              id: task.id!,
              isComplete: true,
            ),
          );
        },),
    ),);
  }
}

