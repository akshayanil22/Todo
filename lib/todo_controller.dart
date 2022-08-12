import 'package:get/get.dart';
import 'package:todo_manager/todo_model.dart';

import 'db_helper.dart';

class TodoController extends GetxController {
  final RxList todoList = <TodoModel>[].obs;

  Future<void> getTask()async{
    final List<Map<String, dynamic>> tasks = await DBHelper().queryAllRows();
    todoList.assignAll(tasks.map((data) => TodoModel.fromMap(data)).toList());
  }

  addTask(TodoModel task)async{
    await DBHelper().insertTask(task);
    todoList.add(task);
    getTask();
  }
}
